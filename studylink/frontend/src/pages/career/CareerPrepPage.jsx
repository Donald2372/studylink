import { Link, useNavigate } from 'react-router-dom';
import { AppShell, PageHeader, Card, Chip, Avatar } from '../../components/AppShell.jsx';
import { useAppData } from '../../context/AppDataContext.jsx';
const avatars=['https://i.pravatar.cc/160?img=47','https://i.pravatar.cc/160?img=12'];
export default function CareerPrepPage(){
  const navigate=useNavigate();const {notify}=useAppData();
  const actions=[
    ['Simulation d’entretien','▣',()=>navigate('/search')],['Correction de CV','▤',()=>navigate('/materials')],['Simulation RH','◉',()=>navigate('/search')],['Questions fréquentes','?',()=>navigate('/forum')],['Feedback personnalisé','□',()=>navigate('/messages')],['Atelier pratique','♟',()=>navigate('/bootcamps')]
  ];
  return <AppShell><div className="page"><PageHeader title="Prépa entretien d’embauche" subtitle="Boostez votre confiance, décrochez le job ! 🚀"/>
    <Card className="career-hero"><div><Chip active>Prochaine session</Chip><h1>Simulation d’entretien avec Sarah D.</h1><p>Aujourd’hui, 15:00 – 16:00</p></div><Link className="primary-btn" to="/video-session">Rejoindre la session</Link></Card>
    <div className="section-title"><h2>Actions rapides</h2></div><div className="feature-grid career">{actions.map(([x,i,fn])=><button type="button" className="feature-card" key={x} onClick={fn}><span>{i}</span><b>{x}</b><small>Ouvrir l’outil correspondant</small></button>)}</div>
    <div className="section-title"><h2>Mentor recommandé</h2><Link to="/search">Voir tout</Link></div><Card className="mentor-summary"><Avatar src={avatars[0]} size="lg"/><div className="grow"><h3>Sarah D.</h3><p>Experte en recrutement & Soft Skills</p><span>★ 4.9 · +5 ans d’expérience</span></div><button className="primary-btn" onClick={()=>navigate('/search')}>Réserver</button></Card>
    <div className="section-title"><h2>Ressources pour vous</h2></div><div className="resource-grid"><Link to="/materials">📄 10 questions pièges en entretien<br/><small>Guide pratique</small></Link><button onClick={()=>notify('Vidéo enregistrée dans vos favoris')}>▶ Réussir son pitch en 2 minutes<br/><small>Vidéo · 6 min</small></button><Link to="/materials">✓ Checklist avant l’entretien<br/><small>PDF</small></Link></div>
  </div></AppShell>;
}
