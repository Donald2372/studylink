import { useEffect, useMemo, useState } from 'react';
import { api } from '../../api.js';
import { useAuth } from '../../context/AuthContext.jsx';
import { AppShell, PageHeader, Card, Chip, Progress } from '../../components/AppShell.jsx';

const statusLabel={project:'En projet',upcoming:'À venir',ongoing:'En cours',completed:'Terminé',cancelled:'Annulé'};

export default function BootcampsPage(){
  const {token}=useAuth();
  const [items,setItems]=useState([]);
  const [q,setQ]=useState('');
  const [tab,setTab]=useState('Tous');
  const [msg,setMsg]=useState('');
  const [error,setError]=useState('');
  const load=()=>api.getBootcamps({q}).then(d=>setItems(d.bootcamps||[])).catch(e=>setError(e.message));
  useEffect(()=>{const t=setTimeout(load,250);return()=>clearTimeout(t)},[q]);
  const visible=useMemo(()=>items.filter(b=>tab==='Tous'||statusLabel[b.status]===tab),[items,tab]);
  async function join(id){if(!token){setError('Connectez-vous pour vous inscrire.');return;}try{await api.registerBootcamp(id,token);setMsg('Inscription confirmée.');load();}catch(e){setError(e.message)}}
  return <AppShell><div className="page"><PageHeader title="Bootcamps & formations" subtitle="Formations gratuites ajoutées par les tuteurs et administrateurs"/>
    <div className="search-box">⌕<input value={q} onChange={e=>setQ(e.target.value)} placeholder="Rechercher un bootcamp, une compétence..."/></div>
    <div className="chip-row">{['Tous','En projet','À venir','En cours','Terminé'].map(x=><button key={x} onClick={()=>setTab(x)} className={`chip ${tab===x?'active':''}`}>{x}</button>)}</div>
    {msg&&<div className="info-banner">{msg}</div>}{error&&<div className="admin-error">{error}</div>}
    <div className="stack">{visible.length?visible.map((b)=><Card className="bootcamp-card" key={b.id}><div className="boot-icon">{(b.title||'B').slice(0,2)}</div><div className="grow"><div className="between"><Chip tone={b.status==='ongoing'?'green':'blue'}>{statusLabel[b.status]||b.status}</Chip><Chip tone="green">{b.is_free?'Gratuit':'Payant'}</Chip></div><h2>{b.title}</h2><p>{b.description}</p><p>{b.start_at?new Date(b.start_at).toLocaleDateString('fr-FR'):'Date à confirmer'} · {b.registered_count||0}{b.max_participants?` / ${b.max_participants}`:''} inscrits</p><Progress value={b.status==='completed'?100:b.status==='ongoing'?60:0}/></div>{b.status==='completed'&&b.replay_url?<a className="outline-btn" href={b.replay_url} target="_blank" rel="noreferrer">Voir le replay</a>:<button className="primary-btn" onClick={()=>join(b.id)} disabled={b.status==='completed'||b.status==='project'}>{b.status==='project'?'Bientôt':b.status==='completed'?'Terminé':'S’inscrire'}</button>}</Card>):<Card><p style={{padding:18}}>Aucun bootcamp publié pour le moment.</p></Card>}</div>
  </div></AppShell>}
