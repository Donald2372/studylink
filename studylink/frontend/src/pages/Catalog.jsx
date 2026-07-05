import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { api } from '../api.js';

function CategoryIcon({ icon }) {
  const common = { width: 24, height: 24, fill: 'none', stroke: 'currentColor', strokeWidth: 2, strokeLinecap: 'round', strokeLinejoin: 'round' };
  switch (icon) {
    case 'code': return <svg {...common}><path d="m16 18 6-6-6-6M8 6l-6 6 6 6" /></svg>;
    case 'sigma': return <svg {...common}><path d="M18 7V5H6l6 7-6 7h12v-2" /></svg>;
    case 'atom': return <svg {...common}><circle cx="12" cy="12" r="1" /><ellipse cx="12" cy="12" rx="10" ry="4.5" /><ellipse cx="12" cy="12" rx="10" ry="4.5" transform="rotate(60 12 12)" /><ellipse cx="12" cy="12" rx="10" ry="4.5" transform="rotate(120 12 12)" /></svg>;
    case 'globe': return <svg {...common}><circle cx="12" cy="12" r="10" /><path d="M2 12h20M12 2a15 15 0 0 1 0 20 15 15 0 0 1 0-20" /></svg>;
    case 'briefcase': return <svg {...common}><rect x="2" y="7" width="20" height="14" rx="2" /><path d="M8 7V5a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2" /></svg>;
    case 'brain': return <svg {...common}><path d="M9.5 2A2.5 2.5 0 0 1 12 4.5v15a2.5 2.5 0 0 1-4.96.44 2.5 2.5 0 0 1-2.96-3.08 3 3 0 0 1-.34-5.58 2.5 2.5 0 0 1 1.32-4.24 2.5 2.5 0 0 1 4.44-1.04Z" /></svg>;
    case 'network': return <svg {...common}><circle cx="12" cy="5" r="2" /><circle cx="5" cy="19" r="2" /><circle cx="19" cy="19" r="2" /><path d="M12 7v6m0 0-5 4m5-4 5 4" /></svg>;
    case 'chart': return <svg {...common}><path d="M3 3v18h18M7 16v-5M12 16V8M17 16v-3" /></svg>;
    default: return <svg {...common}><circle cx="12" cy="12" r="9" /></svg>;
  }
}

function Stars({ rating }) {
  return (
    <span className="inline-flex items-center gap-1 text-sm">
      <span className="text-amber-500">★</span>
      <span className="font-medium text-ink">{Number(rating).toFixed(1)}</span>
    </span>
  );
}

