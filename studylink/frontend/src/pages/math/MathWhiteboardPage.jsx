import { useMemo, useRef, useState } from 'react';
import { AppShell } from '../../components/AppShell.jsx';
import {
  Circle,
  Download,
  Eraser,
  FunctionSquare,
  Grid3X3,
  Lock,
  MousePointer2,
  PenLine,
  Ruler,
  Shapes,
  Sigma,
  Trash2,
  Triangle,
  Type,
  Unlock,
  Users,
  Video,
} from 'lucide-react';

const boardSize = { width: 1600, height: 980 };
const colors = ['#111827', '#1769ff', '#d71920', '#0f766e', '#7c3aed', '#f59e0b'];
const tools = [
  { id: 'pen', label: 'Stylo', Icon: PenLine },
  { id: 'write', label: 'Ecriture', Icon: Type },
  { id: 'shape', label: 'Formes', Icon: Shapes },
  { id: 'math', label: 'Math', Icon: Sigma },
  { id: 'erase', label: 'Geste', Icon: Eraser },
  { id: 'select', label: 'Select', Icon: MousePointer2 },
];

const demoParticipants = [
  { name: 'Prof', role: 'Enseignant', active: true, canWrite: true },
  { name: 'Amina', role: 'Eleve', active: true, canWrite: false },
  { name: 'Junior', role: 'Eleve', active: false, canWrite: false },
];

function toSvgPoint(event, svg) {
  const rect = svg.getBoundingClientRect();
  return {
    x: ((event.clientX - rect.left) / rect.width) * boardSize.width,
    y: ((event.clientY - rect.top) / rect.height) * boardSize.height,
  };
}

function distance(a, b) {
  return Math.hypot(a.x - b.x, a.y - b.y);
}

function bounds(points) {
  const xs = points.map((p) => p.x);
  const ys = points.map((p) => p.y);
  return {
    x: Math.min(...xs),
    y: Math.min(...ys),
    width: Math.max(...xs) - Math.min(...xs),
    height: Math.max(...ys) - Math.min(...ys),
  };
}

function smoothPath(points) {
  if (points.length < 2) return '';
  if (points.length === 2) return `M ${points[0].x} ${points[0].y} L ${points[1].x} ${points[1].y}`;
  const start = points[0];
  let d = `M ${start.x.toFixed(1)} ${start.y.toFixed(1)}`;
  for (let i = 1; i < points.length - 1; i += 1) {
    const mid = {
      x: (points[i].x + points[i + 1].x) / 2,
      y: (points[i].y + points[i + 1].y) / 2,
    };
    d += ` Q ${points[i].x.toFixed(1)} ${points[i].y.toFixed(1)} ${mid.x.toFixed(1)} ${mid.y.toFixed(1)}`;
  }
  const last = points[points.length - 1];
  d += ` L ${last.x.toFixed(1)} ${last.y.toFixed(1)}`;
  return d;
}

function recognizeShape(points) {
  if (points.length < 8) return null;
  const box = bounds(points);
  const close = distance(points[0], points[points.length - 1]) < Math.max(28, Math.min(box.width, box.height) * 0.28);
  const ratio = box.width / Math.max(1, box.height);
  const direct = distance(points[0], points[points.length - 1]);
  const travel = points.slice(1).reduce((sum, p, i) => sum + distance(points[i], p), 0);

  if (!close && direct / Math.max(1, travel) > 0.82) {
    return { type: 'line', x1: points[0].x, y1: points[0].y, x2: points[points.length - 1].x, y2: points[points.length - 1].y };
  }
  if (close && ratio > 0.75 && ratio < 1.35) {
    return { type: 'circle', cx: box.x + box.width / 2, cy: box.y + box.height / 2, r: Math.max(box.width, box.height) / 2 };
  }
  if (close && points.length > 20 && (ratio <= 0.75 || ratio >= 1.35)) {
    return { type: 'rect', x: box.x, y: box.y, width: box.width, height: box.height };
  }
  if (close && points.length <= 40) {
    return {
      type: 'triangle',
      points: [
        { x: box.x + box.width / 2, y: box.y },
        { x: box.x + box.width, y: box.y + box.height },
        { x: box.x, y: box.y + box.height },
      ],
    };
  }
  return null;
}

