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


export default function SessionDetailPage(){return <AppShell><div className="page"><PageHeader title="Détail d’une session" back/><h1>Python – Programmation avancée</h1><div className="between"><div className="row gap"><Avatar src={avatars[0]}/><span>Avec Marc T.</span></div><Chip tone="green">✓ Confirmée</Chip></div><Card>{[['Date','15 mai 2025'],['Heure','15:30 – 16:30'],['Durée','1 heure'],['Mode','En ligne (Visioconférence)']].map(([a,b])=><div className="setting-row"><b>{a}</b><span>{b}</span></div>)}</Card><Card><h3>Objectif</h3><p>Approfondir les concepts avancés de Python et résoudre des exercices pratiques.</p></Card><Card><h3>Documents</h3>{['Exercice_test.pdf','Notes_cours.pdf'].map(f=><div className="file-row"><span className="file-icon">PDF</span><div className="grow"><b>{f}</b><p>1,2 Mo · PDF</p></div><span>↓</span></div>)}</Card><Link className="primary-btn full" to="/video-session">▣ Rejoindre la session</Link></div></AppShell>}
