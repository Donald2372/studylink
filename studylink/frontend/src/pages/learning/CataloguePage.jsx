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


export default function CataloguePage(){return <AppShell><div className="page"><PageHeader title="Catalogue des cours" subtitle="Découvrez et développez vos compétences"/><div className="search-box">⌕<input placeholder="Rechercher un cours, un tutoriel..."/></div><div className="chip-row"><Chip>Catégories⌄</Chip><Chip>Niveau⌄</Chip><Chip>Type⌄</Chip><Chip>Langue⌄</Chip></div><div className="section-title"><h2>Catégories principales</h2><Link to="#">Voir tout</Link></div><div className="category-grid">{categories.map((c,i)=><div className={`category-card c${i}`}><span>{['⌘','∑','⚛','◎','▣','✦','◈','↗'][i]}</span><b>{c}</b><small>{45+i*11} cours</small></div>)}</div><div className="section-title"><h2>Cours populaires</h2><Link to="#">Voir tout</Link></div><div className="course-card-grid">{courses.map((c,i)=><Link to={`/courses/${i+1}`} className="course-card"><div className={`course-cover ${c.tone}`}>◈</div><b>{c.title}</b><span>{c.mentor}</span><small>★ {c.rating} · {c.level}</small></Link>)}</div><div className="section-title"><h2>Tutoriels rapides</h2><Link to="#">Voir tout</Link></div><div className="tutorial-strip">{[['Installer Python','8 min'],['Git & GitHub','12 min'],['Docker','15 min']].map(x=><Link to="/tutorials/python" className="mini-tutorial"><b>{x[0]}</b><span>◷ {x[1]} ▶</span></Link>)}</div></div></AppShell>}
