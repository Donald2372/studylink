import { useCallback, useEffect, useRef, useState } from 'react';

const MODES = ['Silence', 'Pluie', 'Café', 'Bibliothèque', 'Forêt', 'Bruit blanc'];

function makeNoiseBuffer(ctx, kind = 'white', seconds = 8) {
  const length = Math.max(1, Math.floor(ctx.sampleRate * seconds));
  const buffer = ctx.createBuffer(2, length, ctx.sampleRate);
  for (let channel = 0; channel < buffer.numberOfChannels; channel += 1) {
    const data = buffer.getChannelData(channel);
    let last = 0;
    let brown = 0;
    for (let i = 0; i < length; i += 1) {
      const white = Math.random() * 2 - 1;
      if (kind === 'brown') {
        brown = (brown + 0.02 * white) / 1.02;
        data[i] = brown * 3.5;
      } else if (kind === 'pink') {
        last = 0.985 * last + 0.15 * white;
        data[i] = last * 0.75;
      } else {
        data[i] = white * 0.72;
      }
    }
  }
  return buffer;
}

function startLoop(ctx, buffer, destination, gainValue = 0.2) {
  const source = ctx.createBufferSource();
  const gain = ctx.createGain();
  source.buffer = buffer;
  source.loop = true;
  gain.gain.value = gainValue;
  source.connect(gain).connect(destination);
  source.start();
  return [source, gain];
}

