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


export default function EntrepreneurshipPage(){const cats=['Idée & Validation','Business Plan','Finance','Marketing','Vente','E-commerce','Leadership','Business en ligne'];return <AppShell><div className="page"><PageHeader title="Entrepreneuriat" subtitle="Créez, lancez et développez votre projet"/><div className="search-box">⌕<input placeholder="Rechercher un cours, une compétence, un sujet..."/></div><div className="chip-row"><Chip>Catégories⌄</Chip><Chip>Niveau⌄</Chip><Chip>Type⌄</Chip><Chip>Format⌄</Chip></div><div className="category-grid entrepreneur">{cats.map((c,i)=><div className={`category-card e${i}`}><span>{['💡','▤','◔','⌁','▣','🛒','♟','◎'][i]}</span><b>{c}</b><small>{10+i} cours</small></div>)}</div><div className="section-title"><h2>Parcours populaires</h2><Link to="#">Voir tout</Link></div><div className="course-card-grid"><div className="path-card"><Chip>Débutant</Chip><h3>Créer son entreprise</h3><p>Les étapes clés pour passer de l’idée au lancement.</p><small>8 modules · 6h 30min</small></div><Link to="/entrepreneurship/business-plan" className="path-card"><Chip tone="green">Intermédiaire</Chip><h3>Business plan complet</h3><p>Réalisez un business plan solide et convaincant.</p><small>10 modules · 7h 45min</small></Link><div className="path-card"><Chip>Débutant</Chip><h3>Trouver ses premiers clients</h3><p>Attirez, convertissez et fidélisez vos premiers clients.</p><small>7 modules · 5h 20min</small></div></div><div className="section-title"><h2>Ressources & Modèles</h2><Link to="/entrepreneurship/toolkit">Voir tout</Link></div><div className="resource-grid"><Link to="/entrepreneurship/toolkit">▤ Modèles<br/><small>24 modèles</small></Link><span>▶ Vidéos<br/><small>36 vidéos</small></span><span>▥ Livres & Guides<br/><small>18 ressources</small></span></div></div></AppShell>}
