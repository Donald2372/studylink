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


export default function TutorProfilePage(){
  const {id}=useParams(); const [t,setT]=useState(tutorFallback[0]);
  useEffect(()=>{api.getTutor(id).then(r=>setT({...tutorFallback[0],...r.tutor})).catch(()=>{})},[id]);
  return <AppShell><div className="page"><PageHeader title="Profil d’un tuteur" back/><div className="profile-hero"><Avatar src={t.avatar_url||avatars[0]} size="xl"/><h1>{t.full_name||'Marc T.'}</h1><p>{t.headline||'Python · IA · Machine Learning'}</p><div className="rating-line">★ {t.avg_rating||4.9} <span>({t.review_count||256} avis)</span><b>{t.hourly_rate||25}€/h</b></div></div><div className="metric-row"><span>🎓 5 ans d’expérience</span><span>🌐 2 langues</span><span>⌖ Paris, France</span></div><div className="tabs"><b>À propos</b><span>Disponibilités</span><span>Avis</span></div><Card><p>Ingénieur en IA et développeur Python passionné, j’aide les étudiants et les professionnels à maîtriser Python, le Machine Learning et l’Intelligence Artificielle.</p><div className="detail-list"><p><b>Spécialités</b><br/>Python, Machine Learning, Deep Learning, Data Science, IA</p><p><b>Niveaux enseignés</b><br/>Débutant · Intermédiaire · Avancé</p><p><b>Langues</b><br/>Français · Anglais</p></div></Card><div className="dual-actions"><Link className="outline-btn" to={`/messages/${id}`}>Contacter</Link><Link className="primary-btn" to={`/reserve/${id}`}>Réserver</Link></div></div></AppShell>
}
