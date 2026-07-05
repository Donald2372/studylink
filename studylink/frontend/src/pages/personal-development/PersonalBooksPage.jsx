import { useEffect, useMemo, useState } from 'react';
import { Link } from 'react-router-dom';
import { api } from '../../api.js';
import { AppShell, PageHeader, Card, Chip, Progress } from '../../components/AppShell.jsx';

export default function PersonalBooksPage(){
  const [books,setBooks]=useState([]); const [q,setQ]=useState(''); const [cat,setCat]=useState('Tous'); const [error,setError]=useState('');
  useEffect(()=>{api.getBooks({q}).then(d=>setBooks(d.books||[])).catch(e=>setError(e.message))},[q]);
  const categories=['Tous',...Array.from(new Set(books.map(b=>b.category_name).filter(Boolean)))];
  const list=useMemo(()=>books.filter(b=>cat==='Tous'||b.category_name===cat),[books,cat]);
  return <AppShell><div className="page"><PageHeader title="Livres de développement personnel" subtitle="Lisez et progressez à votre rythme."/>
    <div className="search-box">⌕<input value={q} onChange={e=>setQ(e.target.value)} placeholder="Rechercher un livre, un auteur, un sujet..."/></div>
    <div className="chip-row">{categories.map(x=><button key={x} onClick={()=>setCat(x)} className={`chip ${cat===x?'active':''}`}>{x}</button>)}</div>
    {error&&<div className="admin-error">{error}</div>}
    <h2>Tous les livres publiés</h2>
    <div className="stack">{list.length?list.map((b,i)=><Link key={b.id} to={`/personal-development/books/${b.id}`} className="book-row"><div className={`book-cover b${i%5}`} style={b.cover_url?{backgroundImage:`url(${b.cover_url})`,backgroundSize:'cover',backgroundPosition:'center'}:undefined}>{!b.cover_url&&b.title?.split(' ').slice(0,2).join('\n')}</div><div className="grow"><h3>{b.title}</h3><p>{b.author_name}</p><Chip>{b.category_name||b.file_type||'Livre'}</Chip><small>{b.page_count||0} pages · {b.file_type||'PDF'}</small></div><span>Lire ›</span></Link>):<Card><p style={{padding:18}}>Aucun livre publié.</p></Card>}</div>
  </div></AppShell>}
