import { useState } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import { AppShell, PageHeader, Card, Avatar } from '../../components/AppShell.jsx';
import { useAppData } from '../../context/AppDataContext.jsx';
const avatar='https://i.pravatar.cc/160?img=12';
export default function ReservePage(){
  const {id}=useParams(); const nav=useNavigate(); const {state,addBooking}=useAppData(); const [goal,setGoal]=useState('');
  const confirm=()=>{addBooking({tutorId:id,title:'Python – Programmation avancée',tutor:'Marc T.',date:'15 mai 2025',time:state.selectedSlot||'15:00 – 16:00',goal});nav('/bookings')};
  return <AppShell><div className="page"><PageHeader title="Réservation d’une session" back/><Card className="mentor-summary"><Avatar src={avatar} size="lg"/><div><h2>Réserver une session avec Marc T.</h2><p>Python · IA · Machine Learning</p><span>★ 4,9 (256 avis)</span></div></Card><Card><h2>Détails de la session</h2>{[['Matière','Python – Programmation avancée'],['Date','15 mai 2025'],['Heure',state.selectedSlot||'15:00 – 16:00'],['Durée','1 heure'],['Tarif','25,00 €']].map(([a,b])=><div className="setting-row" key={a}><b>{a}</b><span>{b}</span></div>)}</Card><Card><h3>Objectif de la session (optionnel)</h3><textarea value={goal} onChange={e=>setGoal(e.target.value)} placeholder="Ex. : Je souhaite mieux comprendre les décorateurs en Python"/></Card><div className="info-banner">🛡 Paiement sécurisé · Annulation flexible</div><button className="primary-btn full" onClick={confirm}>Confirmer la réservation</button></div></AppShell>
}
