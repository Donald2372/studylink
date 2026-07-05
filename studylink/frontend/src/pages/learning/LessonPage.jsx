import { useEffect, useMemo, useState } from 'react';
import { Link, useLocation, useParams } from 'react-router-dom';
import { api } from '../../api.js';
import { useAuth } from '../../context/AuthContext.jsx';
import { AppShell, PageHeader, Card } from '../../components/AppShell.jsx';

function YouTubeEmbed({ id }) {
  if (!id) return null;
  return <div className="youtube-embed"><iframe src={`https://www.youtube.com/embed/${id}`} title="Vidéo StudyLink" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowFullScreen /></div>;
}

export default function LessonPage(){
  const {id}=useParams();
  const {search}=useLocation();
  const courseId=new URLSearchParams(search).get('course');
  const {token}=useAuth();
  const [data,setData]=useState(null);
  const [tab,setTab]=useState('Résumé');
  const [note,setNote]=useState('');
  const [done,setDone]=useState(false);
  const [error,setError]=useState('');
  useEffect(()=>{ if(courseId) api.getCourse(courseId).then(setData).catch(e=>setError(e.message)); },[courseId]);
  const flat=useMemo(()=> (data?.modules||[]).flatMap(m=>(m.lessons||[]).map(l=>({...l,module:m}))),[data]);
  const lesson=flat.find(l=>l.id===id);
  const index=flat.findIndex(l=>l.id===id);
  async function complete(){setDone(true); if(token) api.saveLessonProgress(id,{progress_percent:100,completed:true},token).catch(()=>{});}
  return <AppShell><div className="page"><PageHeader title="Leçon StudyLink" back/>
    {error&&<div className="admin-error">{error}</div>}
    {!lesson?<Card><p style={{padding:18}}>Chargement de la leçon...</p></Card>:<>
      <p className="breadcrumb">Mes cours › {data.course.title} › {lesson.module?.title}</p>
      <h1>{lesson.title}</h1><p>{lesson.lesson_type||'Leçon'} · {Math.round((Number(lesson.duration_seconds)||0)/60)||'Durée libre'} min</p>
      {lesson.lesson_type==='youtube'&&<YouTubeEmbed id={lesson.youtube_video_id}/>} 
      {lesson.lesson_type==='video_upload'&&lesson.media_url&&<video src={lesson.media_url} controls className="uploaded-video"/>}
      {lesson.lesson_type==='pdf'&&lesson.media_url&&<a className="primary-btn" href={lesson.media_url} target="_blank" rel="noreferrer">Ouvrir le PDF</a>}
      <div className="tabs">{['Résumé','Notes','Ressources','Exercices'].map(t=><span key={t} onClick={()=>setTab(t)} className={`interactive-tab ${tab===t?'active':''}`}>{t}</span>)}</div>
      <Card>{tab==='Résumé'&&<><h3>Contenu</h3><p>{lesson.content||'Cette leçon ne contient pas encore de texte complémentaire.'}</p></>}{tab==='Notes'&&<textarea rows="6" value={note} onChange={e=>setNote(e.target.value)} placeholder="Écrivez vos notes personnelles ici..."/>}{tab==='Ressources'&&<p>Les ressources ajoutées à cette leçon apparaîtront ici.</p>}{tab==='Exercices'&&<p>Les exercices associés à cette leçon apparaîtront ici.</p>}<div className="info-banner">{done?'✓ Leçon terminée et progression enregistrée.':'ⓘ Cliquez sur “Marquer comme terminée” pour enregistrer votre progression.'}</div></Card>
      <div className="dual-actions"><Link className="outline-btn" to={index>0?`/lessons/${flat[index-1].id}?course=${courseId}`:`/courses/${courseId}/modules`}>← Précédente</Link><button className="primary-btn" onClick={complete}>{done?'Terminée ✓':'Marquer comme terminée'}</button>{index<flat.length-1&&<Link className="primary-btn" to={`/lessons/${flat[index+1].id}?course=${courseId}`}>Suivante →</Link>}</div>
    </>}
  </div></AppShell>}
