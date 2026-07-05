import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { api } from '../api.js';
import { MobileHeader } from '../components/MobileHeader.jsx';

// Icônes de catégories (carrés arrondis colorés, comme les maquettes)
function CategoryIcon({ icon }) {
  const c = { width: 22, height: 22, fill: 'none', stroke: 'currentColor', strokeWidth: 2, strokeLinecap: 'round', strokeLinejoin: 'round' };
  switch (icon) {
    case 'code': return <svg {...c}><path d="m16 18 6-6-6-6M8 6l-6 6 6 6" /></svg>;
    case 'sigma': return <svg {...c}><path d="M18 7V5H6l6 7-6 7h12v-2" /></svg>;
    case 'atom': return <svg {...c}><circle cx="12" cy="12" r="1" /><ellipse cx="12" cy="12" rx="10" ry="4.5" /><ellipse cx="12" cy="12" rx="10" ry="4.5" transform="rotate(60 12 12)" /><ellipse cx="12" cy="12" rx="10" ry="4.5" transform="rotate(120 12 12)" /></svg>;
    case 'globe': return <svg {...c}><circle cx="12" cy="12" r="10" /><path d="M2 12h20M12 2a15 15 0 0 1 0 20 15 15 0 0 1 0-20" /></svg>;
    case 'briefcase': return <svg {...c}><rect x="2" y="7" width="20" height="14" rx="2" /><path d="M8 7V5a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2" /></svg>;
    case 'brain': return <svg {...c}><path d="M9.5 2A2.5 2.5 0 0 1 12 4.5v15a2.5 2.5 0 0 1-4.96.44 2.5 2.5 0 0 1-2.96-3.08 3 3 0 0 1-.34-5.58 2.5 2.5 0 0 1 1.32-4.24 2.5 2.5 0 0 1 4.44-1.04Z" /></svg>;
    case 'network': return <svg {...c}><circle cx="12" cy="5" r="2" /><circle cx="5" cy="19" r="2" /><circle cx="19" cy="19" r="2" /><path d="M12 7v6m0 0-5 4m5-4 5 4" /></svg>;
    case 'chart': return <svg {...c}><path d="M3 3v18h18M7 16v-5M12 16V8M17 16v-3" /></svg>;
    default: return <svg {...c}><circle cx="12" cy="12" r="9" /></svg>;
  }
}

