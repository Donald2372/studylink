import { useEffect, useState } from 'react';
import { Link, useParams, useNavigate } from 'react-router-dom';
import { api } from '../api.js';
import { useAuth } from '../context/AuthContext.jsx';

export default function Lesson() {
  const { lessonId } = useParams();
  const navigate = useNavigate();
  const { user, token } = useAuth();
  const [data, setData] = useState(null);
  const [tab, setTab] = useState('summary');
  const [loading, setLoading] = useState(true);
  const [completing, setCompleting] = useState(false);

  useEffect(() => {
    if (!token) {
      setLoading(false);
      return;
    }
    setLoading(true);
    api
      .getLesson(lessonId, token)
      .then(setData)
      .catch(() => {})
      .finally(() => setLoading(false));
  }, [lessonId, token]);

  async function handleComplete() {
    setCompleting(true);
    try {
      await api.completeLesson(lessonId, token);
      setData((d) => ({ ...d, completed: true }));
    } catch {}
    setCompleting(false);
  }

  if (!user) {
    return (
      <div className="mx-auto max-w-lg px-6 py-20 text-center">
        <p className="text-ink/60">Connectez-vous pour suivre cette leçon.</p>
        <Link to="/login" className="mt-4 inline-block text-brand-600 hover:underline">Se connecter</Link>
      </div>
    );
  }
  if (loading) return <p className="px-6 py-20 text-center text-ink/50">Chargement...</p>;
  if (!data) return <p className="px-6 py-20 text-center text-ink/50">Leçon introuvable.</p>;

  const { lesson, completed } = data;

  const tabs = [
    ['summary', 'Résumé'],
    ['notes', 'Notes'],
    ['resources', 'Ressources'],
    ['exercises', 'Exercices'],
  ];

  return (
    <div className="mx-auto max-w-3xl px-6 py-8">
      {/* Fil d'ariane */}
      <div className="mb-3 flex flex-wrap items-center gap-1 text-sm text-brand-600">
        <Link to="/my-courses" className="hover:underline">Mes cours</Link>
        <span className="text-ink/30">›</span>
        <Link to={`/course/${lesson.course_id}/content`} className="hover:underline">
          {lesson.course_title}
        </Link>
        <span className="text-ink/30">›</span>
        <span className="text-ink/50">{lesson.module_title}</span>
      </div>

      <h1 className="font-display text-2xl font-semibold text-ink">{lesson.title}</h1>
      <div className="mt-1 flex flex-wrap items-center gap-3 text-sm text-ink/50">
        <span>📖 {lesson.module_title}</span>
        {lesson.duration_minutes > 0 && <span>🕐 {lesson.duration_minutes} min</span>}
      </div>

      {/* Vidéo YouTube intégrée */}
      <div className="mt-5 overflow-hidden rounded-xl2 bg-black shadow-card" style={{ aspectRatio: '16/9' }}>
        {lesson.youtube_id ? (
          <iframe
            title={lesson.title}
            width="100%"
            height="100%"
            src={`https://www.youtube.com/embed/${lesson.youtube_id}`}
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowFullScreen
          />
        ) : (
          <div className="flex h-full items-center justify-center text-white/60">Vidéo indisponible</div>
        )}
      </div>

      {/* Onglets */}
      <div className="mt-6 flex gap-6 border-b border-black/5">
        {tabs.map(([key, label]) => (
          <button
            key={key}
            onClick={() => setTab(key)}
            className={`-mb-px border-b-2 pb-3 text-sm font-medium transition ${
              tab === key ? 'border-brand-500 text-brand-600' : 'border-transparent text-ink/50 hover:text-ink'
            }`}
          >
            {label}
          </button>
        ))}
      </div>

      <div className="mt-6">
        {tab === 'summary' && (
          <div className="rounded-xl2 border border-black/5 bg-white p-6 shadow-card">
            <p className="font-semibold text-ink">Dans cette leçon, vous allez :</p>
            <ul className="mt-3 flex flex-col gap-2">
              {['Créer votre premier programme', 'Comprendre les concepts clés', 'Pratiquer pas à pas'].map(
                (item) => (
                  <li key={item} className="flex items-start gap-2 text-sm text-ink/70">
                    <span className="mt-0.5 flex h-5 w-5 shrink-0 items-center justify-center rounded-full bg-brand-500 text-white">
                      <svg width="12" height="12" fill="none" stroke="currentColor" strokeWidth="3"><path d="m2 6 3 3 5-6" /></svg>
                    </span>
                    {item}
                  </li>
                )
              )}
            </ul>
            <div className="mt-4 flex items-start gap-2 rounded-xl2 bg-brand-50 p-4 text-sm text-brand-700">
              <span>ℹ️</span>
              <p>N'oubliez pas : en programmation, chaque expert a commencé par un simple "Hello, World !" 🚀</p>
            </div>
          </div>
        )}
        {tab === 'notes' && (
          <div className="rounded-xl2 border border-dashed border-black/15 p-10 text-center text-sm text-ink/50">
            Vos notes personnelles pour cette leçon apparaîtront ici.
          </div>
        )}
        {tab === 'resources' && (
          <div className="rounded-xl2 border border-dashed border-black/15 p-10 text-center text-sm text-ink/50">
            Les ressources téléchargeables de la leçon apparaîtront ici.
          </div>
        )}
        {tab === 'exercises' && (
          <div className="rounded-xl2 border border-dashed border-black/15 p-10 text-center text-sm text-ink/50">
            Les exercices pratiques apparaîtront ici.
          </div>
        )}
      </div>

      {/* Marquer comme terminé + navigation */}
      <div className="mt-6 flex items-center justify-between gap-3">
        <Link
          to={`/course/${lesson.course_id}/content`}
          className="rounded-xl2 border border-black/10 px-5 py-3 text-sm font-medium text-ink transition hover:bg-black/5"
        >
          ← Contenu du cours
        </Link>
        <button
          onClick={handleComplete}
          disabled={completed || completing}
          className={`rounded-xl2 px-5 py-3 text-sm font-semibold transition ${
            completed
              ? 'bg-mint-500 text-white'
              : 'bg-brand-500 text-white hover:bg-brand-600'
          }`}
        >
          {completed ? '✓ Leçon terminée' : completing ? '...' : 'Marquer comme terminée'}
        </button>
      </div>
    </div>
  );
}
