import { useEffect, useMemo, useState } from 'react';
import { Link, useLocation, useNavigate, useParams } from 'react-router-dom';
import { api } from '../../api.js';
import { useAuth } from '../../context/AuthContext.jsx';
import { AppShell, PageHeader, Progress } from '../../components/AppShell.jsx';
import { PYTHON_COURSE_SLUG, pythonCourseFallback, flattenCourseLessons } from '../../data/pythonCourseData.js';
import { englishCourseFallback, isEnglishCourseId } from '../../data/englishCourseData.js';

const englishThemes = {
  A1: { accent: '#1769ff', soft: '#eef5ff', text: '#0f3f91', image: 'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?auto=format&fit=crop&w=1200&q=85' },
  A2: { accent: '#0f9f6e', soft: '#ecfbf5', text: '#08734f', image: 'https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?auto=format&fit=crop&w=1200&q=85' },
  B1: { accent: '#e17800', soft: '#fff6e8', text: '#9a5200', image: 'https://images.unsplash.com/photo-1551836022-d5d88e9218df?auto=format&fit=crop&w=1200&q=85' },
  B2: { accent: '#7c4ae6', soft: '#f5efff', text: '#5531a8', image: 'https://images.unsplash.com/photo-1552664730-d307ca884978?auto=format&fit=crop&w=1200&q=85' },
  C1: { accent: '#d93662', soft: '#fff0f4', text: '#9f2244', image: 'https://images.unsplash.com/photo-1556761175-b413da4baf72?auto=format&fit=crop&w=1200&q=85' },
};

const englishVideoLibrary = {
  A1: [
    { youtube_video_id: 'I_tRSrPru94', title: 'Introductions and beginner English', channel: 'BBC Learning English', minutes: 6 },
    { youtube_video_id: 'SHXPpsIJTb0', title: 'Asking for directions', channel: 'BBC Learning English', minutes: 6 },
    { youtube_video_id: '7GSrQ4DX8gY', title: 'Basic grammar patterns', channel: 'BBC Learning English', minutes: 6 },
  ],
  A2: [
    { youtube_video_id: 'PgsG98vByiw', title: 'Past simple practice', channel: 'BBC Learning English', minutes: 6 },
    { youtube_video_id: 'bVRIpmjTSxM', title: 'Ordering food in English', channel: 'BBC Learning English', minutes: 6 },
    { youtube_video_id: 'FAhpT7BH7GE', title: 'Comparatives and superlatives', channel: 'BBC Learning English', minutes: 6 },
  ],
  B1: [
    { youtube_video_id: 'jwmKjgwlMk8', title: 'Present perfect', channel: 'BBC Learning English', minutes: 6 },
    { youtube_video_id: 'elPHkXNxi2g', title: 'Future plans', channel: 'BBC Learning English', minutes: 6 },
    { youtube_video_id: 'O-jJPd5ZYo4', title: 'Advice with should and must', channel: 'BBC Learning English', minutes: 6 },
  ],
  B2: [
    { youtube_video_id: 'D58LCh_1jmM', title: 'Debate and opinion phrases', channel: 'BBC Learning English', minutes: 6 },
    { youtube_video_id: '7GSrQ4DX8gY', title: 'Passive voice', channel: 'BBC Learning English', minutes: 6 },
    { youtube_video_id: 'uDoBdq0s8eY', title: 'Conditionals', channel: 'BBC Learning English', minutes: 6 },
  ],
  C1: [
    { youtube_video_id: 'VxQNOXpoLC8', title: 'Hedging and advanced nuance', channel: 'BBC Learning English', minutes: 6 },
    { youtube_video_id: 'LEi8Cs2z0Q4', title: 'Academic writing style', channel: 'BBC Learning English', minutes: 6 },
    { youtube_video_id: 'K-Nps59NeBA', title: 'Persuasive speaking', channel: 'BBC Learning English', minutes: 6 },
  ],
};

const extractLine = (content = '', label) => {
  const line = content.split('\n').find((item) => item.trim().toLowerCase().startsWith(label.toLowerCase()));
  return line ? line.replace(new RegExp(`^${label}\\s*:?\\s*`, 'i'), '').trim() : '';
};

