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


export default function EntrepreneurProjectPage(){return <AppShell><div className="page"><PageHeader title="Mon projet entrepreneurial" subtitle="Gérez l’avancement de votre projet et atteignez vos objectifs." back/><div className="project-hero"><div className="project-logo">FRESH<br/>BOX</div><div className="grow"><h1>FreshBox Delivery</h1><Chip tone="green">● En cours</Chip><p>Projet créé le 12 avr. 2024</p></div><div className="progress-ring big">65%<small>Avancement</small></div><div className="project-metrics"><span>Lancement prévu<b>15 oct. 2024</b></span><span>Budget utilisé<b>6 450 € / 10 000 €</b></span><span>Prochaine étape<b>Lancement bêta</b></span></div></div><div className="dashboard-grid"><Card><div className="between"><h2>Tâches</h2><Link to="#">Voir tout</Link></div>{['Étude de marché','Création du logo','Rédaction du business plan','Recherche des premiers clients'].map((x,i)=><p>{i<2?'✓':'○'} {x} <span>{i<2?'Terminée':i===2?'En cours':'À faire'}</span></p>)}<Progress value={50}/></Card><Card><h2>Budget</h2><h1>6 450 €</h1><p>sur 10 000 €</p><div className="progress-ring">64%</div></Card><Card><h2>Objectifs</h2>{[['Valider le concept',100],['Développer le MVP',75],['Atteindre 100 clients',30]].map(x=><div><div className="between"><span>{x[0]}</span><b>{x[1]}%</b></div><Progress value={x[1]}/></div>)}</Card><Card><h2>Documents</h2>{['Business Plan v1.2.pdf','Étude de marché.docx','Prévisionnel financier.xlsx'].map(x=><p>▤ {x} ⋮</p>)}</Card></div><div className="info-banner">ⓘ Conseil du jour : pensez à tester votre MVP auprès d’un petit groupe avant le lancement ! 🚀</div></div></AppShell>}
