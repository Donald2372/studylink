import { useEffect, useRef, useState } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import { api } from '../../api.js';
import { useAuth } from '../../context/AuthContext.jsx';
import { AppShell } from '../../components/AppShell.jsx';

const iceServers = [
  { urls: 'stun:stun.l.google.com:19302' },
  { urls: 'stun:stun1.l.google.com:19302' },
];
if (import.meta.env.VITE_TURN_URL) {
  iceServers.push({
    urls: import.meta.env.VITE_TURN_URL,
    username: import.meta.env.VITE_TURN_USERNAME || '',
    credential: import.meta.env.VITE_TURN_CREDENTIAL || '',
  });
}
const rtcConfig = { iceServers };

export default function CallPage() {
  const { id } = useParams();
  const { token, user } = useAuth();
  const nav = useNavigate();
  const localVideo = useRef(null);
  const remoteVideo = useRef(null);
  const pcRef = useRef(null);
  const localStreamRef = useRef(null);
  const screenStreamRef = useRef(null);
  const pollRef = useRef(null);
  const lastSignalRef = useRef(0);
  const [call, setCall] = useState(null);
  const [status, setStatus] = useState('Connexion…');
  const [error, setError] = useState('');
  const [muted, setMuted] = useState(false);
  const [cameraOff, setCameraOff] = useState(false);
  const [sharing, setSharing] = useState(false);
  const [chatOpen, setChatOpen] = useState(false);
  const [seconds, setSeconds] = useState(0);

  useEffect(() => {
    if (!token) return;
    let mounted = true;
    let timer;
    async function init() {
      try {
        const data = await api.getCall(id, token);
        if (!mounted) return;
        setCall(data.call);
        const isCaller = data.call.caller_id === user?.id;
        setStatus(data.call.status === 'ringing' ? (isCaller ? 'Appel en cours…' : 'Connexion…') : 'Connexion…');
        await startRtc(data.call, isCaller);
      } catch (e) { setError(e.message); setStatus('Erreur'); }
    }
    init();
    timer = setInterval(() => setSeconds(s => s + 1), 1000);
    return () => {
      mounted = false;
      clearInterval(timer);
      clearInterval(pollRef.current);
      pcRef.current?.close();
      localStreamRef.current?.getTracks().forEach(t => t.stop());
      screenStreamRef.current?.getTracks().forEach(t => t.stop());
    };
  }, [id, token, user?.id]);

  async function startRtc(callData, isCaller) {
    const stream = await navigator.mediaDevices.getUserMedia({ video: callData.call_type !== 'audio', audio: true });
    localStreamRef.current = stream;
    if (localVideo.current) localVideo.current.srcObject = stream;

    const pc = new RTCPeerConnection(rtcConfig);
    pcRef.current = pc;
    stream.getTracks().forEach(track => pc.addTrack(track, stream));
    pc.ontrack = (e) => {
      if (remoteVideo.current) remoteVideo.current.srcObject = e.streams[0];
      setStatus('Connecté');
    };
    pc.onicecandidate = (e) => {
      if (e.candidate) api.sendCallSignal(id, 'ice', e.candidate.toJSON(), token).catch(() => {});
    };
    pc.onconnectionstatechange = () => {
      const st = pc.connectionState;
      if (st === 'connected') setStatus('Connecté');
      if (['failed','disconnected'].includes(st)) setStatus('Connexion interrompue');
      if (st === 'closed') setStatus('Appel terminé');
    };

    pollRef.current = setInterval(async () => {
      try {
        const data = await api.getCallSignals(id, lastSignalRef.current, token);
        for (const sig of data.signals || []) {
          lastSignalRef.current = Math.max(lastSignalRef.current, Number(sig.id));
          if (sig.signal_type === 'offer' && !pc.currentRemoteDescription) {
            await pc.setRemoteDescription(new RTCSessionDescription(sig.payload));
            const answer = await pc.createAnswer();
            await pc.setLocalDescription(answer);
            await api.sendCallSignal(id, 'answer', answer, token);
          } else if (sig.signal_type === 'answer' && !pc.currentRemoteDescription) {
            await pc.setRemoteDescription(new RTCSessionDescription(sig.payload));
          } else if (sig.signal_type === 'ice') {
            try { await pc.addIceCandidate(new RTCIceCandidate(sig.payload)); } catch {}
          }
        }
        const current = await api.getCall(id, token);
        setCall(current.call);
        if (['rejected','ended','missed'].includes(current.call.status)) {
          setStatus(current.call.status === 'rejected' ? 'Appel refusé' : 'Appel terminé');
          setTimeout(() => nav('/messages'), 1200);
        }
      } catch {}
    }, 1000);

    if (isCaller) {
      const waitForAccept = setInterval(async () => {
        try {
          const data = await api.getCall(id, token);
          setCall(data.call);
          if (data.call.status === 'accepted') {
            clearInterval(waitForAccept);
            const offer = await pc.createOffer();
            await pc.setLocalDescription(offer);
            await api.sendCallSignal(id, 'offer', offer, token);
            setStatus('Connexion…');
          } else if (['rejected','ended','missed'].includes(data.call.status)) {
            clearInterval(waitForAccept);
          }
        } catch {}
      }, 1200);
    }
  }

  function toggleMute() {
    const tracks = localStreamRef.current?.getAudioTracks() || [];
    tracks.forEach(t => { t.enabled = muted; });
    setMuted(!muted);
  }
  function toggleCamera() {
    const tracks = localStreamRef.current?.getVideoTracks() || [];
    tracks.forEach(t => { t.enabled = cameraOff; });
    setCameraOff(!cameraOff);
  }
  async function shareScreen() {
    if (sharing) {
      const camTrack = localStreamRef.current?.getVideoTracks()[0];
      const sender = pcRef.current?.getSenders().find(s => s.track?.kind === 'video');
      if (sender && camTrack) await sender.replaceTrack(camTrack);
      screenStreamRef.current?.getTracks().forEach(t => t.stop());
      setSharing(false);
      return;
    }
    try {
      const screen = await navigator.mediaDevices.getDisplayMedia({ video: true, audio: false });
      screenStreamRef.current = screen;
      const track = screen.getVideoTracks()[0];
      const sender = pcRef.current?.getSenders().find(s => s.track?.kind === 'video');
      if (sender) await sender.replaceTrack(track);
      track.onended = () => shareScreen();
      setSharing(true);
    } catch {}
  }
  async function endCall() {
    try { await api.endCall(id, token); } catch {}
    pcRef.current?.close();
    localStreamRef.current?.getTracks().forEach(t => t.stop());
    nav('/messages');
  }

  const otherName = call ? (call.caller_id === user?.id ? call.callee_name : call.caller_name) : 'Utilisateur';
  const mm = String(Math.floor(seconds / 60)).padStart(2, '0');
  const ss = String(seconds % 60).padStart(2, '0');

  return <AppShell><div className="page real-call-page">
    <div className="real-call-header"><button onClick={() => nav(-1)}>←</button><div><h1>Visioconférence</h1><p>{status} · {otherName}</p></div></div>
    {error && <div className="admin-error">{error}</div>}
    <div className="real-call-stage">
      <video ref={remoteVideo} autoPlay playsInline className="remote-video" />
      <div className="call-placeholder"><div className="pulse-avatar">{otherName?.charAt(0) || '?'}</div><h2>{otherName}</h2><p>{status}</p></div>
      <video ref={localVideo} autoPlay muted playsInline className="local-video" />
      <span className="call-timer">{mm}:{ss}</span>
    </div>
    <div className="real-call-controls">
      <button onClick={toggleMute} className={muted ? 'active-off' : ''}><span>{muted ? '🔇' : '🎙️'}</span>{muted ? 'Réactiver' : 'Micro'}</button>
      <button onClick={toggleCamera} className={cameraOff ? 'active-off' : ''}><span>{cameraOff ? '🚫' : '📹'}</span>{cameraOff ? 'Activer' : 'Caméra'}</button>
      <button onClick={shareScreen} className={sharing ? 'active-share' : ''}><span>🖥️</span>{sharing ? 'Arrêter' : 'Partager'}</button>
      <button onClick={() => setChatOpen(!chatOpen)}><span>💬</span>Chat</button>
      <button className="hangup" onClick={endCall}><span>☎</span>Quitter</button>
    </div>
    {chatOpen && <div className="call-chat-panel"><h3>Chat de l’appel</h3><p>Utilise la messagerie privée StudyLink pour conserver l’historique des échanges.</p><button onClick={() => nav(`/messages/${call?.caller_id === user?.id ? call?.callee_id : call?.caller_id}?name=${encodeURIComponent(otherName)}`)}>Ouvrir la conversation</button></div>}
  </div></AppShell>;
}