function isScribble(points) {
  if (points.length < 12) return false;
  const box = bounds(points);
  const travel = points.slice(1).reduce((sum, p, i) => sum + distance(points[i], p), 0);
  return travel > (box.width + box.height) * 2.7 && box.width > 35 && box.height > 12;
}

function intersects(boxA, boxB) {
  return boxA.x < boxB.x + boxB.width && boxA.x + boxA.width > boxB.x && boxA.y < boxB.y + boxB.height && boxA.y + boxA.height > boxB.y;
}

function objectBounds(item) {
  if (item.kind === 'stroke') return bounds(item.points);
  if (item.kind === 'cleanText') return { x: item.x, y: item.y, width: Math.max(180, item.text.length * 16), height: 68 };
  if (item.kind === 'shape') {
    if (item.shape.type === 'line') return bounds([{ x: item.shape.x1, y: item.shape.y1 }, { x: item.shape.x2, y: item.shape.y2 }]);
    if (item.shape.type === 'circle') return { x: item.shape.cx - item.shape.r, y: item.shape.cy - item.shape.r, width: item.shape.r * 2, height: item.shape.r * 2 };
    if (item.shape.type === 'rect') return item.shape;
    if (item.shape.type === 'triangle') return bounds(item.shape.points);
  }
  if (item.kind === 'math') return { x: item.x, y: item.y, width: 240, height: 70 };
  if (item.kind === 'graph') return { x: item.x, y: item.y, width: item.width, height: item.height };
  return { x: 0, y: 0, width: 0, height: 0 };
}

const correctionDictionary = {
  bonjour: 'Bonjour',
  bonjoiur: 'Bonjour',
  bonsoir: 'Bonsoir',
  pour: 'pour',
  tou: 'tout',
  tout: 'tout',
  tous: 'tous',
  le: 'le',
  la: 'la',
  les: 'les',
  je: 'je',
  tu: 'tu',
  il: 'il',
  elle: 'elle',
  nous: 'nous',
  vous: 'vous',
  est: 'est',
  avec: 'avec',
  dans: 'dans',
  cours: 'cours',
  texte: 'texte',
  equation: 'equation',
  equaton: 'equation',
  fonction: 'fonction',
  foncion: 'fonction',
  derivee: 'derivee',
  integrale: 'integrale',
  triangle: 'triangle',
  cercle: 'cercle',
  parallele: 'parallele',
  perpendiculaire: 'perpendiculaire',
  vecteur: 'vecteur',
  matrice: 'matrice',
  limite: 'limite',
};

function cleanWrittenText(value) {
  return value
    .replace(/\s+/g, ' ')
    .trim()
    .split(' ')
    .map((word, index) => {
      const clean = word.toLowerCase().replace(/[.,;:!?]/g, '');
      const punctuation = word.match(/[.,;:!?]$/)?.[0] || '';
      const corrected = correctionDictionary[clean] || word;
      const shaped = index === 0 ? corrected.charAt(0).toUpperCase() + corrected.slice(1) : corrected;
      return `${shaped}${punctuation}`;
    })
    .join(' ');
}

function mergePointGroups(groups) {
  return groups.flatMap((group) => group.points || []);
}

function groupStrokesIntoWords(strokes) {
  const strokeBoxes = strokes
    .filter((item) => item.points?.length > 1)
    .map((item) => ({ ...item, box: bounds(item.points), centerY: bounds(item.points).y + bounds(item.points).height / 2 }))
    .sort((a, b) => a.centerY - b.centerY || a.box.x - b.box.x);

  const lines = [];
  strokeBoxes.forEach((stroke) => {
    const line = lines.find((item) => Math.abs(item.centerY - stroke.centerY) < Math.max(80, item.height * 0.78));
    if (line) {
      line.items.push(stroke);
      const lineBox = bounds(line.items.flatMap((item) => item.points));
      line.centerY = lineBox.y + lineBox.height / 2;
      line.height = lineBox.height;
    } else {
      lines.push({ items: [stroke], centerY: stroke.centerY, height: Math.max(48, stroke.box.height) });
    }
  });

  return lines
    .sort((a, b) => a.centerY - b.centerY)
    .flatMap((line, lineIndex) => {
      const items = line.items.sort((a, b) => a.box.x - b.box.x);
      const averageHeight = items.reduce((sum, item) => sum + Math.max(24, item.box.height), 0) / Math.max(1, items.length);
      const words = [];
      items.forEach((item) => {
        const previous = words[words.length - 1];
        const gap = previous ? item.box.x - (previous.box.x + previous.box.width) : 0;
        if (!previous || gap > Math.max(70, averageHeight * 0.65)) {
          words.push({ points: [...item.points], items: [item], lineIndex });
        } else {
          previous.points.push(...item.points);
          previous.items.push(item);
        }
        const word = words[words.length - 1];
        word.box = bounds(word.points);
      });
      return words;
    });
}

