import { useEffect, useMemo, useState } from 'react';
import { Link } from 'react-router-dom';
import { api } from '../../api.js';
import { AppShell, PageHeader, Chip } from '../../components/AppShell.jsx';

const categories = [
  'Informatique','Mathématiques','Physique','Langues',
  'Emploi & Carrière','Développement personnel','Data Science','Business'
];

const formatDuration = (minutes) => {
  const value = Number(minutes) || 0;
  if (!value) return 'Durée libre';
  if (value < 60) return `${value} min`;
  const h = Math.floor(value / 60), m = value % 60;
  return m ? `${h} h ${m} min` : `${h} h`;
};

const tutorialThumbnail = (tutorial) => tutorial.cover_url || (
  tutorial.youtube_video_id ? `https://img.youtube.com/vi/${tutorial.youtube_video_id}/hqdefault.jpg` : ''
);

export default function CataloguePage() {
  const [courses, setCourses] = useState([]);
  const [tutorials, setTutorials] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [search, setSearch] = useState('');

  useEffect(() => {
    let alive = true;
    setLoading(true);
    Promise.all([api.getCourses(), api.getTutorials()])
      .then(([courseData, tutorialData]) => {
        if (!alive) return;
        setCourses(courseData.courses || []);
        setTutorials(tutorialData.tutorials || []);
      })
      .catch((e) => alive && setError(e.message || 'Impossible de charger le catalogue.'))
      .finally(() => alive && setLoading(false));
    return () => { alive = false; };
  }, []);

  const query = search.trim().toLowerCase();
  const visibleCourses = useMemo(() => courses.filter((course) => !query || [course.title, course.short_description, course.category_name, course.level].filter(Boolean).join(' ').toLowerCase().includes(query)).slice(0, 12), [courses, query]);
  const visibleTutorials = useMemo(() => tutorials.filter((tutorial) => !query || [tutorial.title, tutorial.description, tutorial.category_name, tutorial.level].filter(Boolean).join(' ').toLowerCase().includes(query)).slice(0, 8), [tutorials, query]);

  return <AppShell><div className="page">
    <PageHeader title="Catalogue des cours" subtitle="Découvrez les contenus réellement publiés sur StudyLink" />

    <div className="search-box">⌕<input value={search} onChange={(e) => setSearch(e.target.value)} placeholder="Rechercher un cours, un tutoriel..." /></div>
    <div className="chip-row"><Chip>Catégories⌄</Chip><Chip>Niveau⌄</Chip><Chip>Type⌄</Chip><Chip>Langue⌄</Chip></div>

    <div className="section-title"><h2>Catégories principales</h2><span>Mis à jour automatiquement</span></div>
    <div className="category-grid">{categories.map((category, index) => <div className={`category-card c${index}`} key={category}><span>{['⌘','∑','⚛','◎','▣','✦','◈','↗'][index]}</span><b>{category}</b><small>Explorer</small></div>)}</div>

    {error && <div className="admin-error">{error}</div>}

    <div className="section-title"><h2>Cours publiés</h2><span>{courses.length} disponible{courses.length > 1 ? 's' : ''}</span></div>
    {loading ? <div className="catalogue-status-card">Chargement...</div> : visibleCourses.length ? (
      <div className="course-card-grid">{visibleCourses.map((course) => <Link to={`/courses/${course.id}`} className="course-card" key={course.id}>
        <div className="course-cover" style={course.cover_url ? { backgroundImage:`url(${course.cover_url})`, backgroundSize:'cover', backgroundPosition:'center' } : undefined}>{!course.cover_url && '◈'}</div>
        <b>{course.title}</b>
        <span>{course.author_name || 'StudyLink'}</span>
        <small>{course.category_name || 'Cours'} · {course.level || 'Tous niveaux'}</small>
        {Number(course.file_count) > 0 && <small>📎 {course.file_count} document{Number(course.file_count) > 1 ? 's' : ''}</small>}
      </Link>)}</div>
    ) : <div className="catalogue-status-card">Aucun cours publié pour le moment. L’administrateur doit cliquer sur <b>Publier</b>.</div>}

    <div className="section-title"><h2>Tutoriels rapides</h2><span>Vidéos YouTube intégrées</span></div>
    {visibleTutorials.length ? <div className="public-tutorial-grid">{visibleTutorials.map((tutorial) => {
      const thumbnail = tutorialThumbnail(tutorial);
      return <Link to={`/tutorials/${tutorial.id}`} className="public-tutorial-card" key={tutorial.id}>
        <div className="public-tutorial-thumb">{thumbnail ? <img src={thumbnail} alt="" loading="lazy" /> : <div className="public-tutorial-placeholder">▶</div>}<span className="public-tutorial-play">▶</span></div>
        <div className="public-tutorial-body"><b>{tutorial.title}</b><span>{tutorial.category_name || 'Tutoriel StudyLink'}</span><small>{formatDuration(tutorial.estimated_minutes)}{Number(tutorial.step_count) ? ` · ${tutorial.step_count} étape${Number(tutorial.step_count)>1?'s':''}` : ''}</small></div>
      </Link>;
    })}</div> : !loading && <div className="catalogue-status-card">Aucun tutoriel publié.</div>}
  </div></AppShell>;
}
