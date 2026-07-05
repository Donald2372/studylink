import { useMemo, useState } from 'react';
import { AppShell, PageHeader } from '../../components/AppShell.jsx';
import { useAppData } from '../../context/AppDataContext.jsx';
const items=[
{id:1,type:'Messages',title:'Nouveau message de Marc T.',text:'Bonjour ! J’ai une question sur l’exercice 3.',time:'10:24'},
{id:2,type:'Forum',title:'Sophie L. a répondu à votre discussion.',text:'Merci pour votre question, voici ma réponse...',time:'09:15'},
{id:3,type:'Sessions',title:'Rappel : votre session commence dans 30 min.',text:'Python – Programmation avancée avec Marie T.',time:'08:30'},
{id:4,type:'Bootcamps',title:'Nouveau bootcamp disponible !',text:'Data Science pour débutants – Inscrivez-vous dès maintenant.',time:'08:05'}];
export default function AlertsPage(){const {state,markNotificationRead}=useAppData();const [filter,setFilter]=useState('Tout');const list=useMemo(()=>items.filter(i=>filter==='Tout'||i.type===filter),[filter]);return <AppShell><div className="page"><PageHeader title="Centre d’alertes" subtitle="Restez informé de tout ce qui compte."/><div className="chip-row">{['Tout','Messages','Forum','Bootcamps'].map(x=><button key={x} onClick={()=>setFilter(x)} className={`chip ${filter===x?'active':''}`}>{x}</button>)}</div><h2>Aujourd’hui</h2><div className="stack">{list.map(i=><button key={i.id} onClick={()=>markNotificationRead(i.id)} className={`tutor-list-card clickable ${state.notificationsRead.includes(i.id)?'read-notification':''}`}><div className="topic-icon">◈</div><div className="grow"><h3>{i.title}</h3><p>{i.text}</p></div><span>{i.time}{!state.notificationsRead.includes(i.id)&&' · ●'}</span></button>)}</div></div></AppShell>}
