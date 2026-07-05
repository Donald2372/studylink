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


export default function SearchTutorsPage(){
  const [tutors,setTutors]=useState(tutorFallback); const [q,setQ]=useState('');
  useEffect(()=>{api.searchTutors({search:q}).then(r=>setTutors(r.tutors?.length?r.tutors:tutorFallback)).catch(()=>setTutors(tutorFallback))},[q]);
  return <AppShell><div className="page"><PageHeader title="Recherche de tuteurs" back/><div className="search-box">⌕<input value={q} onChange={e=>setQ(e.target.value)} placeholder="Rechercher un tuteur, une compétence..."/><span>☷</span></div><div className="chip-row"><Chip active>Compétence</Chip><Chip>Matière</Chip><Chip>Disponibilité</Chip><Chip>Tarif</Chip></div><div className="stack">{tutors.map((t,i)=><Link to={`/tutors/${t.id}`} className="tutor-list-card" key={t.id}><Avatar src={t.avatar_url||avatars[i%avatars.length]} size="lg"/><div className="grow"><h3>{t.full_name}</h3><p>{t.headline||t.subjects?.join(' · ')}</p><span>★ {t.avg_rating||'4.9'} ({t.review_count||120})</span></div><b>{t.hourly_rate||25}€/h</b></Link>)}</div><div className="info-banner">✓ Des tuteurs vérifiés et qualifiés</div></div></AppShell>
}
