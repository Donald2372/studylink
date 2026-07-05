import { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import { api } from '../../api.js';
import { useAuth } from '../../context/AuthContext.jsx';
import { AppShell, PageHeader, Card, Avatar, Chip } from '../../components/AppShell.jsx';
export default function PersonalProgramPage(){
  const {id}=useParams(); const {token}=useAuth(); const [data,setData]=useState(null); const [msg,setMsg]=useState(''); const [error,setError]=useState('');
  useEffect(()=>{api.getPersonalProgram(id).then(setData).catch(e=>setError(e.message))},[id]);
  async function start(){ if(!token){setError('Connectez-vous pour commencer.');return;} try{await api.startPersonalProgram(id,token);setMsg('Programme démarré.');}catch(e){setError(e.message)} }
  const p=data?.program;
  return <AppShell><div className="page"><PageHeader title="Détail du programme" back/>
    {error&&<div className="admin-error">{error}</div>}{msg&&<div className="info-banner">{msg}</div>}
    {!p?<Card><p style={{padding:18}}>Chargement...</p></Card>:<>
      <div className="program-hero" style={p.cover_url?{backgroundImage:`linear-gradient(90deg,rgba(5,23,65,.85),rgba(5,23,65,.45)),url(${p.cover_url})`,backgroundSize:'cover',backgroundPosition:'center'}:undefined}><Chip>Programme</Chip><h1>{p.title}</h1><p>{p.description}</p><div className="row gap"><Avatar/><span>{p.duration_days} jours · {p.level}</span></div></div><Card><h2>Programme</h2>{data.days?.length?data.days.map(d=><div className="setting-row" key={d.id}><b>Jour {d.day_number} · {d.title}</b><span>{d.video_url?'Vidéo':'Texte'}</span></div>):<p>Les journées du programme apparaîtront ici.</p>}</Card><button className="primary-btn full" onClick={start}>Commencer le programme →</button>
    </>}
  </div></AppShell>}
