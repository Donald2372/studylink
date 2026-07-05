import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { api } from '../../api.js';
import { AppShell, PageHeader, Card, Chip } from '../../components/AppShell.jsx';

const cats=['Discipline','Yoga','Méditation','Productivité','Confiance en soi','Habitudes','Bien-être','Intelligence émotionnelle'];

export default function PersonalDevelopmentPage(){
  const [programs,setPrograms]=useState([]);
  const [books,setBooks]=useState([]);
  const [q,setQ]=useState('');
  useEffect(()=>{api.getPersonalPrograms({q}).then(d=>setPrograms(d.programs||[])).catch(()=>{});api.getBooks({q}).then(d=>setBooks(d.books||[])).catch(()=>{})},[q]);
  return <AppShell><div className="page"><PageHeader title="Développement personnel" subtitle="Disciplines, habitudes, bien-être et équilibre"/>
    <div className="search-box">⌕<input value={q} onChange={e=>setQ(e.target.value)} placeholder="Rechercher un cours, une compétence, un sujet..."/></div>
    <div className="chip-row"><Chip>Catégories⌄</Chip><Chip>Niveau⌄</Chip><Chip>Type⌄</Chip><Chip>Langue⌄</Chip></div>
    <div className="category-grid personal">{cats.map((c,i)=><div className={`category-card p${i}`} key={c}><span>{['◎','♨','✿','▤','●','⟳','❧','♥'][i]}</span><b>{c}</b><small>Explorer</small></div>)}</div>
    <div className="section-title"><h2>Programmes publiés</h2></div>
    <div className="course-card-grid">{programs.length?programs.map(p=><Link key={p.id} to={`/personal-development/programs/${p.id}`} className="course-card image-card"><div className="photo discipline-photo" style={p.cover_url?{backgroundImage:`url(${p.cover_url})`,backgroundSize:'cover',backgroundPosition:'center'}:undefined}></div><b>{p.title}</b><small>{p.duration_days||0} jours · {p.level||'Tous niveaux'}</small></Link>):<Card><p style={{padding:18}}>Aucun programme publié.</p></Card>}</div>
    <div className="section-title"><h2>Vidéos & Livres</h2><Link to="/personal-development/books">Voir tout</Link></div>
    <div className="media-strip">{books.slice(0,4).map(b=><Link key={b.id} to={`/personal-development/books/${b.id}`}>▣ {b.title}<br/><small>{b.author_name}</small></Link>)}{!books.length&&<span>Les livres publiés apparaîtront ici.</span>}</div>
  </div></AppShell>}
