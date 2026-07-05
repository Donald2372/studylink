import { useEffect, useMemo, useState } from 'react';
import { useParams } from 'react-router-dom';
import { api } from '../../api.js';
import { AppShell, PageHeader, Card, Chip } from '../../components/AppShell.jsx';

export default function TutorialPage() {
  const { id } = useParams();
  const [tutorial, setTutorial] = useState(null);
  const [steps, setSteps] = useState([]);
  const [activeIndex, setActiveIndex] = useState(0);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  useEffect(() => {
    let alive = true;
    setLoading(true);
    setError('');
    api.getTutorial(id)
      .then((data) => {
        if (!alive) return;
        setTutorial(data.tutorial);
        setSteps(data.steps || []);
        setActiveIndex(0);
      })
      .catch((e) => alive && setError(e.message))
      .finally(() => alive && setLoading(false));
    return () => { alive = false; };
  }, [id]);

  const step = steps[activeIndex];
  const progress = useMemo(() => steps.length ? Math.round(((activeIndex + 1) / steps.length) * 100) : 0, [activeIndex, steps.length]);

  if (loading) {
    return <AppShell><div className="page"><PageHeader title="Tutoriel" back/><div className="card">Chargement du tutoriel...</div></div></AppShell>;
  }

  if (error || !tutorial) {
    return <AppShell><div className="page"><PageHeader title="Tutoriel" back/><div className="admin-error">{error || 'Tutoriel introuvable.'}</div></div></AppShell>;
  }

  return (
    <AppShell>
      <div className="page">
        <PageHeader title="Tutoriel" back />
        <h1>{tutorial.title}</h1>
        <p>{tutorial.description || 'Suivez ce tutoriel étape par étape.'}</p>

        {!steps.length ? (
          <Card>
            <h2>Le tutoriel ne contient pas encore d’étape</h2>
            <p>Ajoutez une URL YouTube depuis l’espace administrateur. La vidéo apparaîtra ensuite ici et pourra être lue directement dans StudyLink.</p>
          </Card>
        ) : (
          <>
            <div className="tutorial-layout">
              <aside>
                {steps.map((item, index) => (
                  <button
                    type="button"
                    key={item.id}
                    className={index === activeIndex ? 'tutorial-step active' : 'tutorial-step'}
                    onClick={() => setActiveIndex(index)}
                  >
                    <span>{index + 1}</span>
                    {item.title}
                  </button>
                ))}
              </aside>

              <div>
                {step?.youtube_video_id ? (
                  <div className="tutorial-video-wrap">
                    <iframe
                      className="tutorial-video-frame"
                      src={`https://www.youtube-nocookie.com/embed/${step.youtube_video_id}?rel=0`}
                      title={step.title}
                      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                      allowFullScreen
                    />
                  </div>
                ) : step?.image_url ? (
                  <img className="tutorial-step-image" src={step.image_url} alt={step.title} />
                ) : null}

                <Card>
                  <Chip active>Étape {activeIndex + 1}</Chip>
                  <h2>{step?.title}</h2>
                  {step?.content ? <p className="tutorial-content-text">{step.content}</p> : <p>Regardez la vidéo puis passez à l’étape suivante.</p>}
                  {step?.resource_url && (
                    <a className="link-box" href={step.resource_url} target="_blank" rel="noreferrer">Ouvrir la ressource associée</a>
                  )}
                  <div className="tutorial-progress-text">Progression : {progress}%</div>
                </Card>
              </div>
            </div>

            <div className="dual-actions">
              <button
                type="button"
                className="outline-btn"
                disabled={activeIndex === 0}
                onClick={() => setActiveIndex((v) => Math.max(0, v - 1))}
              >
                ← Étape précédente
              </button>
              <button
                type="button"
                className="primary-btn"
                disabled={activeIndex >= steps.length - 1}
                onClick={() => setActiveIndex((v) => Math.min(steps.length - 1, v + 1))}
              >
                Étape suivante →
              </button>
            </div>
          </>
        )}
      </div>
    </AppShell>
  );
}
