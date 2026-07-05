import { useEffect, useMemo, useState } from 'react';
import { Link } from 'react-router-dom';
import { api } from '../../api.js';
import { AppShell, PageHeader, Chip } from '../../components/AppShell.jsx';
import { demoPrograms, demoBooks } from '../../data/demoContent.js';

const cats=['Discipline','Yoga','Méditation','Productivité','Confiance en soi','Habitudes','Bien-être','Intelligence émotionnelle'];
export default function PersonalDevelopmentPage(){
  const [programs,setPrograms]=useState([]);const [books,setBooks]=useState([]);const [q,setQ]=useState('');
  useEffect(()=>{api.getPersonalPrograms({q}).then(d=>setPrograms(d.programs||[])).catch(()=>{});api.getBooks({q}).then(d=>setBooks(d.books||[])).catch(()=>{})},[q]);
  const allPrograms=useMemo(()=>[...programs,...demoPrograms.filter(d=>!programs.some(p=>String(p.id)===String(d.id)))],[programs]);
  const allBooks=useMemo(()=>[...books,...demoBooks.filter(d=>!books.some(b=>String(b.id)===String(d.id)))],[books]);
  return <AppShell><div className="page"><PageHeader title="Développement personnel" subtitle="Discipline, habitudes, bien-être et équilibre"/>
    <div className="search-box">⌕<input value={q} onChange={e=>setQ(e.target.value)} placeholder="Rechercher un cours, une compétence, un sujet..."/></div>
    <div className="chip-row"><Chip>Catégories⌄</Chip><Chip>Niveau⌄</Chip><Chip>Type⌄</Chip><Chip>Langue⌄</Chip></div>
    <div className="category-grid personal">{cats.map((c,i)=><button type="button" className={`category-card p${i}`} key={c} onClick={()=>setQ(c)}><span>{['◎','♨','✿','▤','●','⟳','❧','♥'][i]}</span><b>{c}</b><small>Explorer</small></button>)}</div>
    <div className="section-title"><h2>Programmes populaires</h2><span>{allPrograms.length} disponibles</span></div>
    <div className="course-card-grid">{allPrograms.slice(0,6).map(p=><Link key={p.id} to={`/personal-development/programs/${p.id}`} className="course-card image-card"><div className="photo" style={p.cover_url?{backgroundImage:`url(${p.cover_url})`,backgroundSize:'cover',backgroundPosition:'center'}:undefined}></div><b>{p.title}</b><small>{p.duration_days||0} jours · {p.level||'Tous niveaux'}</small><span>Commencer →</span></Link>)}</div>
    <div className="section-title"><h2>Vidéos & Livres</h2><Link to="/personal-development/books">Voir tout</Link></div>
    <div className="media-strip">{allBooks.slice(0,4).map(b=><Link key={b.id} to={String(b.id).startsWith('demo-')?'/personal-development/books':`/personal-development/books/${b.id}`}><span className="media-icon">📚</span><b>{b.title}</b><small>{b.author_name||'StudyLink'} · {b.category||'Développement personnel'}</small></Link>)}</div>
  </div></AppShell>;
}
