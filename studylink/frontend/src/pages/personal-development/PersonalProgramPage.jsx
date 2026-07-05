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


export default function PersonalProgramPage(){return <AppShell><div className="page"><PageHeader title="Détail du programme" back/><p className="breadcrumb">Programmes de développement › Discipline 30 jours</p><div className="program-hero"><Chip active>Programme</Chip><h1>Discipline<br/>30 jours</h1><p>Transformez vos habitudes.<br/>Changez votre vie.</p><div className="row gap"><Avatar src={avatars[1]}/><span>Coach Sarah M.</span></div><div>★ 4,8 · Débutant · 30 jours</div></div><div className="tabs"><b>À propos</b><span>Programme</span><span>Avis</span><span>Ressources</span></div><Card><h2>À propos de ce programme</h2><p>Un programme pratique et progressif conçu pour renforcer votre autodiscipline, construire des habitudes solides et atteindre vos objectifs personnels et professionnels.</p><h3>Ce que vous allez accomplir</h3>{['Développer une discipline quotidienne durable','Créer et suivre une routine efficace','Améliorer votre concentration et votre productivité','Vaincre la procrastination et passer à l’action'].map(x=><p>✓ {x}</p>)}<div className="info-banner">▣ Suivi quotidien et défis motivants.</div></Card><button className="primary-btn full">Commencer le programme →</button></div></AppShell>}
