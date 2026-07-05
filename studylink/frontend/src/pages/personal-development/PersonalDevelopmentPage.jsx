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


export default function PersonalDevelopmentPage(){const cats=['Discipline','Yoga','Méditation','Productivité','Confiance en soi','Habitudes','Bien-être','Intelligence émotionnelle'];return <AppShell><div className="page"><PageHeader title="Développement personnel" subtitle="Disciplines, habitudes, bien-être et équilibre"/><div className="search-box">⌕<input placeholder="Rechercher un cours, une compétence, un sujet..."/></div><div className="chip-row"><Chip>Catégories⌄</Chip><Chip>Niveau⌄</Chip><Chip>Type⌄</Chip><Chip>Langue⌄</Chip></div><div className="category-grid personal">{cats.map((c,i)=><div className={`category-card p${i}`}><span>{['◎','♨','✿','▤','●','⟳','❧','♥'][i]}</span><b>{c}</b><small>{11+i} cours</small></div>)}</div><div className="section-title"><h2>Programmes populaires</h2><Link to="#">Voir tout</Link></div><div className="course-card-grid"><Link to="/personal-development/programs/discipline-30" className="course-card image-card"><div className="photo discipline-photo"></div><b>Discipline 30 jours</b><small>★ 4,8 · Débutant</small></Link><div className="course-card image-card"><div className="photo yoga-photo"></div><b>Yoga du matin</b><small>★ 4,9 · Tous niveaux</small></div><div className="course-card image-card"><div className="photo focus-photo"></div><b>Routine anti-procrastination</b><small>★ 4,7 · Débutant</small></div></div><div className="section-title"><h2>Vidéos & Livres</h2><Link to="/personal-development/books">Voir tout</Link></div><div className="media-strip"><div>▶ Comment renforcer votre discipline</div><Link to="/personal-development/books">▣ Atomic Habits</Link><div>▶ Méditation pour réduire le stress</div><Link to="/personal-development/books">▣ Les 5 AM Club</Link></div></div></AppShell>}
