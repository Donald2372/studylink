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


export default function BookReaderPage(){return <AppShell><div className="page"><PageHeader title="Lecture du livre" back/><div className="reader-tools"><span>🔖<small>Signet</small></span><span>✎<small>Surligner</small></span><span>▤<small>Notes</small></span><span>Aᴀ<small>Taille du texte</small></span><span>☾<small>Mode nuit</small></span></div><Card className="reader-card"><div className="book-header"><div className="book-cover discipline-book">POUVOIR DE LA DISCIPLINE</div><div className="grow"><h1>Pouvoir de la discipline</h1><p>Brian Tracy</p><Progress value={42}/><span>42% terminé</span></div></div><div className="chapter-nav"><button>←</button><div><p>Chapitre 3</p><h2>Construire une routine durable</h2></div><button>→</button></div><div className="book-text"><p>La réussite ne vient pas de ce que vous faites de temps en temps, mais de ce que vous faites <mark>chaque jour.</mark></p><p>Une routine bien construite est le fondement de toute transformation personnelle. Elle élimine la dépendance à la motivation et installe la discipline comme un pilier de votre quotidien.</p><p>Commencez petit. Choisissez 2 ou 3 habitudes essentielles. Répétez-les chaque jour, sans exception.</p></div><div className="page-pill">Page 52 sur 124 · 42%</div></Card><div className="quote-card">“ La discipline est le pont entre vos objectifs et vos réalisations. ”</div></div></AppShell>}
