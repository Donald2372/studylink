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


export default function BusinessPlanCoursePage(){return <AppShell><div className="page"><PageHeader title="StudyLink" back/><p className="breadcrumb">Mes cours › Entrepreneuriat › Créer son business plan</p><h1>Créer son business plan</h1><p>Apprenez à structurer une idée et bâtir un business plan solide pour lancer votre projet avec confiance.</p><div className="mentor-meta"><Avatar src={avatars[3]}/><span><b>Nadia K.</b><br/>Mentore en entrepreneuriat</span><span>★ 4,8 · Intermédiaire</span><span>◷ 4h 30 min · 18 leçons</span></div><div className="business-hero"><h1>Construisez<br/>votre projet.<br/>Planifiez votre<br/><b>réussite.</b></h1></div><div className="tabs"><b>À propos</b><span>Programme</span><span>Avis</span><span>Ressources</span></div><Card><h2>Résumé</h2><p>Ce parcours vous accompagne pas à pas pour transformer votre idée en un business plan clair, réaliste et convaincant.</p><h3>Objectifs pédagogiques</h3>{['Réaliser une étude de marché pertinente','Définir une proposition de valeur unique','Élaborer un plan financier solide','Mettre en place une stratégie commerciale efficace'].map(x=><p>◉ <b>{x}</b></p>)}<button className="primary-btn full">▶ Commencer le parcours</button></Card></div></AppShell>}
