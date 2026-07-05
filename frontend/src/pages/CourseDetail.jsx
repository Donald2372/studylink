import { useEffect, useState } from 'react';
import { Link, useParams, useNavigate } from 'react-router-dom';
import { api } from '../api.js';
import { useAuth } from '../context/AuthContext.jsx';
import { MobileHeader } from '../components/MobileHeader.jsx';

export default function CourseDetail() {
  const { id } = useParams();
  const navigate = useNavigate();
  const { user, token } = useAuth();
  const [data, setData] = useState(null);
  const [progress, setProgress] = useState(null);
  const [tab, setTab] = useState('about');
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    api
      .getCourse(id)
      .then(setData)
      .catch(() => {})
      .finally(() => setLoading(false));
    if (token) api.getCourseProgress(id, token).then(setProgress).catch(() => {});
  }, [id, token]);

  async function handleStart() {
    if (!user) return navigate('/login');
    try {
      await api.enrollCourse(id, token);
    } catch {}
    // Va à la première leçon
    const firstLesson = data?.modules?.[0]?.lessons?.[0];
    if (firstLesson) navigate(`/lesson/${firstLesson.id}`);
    else navigate(`/course/${id}/content`);
  }

  if (loading) return <p className="px-6 py-20 text-center text-ink/50">Chargement...</p>;
  if (!data) return <p className="px-6 py-20 text-center text-ink/50">Cours introuvable.</p>;

  const { course, objectives, modules } = data;
  const totalLessons = modules.reduce((sum, m) => sum + m.lessons.length, 0);
  const hours = Math.floor(course.duration_minutes / 60);
  const mins = course.duration_minutes % 60;

  const tabs = [
    ['about', 'À propos'],
    ['program', 'Programme'],
    ['reviews', `Avis (${course.rating_count})`],
    ['resources', 'Ressources'],
  ];

  return (
    <div className="min-h-full bg-white">
      <MobileHeader showBack onBack={() => navigate('/catalog')} showMenu />
      <div className="px-5 pb-6">
        <div className="mb-1 flex flex-wrap items-center gap-1 text-[13px] text-brand-500">
          <Link to="/my-courses" className="font-semibold">Mes cours</Link>
          <span className="text-ink/30">›</span>
          <span className="text-ink/50">{course.title}</span>
        </div>
      {/* Bannière */}
      <div
        className="relative overflow-hidden rounded-xl2 p-6 text-white"
        style={{ background: `linear-gradient(135deg, ${course.category_color || '#1C3AB3'}, #101828)` }}
      >
        {course.category_name && (
          <span className="inline-block rounded-lg bg-white/15 px-3 py-1 text-xs font-medium">
            {course.category_name}
          </span>
        )}
        <h1 className="mt-3 font-display text-3xl font-semibold">{course.title}</h1>
        <p className="mt-2 max-w-md text-sm text-white/80">{course.subtitle}</p>
        <div className="mt-4 flex items-center gap-3">
          <img
            src={course.instructor_avatar || `https://api.dicebear.com/7.x/initials/svg?seed=${course.instructor_name || 'SL'}`}
            alt=""
            className="h-10 w-10 rounded-full border-2 border-white/30 object-cover"
          />
          <div>
            <p className="text-sm font-semibold">{course.instructor_name || 'StudyLink'}</p>
            <p className="text-xs text-white/70">
              ★ {Number(course.rating).toFixed(1)} ({course.rating_count} avis)
            </p>
          </div>
        </div>
      </div>

      {/* Stats */}
      <div className="mt-4 grid grid-cols-3 divide-x divide-black/5 rounded-xl2 border border-black/5 bg-white py-4 text-center shadow-card">
        <div>
          <p className="text-xs text-ink/50">Niveau</p>
          <p className="mt-1 text-sm font-semibold text-brand-600">{course.level}</p>
        </div>
        <div>
          <p className="text-xs text-ink/50">Durée</p>
          <p className="mt-1 text-sm font-semibold text-brand-600">{hours}h {mins > 0 ? `${mins}m` : ''}</p>
        </div>
        <div>
          <p className="text-xs text-ink/50">Leçons</p>
          <p className="mt-1 text-sm font-semibold text-brand-600">{totalLessons} leçons</p>
        </div>
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

      {/* Contenu des onglets */}
      <div className="mt-6">
        {tab === 'about' && (
          <div className="rounded-xl2 border border-black/5 bg-white p-6 shadow-card">
            <h3 className="font-display text-lg font-semibold text-ink">À propos du cours</h3>
            <p className="mt-3 text-sm leading-relaxed text-ink/70">{course.description}</p>

            {objectives.length > 0 && (
              <>
                <h3 className="mt-6 font-display text-lg font-semibold text-ink">Objectifs pédagogiques</h3>
                <ul className="mt-3 flex flex-col gap-2">
                  {objectives.map((obj, i) => (
                    <li key={i} className="flex items-start gap-2 text-sm text-ink/70">
                      <span className="mt-0.5 flex h-5 w-5 shrink-0 items-center justify-center rounded-full bg-brand-500 text-white">
                        <svg width="12" height="12" fill="none" stroke="currentColor" strokeWidth="3"><path d="m2 6 3 3 5-6" /></svg>
                      </span>
                      {obj}
                    </li>
                  ))}
                </ul>
              </>
            )}
          </div>
        )}

        {tab === 'program' && (
          <div className="flex flex-col gap-2">
            {modules.map((m, i) => (
              <div key={m.id} className="rounded-xl2 border border-black/5 bg-white p-4 shadow-card">
                <div className="flex items-center gap-3">
                  <span className="flex h-8 w-8 items-center justify-center rounded-full bg-brand-500 text-sm font-semibold text-white">
                    {i + 1}
                  </span>
                  <div>
                    <p className="text-sm font-semibold text-ink">{m.title}</p>
                    <p className="text-xs text-ink/50">{m.lessons.length} leçons</p>
                  </div>
                </div>
              </div>
            ))}
          </div>
        )}

        {tab === 'reviews' && (
          <div className="rounded-xl2 border border-black/5 bg-white p-6 text-center shadow-card">
            <p className="font-display text-3xl font-semibold text-ink">{Number(course.rating).toFixed(1)}</p>
            <p className="mt-1 text-amber-500">★★★★★</p>
            <p className="mt-1 text-sm text-ink/50">Basé sur {course.rating_count} avis</p>
          </div>
        )}

        {tab === 'resources' && (
          <div className="rounded-xl2 border border-dashed border-black/15 p-10 text-center text-sm text-ink/50">
            Les ressources du cours (PDF, exercices) apparaîtront ici.
          </div>
        )}
      </div>

      {/* Bouton Commencer */}
      <button
        onClick={handleStart}
        className="mt-6 flex w-full items-center justify-center gap-2 rounded-xl2 bg-brand-500 py-4 font-semibold text-white transition hover:bg-brand-600"
      >
        <svg width="18" height="18" fill="currentColor"><path d="M5 3l10 6-10 6z" /></svg>
        {progress?.percent > 0 ? 'Continuer le cours' : 'Commencer le cours'}
      </button>
      </div>
    </div>
  );
}
