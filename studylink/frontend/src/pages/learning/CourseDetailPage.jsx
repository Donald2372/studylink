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


export default function CourseDetailPage(){return <AppShell><div className="page"><PageHeader title="Détail du cours" back/><div className="course-hero"><div><Chip active>Python</Chip><h1>Python pour débutants</h1><p>Apprenez les bases de Python et créez vos premiers programmes.</p><div className="row gap"><Avatar src={avatars[0]}/><div><b>Marc T.</b><p>★ 4,9 (256 avis)</p></div></div></div><div className="python-glyph">Py</div></div><div className="metric-row"><span><b>Débutant</b><small>Niveau</small></span><span><b>8h 30m</b><small>Durée</small></span><span><b>24 leçons</b><small>Leçons</small></span></div><div className="tabs"><b>À propos</b><span>Programme</span><span>Avis (256)</span><span>Ressources</span></div><Card><h2>À propos du cours</h2><p>Ce cours est conçu pour les débutants souhaitant apprendre Python pas à pas. Vous découvrirez les concepts essentiels du langage avec des exemples concrets et des exercices pratiques.</p><h3>Objectifs pédagogiques</h3>{['Comprendre les bases de Python et son écosystème','Écrire vos premiers programmes avec confiance','Manipuler des données avec des structures clés','Réaliser un projet pratique'].map(x=><p>✓ {x}</p>)}<Link className="primary-btn full" to="/courses/1/modules">▶ Commencer le cours</Link></Card></div></AppShell>}
