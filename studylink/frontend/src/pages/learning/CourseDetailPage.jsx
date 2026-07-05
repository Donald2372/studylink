import { useEffect, useState } from 'react';
import { Link, useParams } from 'react-router-dom';
import { api } from '../../api.js';
import { AppShell, PageHeader, Card, Chip, Avatar } from '../../components/AppShell.jsx';

const duration = (minutes) => {
  const n=Number(minutes)||0; if(!n) return 'Durée libre';
  const h=Math.floor(n/60), m=n%60; return h ? `${h}h${m?` ${m}min`:''}` : `${m} min`;
};

export default function CourseDetailPage() {
  const { id } = useParams();
  const [data,setData]=useState(null);
  const [error,setError]=useState('');
  useEffect(()=>{ api.getCourse(id).then(setData).catch((e)=>setError(e.message)); },[id]);
  if(error) return <AppShell><div className="page"><PageHeader title="Détail du cours" back/><div className="admin-error">{error}</div></div></AppShell>;
  if(!data) return <AppShell><div className="page"><PageHeader title="Détail du cours" back/><Card><p style={{padding:18}}>Chargement...</p></Card></div></AppShell>;
  const {course,modules=[],files=[]}=data;
  return <AppShell><div className="page"><PageHeader title="Détail du cours" back/>
    <div className="course-hero" style={course.cover_url ? {backgroundImage:`linear-gradient(90deg,rgba(5,23,65,.92),rgba(5,23,65,.45)),url(${course.cover_url})`,backgroundSize:'cover',backgroundPosition:'center'} : undefined}>
      <div><Chip active>{course.category_name||'Cours'}</Chip><h1>{course.title}</h1><p>{course.short_description||course.description}</p><div className="row gap"><Avatar src={course.author_avatar_url}/><div><b>{course.author_name||'StudyLink'}</b><p>{course.language?.toUpperCase()||'FR'}</p></div></div></div><div className="python-glyph">SL</div>
    </div>
    <div className="metric-row"><span><b>{course.level||'Tous niveaux'}</b><small>Niveau</small></span><span><b>{duration(course.estimated_minutes)}</b><small>Durée</small></span><span><b>{modules.length} modules</b><small>Programme</small></span></div>
    <Card><h2>À propos du cours</h2><p>{course.description||course.short_description||'Aucune description.'}</p>
      {Array.isArray(course.objectives)&&course.objectives.length>0&&<><h3>Objectifs pédagogiques</h3>{course.objectives.map((x)=><p key={x}>✓ {x}</p>)}</>}
      {files.length>0&&<><h3>Documents</h3>{files.map((f)=><p key={f.id}>📎 <a href={f.file_url} target="_blank" rel="noreferrer">{f.title||f.file_name}</a></p>)}</>}
      <Link className="primary-btn full" to={`/courses/${id}/modules`}>▶ Voir le programme</Link>
    </Card>
  </div></AppShell>;
}
