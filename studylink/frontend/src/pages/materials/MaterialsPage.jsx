import { useEffect, useMemo, useState } from 'react';
import { api } from '../../api.js';
import { AppShell, PageHeader, Card, Chip } from '../../components/AppShell.jsx';

const formatSize = (bytes) => {
  const n = Number(bytes || 0);
  if (!n) return '';
  if (n < 1024) return `${n} o`;
  if (n < 1024 * 1024) return `${(n / 1024).toFixed(0)} Ko`;
  return `${(n / 1024 / 1024).toFixed(2)} Mo`;
};

const extFrom = (material) => {
  const name = material.file_name || material.title || '';
  const ext = name.includes('.') ? name.split('.').pop().toUpperCase() : '';
  if (ext) return ext.slice(0, 5);
  const mime = material.mime_type || '';
  if (mime.includes('pdf')) return 'PDF';
  if (mime.includes('presentation')) return 'PPTX';
  if (mime.includes('word')) return 'DOCX';
  if (mime.includes('audio')) return 'AUDIO';
  if (mime.includes('video')) return 'VIDEO';
  return 'FILE';
};

export default function MaterialsPage() {
  const [materials, setMaterials] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [query, setQuery] = useState('');
  const [active, setActive] = useState('all');

  useEffect(() => {
    let cancelled = false;
    setLoading(true);
    setError('');
    api.getPublicMaterials()
      .then(({ materials }) => {
        if (!cancelled) setMaterials(materials || []);
      })
      .catch((err) => {
        if (!cancelled) setError(err.message || 'Impossible de charger les documents.');
      })
      .finally(() => {
        if (!cancelled) setLoading(false);
      });
    return () => { cancelled = true; };
  }, []);

  const visible = useMemo(() => {
    const needle = query.trim().toLowerCase();
    return materials.filter((m) => {
      const haystack = [m.title, m.file_name, m.course_title, m.category_name]
        .filter(Boolean)
        .join(' ')
        .toLowerCase();
      const matchesQuery = !needle || haystack.includes(needle);
      const matchesType = active === 'all' || active === 'courses';
      return matchesQuery && matchesType;
    });
  }, [materials, query, active]);

  return (
    <AppShell>
      <div className="page">
        <PageHeader
          title="Matériels & Documents"
          subtitle="Accédez à tous les supports réellement ajoutés aux cours publiés."
        />

        <div className="search-box">
          ⌕
          <input
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            placeholder="Rechercher un document, un cours..."
          />
          <span>☷</span>
        </div>

        <div className="chip-row">
          <button onClick={() => setActive('all')}><Chip active={active === 'all'}>Tous</Chip></button>
          <button onClick={() => setActive('courses')}><Chip active={active === 'courses'}>Cours</Chip></button>
        </div>

        {error && <div className="admin-error" style={{ marginTop: 16 }}>{error}</div>}

        {loading ? (
          <Card><p style={{ padding: 18 }}>Chargement des documents...</p></Card>
        ) : visible.length === 0 ? (
          <Card>
            <div style={{ padding: '28px 18px', textAlign: 'center' }}>
              <b>Aucun document publié pour le moment.</b>
              <p style={{ marginTop: 8, opacity: .65 }}>
                Les fichiers ajoutés à un cours publié depuis l’administration apparaîtront automatiquement ici.
              </p>
            </div>
          </Card>
        ) : (
          <Card>
            {visible.map((m) => (
              <div className="file-row" key={m.id}>
                <span className={`file-icon type-${extFrom(m).includes('PDF') ? 'pdf' : 'doc'}`}>
                  {extFrom(m)}
                </span>
                <div className="grow">
                  <a
                    href={m.file_url}
                    target="_blank"
                    rel="noreferrer"
                    style={{ color: 'inherit', textDecoration: 'none' }}
                  >
                    <b>{m.title || m.file_name || 'Document'}</b>
                  </a>
                  <p>{m.course_title || 'Cours StudyLink'}</p>
                  <span>
                    {m.category_name || 'Cours'}
                    {m.file_size ? ` · ${formatSize(m.file_size)}` : ''}
                    {m.created_at ? ` · Ajouté le ${new Intl.DateTimeFormat('fr-FR', { day: 'numeric', month: 'short', year: 'numeric' }).format(new Date(m.created_at))}` : ''}
                  </span>
                </div>
                <a
                  href={m.file_url}
                  target="_blank"
                  rel="noreferrer"
                  className="admin-btn secondary"
                  style={{ textDecoration: 'none', whiteSpace: 'nowrap' }}
                >
                  Ouvrir
                </a>
              </div>
            ))}
          </Card>
        )}
      </div>
    </AppShell>
  );
}
