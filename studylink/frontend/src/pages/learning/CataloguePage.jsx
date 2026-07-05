import { useEffect, useMemo, useState } from 'react';
import { Link } from 'react-router-dom';
import { api } from '../../api.js';
import { AppShell, PageHeader, Chip } from '../../components/AppShell.jsx';

const courses = [
  { title: 'Python pour débutants', mentor: 'Marie T.', rating: '4,9', level: 'Débutant', tone: 'python' },
  { title: 'Machine Learning', mentor: 'Marc T.', rating: '4,8', level: 'Intermédiaire', tone: 'ai' },
  { title: 'Algorithmes & Structures', mentor: 'Sophie L.', rating: '4,7', level: 'Intermédiaire', tone: 'code' },
];

const categories = [
  'Informatique',
  'Mathématiques',
  'Physique',
  'Langues',
  'Emploi & Carrière',
  'Développement personnel',
  'Data Science',
  'Business',
];

function formatDuration(minutes) {
  const value = Number(minutes) || 0;
  if (value <= 0) return 'Durée libre';
  if (value < 60) return `${value} min`;
  const hours = Math.floor(value / 60);
  const rest = value % 60;
  return rest ? `${hours} h ${rest} min` : `${hours} h`;
}

function tutorialThumbnail(tutorial) {
  if (tutorial.cover_url) return tutorial.cover_url;
  if (tutorial.youtube_video_id) {
    return `https://img.youtube.com/vi/${tutorial.youtube_video_id}/hqdefault.jpg`;
  }
  return '';
}

export default function CataloguePage() {
  const [tutorials, setTutorials] = useState([]);
  const [tutorialLoading, setTutorialLoading] = useState(true);
  const [tutorialError, setTutorialError] = useState('');
  const [search, setSearch] = useState('');

  useEffect(() => {
    let alive = true;
    setTutorialLoading(true);
    setTutorialError('');

    api.getTutorials()
      .then((data) => {
        if (!alive) return;
        setTutorials(Array.isArray(data?.tutorials) ? data.tutorials : []);
      })
      .catch((error) => {
        if (!alive) return;
        setTutorialError(error.message || 'Impossible de charger les tutoriels.');
      })
      .finally(() => {
        if (alive) setTutorialLoading(false);
      });

    return () => {
      alive = false;
    };
  }, []);

  const visibleTutorials = useMemo(() => {
    const query = search.trim().toLowerCase();
    const filtered = query
      ? tutorials.filter((tutorial) => {
          const haystack = [
            tutorial.title,
            tutorial.description,
            tutorial.category_name,
            tutorial.level,
          ].filter(Boolean).join(' ').toLowerCase();
          return haystack.includes(query);
        })
      : tutorials;

    return filtered.slice(0, 6);
  }, [tutorials, search]);

  return (
    <AppShell>
      <div className="page">
        <PageHeader title="Catalogue des cours" subtitle="Découvrez et développez vos compétences" />

        <div className="search-box">
          ⌕
          <input
            value={search}
            onChange={(event) => setSearch(event.target.value)}
            placeholder="Rechercher un cours, un tutoriel..."
          />
        </div>

        <div className="chip-row">
          <Chip>Catégories⌄</Chip>
          <Chip>Niveau⌄</Chip>
          <Chip>Type⌄</Chip>
          <Chip>Langue⌄</Chip>
        </div>

        <div className="section-title">
          <h2>Catégories principales</h2>
          <Link to="#">Voir tout</Link>
        </div>
        <div className="category-grid">
          {categories.map((category, index) => (
            <div className={`category-card c${index}`} key={category}>
              <span>{['⌘', '∑', '⚛', '◎', '▣', '✦', '◈', '↗'][index]}</span>
              <b>{category}</b>
              <small>{45 + index * 11} cours</small>
            </div>
          ))}
        </div>

        <div className="section-title">
          <h2>Cours populaires</h2>
          <Link to="#">Voir tout</Link>
        </div>
        <div className="course-card-grid">
          {courses.map((course, index) => (
            <Link to={`/courses/${index + 1}`} className="course-card" key={course.title}>
              <div className={`course-cover ${course.tone}`}>◈</div>
              <b>{course.title}</b>
              <span>{course.mentor}</span>
              <small>★ {course.rating} · {course.level}</small>
            </Link>
          ))}
        </div>

        <div className="section-title">
          <h2>Tutoriels rapides</h2>
          <span className="catalogue-live-label">Mis à jour automatiquement</span>
        </div>

        {tutorialLoading ? (
          <div className="catalogue-status-card">Chargement des tutoriels publiés...</div>
        ) : tutorialError ? (
          <div className="admin-error">{tutorialError}</div>
        ) : visibleTutorials.length ? (
          <div className="public-tutorial-grid">
            {visibleTutorials.map((tutorial) => {
              const thumbnail = tutorialThumbnail(tutorial);
              return (
                <Link
                  to={`/tutorials/${tutorial.id}`}
                  className="public-tutorial-card"
                  key={tutorial.id}
                >
                  <div className="public-tutorial-thumb">
                    {thumbnail ? (
                      <img src={thumbnail} alt="" loading="lazy" />
                    ) : (
                      <div className="public-tutorial-placeholder">▶</div>
                    )}
                    <span className="public-tutorial-play">▶</span>
                  </div>
                  <div className="public-tutorial-body">
                    <b>{tutorial.title}</b>
                    <span>{tutorial.category_name || 'Tutoriel StudyLink'}</span>
                    <small>
                      {formatDuration(tutorial.estimated_minutes)}
                      {Number(tutorial.step_count) > 0 ? ` · ${tutorial.step_count} étape${Number(tutorial.step_count) > 1 ? 's' : ''}` : ''}
                    </small>
                  </div>
                </Link>
              );
            })}
          </div>
        ) : (
          <div className="catalogue-status-card">
            Aucun tutoriel publié pour le moment. Les tutoriels publiés par l’administrateur apparaîtront automatiquement ici.
          </div>
        )}
      </div>
    </AppShell>
  );
}
