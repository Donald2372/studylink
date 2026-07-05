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


export default function PersonalBooksPage(){const books=[['Atomic Habits','James Clear','Productivité','45%'],['Pouvoir de la discipline','Brian Tracy','Discipline','28%'],['Yoga pour débutants','Elodie Martin','Yoga','60%'],['Maîtriser son temps','Thibault Meurisse','Productivité','35%'],['Confiance en soi','Sarah Ben Ali','Psychologie','15%']];return <AppShell><div className="page"><PageHeader title="Livres de développement personnel" subtitle="Lisez et progressez à votre rythme."/><div className="search-box">⌕<input placeholder="Rechercher un livre, un auteur, un sujet..."/><span>☷</span></div><div className="chip-row"><Chip active>Tous</Chip><Chip>Discipline</Chip><Chip>Motivation</Chip><Chip>Productivité</Chip><Chip>Yoga</Chip></div><h2>Continuer la lecture</h2><Card className="book-feature"><div className="book-cover atomic">Atomic<br/><b>Habits</b></div><div className="grow"><h2>Atomic Habits</h2><p>James Clear</p><Chip>Productivité</Chip><Progress value={45}/></div><b>PDF ⋮</b></Card><h2>Tous les livres</h2><div className="stack">{books.map((b,i)=><Link to={i===1?'/personal-development/books/discipline':'#'} className="book-row"><div className={`book-cover b${i}`}>{b[0].split(' ').slice(0,2).join('\n')}</div><div className="grow"><h3>{b[0]}</h3><p>{b[1]}</p><Chip>{b[2]}</Chip><small>★ {4.5+i/10} · {b[3]}</small></div><span>⋮</span></Link>)}</div></div></AppShell>}