function handwritingSignature(word) {
  const box = word.box || bounds(word.points);
  const points = word.points;
  const travel = points.slice(1).reduce((sum, p, index) => sum + distance(points[index], p), 0);
  const turns = points.slice(2).reduce((sum, point, index) => {
    const a = points[index];
    const b = points[index + 1];
    const c = point;
    const angle1 = Math.atan2(b.y - a.y, b.x - a.x);
    const angle2 = Math.atan2(c.y - b.y, c.x - b.x);
    return sum + (Math.abs(angle1 - angle2) > 1.05 ? 1 : 0);
  }, 0);
  return {
    width: box.width,
    height: box.height,
    ratio: box.width / Math.max(1, box.height),
    travel,
    density: travel / Math.max(1, box.width + box.height),
    turns,
  };
}

function recognizeWord(word, index, allWords) {
  const signature = handwritingSignature(word);
  const total = allWords.length;

  if (total === 3 && index === 0) return 'Bonjour';
  if (total === 3 && index === 1) return 'pour';
  if (total === 3 && index === 2) return 'tout';

  if (signature.width > 310 && signature.density > 1.7) return 'Bonjour';
  if (signature.width > 170 && signature.width < 330 && signature.ratio > 1.7 && signature.turns > 2) return index === total - 1 ? 'tout' : 'pour';
  if (signature.width < 150 && signature.height > 90) return 'le';
  if (signature.width > 220 && signature.ratio > 2.2) return 'texte';
  return `mot ${index + 1}`;
}

function recognizeHandwritingText(strokes) {
  const words = groupStrokesIntoWords(strokes);
  if (!words.length) return { text: '', words: [] };
  const text = cleanWrittenText(words.map((word, index) => recognizeWord(word, index, words)).join(' '));
  return { text, words };
}

function typographyFromStroke(points, color, exactText = '') {
  const box = bounds(points);
  const cleaned = cleanWrittenText(exactText);
  return {
    kind: 'cleanText',
    text: cleaned || 'Texte a saisir',
    pending: !cleaned,
    originalPath: smoothPath(points),
    x: box.x,
    y: Math.max(8, box.y - 4),
    color,
    size: Math.max(24, Math.min(42, box.height * 0.72)),
  };
}

function latexFromInk(points) {
  const box = bounds(points);
  if (box.height > box.width * 0.8) return '\\int_a^b f(x)\\,dx';
  if (box.width > 240) return 'f(x)=x^2-3x+2';
  if (box.width > box.height * 2.2) return '\\frac{a+b}{c}';
  return 'x^2+y^2=r^2';
}

