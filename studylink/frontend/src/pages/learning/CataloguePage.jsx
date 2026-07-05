import { useEffect, useMemo, useState } from 'react';
import { Link } from 'react-router-dom';
import { api } from '../../api.js';
import { AppShell, PageHeader, Chip } from '../../components/AppShell.jsx';
import { demoCourses, demoTutorials } from '../../data/demoContent.js';

const categories = [
  'Informatique','Mathématiques','Physique','Langues',
  'Emploi & Carrière','Développement personnel','Data Science','Business'
];

const formatDuration = (minutes) => { const value=Number(minutes)||0; if(!value)return'Durée libre'; if(value<60)return`${value} min`; const h=Math.floor(value/60),m=value%60; return m?`${h} h ${m} min`:`${h} h`; };
const tutorialThumbnail = (tutorial) => tutorial.cover_url || (tutorial.youtube_video_id ? `https://img.youtube.com/vi/${tutorial.youtube_video_id}/hqdefault.jpg` : '');

export default function CataloguePage() {
  const [courses,setCourses]=useState([]); const [tutorials,setTutorials]=useState([]); const [loading,setLoading]=useState(true); const [error,setError]=useState(''); const [search,setSearch]=useState('');
  useEffect(()=>{let alive=true;Promise.all([api.getCourses(),api.getTutorials()]).then(([a,b])=>{if(!alive)return;setCourses(a.courses||[]);setTutorials(b.tutorials||[])}).catch(e=>alive&&setError(e.message||'Impossible de charger le catalogue.')).finally(()=>alive&&setLoading(false));return()=>{alive=false}},[]);
  const allCourses=useMemo(()=>[...courses,...demoCourses.filter(d=>!courses.some(c=>String(c.id)===String(d.id)))],[courses]);
  const allTutorials=useMemo(()=>[...tutorials,...demoTutorials.filter(d=>!tutorials.some(t=>String(t.id)===String(d.id)))],[tutorials]);
  const query=search.trim().toLowerCase();
  const visibleCourses=allCourses.filter(c=>!query||[c.title,c.short_description,c.category_name,c.level].filter(Boolean).join(' ').toLowerCase().includes(query)).slice(0,12);
  const visibleTutorials=allTutorials.filter(t=>!query||[t.title,t.description,t.category_name,t.level].filter(Boolean).join(' ').toLowerCase().includes(query)).slice(0,8);
  return <AppShell><div className="page">
    <PageHeader title="Catalogue des cours" subtitle="Cours publiés et contenus de découverte entièrement cliquables"/>
    <div className="search-box">⌕<input value={search} onChange={e=>setSearch(e.target.value)} placeholder="Rechercher un cours, un tutoriel..."/></div>
    <div className="chip-row"><Chip>Catégories⌄</Chip><Chip>Niveau⌄</Chip><Chip>Type⌄</Chip><Chip>Langue⌄</Chip></div>
    <div className="section-title"><h2>Catégories principales</h2><Link to="/catalogue">Voir tout</Link></div>
    <div className="category-grid">{categories.map((category,index)=><button type="button" className={`category-card c${index}`} key={category} onClick={()=>setSearch(category)}><span>{['⌘','∑','⚛','◎','▣','✦','◈','↗'][index]}</span><b>{category}</b><small>Explorer</small></button>)}</div>
    {error&&<div className="info-banner">Mode découverte actif : {error}</div>}
    <div className="section-title"><h2>Cours populaires</h2><span>{allCourses.length} contenus</span></div>
    <div className="course-card-grid">{visibleCourses.map(course=><Link to={`/courses/${course.id}`} className="course-card" key={course.id}><div className="course-cover" style={course.cover_url?{backgroundImage:`url(${course.cover_url})`,backgroundSize:'cover',backgroundPosition:'center'}:undefined}>{!course.cover_url&&'◈'}</div><b>{course.title}</b><span>{course.author_name||'StudyLink'}</span><small>{course.category_name||'Cours'} · {course.level||'Tous niveaux'}</small><small>{formatDuration(course.estimated_minutes)}</small></Link>)}</div>
    <div className="section-title"><h2>Tutoriels rapides</h2><span>Vidéos YouTube intégrées</span></div>
    <div className="public-tutorial-grid">{visibleTutorials.map(t=>{const thumbnail=tutorialThumbnail(t);return <Link to={`/tutorials/${t.id}`} className="public-tutorial-card" key={t.id}><div className="public-tutorial-thumb">{thumbnail?<img src={thumbnail} alt="" loading="lazy"/>:<div className="public-tutorial-placeholder">▶</div>}<span className="public-tutorial-play">▶</span></div><div className="public-tutorial-body"><b>{t.title}</b><span>{t.category_name||'Tutoriel StudyLink'}</span><small>{formatDuration(t.estimated_minutes)}{Number(t.step_count)?` · ${t.step_count} étapes`:''}</small></div></Link>})}</div>
    {loading&&<div className="catalogue-status-card">Synchronisation avec la base de données...</div>}
  </div></AppShell>;
}
