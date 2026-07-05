import { Link } from 'react-router-dom';
import { AppShell, PageHeader, Avatar, Chip } from '../../components/AppShell.jsx';
import { useAppData } from '../../context/AppDataContext.jsx';
const fallback=[
{id:'f1',title:'Python – Avancé',tutor:'Marc T.',date:'15 mai 2025',time:'15:30',status:'Confirmée',avatar:'https://i.pravatar.cc/160?img=12'},
{id:'f2',title:'Mathématiques',tutor:'Sophie L.',date:'16 mai 2025',time:'10:00',status:'Confirmée',avatar:'https://i.pravatar.cc/160?img=47'}];
export default function BookingsPage(){const {state,cancelBooking}=useAppData(); const all=[...state.bookings,...fallback]; return <AppShell><div className="page"><PageHeader title="Mes sessions"/><div className="chip-row"><Chip active>À venir</Chip><Chip>En cours</Chip><Chip>Terminées</Chip><Chip>Annulées</Chip></div><div className="stack">{all.map((s,i)=><div className="session-row" key={s.id}><Avatar src={s.avatar||'https://i.pravatar.cc/160?img=12'} size="lg"/><div className="grow"><h3>{s.title}</h3><p>Avec {s.tutor}</p><span>{s.date} · {s.time}</span></div><div className="stack"><span className="status-pill">{s.status}</span>{String(s.id).startsWith('f')?<Link to="/session/1">Ouvrir</Link>:s.status!=='Annulée'&&<button className="outline-btn" onClick={()=>cancelBooking(s.id)}>Annuler</button>}</div></div>)}</div></div></AppShell>}