function enrichEnglishLesson(lesson, courseId) {
  if (!isEnglishCourseId(courseId) && !/anglais|english|A1|A2|B1|B2|C1/i.test(`${lesson.title} ${lesson.module?.title || ''}`)) return lesson;
  const level = (`${lesson.title} ${lesson.module?.title || ''}`.match(/\b(A1|A2|B1|B2|C1)\b/i)?.[1] || 'A1').toUpperCase();
  const theme = englishThemes[level] || englishThemes.A1;
  const cleanTitle = lesson.title
    .replace(/\b(A1|A2|B1|B2|C1)\b/gi, '')
    .replace(/\s-\s(Video de la lecon|Explication et objets|Exercices corriges|Quiz et oral).*$/i, '')
    .trim() || lesson.title;
  const content = lesson.content || '';
  const situation = extractLine(content, 'Situation') || extractLine(content, '- Comprendre la situation') || 'Utiliser l anglais dans une situation reelle et concrete.';
  const grammar = extractLine(content, 'Grammaire') || extractLine(content, '- Utiliser la grammaire') || 'structure grammaticale de la lecon';
  const vocabText = extractLine(content, 'Vocabulaire') || extractLine(content, '- Employer le vocabulaire') || 'useful words, expressions and pronunciation';
  const vocabulary = vocabText.split(',').map((item) => item.trim()).filter(Boolean).slice(0, 10);
  const baseVideos = englishVideoLibrary[level] || englishVideoLibrary.A1;
  const directVideo = lesson.youtube_video_id ? [{ youtube_video_id: lesson.youtube_video_id, title: `${cleanTitle} - video principale`, channel: 'StudyLink English', minutes: Math.max(1, Math.round((Number(lesson.duration_seconds) || 600) / 60)) }] : [];
  const videos = [...directVideo, ...baseVideos]
    .filter((video, index, arr) => video.youtube_video_id && arr.findIndex((item) => item.youtube_video_id === video.youtube_video_id) === index)
    .map((video, index) => ({
      id: `${lesson.id}-video-${index}`,
      ...video,
      thumbnail_url: `https://img.youtube.com/vi/${video.youtube_video_id}/hqdefault.jpg`,
      description: `Video integree pour pratiquer ${cleanTitle} au niveau ${level}.`,
    }));

  return {
    ...lesson,
    theme: lesson.theme || theme,
    image_url: lesson.image_url || theme.image,
    vocabulary: lesson.vocabulary?.length ? lesson.vocabulary : vocabulary,
    grammar_focus: lesson.grammar_focus || grammar,
    audio_script: lesson.audio_script || `${cleanTitle}. ${situation} ${grammar}. ${vocabulary.slice(0, 5).join(', ')}.`,
    lesson_objectives: lesson.lesson_objectives?.length ? lesson.lesson_objectives : [
      `Comprendre la situation : ${situation}`,
      `Utiliser correctement : ${grammar}`,
      `Employer le vocabulaire utile : ${vocabulary.slice(0, 6).join(', ') || vocabText}`,
      'Produire une reponse orale courte, claire et naturelle',
    ],
    learning_objects: lesson.learning_objects?.length ? lesson.learning_objects : [
      { label: 'Situation', value: situation },
      { label: 'Objet grammatical', value: grammar },
      { label: 'Objet vocabulaire', value: vocabulary.slice(0, 6).join(', ') || vocabText },
      { label: 'Objet oral', value: 'ecouter, repeter, repondre, puis reformuler avec ses propres mots' },
      { label: 'Niveau CECRL', value: level },
    ],
    detailed_sections: lesson.detailed_sections?.length ? lesson.detailed_sections : [
      { title: '1. Mise en situation', body: `Cette lecon commence par une situation concrete: ${situation} L objectif est de savoir quoi dire, dans quel ordre, avec quel niveau de politesse et avec quelle structure.` },
      { title: '2. Objet de langue', body: `Le coeur de la lecon est: ${grammar}. On observe la forme, on comprend sa fonction, puis on l utilise dans plusieurs phrases personnelles.` },
      { title: '3. Construction du sens', body: `Le vocabulaire n est pas une liste a memoriser. Les mots (${vocabulary.slice(0, 8).join(', ') || vocabText}) servent a construire un message utile dans la vraie vie.` },
      { title: '4. Production interactive', body: 'L apprenant ecoute la video, repete les phrases, repond au prompt oral, verifie les erreurs frequentes et valide avec un quiz ou un exercice.' },
    ],
    examples: lesson.examples?.length ? lesson.examples : [
      { title: 'Phrase modele', text: vocabulary[0] ? `I can use "${vocabulary[0]}" in a clear sentence.` : 'I can answer clearly in this situation.' },
      { title: 'Question utile', text: 'Could you repeat that, please?' },
      { title: 'Reponse personnelle', text: `In this situation, I want to be clear, polite and specific.` },
    ],
    common_mistakes: lesson.common_mistakes?.length ? lesson.common_mistakes : [
      'Traduire mot a mot depuis le francais au lieu d utiliser une structure anglaise simple.',
      `Oublier le point de grammaire principal : ${grammar}.`,
      'Parler trop vite avant de maitriser la prononciation et les pauses.',
    ],
    corrected_exercise: lesson.corrected_exercise || {
      prompt: `Produisez six phrases personnelles pour la situation suivante : ${situation}`,
      answer: `In this situation, I would speak clearly and use the key grammar: ${grammar}.`,
      correction: 'La reponse est correcte si elle utilise la structure cible, au moins quatre mots de vocabulaire et une question de relance.',
    },
    oral_practice: lesson.oral_practice || {
      prompt: `Speak for 60 seconds in English. Situation: ${situation}`,
      checklist: [`Use the grammar: ${grammar}`, `Use vocabulary: ${vocabulary.slice(0, 4).join(', ') || vocabText}`, 'Finish with one follow-up question'],
      modelAnswer: `In this situation, I would be polite and clear. I would use simple sentences, key vocabulary and one follow-up question.`,
    },
    youtube_videos: videos,
  };
}

