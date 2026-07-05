import { useEffect, useMemo, useState } from 'react';
import { Link, useParams, useNavigate } from 'react-router-dom';
import { api } from '../../api.js';
import { useAuth } from '../../context/AuthContext.jsx';
import { AppShell, PageHeader, Card, Chip, Progress, Avatar, Logo } from '../../components/AppShell.jsx';

const avatars = [
  'https://i.pravatar.cc/160?img=12','https://i.pravatar.cc/160?img=47','https://i.pravatar.cc/160?img=13','https://i.pravatar.cc/160?img=32','https://i.pravatar.cc/160?img=5'
];
const tutorFallback = [
  {id:1, full_name:'Marc T.', headline:'Python · IA · Machine Learning', avg_rating:4.9, review_count:284, hourly_rate:25, avatar_url:avatars[0]},
  {id:2, full_name:'Sophie L.', headline:'Mathématiques', avg_rating:4.8, review_count:197, hourly_rate:20, avatar_url:avatars[1]},
  {id:3, full_name:'Thomas D.', headline:'Java · Spring Boot', avg_rating:4.7, review_count:210, hourly_rate:30, avatar_url:avatars[2]},
  {id:4, full_name:'Amina K.', headline:'Physique · Mécanique', avg_rating:4.9, review_count:189, hourly_rate:22, avatar_url:avatars[3]},
];
const sessions = [
  ['Python – Avancé','Marc T.','15 mai 2025 · 15:30','Confirmée',avatars[0]],
  ['Mathématiques','Sophie L.','16 mai 2025 · 10:00','Confirmée',avatars[1]],
  ['Java – Spring Boot','Thomas D.','17 mai 2025 · 14:00','À venir',avatars[2]],
  ['Algo & Structures de données','Armin K.','18 mai 2025 · 11:00','À venir',avatars[4]],
];
const courses = [
  {title:'Python pour débutants', mentor:'Marie T.', rating:'4,9', level:'Débutant', progress:65, tone:'python'},
  {title:'Machine Learning', mentor:'Marc T.', rating:'4,8', level:'Intermédiaire', progress:30, tone:'ai'},
  {title:'Algorithmes & Structures', mentor:'Sophie L.', rating:'4,7', level:'Intermédiaire', progress:80, tone:'code'},
];
const categories = ['Informatique','Mathématiques','Physique','Langues','Emploi & Carrière','Développement personnel','Data Science','Business'];


export default function HomePage(){
  return <AppShell><div className="page"><PageHeader title="Bonjour, David 👋" subtitle="Prêt à avancer dans votre apprentissage ?" />
    <Card className="next-session"><div><span className="eyebrow">Prochaine session</span><div className="row gap"><Avatar src={avatars[1]} /><div><h3>Python – Programmation avancée</h3><p>Avec Marie T. · Aujourd’hui 14:00 – 16:00</p></div></div></div><Link className="primary-btn" to="/session/1">Rejoindre</Link></Card>
    <div className="quick-grid">{[['Messages','2','/messages'],['Forum','5','/forum'],['Notifications','7','/alerts']].map(([l,n,to])=><Link to={to} className="quick-card" key={l}><b>{l}</b><span>{n}</span></Link>)}</div>
    <div className="section-title"><h2>Mes apprentissages</h2><Link to="/catalogue">Voir tout</Link></div>
    <Card>{courses.map(c=><div className="learning-row" key={c.title}><div className={`course-icon ${c.tone}`}>◈</div><div className="grow"><div className="between"><b>{c.title}</b><strong>{c.progress}%</strong></div><Progress value={c.progress}/></div></div>)}</Card>
    <div className="section-title"><h2>Explorer StudyLink</h2></div><div className="feature-grid">{[['Développement personnel','/personal-development','✦'],['Entrepreneuriat','/entrepreneurship','↗'],['Bootcamps','/bootcamps','⚑'],['Prépa entretien','/career-prep','◎']].map(([l,to,i])=><Link to={to} className="feature-card" key={l}><span>{i}</span><b>{l}</b></Link>)}</div>
  </div></AppShell>
}
