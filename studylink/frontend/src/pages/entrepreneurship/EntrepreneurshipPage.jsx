import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { api } from '../../api.js';
import { AppShell, PageHeader, Card, Chip } from '../../components/AppShell.jsx';
const cats=['Idée & Validation','Business Plan','Finance','Marketing','Vente','E-commerce','Leadership','Business en ligne'];
export default function EntrepreneurshipPage(){
  const [tools,setTools]=useState([]); const [q,setQ]=useState('');
  useEffect(()=>{api.getEntrepreneurTools({q}).then(d=>setTools(d.tools||[])).catch(()=>{})},[q]);
  return <AppShell><div className="page"><PageHeader title="Entrepreneuriat" subtitle="Créez, lancez et développez votre projet"/>
    <div className="search-box">⌕<input value={q} onChange={e=>setQ(e.target.value)} placeholder="Rechercher un cours, une compétence, un sujet..."/></div>
    <div className="chip-row"><Chip>Catégories⌄</Chip><Chip>Niveau⌄</Chip><Chip>Type⌄</Chip><Chip>Format⌄</Chip></div>
    <div className="category-grid entrepreneur">{cats.map((c,i)=><div className={`category-card e${i}`} key={c}><span>{['💡','▤','◔','⌁','▣','🛒','♟','◎'][i]}</span><b>{c}</b><small>Explorer</small></div>)}</div>
    <div className="section-title"><h2>Parcours populaires</h2><Link to="/entrepreneurship/project">Mon projet</Link></div>
    <div className="course-card-grid"><Link to="/entrepreneurship/business-plan" className="path-card"><Chip tone="green">Intermédiaire</Chip><h3>Business plan complet</h3><p>Réalisez un business plan solide et convaincant.</p><small>Parcours dynamique</small></Link><Link to="/entrepreneurship/project" className="path-card"><Chip>Projet</Chip><h3>Mon projet entrepreneurial</h3><p>Suivez vos tâches, budget et documents.</p><small>Données personnelles</small></Link><Link to="/entrepreneurship/toolkit" className="path-card"><Chip>Outils</Chip><h3>Boîte à outils entrepreneur</h3><p>{tools.length} ressource(s) publiée(s)</p></Link></div>
    <div className="section-title"><h2>Ressources & Modèles</h2><Link to="/entrepreneurship/toolkit">Voir tout</Link></div><div className="resource-grid">{tools.slice(0,3).map(t=><a href={t.file_url||'#'} target="_blank" rel="noreferrer" key={t.id}>▤ {t.title}<br/><small>{t.file_type||t.category}</small></a>)}{!tools.length&&<span>Les ressources publiées apparaîtront ici.</span>}</div>
  </div></AppShell>}
