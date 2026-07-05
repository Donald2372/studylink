import { useEffect, useState } from 'react';
import { Link, useParams } from 'react-router-dom';
import { api } from '../api.js';
import { useAuth } from '../context/AuthContext.jsx';

function ProgressRing({ percent }) {
  const r = 26;
  const circ = 2 * Math.PI * r;
  const offset = circ - (percent / 100) * circ;
  return (
    <svg width="64" height="64" viewBox="0 0 64 64">
      <circle cx="32" cy="32" r={r} fill="none" stroke="#e5e7eb" strokeWidth="6" />
      <circle
        cx="32" cy="32" r={r} fill="none" stroke="#3366FF" strokeWidth="6"
        strokeDasharray={circ} strokeDashoffset={offset} strokeLinecap="round"
        transform="rotate(-90 32 32)"
      />
      <text x="32" y="37" textAnchor="middle" className="fill-ink text-sm font-semibold">
        {percent}%
      </text>
    </svg>
  );
}

export default function CourseContent() {
  const { id } = useParams();
  const { token } = useAuth();
  const [data, setData] = useState(null);
  const [progress, setProgress] = useState(null);
  const [openModule, setOpenModule] = useState(0);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    api.getCourse(id).then(setData).catch(() => {}).finally(() => setLoading(false));
    if (token) api.getCourseProgress(id, token).then(setProgress).catch(() => {});
  }, [id, token]);

  if (loading) return <p className="px-6 py-20 text-center text-ink/50">Chargement...</p>;
  if (!data) return <p className="px-6 py-20 text-center text-ink/50">Cours introuvable.</p>;

  const { course, modules } = data;
  const totalLessons = modules.reduce((s, m) => s + m.lessons.length, 0);
  const completedIds = progress?.completedLessonIds || [];
  const percent = progress?.percent || 0;

  return (
    <div className="mx-auto max-w-3xl px-6 py-8">
      <Link to={`/course/${id}`} className="mb-4 inline-flex items-center gap-1 text-sm text-ink/60 hover:text-ink">
        <svg width="18" height="18" fill="none" stroke="currentColor" strokeWidth="2"><path d="m12 4-6 5 6 5" /></svg>
        Détail du cours
      </Link>

      <div className="flex items-center gap-4">
        <span
          className="flex h-16 w-16 shrink-0 items-center justify-center rounded-xl2 font-display text-2xl font-bold text-white"
          style={{ background: `linear-gradient(135deg, ${course.category_color || '#1C3AB3'}, #101828)` }}
        >
          {course.title.charAt(0)}
        </span>
        <div>
          <p className="text-sm font-medium text-brand-600">{course.category_name}</p>
          <h1 className="font-display text-2xl font-semibold text-ink">{course.title}</h1>
          {course.instructor_name && (
            <p className="text-sm text-ink/50">Avec {course.instructor_name}</p>
          )}
        </div>
      </div>

      {/* Modules (accordéon) */}
      <div className="mt-6 flex flex-col gap-2">
        {modules.map((m, i) => {
          const open = openModule === i;
          const moduleCompleted = m.lessons.filter((l) => completedIds.includes(l.id)).length;
          return (
            <div key={m.id} className="overflow-hidden rounded-xl2 border border-black/5 bg-white shadow-card">
              <button
                onClick={() => setOpenModule(open ? -1 : i)}
                className="flex w-full items-center gap-3 px-4 py-4 text-left"
              >
                <span className="flex h-9 w-9 shrink-0 items-center justify-center rounded-full bg-brand-500 text-sm font-semibold text-white">
                  {i + 1}
                </span>
                <div className="flex-1">
                  <p className="text-sm font-semibold text-ink">{m.title}</p>
                  <p className="text-xs text-ink/50">
                    {m.lessons.length} leçons{moduleCompleted > 0 && ` · ${moduleCompleted} terminée(s)`}
                  </p>
                </div>
                <svg
                  width="18" height="18" fill="none" stroke="currentColor" strokeWidth="2"
                  className={`text-ink/40 transition-transform ${open ? 'rotate-180' : ''}`}
                >
                  <path d="m4 7 5 5 5-5" />
                </svg>
              </button>
              {open && (
                <div className="border-t border-black/5">
                  {m.lessons.map((l, li) => {
                    const done = completedIds.includes(l.id);
                    return (
                      <Link
                        key={l.id}
                        to={`/lesson/${l.id}`}
                        className="flex items-center gap-3 px-4 py-3 text-sm transition hover:bg-black/[0.03]"
                      >
                        <span
                          className={`flex h-6 w-6 shrink-0 items-center justify-center rounded-full text-xs ${
                            done ? 'bg-mint-500 text-white' : 'border border-black/15 text-ink/40'
                          }`}
                        >
                          {done ? '✓' : li + 1}
                        </span>
                        <span className="flex-1 text-ink/80">{l.title}</span>
                        {l.duration_minutes > 0 && (
                          <span className="text-xs text-ink/40">{l.duration_minutes} min</span>
                        )}
                      </Link>
                    );
                  })}
                </div>
              )}
            </div>
          );
        })}
      </div>

      {/* Progression globale */}
      <div className="mt-6 flex items-center gap-4 rounded-xl2 border border-black/5 bg-white p-5 shadow-card">
        <ProgressRing percent={percent} />
        <div className="flex-1">
          <div className="flex items-center justify-between">
            <p className="font-semibold text-ink">Votre progression</p>
            <p className="text-sm text-ink/50">
              {progress?.completed || 0} / {totalLessons} leçons
            </p>
          </div>
          <div className="mt-2 h-2 overflow-hidden rounded-full bg-black/10">
            <div className="h-full rounded-full bg-brand-500" style={{ width: `${percent}%` }} />
          </div>
          <p className="mt-2 text-sm text-ink/50">Continuez comme ça ! Vous êtes sur la bonne voie.</p>
        </div>
      </div>

      <div className="mt-4 flex items-start gap-2 rounded-xl2 bg-brand-50 p-4 text-sm text-brand-700">
        <span>ℹ️</span>
        <p>Toutes les vidéos sont à regarder directement dans l'application StudyLink.</p>
      </div>
    </div>
  );
}
