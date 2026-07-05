import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { api } from '../api.js';
import { useAuth } from '../context/AuthContext.jsx';

export default function MyCourses() {
  const { user, token } = useAuth();
  const [courses, setCourses] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (!token) {
      setLoading(false);
      return;
    }
    api.getMyCourses(token).then(({ courses }) => setCourses(courses)).catch(() => {}).finally(() =>
      setLoading(false)
    );
  }, [token]);

  if (!user) {
    return (
      <div className="mx-auto max-w-lg px-6 py-20 text-center">
        <p className="text-ink/60">Connectez-vous pour voir vos cours.</p>
        <Link to="/login" className="mt-4 inline-block text-brand-600 hover:underline">Se connecter</Link>
      </div>
    );
  }

  return (
    <div className="mx-auto max-w-4xl px-6 py-10">
      <h1 className="font-display text-3xl font-semibold text-ink">Mes cours</h1>
      <p className="mt-1 text-ink/60">Reprenez là où vous vous êtes arrêté.</p>

      {loading ? (
        <p className="mt-8 text-sm text-ink/50">Chargement...</p>
      ) : courses.length === 0 ? (
        <div className="mt-8 rounded-xl2 border border-dashed border-black/15 p-12 text-center text-ink/50">
          Vous ne suivez aucun cours pour l'instant.
          <br />
          <Link to="/catalog" className="mt-2 inline-block text-brand-600 hover:underline">
            Explorer le catalogue
          </Link>
        </div>
      ) : (
        <div className="mt-8 grid grid-cols-1 gap-4 sm:grid-cols-2">
          {courses.map((c) => (
            <Link
              key={c.id}
              to={c.last_lesson_id ? `/lesson/${c.last_lesson_id}` : `/course/${c.id}/content`}
              className="flex gap-4 rounded-xl2 border border-black/5 bg-white p-4 shadow-card transition hover:shadow-pop"
            >
              <span
                className="flex h-16 w-16 shrink-0 items-center justify-center rounded-xl2 font-display text-xl font-bold text-white"
                style={{ background: `linear-gradient(135deg, ${c.category_color || '#1C3AB3'}, #101828)` }}
              >
                {c.title.charAt(0)}
              </span>
              <div className="min-w-0 flex-1">
                <p className="truncate font-semibold text-ink">{c.title}</p>
                <p className="truncate text-sm text-ink/50">{c.instructor_name || 'StudyLink'}</p>
                <span className="mt-2 inline-block rounded-lg bg-brand-50 px-2 py-1 text-xs font-medium text-brand-700">
                  {c.last_lesson_id ? 'Reprendre' : 'Commencer'}
                </span>
              </div>
              {c.is_favorite && <span className="text-coral-500">♥</span>}
            </Link>
          ))}
        </div>
      )}
    </div>
  );
}
