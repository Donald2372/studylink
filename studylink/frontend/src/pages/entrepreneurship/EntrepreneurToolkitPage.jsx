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


export default function EntrepreneurToolkitPage(){const tools=[['Modèle de business plan','DOCX'],['Prévision financière','XLSX'],['Modèle de budget','XLSX'],['Modèle de facture','DOCX'],['Checklist de lancement','PDF'],['Pitch deck','PPTX']];return <AppShell><div className="page"><PageHeader title="Boîte à outils entrepreneur" subtitle="Des modèles et outils pratiques pour lancer, gérer et développer votre projet avec succès." back/><div className="search-box">⌕<input placeholder="Rechercher un modèle ou un outil..."/><span>☷</span></div><div className="chip-row"><Chip active>Tous</Chip><Chip>Modèles</Chip><Chip>Finances</Chip><Chip>Pitch</Chip><Chip>Documents</Chip></div><h2>Modèles et ressources populaires</h2><div className="tools-grid">{tools.map((x,i)=><Card className="tool-card"><div className={`tool-icon t${i}`}>▤</div><div><h3>{x[0]}</h3><p>Modèle professionnel prêt à l’emploi pour votre projet.</p><Chip>{x[1]}</Chip></div><button>↓</button></Card>)}</div><div className="info-banner">ⓘ Conseil StudyLink : personnalisez ces modèles selon vos besoins.</div></div></AppShell>}