const FILTERS = [
  { label: 'Catégories', icon: <path d="M3 3h7v7H3zM14 3h7v7h-7zM14 14h7v7h-7zM3 14h7v7H3z" /> },
  { label: 'Niveau', icon: <path d="M4 20v-6M10 20V8M16 20V4M20 20v-9" /> },
  { label: 'Type', icon: <><rect x="3" y="5" width="18" height="14" rx="2" /><path d="m10 9 5 3-5 3z" /></> },
  { label: 'Langue', icon: <><circle cx="12" cy="12" r="9" /><path d="M3 12h18M12 3a15 15 0 0 1 0 18 15 15 0 0 1 0-18" /></> },
];

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
    <div className="min-h-full bg-white">
      <MobileHeader />

      <div className="px-5">
        <h1 className="mt-1 text-[26px] font-extrabold leading-tight text-navy-900">Catalogue des cours</h1>
        <p className="mt-1 text-[15px] text-ink/50">Découvrez et développez vos compétences</p>

        {/* Recherche */}
        <div className="mt-4 flex items-center gap-2 rounded-2xl border border-black/10 bg-white px-4 py-3.5 shadow-card">
          <svg width="18" height="18" fill="none" stroke="currentColor" strokeWidth="2" className="text-ink/40"><circle cx="8" cy="8" r="6" /><path d="m17 17-4-4" /></svg>
          <input value={search} onChange={(e) => setSearch(e.target.value)} placeholder="Rechercher un cours, un tutoriel..." className="w-full bg-transparent text-[15px] outline-none placeholder:text-ink/40" />
        </div>

        {/* Filtres */}
        <div className="mt-3 flex gap-2 overflow-x-auto pb-1 [-ms-overflow-style:none] [scrollbar-width:none] [&::-webkit-scrollbar]:hidden">
          {FILTERS.map((f) => (
            <button key={f.label} className="flex shrink-0 items-center gap-1.5 rounded-xl border border-black/10 bg-white px-3.5 py-2.5 text-[13px] font-semibold text-ink/70">
              <svg width="16" height="16" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">{f.icon}</svg>
              {f.label}
              <svg width="14" height="14" fill="none" stroke="currentColor" strokeWidth="2"><path d="m4 6 4 4 4-4" /></svg>
            </button>
          ))}
        </div>
      </div>

      {loading ? (
        <p className="px-5 py-10 text-sm text-ink/50">Chargement du catalogue...</p>
      ) : (
        <>
          {/* Catégories principales */}
          <div className="mt-6 flex items-center justify-between px-5">
            <h2 className="text-lg font-bold text-navy-900">Catégories principales</h2>
            <Link to="/catalog" className="text-[13px] font-semibold text-brand-500">Voir tout</Link>
          </div>
          <div className="mt-3 grid grid-cols-4 gap-3 px-5">
            {categories.map((cat) => (
              <Link key={cat.id} to={`/catalog?category=${encodeURIComponent(cat.name)}`} className="flex flex-col items-center rounded-2xl border border-black/[0.06] bg-white p-3 text-center shadow-card">
                <span className="flex h-11 w-11 items-center justify-center rounded-2xl" style={{ backgroundColor: `${cat.color}1a`, color: cat.color }}>
                  <CategoryIcon icon={cat.icon} />
                </span>
                <p className="mt-2 text-[11px] font-bold leading-tight text-navy-900">{cat.name}</p>
                <p className="mt-0.5 text-[10px] text-ink/40">{cat.course_count} cours</p>
              </Link>
            ))}
          </div>

          {/* Cours populaires */}
          <div className="mt-7 flex items-center justify-between px-5">
            <h2 className="text-lg font-bold text-navy-900">Cours populaires</h2>
            <Link to="/catalog" className="text-[13px] font-semibold text-brand-500">Voir tout</Link>
          </div>
          <div className="mt-3 flex gap-3 overflow-x-auto px-5 pb-2 [-ms-overflow-style:none] [scrollbar-width:none] [&::-webkit-scrollbar]:hidden">
            {popular.map((c) => (
              <Link key={c.id} to={`/course/${c.id}`} className="w-[150px] shrink-0">
                <div className="relative flex h-[110px] items-center justify-center overflow-hidden rounded-2xl" style={{ background: `linear-gradient(135deg, ${c.category_color || '#1B3C99'}, #0A1B3D)` }}>
                  <span className="px-2 text-center text-[13px] font-bold text-white/90">{c.title}</span>
                  <span className="absolute right-2 top-2 flex h-7 w-7 items-center justify-center rounded-full bg-white/90">
                    <svg width="15" height="15" fill="none" stroke="#0F172A" strokeWidth="2"><path d="M12.8 4.6a3 3 0 0 0-4.2 0l-.6.6-.6-.6a3 3 0 1 0-4.2 4.2l4.8 4.8 4.8-4.8a3 3 0 0 0 0-4.2z" /></svg>
                  </span>
                </div>
                <p className="mt-2 text-[13px] font-bold leading-tight text-navy-900">{c.title}</p>
                <p className="mt-1 text-[11px] text-ink/50">{c.instructor_name || 'StudyLink'}</p>
                <div className="mt-1 flex items-center gap-1 text-[11px]">
                  <span className="text-amber-400">★</span>
                  <span className="font-semibold text-navy-900">{Number(c.rating).toFixed(1)}</span>
                  <span className="text-ink/40">({c.rating_count})</span>
                  <span className="text-brand-500">•</span>
                  <span className="text-ink/50">{c.level}</span>
                </div>
              </Link>
            ))}
          </div>

          {/* Tutoriels rapides */}
          <div className="mt-6 flex items-center justify-between px-5">
            <h2 className="text-lg font-bold text-navy-900">Tutoriels rapides</h2>
            <Link to="/catalog" className="text-[13px] font-semibold text-brand-500">Voir tout</Link>
          </div>
          <div className="mt-3 flex gap-3 overflow-x-auto px-5 pb-4 [-ms-overflow-style:none] [scrollbar-width:none] [&::-webkit-scrollbar]:hidden">
            {[['Installer Python', '8 min', '#2563EB'], ['Git & GitHub', '12 min', '#EA4E27'], ['Docker', '15 min', '#2563EB']].map(([title, dur, color]) => (
              <div key={title} className="flex w-[150px] shrink-0 items-center justify-between rounded-2xl border border-black/[0.06] bg-white p-3 shadow-card">
                <div>
                  <p className="text-[13px] font-bold leading-tight text-navy-900">{title}</p>
                  <p className="mt-1 flex items-center gap-1 text-[11px] text-ink/50">
                    <svg width="12" height="12" fill="none" stroke="currentColor" strokeWidth="2"><circle cx="6" cy="6" r="5" /><path d="M6 3v3l2 1" /></svg>
                    {dur}
                  </p>
                </div>
                <span className="flex h-8 w-8 items-center justify-center rounded-full text-white" style={{ backgroundColor: color }}>
                  <svg width="14" height="14" fill="currentColor"><path d="M4 3l8 4-8 4z" /></svg>
                </span>
              </div>
            ))}
          </div>
        </>
      )}
    </div>
  );
}
