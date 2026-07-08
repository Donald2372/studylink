import { useEffect, useRef, useState } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import { api } from '../../api.js';
import { useAuth } from '../../context/AuthContext.jsx';
import { AppShell } from '../../components/AppShell.jsx';

function buildIceServers() {
  const servers = [
    { urls: ['stun:stun.l.google.com:19302', 'stun:stun1.l.google.com:19302'] },
  ];
  if (import.meta.env.VITE_TURN_URL) {
    servers.push({
      urls: import.meta.env.VITE_TURN_URL,
      username: import.meta.env.VITE_TURN_USERNAME || '',
      credential: import.meta.env.VITE_TURN_CREDENTIAL || '',
    });
  }
  return servers;
}

function hasTurnServer(servers = []) {
  return servers.some(server => {
    const urls = Array.isArray(server.urls) ? server.urls : [server.urls];
    return urls.some(url => String(url || '').startsWith('turn:') || String(url || '').startsWith('turns:'));
  });
}

function safePayload(payload) {
  if (typeof payload !== 'string') return payload;
  try { return JSON.parse(payload); } catch { return payload; }
}

function fmtTime(seconds) {
  const mm = String(Math.floor(seconds / 60)).padStart(2, '0');
  const ss = String(seconds % 60).padStart(2, '0');
  return `${mm}:${ss}`;
}

