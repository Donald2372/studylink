export function localStudySeed() {
  const now = new Date();
  const at = (offset,h,m=0) => { const d=new Date(now); d.setDate(d.getDate()+offset); d.setHours(h,m,0,0); return d.toISOString(); };
  return {
    tasks:[
      {id:'lt1',title:'Terminer la leçon 4 de Python',category:'Python',priority:'high',estimated_minutes:45,completed_at:null},
      {id:'lt2',title:'Faire les exercices sur les boucles',category:'Python',priority:'high',estimated_minutes:60,completed_at:null},
      {id:'lt3',title:'Réviser 20 mots allemands',category:'Allemand B1',priority:'medium',estimated_minutes:25,completed_at:null},
      {id:'lt4',title:'Lire 10 pages de Machine Learning',category:'Machine Learning',priority:'medium',estimated_minutes:30,completed_at:null}
    ],
    events:[
      {id:'le1',title:'Python débutants',description:'Module 3 – Fonctions',category:'Python',color:'#7bcf93',start_at:at(0,9),end_at:at(0,10,30)},
      {id:'le2',title:'Projet StudyLink',description:'Développement du MVP',category:'Projet',color:'#78a7ff',start_at:at(0,13),end_at:at(0,15)},
      {id:'le3',title:'Mathématiques',description:'Algèbre linéaire',category:'Mathématiques',color:'#aa87e8',start_at:at(0,16),end_at:at(0,17,30)},
      {id:'le4',title:'Allemand B1',description:'Vocabulaire',category:'Allemand B1',color:'#72c98f',start_at:at(0,19),end_at:at(0,20)},
      {id:'le5',title:'Lecture',description:'Deep Work',category:'Lecture',color:'#f6bf59',start_at:at(1,11),end_at:at(1,12)},
      {id:'le6',title:'Machine Learning',description:'Régression linéaire',category:'Machine Learning',color:'#1768ff',start_at:at(2,14),end_at:at(2,15,30)}
    ],
    notes:[
      {id:'ln1',title:'Différence list / tuple',content:'En Python, une list est mutable tandis qu’un tuple est immuable. À revoir avec des exemples de performance.',category:'Python',tags:['python','structures'],favorite:true,updated_at:new Date().toISOString()},
      {id:'ln2',title:'Régression linéaire — résumé',content:'1. Définition\nLa régression linéaire modélise une relation entre une variable dépendante et des variables indépendantes.\n\n2. Modèle simple\ny = β₀ + β₁x + ε\n\n3. À revoir\nInterprétation des résidus et du coefficient R².',category:'Machine Learning',tags:['régression','statistiques'],favorite:true,updated_at:new Date().toISOString()},
      {id:'ln3',title:'Vocabulaire B1 semaine 3',content:'Bewerbung, Erfahrung, Fähigkeit, Vorstellungsgespräch, zuverlässig, selbstständig.',category:'Allemand B1',tags:['vocabulaire'],favorite:false,updated_at:new Date().toISOString()},
      {id:'ln4',title:'Idées de projets ML',content:'• Prédiction des prix immobiliers\n• Classification d’images\n• Détection d’anomalies',category:'Idées',tags:['machine learning','projets'],favorite:false,updated_at:new Date().toISOString()}
    ],
    goals:[
      {id:'lg1',title:'Apprendre Python',description:'Maîtriser les bases et construire des projets.',category:'Python',color:'#1768ff',progress_percent:42,priority:'high',effort_hours_per_week:4,milestones:[{id:'lm11',title:'Variables',completed_at:'yes'},{id:'lm12',title:'Conditions',completed_at:'yes'},{id:'lm13',title:'Fonctions',completed_at:'yes'},{id:'lm14',title:'Classes',completed_at:null},{id:'lm15',title:'Projet final',completed_at:null}]},
      {id:'lg2',title:'Allemand B1',description:'Atteindre le niveau B1 en 12 semaines.',category:'Allemand B1',color:'#2eaf5d',progress_percent:58,priority:'medium',effort_hours_per_week:3,milestones:[{id:'lm21',title:'Compréhension orale',completed_at:'yes'},{id:'lm22',title:'Vocabulaire',completed_at:'yes'},{id:'lm23',title:'Grammaire',completed_at:'yes'},{id:'lm24',title:'Expression orale',completed_at:null}]},
      {id:'lg3',title:'Préparation entretien',description:'Me préparer pour décrocher le poste.',category:'Carrière',color:'#7c4dff',progress_percent:35,priority:'high',effort_hours_per_week:2,milestones:[{id:'lm31',title:'CV',completed_at:'yes'},{id:'lm32',title:'Pitch',completed_at:'yes'},{id:'lm33',title:'Simulation RH',completed_at:null},{id:'lm34',title:'Questions fréquentes',completed_at:null},{id:'lm35',title:'Entretien blanc',completed_at:null}]},
      {id:'lg4',title:'Machine Learning',description:'Comprendre les algorithmes et expérimenter.',category:'Machine Learning',color:'#1768ff',progress_percent:24,priority:'medium',effort_hours_per_week:5,milestones:[{id:'lm41',title:'Régression',completed_at:'yes'},{id:'lm42',title:'Classification',completed_at:null},{id:'lm43',title:'Validation',completed_at:null},{id:'lm44',title:'Projet',completed_at:null}]}
    ],
    focus_sessions:[
      {id:'lf1',subject:'Python',category:'Python',elapsed_seconds:7200,focus_score:5,status:'completed',started_at:at(-1,9)},
      {id:'lf2',subject:'Allemand B1',category:'Allemand B1',elapsed_seconds:4200,focus_score:4,status:'completed',started_at:at(-2,18)},
      {id:'lf3',subject:'Mathématiques',category:'Mathématiques',elapsed_seconds:5400,focus_score:4,status:'completed',started_at:at(-3,10)},
      {id:'lf4',subject:'Machine Learning',category:'Machine Learning',elapsed_seconds:4800,focus_score:4,status:'completed',started_at:at(-4,15)}
    ],
    bookings:[], learning:[], materials:[]
  };
}
