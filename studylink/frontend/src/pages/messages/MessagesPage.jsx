import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { api } from '../../api.js';
import { useAuth } from '../../context/AuthContext.jsx';
import { AppShell, PageHeader, Card, Chip, Avatar } from '../../components/AppShell.jsx';

const fallbackAvatar='https://i.pravatar.cc/160?img=12';

export default function MessagesPage() {
  const { token } = useAuth();
  const [contacts,setContacts]=useState([]);
  const [loading,setLoading]=useState(true);
  const [error,setError]=useState('');

  useEffect(()=>{
    if(!token){ setLoading(false); return; }
    let alive=true;
    api.getContacts(token)
      .then((data)=>alive&&setContacts(data.contacts||[]))
      .catch((e)=>alive&&setError(e.message||'Impossible de charger les conversations.'))
      .finally(()=>alive&&setLoading(false));
    return ()=>{alive=false};
  },[token]);

  return <AppShell><div className="page">
    <PageHeader title="Messages" subtitle="Échangez du texte et des documents avec vos contacts" />
    <div className="chip-row"><Chip active>Tous</Chip><Chip>Tuteurs</Chip><Chip>Apprenants</Chip><Chip>● Non lus</Chip></div>
    {error&&<div className="admin-error">{error}</div>}
    {loading ? <Card><p style={{padding:18}}>Chargement des conversations...</p></Card> : contacts.length ? <Card>
      {contacts.map((contact)=><Link
        to={`/messages/${contact.id}?name=${encodeURIComponent(contact.full_name||'Contact')}`}
        className="message-row"
        key={contact.id}
      >
        <Avatar src={contact.avatar_url||fallbackAvatar} size="lg"/>
        <div className="grow"><h3>{contact.full_name||'Utilisateur StudyLink'}</h3><p>{contact.lastMessage?.content || (contact.lastMessage?.has_attachment ? '📎 Document envoyé' : 'Commencer la conversation')}</p></div>
        <div>{contact.lastMessage?.created_at&&<span>{new Intl.DateTimeFormat('fr-FR',{hour:'2-digit',minute:'2-digit'}).format(new Date(contact.lastMessage.created_at))}</span>}{contact.unreadCount>0&&<b className="badge blue">{contact.unreadCount}</b>}</div>
      </Link>)}
    </Card> : <Card><div style={{padding:24,textAlign:'center'}}><b>Aucune conversation disponible.</b><p style={{marginTop:8,opacity:.65}}>Une conversation devient disponible après une réservation avec un tuteur ou un apprenant autorisé.</p></div></Card>}
  </div></AppShell>;
}