function YouTubeEmbed({ id, title }) {
  if (!id) return null;
  return <div className="lesson-video-frame"><iframe src={`https://www.youtube.com/embed/${id}?rel=0`} title={title || 'Video StudyLink'} allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowFullScreen /></div>;
}

function renderContent(content = '') {
  return content.split('\n').map((line, index) => line.trim() ? <p key={index}>{line}</p> : <br key={index} />);
}

function speak(text) {
  if (!text || !('speechSynthesis' in window)) return;
  window.speechSynthesis.cancel();
  const utterance = new SpeechSynthesisUtterance(text);
  utterance.lang = 'en-US';
  utterance.rate = 0.86;
  utterance.pitch = 1;
  window.speechSynthesis.speak(utterance);
}

function LanguageAudioLab({ lesson, transcript, setTranscript }) {
  const [recording, setRecording] = useState(false);
  const recognitionAvailable = typeof window !== 'undefined' && (window.SpeechRecognition || window.webkitSpeechRecognition);
  const script = lesson.audio_script || lesson.content || '';
  const oral = lesson.oral_practice;

  function startRecording() {
    const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
    if (!SpeechRecognition) return;
    const recognition = new SpeechRecognition();
    recognition.lang = 'en-US';
    recognition.interimResults = false;
    recognition.maxAlternatives = 1;
    recognition.onstart = () => setRecording(true);
    recognition.onend = () => setRecording(false);
    recognition.onerror = () => setRecording(false);
    recognition.onresult = (event) => setTranscript(event.results?.[0]?.[0]?.transcript || '');
    recognition.start();
  }

  return <div className="course-panel language-lab">
    <div className="between"><div><h2>Audio et entrainement oral</h2><p>Ecoutez le modele, repetez, puis enregistrez une reponse courte.</p></div><button className="primary-btn" onClick={() => speak(script)}>Ecouter le modele</button></div>
    <div className="language-lab-grid">
      <section>
        <h3>Script audio</h3>
        <p>{script}</p>
        <div className="language-chip-row">{(lesson.vocabulary || []).map((word) => <button key={word} onClick={() => speak(word)}>{word}</button>)}</div>
      </section>
      {oral && <section>
        <h3>Mission orale</h3>
        <p>{oral.prompt}</p>
        <ul>{oral.checklist.map((item) => <li key={item}>{item}</li>)}</ul>
        <div className="language-lab-actions">
          <button className="outline-btn" onClick={() => speak(oral.modelAnswer)}>Ecouter une reponse modele</button>
          <button className="primary-btn" onClick={startRecording} disabled={!recognitionAvailable || recording}>{recording ? 'Enregistrement...' : 'Parler maintenant'}</button>
        </div>
        {!recognitionAvailable && <small>La reconnaissance vocale n est pas disponible dans ce navigateur, mais vous pouvez pratiquer avec le script et le modele audio.</small>}
        {transcript && <div className="speech-result"><b>Votre transcription</b><p>{transcript}</p></div>}
      </section>}
    </div>
  </div>;
}