export default function CallPage() {
  const { id } = useParams();
  const { token, user } = useAuth();
  const nav = useNavigate();

  const localVideo = useRef(null);
  const remoteVideo = useRef(null);
  const remoteAudio = useRef(null);
  const pcRef = useRef(null);
  const localStreamRef = useRef(new MediaStream());
  const remoteStreamRef = useRef(new MediaStream());
  const screenStreamRef = useRef(null);
  const pollRef = useRef(null);
  const statusPollRef = useRef(null);
  const retryRef = useRef(null);
  const lastSignalRef = useRef(0);
  const pendingIceRef = useRef([]);
  const processingSignalsRef = useRef(false);
  const mountedRef = useRef(true);
  const offerSentRef = useRef(false);
  const mediaStartedRef = useRef(false);
  const callerRef = useRef(false);
  const acceptedRef = useRef(false);

  const [call, setCall] = useState(null);
  const [status, setStatus] = useState('Préparation de l’appel…');
  const [error, setError] = useState('');
  const [warning, setWarning] = useState('');
  const [muted, setMuted] = useState(false);
  const [cameraOff, setCameraOff] = useState(false);
  const [sharing, setSharing] = useState(false);
  const [remoteHasVideo, setRemoteHasVideo] = useState(false);
  const [chatOpen, setChatOpen] = useState(false);
  const [seconds, setSeconds] = useState(0);
  const [needsMediaPlay, setNeedsMediaPlay] = useState(false);
  const [debugState, setDebugState] = useState('Initialisation');
  const [networkState, setNetworkState] = useState('Réseau en préparation');

  useEffect(() => {
    if (!token || !user?.id) return undefined;
    mountedRef.current = true;
    let timer;

    async function init() {
      try {
        setError('');
        setWarning('');
        const data = await api.getCall(id, token);
        if (!mountedRef.current) return;
        const callData = data.call;
        const isCaller = callData.caller_id === user.id;
        callerRef.current = isCaller;
        setCall(callData);
        acceptedRef.current = callData.status === 'accepted';
        await startRtc(callData, isCaller);
      } catch (e) {
        if (!mountedRef.current) return;
        setError(e.message || 'Impossible de démarrer l’appel.');
        setStatus('Erreur');
      }
    }

    init();
    timer = setInterval(() => setSeconds(s => s + 1), 1000);

    return () => {
      mountedRef.current = false;
      clearInterval(timer);
      clearInterval(pollRef.current);
      clearInterval(statusPollRef.current);
      clearInterval(retryRef.current);
      pcRef.current?.close();
      localStreamRef.current?.getTracks().forEach(track => track.stop());
      screenStreamRef.current?.getTracks().forEach(track => track.stop());
      remoteStreamRef.current?.getTracks().forEach(track => track.stop());
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [id, token, user?.id]);

  async function attachRemoteMedia() {
    const remoteStream = remoteStreamRef.current;
    let blocked = false;

    const hasAudio = remoteStream.getAudioTracks().some(track => track.readyState === 'live');
    const hasVideo = remoteStream.getVideoTracks().some(track => track.readyState === 'live');
    setRemoteHasVideo(hasVideo);

    if (remoteAudio.current) {
      try {
        if (remoteAudio.current.srcObject !== remoteStream) remoteAudio.current.srcObject = remoteStream;
        remoteAudio.current.muted = false;
        remoteAudio.current.volume = 1;
        if (hasAudio) await remoteAudio.current.play();
      } catch {
        blocked = true;
      }
    }

    if (remoteVideo.current) {
      try {
        if (remoteVideo.current.srcObject !== remoteStream) remoteVideo.current.srcObject = remoteStream;
        remoteVideo.current.muted = true;
        if (hasVideo) await remoteVideo.current.play();
      } catch {
        blocked = true;
      }
    }

    if (hasAudio || hasVideo) {
      setStatus('Connecté');
      setError('');
    }
    setNeedsMediaPlay(blocked);
  }

  async function addLocalTracksToTransceivers(pc, stream, callType) {
    const audioTrack = stream.getAudioTracks()[0] || null;
    const cameraTrack = stream.getVideoTracks()[0] || null;

    const audioTransceiver = pc.addTransceiver('audio', { direction: 'sendrecv' });
    await audioTransceiver.sender.replaceTrack(audioTrack);

    // Un canal vidéo existe toujours. Cela permet aussi de partager l'écran pendant un appel audio.
    const videoTransceiver = pc.addTransceiver('video', { direction: 'sendrecv' });
    await videoTransceiver.sender.replaceTrack(callType === 'video' ? cameraTrack : null);
  }

  async function getLocalMedia(callType) {
    if (!navigator.mediaDevices?.getUserMedia) {
      throw new Error('Ce navigateur ne prend pas en charge la caméra et le microphone.');
    }

    const wantsVideo = callType === 'video';
    const audio = { echoCancellation: true, noiseSuppression: true, autoGainControl: true };
    const video = wantsVideo ? { width: { ideal: 1280 }, height: { ideal: 720 }, facingMode: 'user' } : false;

    try {
      return await navigator.mediaDevices.getUserMedia({ audio, video });
    } catch (firstError) {
      if (wantsVideo) {
        setWarning('La caméra n’a pas pu être ouverte. L’appel continue en audio, et le partage d’écran reste disponible.');
        setCameraOff(true);
        return await navigator.mediaDevices.getUserMedia({ audio, video: false });
      }
      throw firstError;
    }
  }

  async function flushPendingIce(pc) {
    if (!pc.remoteDescription) return;
    const queued = pendingIceRef.current.splice(0);
    for (const candidate of queued) {
      try { await pc.addIceCandidate(candidate); } catch (e) { console.warn('ICE candidate rejeté', e); }
    }
  }

  async function createAndSendOffer(pc, reason = 'offre') {
    if (!mountedRef.current || !callerRef.current || pc.signalingState !== 'stable') return;
    setDebugState(`${reason}…`);
    const offer = await pc.createOffer({ offerToReceiveAudio: true, offerToReceiveVideo: true });
    await pc.setLocalDescription(offer);
    await api.sendCallSignal(id, 'offer', pc.localDescription.toJSON(), token);
    offerSentRef.current = true;
    setStatus('Connexion…');
    setDebugState(`${reason} envoyée`);
  }

  async function processSignal(signal, pc) {
    const payload = safePayload(signal.payload);

    if (signal.signal_type === 'offer') {
      setDebugState('Offre reçue');

      // En cas de retry, une nouvelle offre peut arriver alors qu'une ancienne existe déjà.
      // On remplace proprement la description distante au lieu de bloquer l'appel.
      if (pc.signalingState !== 'stable') {
        try { await pc.setLocalDescription({ type: 'rollback' }); } catch {}
      }

      await pc.setRemoteDescription(payload);
      await flushPendingIce(pc);
      const answer = await pc.createAnswer();
      await pc.setLocalDescription(answer);
      await api.sendCallSignal(id, 'answer', pc.localDescription.toJSON(), token);
      setDebugState('Réponse envoyée');
      return;
    }

    if (signal.signal_type === 'answer') {
      if (pc.signalingState !== 'have-local-offer') return;
      setDebugState('Réponse reçue');
      await pc.setRemoteDescription(payload);
      await flushPendingIce(pc);
      return;
    }

    if (signal.signal_type === 'ice') {
      const candidate = new RTCIceCandidate(payload);
      if (pc.remoteDescription) {
        try { await pc.addIceCandidate(candidate); } catch (e) { console.warn('ICE candidate rejeté', e); }
      } else {
        pendingIceRef.current.push(candidate);
      }
    }

    await attachRemoteMedia();
  }

  async function pollSignals(pc) {
    if (processingSignalsRef.current || !mountedRef.current) return;
    processingSignalsRef.current = true;
    try {
      const data = await api.getCallSignals(id, lastSignalRef.current, token);
      for (const signal of data.signals || []) {
        lastSignalRef.current = Math.max(lastSignalRef.current, Number(signal.id));
        try { await processSignal(signal, pc); }
        catch (e) {
          console.error('Erreur signal WebRTC', signal.signal_type, e);
          setDebugState(`Erreur ${signal.signal_type}`);
        }
      }
    } catch (e) {
      console.warn('Polling signalisation', e);
    } finally {
      processingSignalsRef.current = false;
    }
  }

  async function startRtc(callData, isCaller) {
    setStatus(isCaller && callData.status === 'ringing' ? 'Sonnerie…' : 'Connexion…');
    setDebugState('Accès caméra/micro');

    const stream = await getLocalMedia(callData.call_type);
    if (!mountedRef.current) {
      stream.getTracks().forEach(track => track.stop());
      return;
    }

    localStreamRef.current = stream;
    mediaStartedRef.current = true;

    if (localVideo.current && (callData.call_type === 'video' || stream.getVideoTracks().length)) {
      localVideo.current.srcObject = stream;
      localVideo.current.muted = true;
      localVideo.current.play().catch(() => {});
    }

    let iceServers = buildIceServers();
    try {
      const iceData = await api.getCallIceConfig(token);
      if (Array.isArray(iceData?.iceServers) && iceData.iceServers.length) {
        iceServers = iceData.iceServers;
      }
      const turnReady = hasTurnServer(iceServers);
      setNetworkState(turnReady ? 'TURN actif : appel compatible réseaux différents' : 'STUN seul : test possible, mais réseau limité');
      if (!turnReady) {
        setWarning('Aucun serveur TURN n’est configuré. Sur deux réseaux différents, le flux audio/vidéo peut ne pas passer. Configure TURN sur Render pour rendre les appels fiables.');
      }
    } catch (e) {
      console.warn('Configuration ICE indisponible, fallback STUN', e);
      setNetworkState('STUN seul : configuration réseau minimale');
      setWarning('La configuration réseau avancée de l’appel est indisponible. Le flux peut échouer entre deux réseaux différents.');
    }

    const pc = new RTCPeerConnection({
      iceServers,
      iceCandidatePoolSize: 10,
      bundlePolicy: 'max-bundle',
      rtcpMuxPolicy: 'require',
    });
    pcRef.current = pc;
    remoteStreamRef.current = new MediaStream();

    await addLocalTracksToTransceivers(pc, stream, callData.call_type);

    pc.ontrack = event => {
      const remoteStream = remoteStreamRef.current;
      const track = event.track;
      if (!remoteStream.getTracks().some(t => t.id === track.id)) remoteStream.addTrack(track);
      if (event.streams?.[0]) {
        for (const remoteTrack of event.streams[0].getTracks()) {
          if (!remoteStream.getTracks().some(t => t.id === remoteTrack.id)) remoteStream.addTrack(remoteTrack);
        }
      }
      if (track.kind === 'video') setRemoteHasVideo(true);
      track.onunmute = () => attachRemoteMedia();
      track.onended = () => {
        if (track.kind === 'video') {
          setRemoteHasVideo(remoteStream.getVideoTracks().some(t => t.readyState === 'live'));
        }
      };
      setDebugState(`Flux distant reçu (${track.kind})`);
      attachRemoteMedia();
    };

    pc.onicecandidate = event => {
      if (!event.candidate) {
        setDebugState('Candidats ICE envoyés');
        return;
      }
      api.sendCallSignal(id, 'ice', event.candidate.toJSON(), token).catch(e => console.warn('Envoi ICE impossible', e));
    };

    pc.onicecandidateerror = event => {
      console.warn('ICE candidate error', event);
      setDebugState(`Erreur ICE ${event.errorCode || ''}`.trim());
    };

    pc.onicegatheringstatechange = () => setDebugState(`ICE gathering: ${pc.iceGatheringState}`);
    pc.onsignalingstatechange = () => setDebugState(`Signal: ${pc.signalingState}`);

    pc.oniceconnectionstatechange = () => {
      const state = pc.iceConnectionState;
      setNetworkState(`ICE: ${state}`);
      if (['connected', 'completed'].includes(state)) {
        setStatus('Connecté');
        setError('');
        attachRemoteMedia();
      }
      if (state === 'checking') setStatus('Connexion des médias…');
      if (state === 'disconnected') setStatus('Connexion interrompue');
      if (state === 'failed') {
        setStatus('Connexion média impossible');
        const turnReady = hasTurnServer(iceServers);
        setError(turnReady
          ? 'Le flux média a échoué malgré TURN. Clique sur Relancer le flux, puis vérifie que micro/caméra sont autorisés.'
          : 'Le flux média ne peut pas passer sans serveur TURN fiable. Configure TURN sur Render, puis relance l’appel.');
      }
    };

    pc.onconnectionstatechange = () => {
      const state = pc.connectionState;
      if (state === 'connected') {
        setStatus('Connecté');
        setError('');
        attachRemoteMedia();
      }
      if (state === 'connecting') setStatus('Connexion…');
      if (state === 'failed') setStatus('Connexion échouée');
      if (state === 'disconnected') setStatus('Connexion interrompue');
      if (state === 'closed') setStatus('Appel terminé');
    };

    await pollSignals(pc);
    pollRef.current = setInterval(() => pollSignals(pc), 300);

    statusPollRef.current = setInterval(async () => {
      try {
        const current = await api.getCall(id, token);
        if (!mountedRef.current) return;
        setCall(current.call);
        acceptedRef.current = current.call.status === 'accepted';

        if (isCaller && current.call.status === 'accepted' && !offerSentRef.current) {
          await createAndSendOffer(pc, 'Création de l’offre');
        }

        if (['rejected', 'ended', 'missed'].includes(current.call.status)) {
          setStatus(current.call.status === 'rejected' ? 'Appel refusé' : 'Appel terminé');
          clearInterval(statusPollRef.current);
          clearInterval(pollRef.current);
          clearInterval(retryRef.current);
          setTimeout(() => nav('/messages'), 1200);
        }
      } catch (e) {
        console.warn('Polling état appel', e);
      }
    }, 600);

    // Sécurité: si le premier échange SDP n'a pas abouti, le caller renvoie une offre.
    // Cela évite les appels bloqués en "Connexion" après une latence Render ou un signal perdu.
    retryRef.current = setInterval(async () => {
      if (!mountedRef.current || !callerRef.current) return;
      if (pc.connectionState === 'connected' || pc.iceConnectionState === 'connected' || pc.iceConnectionState === 'completed') return;
      if (!acceptedRef.current) return;
      try {
        if (pc.signalingState === 'stable') {
          pc.restartIce?.();
          await createAndSendOffer(pc, 'Relance du flux');
        }
      } catch (e) {
        console.warn('Relance WebRTC impossible', e);
      }
    }, 8000);
  }

  async function enableRemoteMedia() {
    await attachRemoteMedia();
  }

  function toggleMute() {
    const tracks = localStreamRef.current?.getAudioTracks() || [];
    tracks.forEach(track => { track.enabled = muted; });
    setMuted(!muted);
  }

  function toggleCamera() {
    const tracks = localStreamRef.current?.getVideoTracks() || [];
    tracks.forEach(track => { track.enabled = cameraOff; });
    setCameraOff(!cameraOff);
  }

  function getVideoSender() {
    const pc = pcRef.current;
    if (!pc) return null;
    const transceiver = pc.getTransceivers().find(t => t.receiver?.track?.kind === 'video');
    if (transceiver?.sender) return transceiver.sender;
    return pc.getSenders().find(s => s.track?.kind === 'video') || null;
  }

  async function restoreCameraAfterShare(sender) {
    const cameraTrack = localStreamRef.current?.getVideoTracks()[0] || null;
    await sender.replaceTrack(cameraTrack && !cameraOff ? cameraTrack : null);
    if (localVideo.current) {
      localVideo.current.srcObject = cameraTrack && !cameraOff ? localStreamRef.current : null;
      if (cameraTrack && !cameraOff) localVideo.current.play().catch(() => {});
    }
    screenStreamRef.current?.getTracks().forEach(track => track.stop());
    screenStreamRef.current = null;
    setSharing(false);
  }

  async function shareScreen() {
    const pc = pcRef.current;
    if (!pc || pc.connectionState === 'closed') {
      setError('La connexion de l’appel n’est pas encore prête.');
      return;
    }

    const sender = getVideoSender();
    if (!sender) {
      setError('Le canal de partage d’écran n’est pas disponible. Relance l’appel.');
      return;
    }

    if (sharing) {
      try { await restoreCameraAfterShare(sender); } catch (e) { setError(e.message || 'Impossible d’arrêter le partage.'); }
      return;
    }

    try {
      setError('');
      const screen = await navigator.mediaDevices.getDisplayMedia({ video: { frameRate: { ideal: 15, max: 30 } }, audio: false });
      screenStreamRef.current = screen;
      const screenTrack = screen.getVideoTracks()[0];
      if (!screenTrack) throw new Error('Aucun écran n’a été sélectionné.');

      await sender.replaceTrack(screenTrack);
      if (localVideo.current) {
        localVideo.current.srcObject = screen;
        localVideo.current.muted = true;
        localVideo.current.play().catch(() => {});
      }

      screenTrack.onended = () => restoreCameraAfterShare(sender).catch(e => console.warn('Retour caméra impossible', e));
      setSharing(true);
      setDebugState('Partage d’écran actif');
    } catch (e) {
      screenStreamRef.current?.getTracks().forEach(track => track.stop());
      screenStreamRef.current = null;
      if (e?.name !== 'NotAllowedError' && e?.name !== 'AbortError') setError(e.message || "Impossible de partager l'écran.");
    }
  }

  async function retryMediaFlow() {
    const pc = pcRef.current;
    if (!pc) return;
    try {
      setError('');
      setStatus('Relance du flux…');
      await attachRemoteMedia();
      if (callerRef.current && pc.signalingState === 'stable') {
        pc.restartIce?.();
        await createAndSendOffer(pc, 'Relance manuelle du flux');
      } else {
        await pollSignals(pc);
      }
    } catch (e) {
      setError(e.message || 'Impossible de relancer le flux.');
    }
  }

  async function endCall() {
    try { await api.endCall(id, token); } catch {}
    clearInterval(pollRef.current);
    clearInterval(statusPollRef.current);
    clearInterval(retryRef.current);
    pcRef.current?.close();
    localStreamRef.current?.getTracks().forEach(track => track.stop());
    screenStreamRef.current?.getTracks().forEach(track => track.stop());
    nav('/messages');
  }

  const otherName = call ? (call.caller_id === user?.id ? call.callee_name : call.caller_name) : 'Utilisateur';
  const isAudioCall = call?.call_type === 'audio';
  const showRemoteVideo = !isAudioCall || remoteHasVideo;
  const showLocalVideo = !isAudioCall || sharing || localStreamRef.current?.getVideoTracks?.().length > 0;

  return <AppShell><div className="page real-call-page">
    <div className="real-call-header">
      <button onClick={() => nav(-1)}>←</button>
      <div>
        <h1>{isAudioCall ? 'Appel audio' : 'Visioconférence'}</h1>
        <p>{status} · {otherName}</p>
      </div>
    </div>

    {warning && <div className="admin-warning">{warning}</div>}
    {error && <div className="admin-error">{error}</div>}
    {needsMediaPlay && <button className="media-unlock-btn" onClick={enableRemoteMedia}>🔊 Activer le son</button>}

    <div className={`real-call-stage ${isAudioCall && !remoteHasVideo ? 'audio-call-stage' : ''}`} onClick={() => needsMediaPlay && enableRemoteMedia()}>
      <audio ref={remoteAudio} autoPlay playsInline preload="auto" />
      {showRemoteVideo && <video ref={remoteVideo} autoPlay muted playsInline className="remote-video" />}
      <div className="call-placeholder">
        <div className="pulse-avatar">{otherName?.charAt(0) || '?'}</div>
        <h2>{otherName}</h2>
        <p>{status}</p>
      </div>
      {showLocalVideo && <video ref={localVideo} autoPlay muted playsInline className="local-video" />}
      <span className="call-timer">{fmtTime(seconds)}</span>
      <small className="call-debug-state">{networkState} · {debugState}</small>
    </div>

    <div className="real-call-controls">
      <button onClick={toggleMute} className={muted ? 'active-off' : ''}><span>{muted ? '🔇' : '🎙️'}</span>{muted ? 'Réactiver' : 'Micro'}</button>
      <button onClick={toggleCamera} disabled={isAudioCall || !mediaStartedRef.current} className={cameraOff ? 'active-off' : ''}><span>{cameraOff ? '🚫' : '📹'}</span>{isAudioCall ? 'Audio' : (cameraOff ? 'Activer' : 'Caméra')}</button>
      <button onClick={shareScreen} className={sharing ? 'active-share' : ''}><span>🖥️</span>{sharing ? 'Arrêter' : 'Partager'}</button>
      <button onClick={retryMediaFlow}><span>🔁</span>Relancer le flux</button>
      <button onClick={() => setChatOpen(!chatOpen)}><span>💬</span>Chat</button>
      <button className="hangup" onClick={endCall}><span>☎</span>Quitter</button>
    </div>

    {chatOpen && <div className="call-chat-panel">
      <h3>Chat de l’appel</h3>
      <p>La conversation privée reste liée aux deux utilisateurs.</p>
      <button onClick={() => nav(`/messages/${call?.caller_id === user?.id ? call?.callee_id : call?.caller_id}?name=${encodeURIComponent(otherName)}`)}>Ouvrir la conversation</button>
    </div>}
  </div></AppShell>;
}
