import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { api } from '../../api.js';
import { useAuth } from '../../context/AuthContext.jsx';
import { AdminHeader, Status } from './AdminLayout.jsx';

export default function AdminCoursesPage() {
  const { token } = useAuth();
  const [items, setItems] = useState([]);
  const [q, setQ] = useState('');
  const [err, setErr] = useState('');
  const [busyId, setBusyId] = useState('');

  const load = () => api.adminList('courses', token)
    .then((x) => setItems(x.courses || []))
    .catch((e) => setErr(e.message));

  useEffect(load, [token]);

  async function del(id) {
    if (!confirm('Supprimer ce cours et tout son contenu ?')) return;
    await api.adminDelete('courses', id, token);
    load();
  }

  async function changeStatus(id, status) {
    setBusyId(id);
    setErr('');
    try {
      await api.adminSetCourseStatus(id, status, token);
      await load();
    } catch (e) {
      setErr(e.message);
    } finally {
      setBusyId('');
    }
  }

  const filtered = items.filter((x) => x.title.toLowerCase().includes(q.toLowerCase()));

  return <>
    <AdminHeader
      title="Cours"
      subtitle="Créez, structurez et publiez vos formations"
      action={<Link className="admin-btn primary" to="/admin/courses/new">＋ Nouveau cours</Link>}
    />

    <div className="admin-toolbar">
      <input placeholder="Rechercher un cours..." value={q} onChange={(e) => setQ(e.target.value)} />
    </div>

    {err && <div className="admin-error">{err}</div>}

    <div className="admin-table-wrap">
      <table className="admin-table">
        <thead>
          <tr><th>Cours</th><th>Catégorie</th><th>Modules</th><th>Statut</th><th>Actions</th></tr>
        </thead>
        <tbody>
          {filtered.map((c) => <tr key={c.id}>
            <td><b>{c.title}</b><small>{c.short_description}</small></td>
            <td>{c.category_name || '—'}</td>
            <td>{c.module_count}</td>
            <td><Status value={c.status} /></td>
            <td className="admin-row-actions">
              <Link to={`/admin/courses/${c.id}/structure`}>Structurer</Link>
              <Link to={`/admin/courses/${c.id}/edit`}>Modifier</Link>
              {c.status === 'published' ? (
                <button disabled={busyId === c.id} onClick={() => changeStatus(c.id, 'draft')}>Dépublier</button>
              ) : (
                <button disabled={busyId === c.id} onClick={() => changeStatus(c.id, 'published')} style={{ color: '#087c35' }}>
                  {busyId === c.id ? 'Publication...' : 'Publier'}
                </button>
              )}
              <button onClick={() => del(c.id)}>Supprimer</button>
            </td>
          </tr>)}
        </tbody>
      </table>
      {!filtered.length && <div className="admin-empty">Aucun cours pour le moment.</div>}
    </div>

    <div className="admin-upload-note" style={{ marginTop: 16 }}>
      Un cours en <b>Brouillon</b> reste invisible pour le public. Cliquez sur <b>Publier</b> pour l’afficher dans le Catalogue, l’accueil et la page Documents.
    </div>
  </>;
}
