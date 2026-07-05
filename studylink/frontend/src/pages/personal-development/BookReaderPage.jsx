import { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import { api } from '../../api.js';
import { useAuth } from '../../context/AuthContext.jsx';
import { AppShell, PageHeader, Card, Progress } from '../../components/AppShell.jsx';

export default function BookReaderPage(){
  const {id}=useParams(); const {token}=useAuth();
  const [book,setBook]=useState(null); const [page,setPage]=useState(1); const [font,setFont]=useState(18); const [night,setNight]=useState(false); const [marked,setMarked]=useState(false); const [error,setError]=useState('');
  useEffect(()=>{api.getBook(id).then(d=>setBook(d.book)).catch(e=>setError(e.message))},[id]);
  const total=Number(book?.page_count)||124; const progress=Math.min(100,Math.round(page/total*100));
  function save(nextPage=page){setPage(nextPage); if(token) api.saveBookProgress(id,{current_page:nextPage,progress_percent:Math.min(100,Math.round(nextPage/total*100)),font_size:font,night_mode:night},token).catch(()=>{})}
  return <AppShell><div className="page"><PageHeader title="Lecture du livre" back/>
    {error&&<div className="admin-error">{error}</div>}
    {!book?<Card><p style={{padding:18}}>Chargement...</p></Card>:<>
      <div className="reader-tools"><button onClick={()=>setMarked(!marked)}>🔖<small>{marked?'Signet ✓':'Signet'}</small></button><button>✎<small>Surligner</small></button><button>▤<small>Notes</small></button><button onClick={()=>setFont(font>=24?16:font+2)}>Aᴀ<small>Taille {font}</small></button><button onClick={()=>setNight(!night)}>☾<small>Mode nuit</small></button></div>
      <Card className={`reader-card ${night?'night':''}`}><div className="book-header"><div className="book-cover discipline-book" style={book.cover_url?{backgroundImage:`url(${book.cover_url})`,backgroundSize:'cover',backgroundPosition:'center'}:undefined}>{!book.cover_url&&book.title}</div><div className="grow"><h1>{book.title}</h1><p>{book.author_name}</p><Progress value={progress}/><span>{progress}% terminé</span>{book.file_url&&<a className="outline-btn" href={book.file_url} target="_blank" rel="noreferrer">Ouvrir le fichier original</a>}</div></div><div className="chapter-nav"><button onClick={()=>save(Math.max(1,page-1))}>←</button><div><p>Page {page}</p><h2>{book.title}</h2></div><button onClick={()=>save(Math.min(total,page+1))}>→</button></div><div className="book-text" style={{fontSize:font}}><p>{book.description||'Ce livre a été ajouté par l’administration StudyLink.'}</p><p>Utilisez le bouton “Ouvrir le fichier original” pour lire le document complet hébergé sur Supabase Storage.</p><p>Votre progression est enregistrée lorsque vous changez de page.</p></div><div className="page-pill">Page {page} sur {total} · {progress}%</div></Card>
    </>}
  </div></AppShell>}
