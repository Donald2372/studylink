import { useEffect, useMemo, useState } from 'react';
import { Link } from 'react-router-dom';
import { api } from '../../api.js';
import { AppShell, PageHeader, Card, Avatar, Progress } from '../../components/AppShell.jsx';
import { demoCourses, demoTutorials, demoPrograms, demoBootcamps } from '../../data/demoContent.js';

const fallbackAvatar='https://i.pravatar.cc/160?img=47';
const quickLinks=[
  ['Messages','/messages','💬','2'],['Forum','/forum','👥','5'],['Notifications','/alerts','🔔','7'],['Documents','/materials','📁','']
];
const featureLinks=[
  ['Développement personnel','/personal-development','✦','Discipline, yoga, méditation'],
  ['Entrepreneuriat','/entrepreneurship','↗','Business plan et outils'],
  ['Bootcamps','/bootcamps','⚑','Formations gratuites'],
  ['Prépa entretien','/career-prep','◎','Simulations et CV']
];

export default function HomePage() {
  const [courses, setCourses] = useState([]);
  const [bootcamps,setBootcamps]=useState([]);

  useEffect(() => {
    let alive = true;
    api.getCourses().then((data) => alive && setCourses(data.courses || [])).catch(() => {});
    api.getBootcamps({}).then((data)=>alive&&setBootcamps(data.bootcamps||[])).catch(()=>{});
    return () => { alive = false; };
  }, []);

  const displayCourses=useMemo(()=>[...courses,...demoCourses.filter(d=>!courses.some(c=>String(c.id)===String(d.id)))].slice(0,4),[courses]);
  const displayBootcamps=useMemo(()=>[...bootcamps,...demoBootcamps.filter(d=>!bootcamps.some(b=>String(b.id)===String(d.id)))].slice(0,3),[bootcamps]);

  return <AppShell><div className="page">
    <PageHeader title="Bonjour 👋" subtitle="Prêt à avancer dans votre apprentissage ?" />

    <Card className="next-session"><div><span className="eyebrow">Prochaine session</span><div className="row gap"><Avatar src={fallbackAvatar}/><div><h3>Python – Programmation avancée</h3><p>Avec Marie T. · Aujourd’hui, 14:00 – 16:00</p></div></div></div><Link className="primary-btn" to="/bookings">Rejoindre</Link></Card>

    <div className="quick-grid">{quickLinks.map(([l,to,icon,n]) => <Link to={to} className="quick-card" key={l}><span className="quick-icon">{icon}</span><b>{l}</b>{n && <span className="badge red">{n}</span>}</Link>)}</div>

    <div className="section-title"><h2>Mes apprentissages</h2><Link to="/catalogue">Voir tout</Link></div>
    <Card>{[
      ['Python pour débutants',65,'/courses/demo-python'],['Algorithmes & Structures',80,'/courses/demo-algo'],['Préparation Entretien Tech',75,'/career-prep']
    ].map(([name,p,to])=><Link to={to} className="learning-row" key={name}><div className="grow"><b>{name}</b><Progress value={p}/></div><strong>{p}%</strong></Link>)}</Card>

    <div className="section-title"><h2>Nouveaux cours</h2><Link to="/catalogue">Voir tout</Link></div>
    <div className="course-card-grid">{displayCourses.map((course) => <Link to={`/courses/${course.id}`} className="course-card" key={course.id}>
      <div className="course-cover" style={course.cover_url ? { backgroundImage:`url(${course.cover_url})`, backgroundSize:'cover', backgroundPosition:'center' } : undefined}>{!course.cover_url && '◈'}</div>
      <b>{course.title}</b><span>{course.author_name || 'StudyLink'}</span><small>{course.category_name || 'Cours'} · {course.level || 'Tous niveaux'}</small>
    </Link>)}</div>

    <div className="section-title"><h2>Tutoriels rapides</h2><Link to="/catalogue">Voir tout</Link></div>
    <div className="media-strip">{demoTutorials.map(t=><Link key={t.id} to={`/tutorials/${t.id}`}><img src={`https://img.youtube.com/vi/${t.youtube_video_id}/mqdefault.jpg`} alt=""/><b>{t.title}</b><small>{t.estimated_minutes} min · ▶ Lancer</small></Link>)}</div>

    <div className="section-title"><h2>Programmes recommandés</h2><Link to="/personal-development">Voir tout</Link></div>
    <div className="course-card-grid">{demoPrograms.map(p=><Link key={p.id} to={`/personal-development/programs/${p.id}`} className="course-card image-card"><div className="photo" style={{backgroundImage:`url(${p.cover_url})`,backgroundSize:'cover',backgroundPosition:'center'}}></div><b>{p.title}</b><small>{p.duration_days} jours · {p.level}</small></Link>)}</div>

    <div className="section-title"><h2>Bootcamps à découvrir</h2><Link to="/bootcamps">Voir tout</Link></div>
    <div className="stack">{displayBootcamps.map(b=><Link to="/bootcamps" className="bootcamp-card" key={b.id}><div className="boot-icon">🚀</div><div className="grow"><b>{b.title}</b><p>{b.description}</p><small>{b.registered_count||0} participants</small></div><span className="status-pill">Découvrir</span></Link>)}</div>

    <div className="section-title"><h2>Explorer StudyLink</h2></div>
    <div className="feature-grid">{featureLinks.map(([l,to,i,sub]) => <Link to={to} className="feature-card" key={l}><span>{i}</span><b>{l}</b><small>{sub}</small></Link>)}</div>
  </div></AppShell>;
}
