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


export default function MessagesPage(){const people=[['Marc T.','Bonjour David, n’oublie pas notre session demain à 14h.','2',avatars[0]],['Sophie L.','Merci pour ton aide ! J’ai mieux compris la régression linéaire.','1',avatars[1]],['Thomas D.','Peux-tu m’envoyer les ressources sur les arbres de décision ?','',avatars[2]],['Amina K.','Parfait, merci ! À demain pour la session de révision.','1',avatars[3]]];return <AppShell><div className="page"><PageHeader title="Messages"/><div className="chip-row"><Chip active>Tous</Chip><Chip>Tuteurs</Chip><Chip>Apprenants</Chip><Chip>● Non lus</Chip></div><Card>{people.map(([n,m,u,a],i)=><Link to={`/messages/${i+1}`} className="message-row"><Avatar src={a} size="lg"/><div className="grow"><h3>{n}</h3><p>{m}</p></div><div><span>{i?'Hier':'10:24'}</span>{u&&<b className="badge blue">{u}</b>}</div></Link>)}</Card></div></AppShell>}