function LessonAnnotations({ lesson }) {
  if (!lesson.annotations?.length && !lesson.grammar_focus) return null;
  return <div className="course-panel language-annotations">
    <h2>Annotations pedagogiques</h2>
    {lesson.grammar_focus && <p><b>Focus grammaire :</b> {lesson.grammar_focus}</p>}
    <div className="annotation-list">{(lesson.annotations || []).map((item) => <span key={item}>{item}</span>)}</div>
  </div>;
}

function LessonRichOverview({ lesson, done }) {
  const theme = lesson.theme || { accent: '#1769ff', soft: '#eef5ff', text: '#0f3f91' };
  return <>
    {lesson.image_url && <div className="lesson-visual-card rich" style={{ '--lesson-accent': theme.accent, '--lesson-soft': theme.soft, '--lesson-text': theme.text }}><img src={lesson.image_url} alt="" /><div><span>Contexte de la lecon</span><b>{lesson.title}</b><p>{lesson.oral_practice?.prompt || 'Observez la situation, identifiez les interlocuteurs et preparez le langage utile.'}</p></div></div>}
    {lesson.lesson_objectives?.length > 0 && <div className="course-panel lesson-objectives-panel" style={{ '--lesson-accent': theme.accent, '--lesson-soft': theme.soft, '--lesson-text': theme.text }}>
      <div className="lesson-panel-head"><span>Objectifs</span><h2>Ce que vous devez savoir faire</h2></div>
      <div className="lesson-objective-list">{lesson.lesson_objectives.map((item, index) => <article key={item}><span>{index + 1}</span><p>{item}</p></article>)}</div>
    </div>}
    {lesson.learning_objects?.length > 0 && <div className="course-panel lesson-object-panel" style={{ '--lesson-accent': theme.accent, '--lesson-soft': theme.soft, '--lesson-text': theme.text }}>
      <div className="lesson-panel-head"><span>Objets</span><h2>Objets du cours</h2></div>
      <div className="lesson-object-grid">{lesson.learning_objects.map((item) => <article key={item.label}><span>{item.label}</span><b>{item.value}</b></article>)}</div>
    </div>}
    {lesson.detailed_sections?.length > 0 && <div className="course-panel lesson-detail-panel" style={{ '--lesson-accent': theme.accent, '--lesson-soft': theme.soft, '--lesson-text': theme.text }}>
      <div className="lesson-panel-head"><span>Explication</span><h2>Comprendre le cours pas a pas</h2></div>
      <div className="lesson-section-list">{lesson.detailed_sections.map((section) => <article key={section.title}><h3>{section.title}</h3><p>{section.body}</p></article>)}</div>
    </div>}
    <div className="course-panel lesson-copy lesson-reference-copy">
      <h2>Fiche complete</h2>
      {renderContent(lesson.content || 'Le contenu complementaire de cette lecon sera bientot disponible.')}
      {done && <div className="lesson-success">✓ Cette lecon est terminee et enregistree dans votre progression.</div>}
    </div>
    {lesson.examples?.length > 0 && <div className="course-panel lesson-examples-panel">
      <h2>Exemples expliques</h2>
      <div className="lesson-example-list">{lesson.examples.map((item) => <article key={item.title}><span>{item.title}</span><p>{item.text}</p><button onClick={() => speak(item.text)}>Ecouter</button></article>)}</div>
    </div>}
    {lesson.common_mistakes?.length > 0 && <div className="course-panel language-annotations">
      <h2>Erreurs frequentes</h2>
      <div className="annotation-list">{lesson.common_mistakes.map((item) => <span key={item}>{item}</span>)}</div>
    </div>}
    <LessonAnnotations lesson={lesson} />
  </>;
}

function LessonVideos({ lesson }) {
  const videos = lesson.youtube_videos || [];
  const [active, setActive] = useState(videos[0]?.youtube_video_id || '');
  useEffect(() => { setActive(videos[0]?.youtube_video_id || ''); }, [lesson.id]);
  const current = videos.find((video) => video.youtube_video_id === active) || videos[0];
  return <div className="course-panel lesson-youtube-panel">
    <div className="lesson-panel-head"><span>Videos</span><h2>Videos de la lecon</h2></div>
    {current?.youtube_video_id && <div className="lesson-integrated-video"><iframe src={`https://www.youtube-nocookie.com/embed/${current.youtube_video_id}?rel=0`} title={current.title} allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowFullScreen /></div>}
    <div className="youtube-recommendation-grid embedded">
      {videos.map((video) => <button key={video.id} type="button" className={video.youtube_video_id === current?.youtube_video_id ? 'active' : ''} onClick={() => setActive(video.youtube_video_id)}>
        <img src={video.thumbnail_url} alt="" />
        <div><b>{video.title}</b><small>{video.channel} - {video.minutes} min</small><p>{video.description}</p></div>
      </button>)}
    </div>
  </div>;
}

