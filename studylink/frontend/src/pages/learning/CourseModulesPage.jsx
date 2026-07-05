import { useEffect, useState } from 'react';
import { Link, useParams } from 'react-router-dom';
import { api } from '../../api.js';
import { useAuth } from '../../context/AuthContext.jsx';
import { AppShell, PageHeader, Card, Progress } from '../../components/AppShell.jsx';

export default function CourseModulesPage(){
  const {id}=useParams();
  const {token}=useAuth();
  const [data,setData]=useState(null);
  const [error,setError]=useState('');
  const [enrolled,setEnrolled]=useState(false);
  useEffect(()=>{api.getCourse(id).then(setData).catch(e=>setError(e.message))},[id]);
  async function enroll(){if(!token)return;try{await api.enrollCourse(id,token);setEnrolled(true)}catch(e){setError(e.message)}}
  const lessons=(data?.modules||[]).flatMap(m=>m.lessons||[]);
  return <AppShell><div className="page"><PageHeader title="Contenu du cours" back/>
    {error&&<div className="admin-error">{error}</div>}
    {!data?<Card><p style={{padding:18}}>Chargement...</p></Card>:<>
      <div className="row gap course-heading"><div className="course-icon python">SL</div><div><p>{data.course.category_name||'Cours'}</p><h1>{data.course.title}</h1><span>Avec {data.course.author_name||'StudyLink'}</span></div></div>
      {token&&<button className="primary-btn" onClick={enroll}>{enrolled?'Inscription enregistrée ✓':'Commencer / s’inscrire au cours'}</button>}
      <div className="stack">{data.modules.map((m,i)=><div className="module-row" key={m.id}><span>{i+1}</span><div className="grow"><h3>Module {i+1} – {m.title}</h3><p>{m.lessons?.length||0} leçon(s)</p>{m.lessons?.length>0&&<div style={{marginTop:12,display:'grid',gap:8}}>{m.lessons.map((l)=><Link key={l.id} to={`/lessons/${l.id}?course=${id}`} className="setting-row"><b>{l.title}</b><span>{l.lesson_type==='youtube'?'Vidéo YouTube':l.lesson_type||'Leçon'} →</span></Link>)}</div>}</div></div>)}</div>
      <Card className="progress-card"><div className="progress-ring">{lessons.length?0:0}%</div><div className="grow"><div className="between"><h3>Votre progression</h3><span>0 / {lessons.length} leçons</span></div><Progress value={0}/><p>La progression se mettra à jour lorsque vous marquerez des leçons comme terminées.</p></div></Card>
      <div className="info-banner">ⓘ Les contenus publiés par l’administrateur sont chargés directement depuis Supabase.</div>
    </>}
  </div></AppShell>}
