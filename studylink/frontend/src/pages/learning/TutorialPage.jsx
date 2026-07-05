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


export default function TutorialPage(){return <AppShell><div className="page"><PageHeader title="Tutoriel" back/><h1>Tutoriel : Installer Python sur Windows</h1><p>Suivez ces étapes pour installer Python et commencer à coder.</p><div className="tutorial-layout"><aside>{['Télécharger Python','Lancer l’installation','Ajouter Python au PATH','Vérifier l’installation'].map((x,i)=><div className={i===0?'tutorial-step active':'tutorial-step'}><span>{i+1}</span>{x}</div>)}</aside><div><div className="youtube-player compact"><div className="yt-title">Installer Python<br/>sur Windows</div><button>▶</button><div className="yt-controls">▶ 🔊 0:00 / 6:45 <span>⚙ YouTube ⛶</span></div></div><Card><Chip active>Étape 1</Chip><h2>Télécharger Python</h2><p>Avant de commencer, nous allons télécharger la dernière version stable de Python depuis le site officiel.</p><p>1. Rendez-vous sur le site officiel de Python.</p><div className="link-box">https://www.python.org/downloads/</div><p>2. Cliquez sur le bouton “Download Python 3.x.x”.</p><p>3. Le fichier d’installation sera téléchargé sur votre ordinateur.</p></Card></div></div><div className="dual-actions"><button className="outline-btn">← Étape précédente</button><button className="primary-btn">Étape suivante →</button></div></div></AppShell>}