export default function LessonPage() {
  const { id } = useParams();
  const { search } = useLocation();
  const navigate = useNavigate();
  const courseId = new URLSearchParams(search).get('course') || PYTHON_COURSE_SLUG;
  const { token } = useAuth();
  const [data, setData] = useState(null);
  const [learning, setLearning] = useState({ enrollment: null, progress: [], notes: [] });
  const [tab, setTab] = useState('Resume');
  const [note, setNote] = useState('');
  const [savingNote, setSavingNote] = useState(false);
  const [error, setError] = useState('');
  const [exerciseChecks, setExerciseChecks] = useState([false, false, false]);
  const [quizAnswers, setQuizAnswers] = useState(['', '', '']);
  const [richQuizAnswers, setRichQuizAnswers] = useState({});
  const [speechTranscript, setSpeechTranscript] = useState('');

  const fallback = courseId === PYTHON_COURSE_SLUG || courseId === 'demo-python' || isEnglishCourseId(courseId);
  useEffect(() => {
    api.getCourse(courseId)
      .then(setData)
      .catch((e) => {
        if (fallback) setData(isEnglishCourseId(courseId) ? englishCourseFallback : pythonCourseFallback);
        else setError(e.message);
      });
  }, [courseId, fallback]);
  useEffect(() => {
    if (token && data) api.getCourseLearning(courseId, token).then((r) => {
      setLearning(r);
      const existing = (r.notes || []).find((n) => String(n.lesson_id) === String(id));
      setNote(existing?.content || '');
    }).catch(() => {});
  }, [courseId, id, token, data]);
  useEffect(() => {
    setExerciseChecks([false, false, false]);
    setQuizAnswers(['', '', '']);
    setRichQuizAnswers({});
    setSpeechTranscript('');
    setTab('Resume');
  }, [id]);

  const flat = useMemo(() => flattenCourseLessons(data || { modules: [] }), [data]);
  const rawLesson = flat.find((l) => String(l.id) === String(id));
  const lesson = rawLesson ? enrichEnglishLesson(rawLesson, courseId) : null;
  const index = flat.findIndex((l) => String(l.id) === String(id));
  const progress = learning.progress?.find((p) => String(p.lesson_id) === String(id));
  const done = progress?.status === 'completed';
  const overall = learning.enrollment?.progress_percent ? Math.round(Number(learning.enrollment.progress_percent)) : Math.round((learning.progress || []).filter((p) => p.status === 'completed').length / Math.max(1, flat.length) * 100);

  async function complete() {
    if (!token) return navigate('/login');
    try {
      const r = await api.saveLessonProgress(id, { progress_percent: 100, completed: true }, token);
      setLearning((s) => ({ ...s, progress: [...(s.progress || []).filter((p) => String(p.lesson_id) !== String(id)), r.progress], enrollment: { ...(s.enrollment || {}), progress_percent: r.course_progress_percent } }));
    } catch (e) { setError(e.message); }
  }
  async function saveNote() {
    if (!token) return navigate('/login');
    setSavingNote(true);
    try {
      const r = await api.saveLessonNote(id, note, token);
      setLearning((s) => ({ ...s, notes: [...(s.notes || []).filter((n) => String(n.lesson_id) !== String(id)), ...(r.note ? [r.note] : [])] }));
    } catch (e) { setError(e.message); }
    finally { setSavingNote(false); }
  }

  if (!lesson) return <AppShell><div className="page course-page"><PageHeader title="Lecon StudyLink" back />{error ? <div className="admin-error">{error}</div> : <div className="course-skeleton">Chargement de la lecon...</div>}</div></AppShell>;
  const prev = flat[index - 1], next = flat[index + 1];
  const tabs = ['Resume', 'Videos', 'Audio oral', 'Notes', 'Ressources', 'Exercices'].filter((item) => item !== 'Audio oral' || lesson.audio_script || lesson.oral_practice);

  return <AppShell><div className="page lesson-page"><PageHeader title="Lecon" back />
    {error && <div className="admin-error">{error}</div>}
    <div className="lesson-topbar"><div><p className="breadcrumb">Mes cours &gt; {data.course.title} &gt; {lesson.module.title}</p><h1>{lesson.title}</h1><p>{lesson.module.title} - {Math.max(1, Math.round((Number(lesson.duration_seconds) || 0) / 60))} min - {data.course.level === 'beginner' ? 'Debutant' : data.course.level}</p></div><div className="lesson-overall-progress"><span>{overall}% du cours</span><Progress value={overall} /></div></div>

    {lesson.lesson_type === 'youtube' && <YouTubeEmbed id={lesson.youtube_video_id} title={lesson.title} />}
    {lesson.lesson_type === 'video_upload' && lesson.media_url && <video src={lesson.media_url} controls className="uploaded-video" />}
    {lesson.lesson_type === 'pdf' && lesson.media_url && <div className="lesson-file-card"><span>PDF</span><div><b>{lesson.title}</b><p>Document de la lecon</p></div><a href={lesson.media_url} target="_blank" rel="noreferrer">Ouvrir</a></div>}
    {['exercise', 'text', 'audio'].includes(lesson.lesson_type) && <div className={`lesson-type-banner ${lesson.lesson_type}`}><span>{lesson.lesson_type === 'exercise' ? '⌘' : lesson.lesson_type === 'audio' ? '♪' : '▤'}</span><div><b>{lesson.lesson_type === 'exercise' ? 'Exercice pratique' : lesson.lesson_type === 'audio' ? 'Audio et prononciation' : 'Lecture guidee'}</b><p>Suivez les consignes ci-dessous, puis marquez la lecon comme terminee.</p></div></div>}

    <nav className="lesson-tabs">{tabs.map((item) => <button key={item} onClick={() => setTab(item)} className={tab === item ? 'active' : ''}>{item}{item === 'Ressources' && lesson.resources?.length ? ` (${lesson.resources.length})` : ''}</button>)}</nav>

    <section className="lesson-content-grid">
      <main className="lesson-main-content">
        {tab === 'Resume' && <LessonRichOverview lesson={lesson} done={done} />}
        {tab === 'Videos' && <LessonVideos lesson={lesson} />}
        {tab === 'Audio oral' && <LanguageAudioLab lesson={lesson} transcript={speechTranscript} setTranscript={setSpeechTranscript} />}
        {tab === 'Notes' && <div className="course-panel"><div className="between"><div><h2>Mes notes personnelles</h2><p>Vos notes sont privees et liees a votre compte.</p></div><button className="primary-btn" onClick={saveNote} disabled={savingNote}>{savingNote ? 'Enregistrement...' : 'Enregistrer'}</button></div><textarea className="lesson-note-editor" rows="12" value={note} onChange={(e) => setNote(e.target.value)} placeholder="Ecrivez ici ce que vous voulez retenir, une question a poser au tuteur, un extrait..." /></div>}
        {tab === 'Ressources' && <div className="course-panel"><h2>Ressources de la lecon</h2>{lesson.resources?.length ? <div className="course-resource-grid">{lesson.resources.map((r) => <a key={r.id} className="course-resource-card" href={r.url} target="_blank" rel="noreferrer"><span>↗</span><div><b>{r.title}</b><small>{r.resource_type || 'Lien'}</small></div><strong>Ouvrir</strong></a>)}</div> : <p>Aucune ressource specifique n a ete ajoutee a cette lecon.</p>}</div>}
        {tab === 'Exercices' && <div className="course-panel lesson-exercise-panel">
          <h2>{lesson.lesson_type === 'quiz' || lesson.quiz?.length ? 'Quiz de validation' : 'Passer a la pratique'}</h2>
          {lesson.quiz?.length ? <>
            <p>Choisissez la meilleure reponse, puis validez quand toutes les questions sont completees.</p>
            <div className="lesson-quiz-list">
              {lesson.quiz.map((question, i) => <div className="lesson-quiz-question" key={question.question}><b>{i + 1}. {question.question}</b><div>{question.options.map((option) => <button key={option} className={richQuizAnswers[i] === option ? 'active' : ''} onClick={() => setRichQuizAnswers((a) => ({ ...a, [i]: option }))}>{option}</button>)}</div>{richQuizAnswers[i] && <small>{richQuizAnswers[i] === question.answer ? 'Correct. ' : 'A revoir. '}{question.explanation}</small>}</div>)}
            </div>
            <button className="primary-btn" disabled={lesson.quiz.some((_, i) => !richQuizAnswers[i])} onClick={complete}>{done ? 'Quiz valide ✓' : 'Valider le quiz'}</button>
          </> : lesson.lesson_type === 'quiz' ? <>
            <p>Repondez honnetement a ces trois questions. Le but est de verifier votre autonomie avant de continuer.</p>
            <div className="lesson-quiz-list">
              {[
                'Pouvez-vous expliquer le concept principal sans relire la lecon ?',
                'Pouvez-vous appliquer la methode sur un exemple different ?',
                'Savez-vous identifier et corriger une erreur frequente ?',
              ].map((question, i) => <div className="lesson-quiz-question" key={question}><b>{i + 1}. {question}</b><div><button className={quizAnswers[i] === 'yes' ? 'active' : ''} onClick={() => setQuizAnswers((a) => a.map((v, j) => j === i ? 'yes' : v))}>Oui</button><button className={quizAnswers[i] === 'notyet' ? 'active' : ''} onClick={() => setQuizAnswers((a) => a.map((v, j) => j === i ? 'notyet' : v))}>Pas encore</button></div></div>)}
            </div>
            <button className="primary-btn" disabled={quizAnswers.some((a) => !a)} onClick={complete}>{done ? 'Quiz valide ✓' : 'Valider mon auto-evaluation'}</button>
          </> : <>
            <p>{lesson.lesson_type === 'exercise' ? lesson.content : 'Reproduisez l exemple de la lecon sans copier, puis modifiez une valeur ou ajoutez une fonctionnalite.'}</p>
            {lesson.corrected_exercise && <div className="corrected-exercise-card"><b>Exercice corrige</b><p><strong>Consigne :</strong> {lesson.corrected_exercise.prompt}</p><p><strong>Reponse modele :</strong> {lesson.corrected_exercise.answer}</p><p><strong>Correction :</strong> {lesson.corrected_exercise.correction}</p></div>}
            <div className="exercise-checklist">
              {['J ai reproduit l exemple', 'J ai teste une variante', 'J ai compris les erreurs rencontrees'].map((label, i) => <label key={label}><input type="checkbox" checked={exerciseChecks[i]} onChange={(e) => setExerciseChecks((a) => a.map((v, j) => j === i ? e.target.checked : v))} /> {label}</label>)}
            </div>
            <button className="primary-btn" disabled={!exerciseChecks.every(Boolean)} onClick={complete}>{done ? 'Activite validee ✓' : 'Valider l activite'}</button>
          </>}
        </div>}
      </main>
      <aside className="lesson-side-panel">
        <div className="course-panel"><h3>Progression</h3><div className="course-progress-circle" style={{ '--progress': `${(done ? 100 : Number(progress?.progress_percent || 0)) * 3.6}deg` }}><strong>{done ? 100 : Math.round(Number(progress?.progress_percent || 0))}%</strong></div><button className={`primary-btn full ${done ? 'success-btn' : ''}`} onClick={complete}>{done ? 'Terminee ✓' : 'Marquer comme terminee'}</button></div>
        <div className="course-panel"><h3>Dans le module</h3>{(lesson.module.lessons || []).map((item, i) => <Link key={item.id} className={`lesson-mini-link ${String(item.id) === String(id) ? 'active' : ''}`} to={`/lessons/${item.id}?course=${encodeURIComponent(courseId)}`}><span>{i + 1}</span><b>{item.title}</b></Link>)}</div>
      </aside>
    </section>

    <div className="lesson-navigation"><Link className={`outline-btn ${!prev ? 'disabled-link' : ''}`} to={prev ? `/lessons/${prev.id}?course=${encodeURIComponent(courseId)}` : `/courses/${courseId}/modules`}>← {prev ? 'Lecon precedente' : 'Programme'}</Link><Link className="outline-btn" to={`/courses/${courseId}/modules`}>☰ Programme</Link>{next ? <Link className="primary-btn" to={`/lessons/${next.id}?course=${encodeURIComponent(courseId)}`}>Lecon suivante →</Link> : <Link className="primary-btn" to={`/courses/${courseId}`}>Voir mon bilan final ✓</Link>}</div>
  </div></AppShell>;
}