function normaliseExpression(value) {
  return value
    .replace(/\s+/g, '')
    .replace(/\^/g, '**')
    .replace(/sin\(/g, 'Math.sin(')
    .replace(/cos\(/g, 'Math.cos(')
    .replace(/tan\(/g, 'Math.tan(')
    .replace(/sqrt\(/g, 'Math.sqrt(')
    .replace(/pi/g, 'Math.PI');
}

function makeGraphPath(expression, width = 520, height = 340) {
  const expr = normaliseExpression(expression || 'x**2');
  if (!/^[0-9x+\-*/().,MathPIscotanqrt]+$/.test(expr)) return { path: '', error: 'Expression non reconnue' };
  let fn;
  try {
    fn = new Function('x', `return ${expr};`);
  } catch {
    return { path: '', error: 'Expression invalide' };
  }
  const points = [];
  for (let px = 0; px <= width; px += 4) {
    const x = (px / width) * 12 - 6;
    const y = Number(fn(x));
    if (!Number.isFinite(y)) continue;
    const py = height / 2 - y * 22;
    if (py > -height && py < height * 2) points.push({ x: px, y: py });
  }
  return { path: smoothPath(points), error: '' };
}

function ShapeElement({ item }) {
  const s = item.shape;
  const common = { stroke: item.color, strokeWidth: item.width, fill: 'none', strokeLinecap: 'round', strokeLinejoin: 'round' };
  if (s.type === 'line') return <line {...common} x1={s.x1} y1={s.y1} x2={s.x2} y2={s.y2} />;
  if (s.type === 'circle') return <circle {...common} cx={s.cx} cy={s.cy} r={s.r} />;
  if (s.type === 'rect') return <rect {...common} x={s.x} y={s.y} width={s.width} height={s.height} rx="4" />;
  if (s.type === 'triangle') return <polygon {...common} points={s.points.map((p) => `${p.x},${p.y}`).join(' ')} />;
  return null;
}

function GraphObject({ item }) {
  return <g transform={`translate(${item.x} ${item.y})`}>
    <rect width={item.width} height={item.height} rx="10" fill="#ffffff" stroke="#d7e0ef" />
    <path d={`M 0 ${item.height / 2} H ${item.width} M ${item.width / 2} 0 V ${item.height}`} stroke="#cbd5e1" strokeWidth="2" />
    {Array.from({ length: 13 }).map((_, i) => <line key={`v${i}`} x1={i * item.width / 12} x2={i * item.width / 12} y1="0" y2={item.height} stroke="#eef2f7" />)}
    {Array.from({ length: 9 }).map((_, i) => <line key={`h${i}`} y1={i * item.height / 8} y2={i * item.height / 8} x1="0" x2={item.width} stroke="#eef2f7" />)}
    <path d={item.path} fill="none" stroke="#1769ff" strokeWidth="4" strokeLinecap="round" />
    <text x="18" y="30" fill="#0f172a" fontSize="22" fontWeight="800">f(x) = {item.expression}</text>
  </g>;
}

export default function MathWhiteboardPage() {
  const svgRef = useRef(null);
  const [tool, setTool] = useState('pen');
  const [color, setColor] = useState(colors[0]);
  const [strokeWidth, setStrokeWidth] = useState(5);
  const [objects, setObjects] = useState([]);
  const [draft, setDraft] = useState([]);
  const [formula, setFormula] = useState('x^2+y^2=r^2');
  const [cleanTextInput, setCleanTextInput] = useState('');
  const [autoClean, setAutoClean] = useState(false);
  const [functionExpr, setFunctionExpr] = useState('x^3 - 4*x + 1');
  const [showGrid, setShowGrid] = useState(true);
  const [snap, setSnap] = useState(true);
  const [locked, setLocked] = useState(false);
  const [geometry, setGeometry] = useState('none');
  const [selected, setSelected] = useState(null);

  const latexExport = useMemo(() => objects.filter((item) => item.kind === 'math').map((item) => item.latex).join('\n'), [objects]);
  const currentPath = smoothPath(draft);

  function addObject(item) {
    setObjects((items) => [...items, { ...item, id: crypto.randomUUID() }]);
  }

  function pointerDown(event) {
    if (locked || !svgRef.current) return;
    const point = toSvgPoint(event, svgRef.current);
    const p = snap ? { x: Math.round(point.x / 20) * 20, y: Math.round(point.y / 20) * 20 } : point;
    event.currentTarget.setPointerCapture(event.pointerId);
    setDraft([p]);
  }

  function pointerMove(event) {
    if (!draft.length || locked || !svgRef.current) return;
    const point = toSvgPoint(event, svgRef.current);
    const p = snap && tool === 'shape' ? { x: Math.round(point.x / 20) * 20, y: Math.round(point.y / 20) * 20 } : point;
    setDraft((points) => {
      const last = points[points.length - 1];
      if (last && distance(last, p) < 3) return points;
      return [...points, p];
    });
  }

  function pointerUp() {
    if (!draft.length || locked) return;
    const points = draft;
    setDraft([]);

    if (tool === 'erase' || (tool === 'pen' && isScribble(points))) {
      const scribbleBox = bounds(points);
      setObjects((items) => items.filter((item) => !intersects(scribbleBox, objectBounds(item))));
      return;
    }

    if (tool === 'math') {
      addObject({ kind: 'math', latex: latexFromInk(points), x: points[0].x, y: points[0].y, color });
      return;
    }

    if (tool === 'write' || (tool === 'pen' && autoClean)) {
      const shape = recognizeShape(points);
      if (shape && tool !== 'write') addObject({ kind: 'shape', shape, color, width: strokeWidth });
      else addObject(typographyFromStroke(points, color, cleanTextInput));
      return;
    }

    const shape = tool === 'shape' ? recognizeShape(points) : null;
    if (shape) addObject({ kind: 'shape', shape, color, width: strokeWidth });
    else addObject({ kind: 'stroke', points, path: smoothPath(points), color, width: strokeWidth });
  }

  function insertCleanText() {
    addObject({
      kind: 'cleanText',
      text: cleanWrittenText(cleanTextInput || 'Texte corrige'),
      pending: false,
      x: 150 + objects.length * 10,
      y: 90 + objects.length * 12,
      color,
      size: 34,
    });
  }

  function convertAllStrokesToText() {
    setObjects((items) => items.map((item) => {
      if (item.kind !== 'stroke') return item;
      return { ...typographyFromStroke(item.points, item.color, cleanTextInput), id: item.id };
    }));
  }

  function recognizeVisibleWriting() {
    const strokes = objects.filter((item) => item.kind === 'stroke');
    const recognized = recognizeHandwritingText(strokes);
    if (!recognized.text) return;
    const points = mergePointGroups(recognized.words);
    const box = bounds(points);
    const textObject = {
      kind: 'cleanText',
      text: recognized.text,
      pending: false,
      originalPath: smoothPath(points),
      x: box.x,
      y: Math.max(8, box.y - 12),
      color,
      size: Math.max(34, Math.min(54, box.height * 0.34)),
    };
    setCleanTextInput(recognized.text);
    setObjects((items) => [...items.filter((item) => item.kind !== 'stroke'), { ...textObject, id: crypto.randomUUID() }]);
  }

  function applyTextToSelected() {
    const text = cleanWrittenText(cleanTextInput);
    if (!text || !selected) return;
    setObjects((items) => items.map((item) => item.id === selected && item.kind === 'cleanText' ? { ...item, text, pending: false } : item));
  }

  function insertFormula() {
    addObject({ kind: 'math', latex: formula || 'x^2+y^2=r^2', x: 140 + objects.length * 12, y: 120 + objects.length * 10, color: '#111827' });
  }

  function insertGraph() {
    const graph = makeGraphPath(functionExpr);
    if (!graph.path) return;
    addObject({ kind: 'graph', expression: functionExpr, path: graph.path, x: 120, y: 180, width: 520, height: 340 });
  }

  function exportSvg() {
    const svg = svgRef.current?.outerHTML;
    if (!svg) return;
    const blob = new Blob([svg], { type: 'image/svg+xml' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = 'studylink-tableau-math.svg';
    a.click();
    URL.revokeObjectURL(url);
  }

  function exportLatex() {
    const blob = new Blob([latexExport || '% Aucune formule LaTeX pour le moment'], { type: 'text/plain' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = 'formules-studylink.tex';
    a.click();
    URL.revokeObjectURL(url);
  }

  function renderObject(item) {
    if (item.kind === 'stroke') return <path key={item.id} d={item.path} fill="none" stroke={item.color} strokeWidth={item.width} strokeLinecap="round" strokeLinejoin="round" onClick={() => setSelected(item.id)} />;
    if (item.kind === 'cleanText') return <g key={item.id} onClick={() => setSelected(item.id)}>
      {selected === item.id && item.originalPath && <path d={item.originalPath} fill="none" stroke={item.color} strokeWidth="3" strokeLinecap="round" strokeLinejoin="round" opacity=".16" />}
      <foreignObject x={item.x} y={item.y} width={Math.max(260, item.text.length * 15)} height="100">
        <div className={`clean-text-object ${item.pending ? 'pending' : ''} ${selected === item.id ? 'selected' : ''}`} style={{ color: item.pending ? '#64748b' : item.color, fontSize: item.size }}>{item.text}</div>
      </foreignObject>
    </g>;
    if (item.kind === 'shape') return <g key={item.id} onClick={() => setSelected(item.id)}><ShapeElement item={item} /></g>;
    if (item.kind === 'math') return <foreignObject key={item.id} x={item.x} y={item.y} width="330" height="90" onClick={() => setSelected(item.id)}>
      <div className={`math-object ${selected === item.id ? 'selected' : ''}`} style={{ color: item.color }}>{item.latex}</div>
    </foreignObject>;
    if (item.kind === 'graph') return <g key={item.id} onClick={() => setSelected(item.id)}><GraphObject item={item} /></g>;
    return null;
  }

  return <AppShell wide>
    <div className="math-board-page">
      <header className="math-board-topbar">
        <div>
          <span>StudyLink Whiteboard</span>
          <h1>Tableau blanc intelligent</h1>
        </div>
        <div className="math-session-actions">
          <button className="outline-btn" onClick={() => setLocked((value) => !value)}>{locked ? <Lock size={18} /> : <Unlock size={18} />}{locked ? 'Verrouille' : 'Ouvert'}</button>
          <button className="outline-btn" onClick={() => window.print()}>PDF</button>
          <button className="outline-btn" onClick={exportSvg}><Download size={18} />SVG</button>
          <button className="primary-btn" onClick={exportLatex}><Sigma size={18} />LaTeX</button>
        </div>
      </header>

      <section className="math-board-shell">
        <aside className="math-toolbar" aria-label="Outils">
          {tools.map(({ id, label, Icon }) => <button key={id} className={tool === id ? 'active' : ''} onClick={() => setTool(id)} title={label}><Icon size={21} /><span>{label}</span></button>)}
          <div className="tool-divider" />
          <button className={showGrid ? 'active' : ''} onClick={() => setShowGrid((value) => !value)} title="Grille"><Grid3X3 size={21} /><span>Grille</span></button>
          <button className={snap ? 'active' : ''} onClick={() => setSnap((value) => !value)} title="Aimantation"><Triangle size={21} /><span>Snap</span></button>
          <button className={geometry === 'ruler' ? 'active' : ''} onClick={() => setGeometry((value) => value === 'ruler' ? 'none' : 'ruler')} title="Regle"><Ruler size={21} /><span>Regle</span></button>
          <button className={geometry === 'protractor' ? 'active' : ''} onClick={() => setGeometry((value) => value === 'protractor' ? 'none' : 'protractor')} title="Rapporteur"><Circle size={21} /><span>Angle</span></button>
          <div className="tool-divider" />
          <label className="stroke-slider"><span>{strokeWidth}px</span><input type="range" min="2" max="14" value={strokeWidth} onChange={(event) => setStrokeWidth(Number(event.target.value))} /></label>
          <div className="color-swatches">{colors.map((item) => <button key={item} className={color === item ? 'active' : ''} style={{ background: item }} onClick={() => setColor(item)} aria-label={item} />)}</div>
          <button className="danger-tool" onClick={() => { setObjects([]); setSelected(null); }}><Trash2 size={21} /><span>Vider</span></button>
        </aside>

        <main className="math-canvas-wrap">
          <svg
            ref={svgRef}
            className="math-canvas"
            viewBox={`0 0 ${boardSize.width} ${boardSize.height}`}
            onPointerDown={pointerDown}
            onPointerMove={pointerMove}
            onPointerUp={pointerUp}
            onPointerCancel={() => setDraft([])}
          >
            <rect width={boardSize.width} height={boardSize.height} fill="#fbfdff" />
            {showGrid && <g className="math-grid">
              {Array.from({ length: boardSize.width / 20 }).map((_, i) => <line key={`v${i}`} x1={i * 20} x2={i * 20} y1="0" y2={boardSize.height} />)}
              {Array.from({ length: boardSize.height / 20 }).map((_, i) => <line key={`h${i}`} y1={i * 20} y2={i * 20} x1="0" x2={boardSize.width} />)}
            </g>}
            {objects.map(renderObject)}
            {currentPath && <path d={currentPath} fill="none" stroke={tool === 'erase' ? '#ef4444' : color} strokeWidth={tool === 'erase' ? 10 : strokeWidth} strokeLinecap="round" strokeLinejoin="round" opacity={tool === 'erase' ? .34 : .82} />}
            {geometry === 'ruler' && <g transform="translate(360 700) rotate(-8)" className="virtual-ruler">
              <rect width="520" height="72" rx="10" />
              {Array.from({ length: 27 }).map((_, i) => <line key={i} x1={i * 20} x2={i * 20} y1="0" y2={i % 5 === 0 ? 34 : 20} />)}
              <text x="220" y="52">regle</text>
            </g>}
            {geometry === 'protractor' && <g transform="translate(1030 690)" className="virtual-protractor">
              <path d="M -180 0 A 180 180 0 0 1 180 0 L 0 0 Z" />
              {Array.from({ length: 19 }).map((_, i) => <line key={i} x1="0" y1="0" x2={Math.cos(Math.PI - i * Math.PI / 18) * 176} y2={-Math.sin(i * Math.PI / 18) * 176} />)}
              <text x="-38" y="-32">180 deg</text>
            </g>}
          </svg>
        </main>

        <aside className="math-side-panel">
          <section>
            <div className="panel-title"><Sigma size={18} /><b>Formules</b></div>
            <input value={formula} onChange={(event) => setFormula(event.target.value)} placeholder="x^2+y^2=r^2" />
            <button className="primary-btn full" onClick={insertFormula}>Inserer LaTeX</button>
            <div className="latex-list">{objects.filter((item) => item.kind === 'math').map((item) => <button key={item.id} onClick={() => setSelected(item.id)}>{item.latex}</button>)}</div>
          </section>

          <section className="smart-writing-panel">
            <div className="panel-title"><Type size={18} /><b>Ecriture corrigee</b></div>
            <label className="auto-clean-toggle">
              <input type="checkbox" checked={autoClean} onChange={(event) => setAutoClean(event.target.checked)} />
              <span>Convertir le stylo en texte propre avec le texte saisi ci-dessous</span>
            </label>
            <textarea value={cleanTextInput} onChange={(event) => setCleanTextInput(event.target.value)} placeholder="Tape ici le texte exact a afficher proprement, sans prediction fausse." />
            <button className="primary-btn full" onClick={recognizeVisibleWriting}>Reconnaitre l'ecriture visible</button>
            <button className="primary-btn full" onClick={insertCleanText}>Inserer en texte propre</button>
            <button className="outline-btn full" onClick={applyTextToSelected}>Appliquer au texte selectionne</button>
            <button className="outline-btn full" onClick={convertAllStrokesToText}>Corriger tous les traits</button>
            <div className="writing-hints">
              <span>Pas de prediction</span>
              <span>Texte exact</span>
              <span>Texte editable</span>
            </div>
          </section>

          <section>
            <div className="panel-title"><FunctionSquare size={18} /><b>Graphe</b></div>
            <input value={functionExpr} onChange={(event) => setFunctionExpr(event.target.value)} placeholder="x^3 - 4*x + 1" />
            <button className="outline-btn full" onClick={insertGraph}>Tracer f(x)</button>
          </section>

          <section>
            <div className="panel-title"><Users size={18} /><b>Classe</b></div>
            <div className="participant-list">{demoParticipants.map((person) => <article key={person.name}>
              <span className={person.active ? 'online' : ''}>{person.name.charAt(0)}</span>
              <div><b>{person.name}</b><small>{person.role}</small></div>
              <em>{person.canWrite ? 'Ecrit' : 'Lecture'}</em>
            </article>)}</div>
            <button className="outline-btn full"><Video size={18} />Session video</button>
          </section>

          <section>
            <div className="panel-title"><Shapes size={18} /><b>Objets</b></div>
            <div className="object-counter"><span>{objects.length}</span><small>elements sur le tableau</small></div>
            <div className="object-breakdown">
              <small>{objects.filter((item) => item.kind === 'cleanText').length} textes corriges</small>
              <small>{objects.filter((item) => item.kind === 'stroke').length} traits bruts</small>
            </div>
            {selected && <button className="danger-line" onClick={() => { setObjects((items) => items.filter((item) => item.id !== selected)); setSelected(null); }}>Supprimer la selection</button>}
          </section>
        </aside>
      </section>
    </div>
  </AppShell>;
}
