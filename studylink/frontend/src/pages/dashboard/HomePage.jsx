import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { api } from '../../api.js';
import { AppShell, PageHeader, Card, Avatar } from '../../components/AppShell.jsx';

const fallbackAvatar='https://i.pravatar.cc/160?img=47';

export default function HomePage() {
  const [courses, setCourses] = useState([]);

  useEffect(() => {
    let alive = true;
    api.getCourses().then((data) => alive && setCourses((data.courses || []).slice(0, 4))).catch(() => {});
    return () => { alive = false; };
  }, []);

  return <AppShell><div className="page">
    <PageHeader title="Bonjour 👋" subtitle="Prêt à avancer dans votre apprentissage ?" />
    <Card className="next-session"><div><span className="eyebrow">Prochaine session</span><div className="row gap"><Avatar src={fallbackAvatar}/><div><h3>Retrouvez vos prochaines sessions</h3><p>Vos réservations et échanges sont centralisés ici.</p></div></div></div><Link className="primary-btn" to="/bookings">Voir</Link></Card>
    <div className="quick-grid">{[['Messages','', '/messages'],['Forum','', '/forum'],['Notifications','', '/alerts']].map(([l,n,to]) => <Link to={to} className="quick-card" key={l}><b>{l}</b>{n && <span>{n}</span>}</Link>)}</div>

    <div className="section-title"><h2>Nouveaux cours publiés</h2><Link to="/catalogue">Voir tout</Link></div>
    {courses.length ? <div className="course-card-grid">{courses.map((course) => <Link to={`/courses/${course.id}`} className="course-card" key={course.id}>
      <div className="course-cover" style={course.cover_url ? { backgroundImage:`url(${course.cover_url})`, backgroundSize:'cover', backgroundPosition:'center' } : undefined}>{!course.cover_url && '◈'}</div>
      <b>{course.title}</b><span>{course.author_name || 'StudyLink'}</span><small>{course.category_name || 'Cours'} · {course.level || 'Tous niveaux'}</small>
    </Link>)}</div> : <Card><p style={{padding:16}}>Les cours publiés par l’administrateur apparaîtront ici automatiquement.</p></Card>}

    <div className="section-title"><h2>Explorer StudyLink</h2></div>
    <div className="feature-grid">{[['Développement personnel','/personal-development','✦'],['Entrepreneuriat','/entrepreneurship','↗'],['Bootcamps','/bootcamps','⚑'],['Prépa entretien','/career-prep','◎']].map(([l,to,i]) => <Link to={to} className="feature-card" key={l}><span>{i}</span><b>{l}</b></Link>)}</div>
  </div></AppShell>;
}