export function useAmbientAudio() {
  const ctxRef = useRef(null);
  const masterRef = useRef(null);
  const nodesRef = useRef([]);
  const timersRef = useRef([]);
  const [active, setActive] = useState('Silence');
  const [volume, setVolumeState] = useState(0.38);
  const [ready, setReady] = useState(false);

  const ensureContext = useCallback(async () => {
    if (!ctxRef.current) {
      const AudioCtx = window.AudioContext || window.webkitAudioContext;
      if (!AudioCtx) throw new Error('Audio non pris en charge par ce navigateur.');
      const ctx = new AudioCtx();
      const master = ctx.createGain();
      master.gain.value = volume;
      master.connect(ctx.destination);
      ctxRef.current = ctx;
      masterRef.current = master;
      setReady(true);
    }
    if (ctxRef.current.state === 'suspended') await ctxRef.current.resume();
    return { ctx: ctxRef.current, master: masterRef.current };
  }, [volume]);

  const stopNodes = useCallback(() => {
    timersRef.current.forEach((id) => window.clearInterval(id));
    timersRef.current = [];
    nodesRef.current.forEach((node) => {
      try { if (typeof node.stop === 'function') node.stop(); } catch {}
      try { node.disconnect?.(); } catch {}
    });
    nodesRef.current = [];
  }, []);

  const scheduleChirp = useCallback((ctx, master, soft = false) => {
    if (ctx.state === 'closed') return;
    const now = ctx.currentTime;
    const osc = ctx.createOscillator();
    const gain = ctx.createGain();
    osc.type = 'sine';
    osc.frequency.setValueAtTime(soft ? 900 : 1500 + Math.random() * 900, now);
    osc.frequency.exponentialRampToValueAtTime(soft ? 650 : 2100 + Math.random() * 700, now + 0.16);
    gain.gain.setValueAtTime(0.0001, now);
    gain.gain.exponentialRampToValueAtTime(soft ? 0.018 : 0.035, now + 0.025);
    gain.gain.exponentialRampToValueAtTime(0.0001, now + 0.25);
    osc.connect(gain).connect(master);
    osc.start(now);
    osc.stop(now + 0.28);
    nodesRef.current.push(osc, gain);
  }, []);

  const select = useCallback(async (mode) => {
    if (!MODES.includes(mode)) return;
    stopNodes();
    setActive(mode);
    if (mode === 'Silence') return;

    const { ctx, master } = await ensureContext();
    master.gain.setTargetAtTime(volume, ctx.currentTime, 0.08);

    if (mode === 'Bruit blanc') {
      const [src, gain] = startLoop(ctx, makeNoiseBuffer(ctx, 'white'), master, 0.24);
      nodesRef.current.push(src, gain);
      return;
    }

    if (mode === 'Pluie') {
      const white = ctx.createBufferSource();
      white.buffer = makeNoiseBuffer(ctx, 'white');
      white.loop = true;
      const low = ctx.createBiquadFilter();
      low.type = 'lowpass'; low.frequency.value = 6500;
      const rainGain = ctx.createGain(); rainGain.gain.value = 0.19;
      white.connect(low).connect(rainGain).connect(master);
      white.start();

      const detail = ctx.createBufferSource();
      detail.buffer = makeNoiseBuffer(ctx, 'pink'); detail.loop = true;
      const band = ctx.createBiquadFilter(); band.type = 'bandpass'; band.frequency.value = 2800; band.Q.value = 0.7;
      const detailGain = ctx.createGain(); detailGain.gain.value = 0.11;
      detail.connect(band).connect(detailGain).connect(master); detail.start();
      nodesRef.current.push(white, low, rainGain, detail, band, detailGain);
      return;
    }

    if (mode === 'Café') {
      const brown = ctx.createBufferSource();
      brown.buffer = makeNoiseBuffer(ctx, 'brown'); brown.loop = true;
      const low = ctx.createBiquadFilter(); low.type = 'lowpass'; low.frequency.value = 1300;
      const gain = ctx.createGain(); gain.gain.value = 0.12;
      brown.connect(low).connect(gain).connect(master); brown.start();
      const interval = window.setInterval(() => scheduleChirp(ctx, master, true), 3800 + Math.random() * 2400);
      timersRef.current.push(interval);
      nodesRef.current.push(brown, low, gain);
      return;
    }

    if (mode === 'Bibliothèque') {
      const brown = ctx.createBufferSource();
      brown.buffer = makeNoiseBuffer(ctx, 'brown'); brown.loop = true;
      const low = ctx.createBiquadFilter(); low.type = 'lowpass'; low.frequency.value = 520;
      const gain = ctx.createGain(); gain.gain.value = 0.075;
      brown.connect(low).connect(gain).connect(master); brown.start();
      const hum = ctx.createOscillator(); hum.type = 'sine'; hum.frequency.value = 58;
      const humGain = ctx.createGain(); humGain.gain.value = 0.012;
      hum.connect(humGain).connect(master); hum.start();
      nodesRef.current.push(brown, low, gain, hum, humGain);
      return;
    }

    if (mode === 'Forêt') {
      const pink = ctx.createBufferSource();
      pink.buffer = makeNoiseBuffer(ctx, 'pink'); pink.loop = true;
      const low = ctx.createBiquadFilter(); low.type = 'lowpass'; low.frequency.value = 2400;
      const gain = ctx.createGain(); gain.gain.value = 0.08;
      pink.connect(low).connect(gain).connect(master); pink.start();
      scheduleChirp(ctx, master, false);
      const interval = window.setInterval(() => scheduleChirp(ctx, master, false), 4200 + Math.random() * 3200);
      timersRef.current.push(interval);
      nodesRef.current.push(pink, low, gain);
    }
  }, [ensureContext, scheduleChirp, stopNodes, volume]);

  const setVolume = useCallback((next) => {
    const value = Math.max(0, Math.min(1, Number(next)));
    setVolumeState(value);
    if (ctxRef.current && masterRef.current) {
      masterRef.current.gain.setTargetAtTime(value, ctxRef.current.currentTime, 0.06);
    }
  }, []);

  useEffect(() => () => {
    stopNodes();
    const ctx = ctxRef.current;
    if (ctx && ctx.state !== 'closed') ctx.close().catch(() => {});
  }, [stopNodes]);

  return { active, volume, ready, select, setVolume, stop: () => select('Silence') };
}
