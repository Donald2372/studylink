import { useEffect, useMemo, useState } from 'react';
import { Link, useLocation, useNavigate, useParams } from 'react-router-dom';
import { api } from '../../api.js';
import { useAuth } from '../../context/AuthContext.jsx';
import { AppShell, PageHeader, Progress } from '../../components/AppShell.jsx';
import { PYTHON_COURSE_SLUG, pythonCourseFallback, flattenCourseLessons } from '../../data/pythonCourseData.js';
import { englishCourseFallback, isEnglishCourseId } from '../../data/englishCourseData.js';

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
  const lesson = flat.find((l) => String(l.id) === String(id));
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
  const tabs = ['Resume', 'Audio oral', 'Notes', 'Ressources', 'Exercices'].filter((item) => item !== 'Audio oral' || lesson.audio_script || lesson.oral_practice);

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
        {tab === 'Resume' && <><div className="course-panel lesson-copy"><h2>Dans cette lecon</h2>{renderContent(lesson.content || 'Le contenu complementaire de cette lecon sera bientot disponible.')}{done && <div className="lesson-success">✓ Cette lecon est terminee et enregistree dans votre progression.</div>}</div><LessonAnnotations lesson={lesson} /></>}
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