export default function Catalog() {
  const [categories, setCategories] = useState([]);
  const [courses, setCourses] = useState([]);
  const [search, setSearch] = useState('');
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    Promise.all([api.getCourseCategories(), api.getCourses()])
      .then(([catRes, courseRes]) => {
        setCategories(catRes.categories);
        setCourses(courseRes.courses);
      })
      .catch(() => {})
      .finally(() => setLoading(false));
  }, []);

  const popular = courses.slice(0, 3);

  return (
    <div className="mx-auto max-w-5xl px-6 py-10">
      <h1 className="font-display text-3xl font-semibold text-ink">Catalogue des cours</h1>
      <p className="mt-1 text-ink/60">Découvrez et développez vos compétences.</p>

      <div className="mt-6 flex items-center gap-2 rounded-xl2 border border-black/10 bg-white px-4 py-3 shadow-card">
        <svg width="18" height="18" fill="none" stroke="currentColor" strokeWidth="2" className="text-ink/40"><circle cx="8" cy="8" r="6" /><path d="m17 17-4-4" /></svg>
        <input value={search} onChange={(e) => setSearch(e.target.value)} placeholder="Rechercher un cours, un tutoriel..." className="w-full bg-transparent text-sm outline-none placeholder:text-ink/40" />
      </div>

      <div className="mt-4 flex flex-wrap gap-2">
        {['Catégories', 'Niveau', 'Type', 'Langue'].map((f) => (
          <button key={f} className="flex items-center gap-1 rounded-lg border border-black/10 bg-white px-3 py-2 text-sm font-medium text-ink/70 transition hover:bg-black/5">
            {f}
            <svg width="14" height="14" fill="none" stroke="currentColor" strokeWidth="2"><path d="m4 6 4 4 4-4" /></svg>
          </button>
        ))}
      </div>

      {loading ? (
        <p className="mt-10 text-sm text-ink/50">Chargement du catalogue...</p>
      ) : (
        <>
          <div className="mt-8 flex items-center justify-between">
            <h2 className="font-display text-xl font-semibold text-ink">Catégories principales</h2>
            <span className="text-sm font-medium text-brand-600">Voir tout</span>
          </div>
          <div className="mt-4 grid grid-cols-2 gap-3 sm:grid-cols-4">
            {categories.map((cat) => (
              <Link key={cat.id} to={`/catalog?category=${encodeURIComponent(cat.name)}`} className="flex flex-col items-center rounded-xl2 border border-black/5 bg-white p-5 text-center shadow-card transition hover:shadow-pop">
                <span className="flex h-12 w-12 items-center justify-center rounded-xl2" style={{ backgroundColor: `${cat.color}1a`, color: cat.color }}>
                  <CategoryIcon icon={cat.icon} />
                </span>
                <p className="mt-3 text-sm font-semibold text-ink">{cat.name}</p>
                <p className="text-xs text-ink/50">{cat.course_count} cours</p>
              </Link>
            ))}
          </div>

          <div className="mt-10 flex items-center justify-between">
            <h2 className="font-display text-xl font-semibold text-ink">Cours populaires</h2>
            <span className="text-sm font-medium text-brand-600">Voir tout</span>
          </div>
          <div className="mt-4 grid grid-cols-1 gap-4 sm:grid-cols-3">
            {popular.map((c) => (
              <Link key={c.id} to={`/course/${c.id}`} className="overflow-hidden rounded-xl2 border border-black/5 bg-white shadow-card transition hover:shadow-pop">
                <div className="flex h-32 items-center justify-center" style={{ background: `linear-gradient(135deg, ${c.category_color || '#1C3AB3'}, #101828)` }}>
                  <span className="font-display text-lg font-semibold text-white/90">{c.title}</span>
                </div>
                <div className="p-4">
                  <p className="font-semibold text-ink">{c.title}</p>
                  <p className="mt-1 text-sm text-ink/50">{c.instructor_name || 'StudyLink'}</p>
                  <div className="mt-2 flex items-center gap-2">
                    <Stars rating={c.rating} />
                    <span className="text-xs text-ink/40">({c.rating_count})</span>
                    <span className="text-xs text-ink/40">· {c.level}</span>
                  </div>
                </div>
              </Link>
            ))}
          </div>

          <div className="mt-10 flex items-center justify-between">
            <h2 className="font-display text-xl font-semibold text-ink">Tutoriels rapides</h2>
            <span className="text-sm font-medium text-brand-600">Voir tout</span>
          </div>
          <div className="mt-4 grid grid-cols-1 gap-3 sm:grid-cols-3">
            {[['Installer Python', '8 min'], ['Git & GitHub', '12 min'], ['Docker', '15 min']].map(([title, dur]) => (
              <div key={title} className="flex items-center justify-between rounded-xl2 border border-black/5 bg-white p-4 shadow-card">
                <div>
                  <p className="text-sm font-semibold text-ink">{title}</p>
                  <p className="text-xs text-ink/50">🕐 {dur}</p>
                </div>
                <span className="flex h-9 w-9 items-center justify-center rounded-full bg-brand-500 text-white">
                  <svg width="16" height="16" fill="currentColor"><path d="M4 3l9 5-9 5z" /></svg>
                </span>
              </div>
            ))}
          </div>
        </>
      )}
    </div>
  );
}
