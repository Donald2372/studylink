export const GERMAN_COURSE_SLUG = 'allemand-complet-a1-c1';

const resource = (title, url, type = 'Link') => ({ id: `${title}-${url}`, title, resource_type: type, url });

const levelImages = {
  A1: 'https://images.unsplash.com/photo-1599946347371-68eb71b16afc?auto=format&fit=crop&w=1200&q=85',
  A2: 'https://images.unsplash.com/photo-1560969184-10fe8719e047?auto=format&fit=crop&w=1200&q=85',
  B1: 'https://images.unsplash.com/photo-1527866959252-deab85ef7d1b?auto=format&fit=crop&w=1200&q=85',
  B2: 'https://images.unsplash.com/photo-1467269204594-9661b134dd2b?auto=format&fit=crop&w=1200&q=85',
  C1: 'https://images.unsplash.com/photo-1567521464027-f127ff144326?auto=format&fit=crop&w=1200&q=85',
};

const levelThemes = {
  A1: { accent: '#111827', soft: '#f3f4f6', text: '#111827' },
  A2: { accent: '#d71920', soft: '#fff1f2', text: '#9f1239' },
  B1: { accent: '#f2c94c', soft: '#fffbeb', text: '#854d0e' },
  B2: { accent: '#0f766e', soft: '#ecfdf5', text: '#115e59' },
  C1: { accent: '#4f46e5', soft: '#eef2ff', text: '#3730a3' },
};

const videoLibrary = {
  A1: [
    { id: '4-eDoThe6qo', title: 'Deutsch A1: sich vorstellen', channel: 'Deutsch lernen', minutes: 12 },
    { id: '9l6m9Qh8Q1E', title: 'German pronunciation basics', channel: 'German learning', minutes: 10 },
    { id: 'MSEqchtpTIk', title: 'German cases introduction', channel: 'German grammar', minutes: 14 },
  ],
  A2: [
    { id: 'GfrZ8xkL9oE', title: 'Perfekt and everyday German', channel: 'Deutsch lernen', minutes: 13 },
    { id: '3y8gP6Y2xHk', title: 'Ordering and shopping in German', channel: 'German practice', minutes: 11 },
    { id: 'L-3bS2Qm2bI', title: 'German comparatives', channel: 'German grammar', minutes: 12 },
  ],
  B1: [
    { id: 'F6khA8eZaD4', title: 'Nebensaetze mit weil, dass, wenn', channel: 'Deutsch lernen', minutes: 15 },
    { id: 'B07mVhwkzGk', title: 'Meinung aeussern auf Deutsch', channel: 'German speaking', minutes: 12 },
    { id: 'P5dTDDV1K5Y', title: 'B1 speaking practice', channel: 'German exam practice', minutes: 16 },
  ],
  B2: [
    { id: 'jR3pNf7Kj2M', title: 'Argumentieren auf Deutsch B2', channel: 'Deutsch Training', minutes: 16 },
    { id: 'zH3sQ4NQhGc', title: 'Passiv und Nominalstil', channel: 'German grammar', minutes: 14 },
    { id: 'x1Y2N6dM8Rk', title: 'B2 Diskussion und Redemittel', channel: 'German speaking', minutes: 18 },
  ],
  C1: [
    { id: 'uJ4m6V9wA2s', title: 'C1 Praesentation und Diskussion', channel: 'Deutsch C1', minutes: 18 },
    { id: 'q4T8bN6xK1A', title: 'Wissenschaftlich schreiben auf Deutsch', channel: 'Academic German', minutes: 16 },
    { id: 'pN4zR9K8q7E', title: 'Nuancen und Stil auf C1', channel: 'Advanced German', minutes: 15 },
  ],
};

const levelData = [
  {
    cefr: 'A1',
    title: 'A1 - Grundlagen',
    focus: 'Begruessung, Aussprache, Alltag, einfache Fragen und Satzbau',
    minutes: 780,
    outcomes: [
      'Sich vorstellen und einfache persoenliche Fragen stellen',
      'Verben im Praesens, Artikel und einfache Satzstellung verwenden',
      'Kurze Dialoge ueber Alltag, Familie, Stadt und Zeit verstehen',
      'Einen stabilen Grundwortschatz fuer reale Alltagssituationen aufbauen',
    ],
    units: [
      {
        title: 'Sich vorstellen',
        grammar: 'sein, heissen, kommen aus, Personalpronomen, W-Fragen',
        vocabulary: ['Name', 'Land', 'Stadt', 'Beruf', 'Sprache', 'Adresse', 'Telefonnummer', 'Kurs'],
        scenario: 'Du triffst eine neue Person im Deutschkurs und stellst dich klar vor.',
        language: ['Ich heisse Lina.', 'Ich komme aus Kamerun.', 'Ich lerne Deutsch.', 'Wie heisst du?'],
      },
      {
        title: 'Alltag und Zeit',
        grammar: 'Praesens, trennbare Verben, Uhrzeit, Wortstellung im Hauptsatz',
        vocabulary: ['aufstehen', 'fruehstuecken', 'arbeiten', 'lernen', 'manchmal', 'immer', 'Uhr', 'Wochenende'],
        scenario: 'Du beschreibst deinen Tag und fragst eine andere Person nach ihrer Routine.',
        language: ['Ich stehe um sieben Uhr auf.', 'Am Abend lerne ich Deutsch.', 'Wann arbeitest du?'],
      },
      {
        title: 'In der Stadt',
        grammar: 'es gibt, lokale Praepositionen, Akkusativ nach Richtung',
        vocabulary: ['Bahnhof', 'Apotheke', 'Supermarkt', 'links', 'rechts', 'geradeaus', 'neben', 'gegenueber'],
        scenario: 'Du fragst nach dem Weg und beschreibst Orte in der Stadt.',
        language: ['Gibt es hier eine Apotheke?', 'Gehen Sie geradeaus.', 'Der Bahnhof ist neben dem Hotel.'],
      },
    ],
  },
  {
    cefr: 'A2',
    title: 'A2 - Alltag sicher meistern',
    focus: 'Vergangenheit, Einkaufen, Reisen, Vergleiche und einfache Erklaerungen',
    minutes: 900,
    outcomes: [
      'Vergangene Erlebnisse mit Perfekt und Praeteritum von sein/haben erzaehlen',
      'Im Restaurant, beim Einkaufen und auf Reisen sicher reagieren',
      'Personen, Produkte, Orte und Entscheidungen vergleichen',
      'Kurze Nachrichten, Einladungen und einfache Beschreibungen schreiben',
    ],
    units: [
      {
        title: 'Erlebnisse im Perfekt',
        grammar: 'Perfekt mit haben/sein, Partizip II, Zeitangaben',
        vocabulary: ['gestern', 'letzte Woche', 'besucht', 'gekauft', 'gefahren', 'gesehen', 'Reise', 'Ausflug'],
        scenario: 'Du erzaehlst einem Freund von einem Wochenendausflug.',
        language: ['Ich habe Berlin besucht.', 'Wir sind mit dem Zug gefahren.', 'Was hast du am Wochenende gemacht?'],
      },
      {
        title: 'Essen und Einkaufen',
        grammar: 'Akkusativ, moechte, kein/keine, Mengenangaben',
        vocabulary: ['Rechnung', 'Angebot', 'frisch', 'scharf', 'Flasche', 'Stueck', 'billig', 'teuer'],
        scenario: 'Du bestellst im Cafe, fragst nach Preisen und kaufst Lebensmittel.',
        language: ['Ich moechte ein Glas Wasser.', 'Was kostet diese Jacke?', 'Haben Sie vegetarische Gerichte?'],
      },
      {
        title: 'Vergleichen und Entscheiden',
        grammar: 'Komparativ, Superlativ, als, so ... wie, zu/genug',
        vocabulary: ['schneller', 'bequemer', 'am billigsten', 'ruhig', 'modern', 'sicher', 'praktisch', 'voll'],
        scenario: 'Du vergleichst Wohnungen, Telefone und Verkehrsmittel, bevor du entscheidest.',
        language: ['Diese Wohnung ist groesser als meine.', 'Der Zug ist am schnellsten.', 'Das Handy ist zu teuer.'],
      },
    ],
  },
  {
    cefr: 'B1',
    title: 'B1 - Selbststaendig kommunizieren',
    focus: 'Meinungen, Plaene, Begruendungen, Erfahrungen und Probleme loesen',
    minutes: 1080,
    outcomes: [
      'Meinungen mit Gruenden und Beispielen klar formulieren',
      'Nebensaetze, Modalverben und Zukunftsformen sicher verwenden',
      'Klare Gespraeche ueber Arbeit, Studium, Reisen und Gesellschaft verstehen',
      'Strukturierte E-Mails, Erfahrungsberichte und kurze Stellungnahmen schreiben',
    ],
    units: [
      {
        title: 'Arbeit und Studium',
        grammar: 'Perfekt vs. Praeteritum, seit/seitdem, dass-Saetze',
        vocabulary: ['Frist', 'Aufgabe', 'Kollege', 'Erfahrung', 'bewerben', 'verbessern', 'Faehigkeit', 'Rueckmeldung'],
        scenario: 'Du sprichst ueber Studium, Berufserfahrung und aktuelle Ziele.',
        language: ['Ich arbeite seit zwei Jahren hier.', 'Ich habe den Bericht noch nicht fertig geschrieben.', 'Ich denke, dass Feedback sehr wichtig ist.'],
      },
      {
        title: 'Plaene und Organisation',
        grammar: 'werden, vorhaben, Praesens fuer Zukunft, Nebensaetze mit wenn',
        vocabulary: ['Termin', 'verschieben', 'wahrscheinlich', 'bestimmt', 'vereinbaren', 'verfuegbar', 'Plan', 'Vorbereitung'],
        scenario: 'Du organisierst einen Termin und erklaerst deine naechsten Schritte.',
        language: ['Ich treffe den Tutor um sechs Uhr.', 'Wir werden die Grammatik wiederholen.', 'Wenn ich Zeit habe, rufe ich dich an.'],
      },
      {
        title: 'Rat geben und Probleme loesen',
        grammar: 'sollte, muesste, duerfte, erste Konditionalsaetze',
        vocabulary: ['empfehlen', 'vermeiden', 'gesund', 'stressig', 'Loesung', 'Entscheidung', 'Risiko', 'Vorteil'],
        scenario: 'Du gibst praktische Ratschlaege zu Lernen, Gesundheit und Arbeit.',
        language: ['Du solltest jeden Tag sprechen ueben.', 'Wenn du gut schlaefst, kannst du dich besser konzentrieren.', 'Du musst dein Passwort schuetzen.'],
      },
    ],
  },
  {
    cefr: 'B2',
    title: 'B2 - Fluessig und differenziert',
    focus: 'Argumentation, Register, Berufskommunikation, komplexe Texte und Diskussionen',
    minutes: 1260,
    outcomes: [
      'An Diskussionen mit klaren Argumenten und Gegenargumenten teilnehmen',
      'Passiv, Relativsaetze, Konnektoren und Nominalstil korrekt einsetzen',
      'Podcasts, Artikel und Vortraege zu vertrauten Themen verstehen',
      'Aufsaetze, Vorschlaege und professionelle E-Mails kohärent schreiben',
    ],
    units: [
      {
        title: 'Meinungen diskutieren',
        grammar: 'Konnektoren, Konzession, Gegensatz, Relativsaetze',
        vocabulary: ['allerdings', 'obwohl', 'Beleg', 'Behauptung', 'Auswirkung', 'Bedenken', 'Kompromiss', 'Perspektive'],
        scenario: 'Du diskutierst ueber Homeoffice, Technologie und Bildung.',
        language: ['Obwohl Online-Lernen flexibel ist, braucht man Disziplin.', 'Der wichtigste Nachteil ist die Isolation.', 'Aus meiner Sicht ueberwiegen die Vorteile.'],
      },
      {
        title: 'Berufliches Deutsch',
        grammar: 'Passiv, formelles Register, indirekte Fragen',
        vocabulary: ['Vorschlag', 'Beteiligte', 'Zeitplan', 'Ergebnis', 'Budget', 'genehmigt', 'umgesetzt', 'ueberprueft'],
        scenario: 'Du praesentierst den Stand eines Projekts in einer Besprechung.',
        language: ['Der Bericht wurde gestern ueberprueft.', 'Der neue Prozess wird naechsten Monat umgesetzt.', 'Koennten wir den Zeitplan klaeren?'],
      },
      {
        title: 'Hypothetische Situationen',
        grammar: 'Konjunktiv II, irreale Bedingungen, haette/waere/wuerde',
        vocabulary: ['Gelegenheit', 'Bedauern', 'Alternative', 'Ergebnis', 'Investition', 'Entscheidung', 'Strategie', 'Annahme'],
        scenario: 'Du analysierst Entscheidungen und stellst dir alternative Ergebnisse vor.',
        language: ['Wenn ich mehr Zeit haette, wuerde ich einen Fortgeschrittenenkurs machen.', 'Wenn sie frueher investiert haetten, waeren sie schneller gewachsen.', 'Was wuerden Sie an meiner Stelle tun?'],
      },
    ],
  },
  {
    cefr: 'C1',
    title: 'C1 - Praezision und Meisterschaft',
    focus: 'Nuance, akademischer Stil, idiomatische Sprache und ueberzeugendes Sprechen',
    minutes: 1380,
    outcomes: [
      'Komplexe Ideen praezise, fluessig und nuanciert ausdruecken',
      'Erweiterte Satzstrukturen, Modalpartikeln, Nominalstil und Stilmittel verwenden',
      'Dichte Vortraege, Interviews und Meinungsartikel verstehen',
      'Polierte Essays, Executive Summaries und Praesentationen produzieren',
    ],
    units: [
      {
        title: 'Nuance und Praezision',
        grammar: 'Einschraenkungen, Hervorhebung, Nominalstil, Modalpartikeln',
        vocabulary: ['wohl', 'durchaus', 'vielschichtig', 'dennoch', 'Tragweite', 'Annahme', 'belastbar', 'Nachteil'],
        scenario: 'Du praesentierst eine ausgewogene Analyse zu einem gesellschaftlichen Thema.',
        language: ['Besonders auffaellig ist der Mangel an langfristigen Daten.', 'Es handelt sich durchaus um eine praktikable Loesung.', 'Selten hatten Lernende so viele Moeglichkeiten.'],
      },
      {
        title: 'Akademisch und professionell schreiben',
        grammar: 'Nominalisierung, komplexe Nominalgruppen, Kohäsion',
        vocabulary: ['Rahmen', 'Methodik', 'Ergebnisse', 'Implikationen', 'folglich', 'wohingegen', 'angesichts', 'ungeachtet'],
        scenario: 'Du fasst Forschungsergebnisse fuer ein professionelles Publikum zusammen.',
        language: ['Die Umsetzung des Rahmens verringerte die Unsicherheit.', 'Angesichts dieser Ergebnisse wurde die Methodik angepasst.', 'Der Vorschlag ist tragfaehig, ungeachtet einiger Einschraenkungen.'],
      },
      {
        title: 'Ueberzeugend praesentieren',
        grammar: 'rhetorische Fragen, Signposting, fortgeschrittene Redemittel',
        vocabulary: ['ueberzeugen', 'anklingen', 'Publikum', 'Glaubwuerdigkeit', 'evidenzbasiert', 'Handlungsaufruf', 'praegnant', 'einpraegsam'],
        scenario: 'Du haeltst einen fuenfminuetigen ueberzeugenden Vortrag und beantwortest Rueckfragen.',
        language: ['Lassen Sie mich mit der zentralen Frage beginnen.', 'Die Belege weisen in eine klare Richtung.', 'Was sollten wir als Naechstes tun?'],
      },
    ],
  },
];

const lessonKinds = [
  { suffix: 'verstehen', type: 'text', title: 'Comprendre la situation', minutes: 35, goal: 'Comprendre le contexte, les roles, les informations importantes et les phrases allemandes de base.' },
  { suffix: 'wortschatz', type: 'text', title: 'Vocabulaire actif', minutes: 35, goal: 'Construire le vocabulaire actif du module et l utiliser dans des phrases personnelles.' },
  { suffix: 'dialog', type: 'audio', title: 'Dialogue et prononciation', minutes: 35, goal: 'Ecouter, repeter, imiter le rythme allemand et jouer un dialogue naturel.' },
  { suffix: 'grammatik', type: 'text', title: 'Grammaire en profondeur', minutes: 45, goal: 'Comprendre le point de grammaire, son utilite et ses erreurs frequentes.' },
  { suffix: 'produktion', type: 'exercise', title: 'Comprehension et production', minutes: 55, goal: 'Transformer les modeles en productions ecrites et orales personnelles.' },
  { suffix: 'intensiv', type: 'exercise', title: 'Atelier intensif', minutes: 70, goal: 'S entrainer avec beaucoup d exercices progressifs du controle vers la production libre.' },
  { suffix: 'quiz', type: 'quiz', title: 'Quiz de validation', minutes: 35, goal: 'Verifier la comprehension, corriger les erreurs et consolider la grammaire.' },
  { suffix: 'mission', type: 'exercise', title: 'Mission reelle', minutes: 90, goal: 'Realiser une tache complete proche de la vie quotidienne, professionnelle ou academique.' },
];

const functionalGermanModules = [
  ['A1', 'Premiers contacts', 'saluer, se presenter et epeler', 'sein, heissen, kommen; pronoms personnels'],
  ['A1', 'Nombres, heure et dates', 'compter, dire l heure et fixer une date', 'nombres; am, um; ordre des mots'],
  ['A1', 'Famille et personnes', 'presenter sa famille et decrire une personne', 'haben; possessifs mein/dein; articles'],
  ['A1', 'Maison et logement', 'decrire son logement et localiser des objets', 'articles; es gibt; prepositions locales'],
  ['A1', 'Manger et boire', 'commander et parler de ses gouts', 'moechten; accusatif; gern/nicht gern'],
  ['A1', 'Routine quotidienne', 'raconter une journee simple', 'verbes separables; present; adverbes de temps'],
  ['A1', 'Ville et orientation', 'demander son chemin et se deplacer', 'imperatif poli; mit + datif; direction'],
  ['A1', 'Achats et vetements', 'acheter, comparer et demander un prix', 'accusatif; adjectifs de base; dieser/diese'],
  ['A1', 'Sante et corps', 'expliquer un probleme simple', 'haben + nom; muessen; parties du corps'],
  ['A1', 'Loisirs et invitations', 'parler de loisirs et inviter quelqu un', 'koennen; verbes de loisir; questions'],
  ['A1', 'Travail et etudes', 'parler de son activite et de son emploi du temps', 'als; horaires; negation nicht/kein'],
  ['A1', 'Revision A1 et projet', 'mobiliser toutes les bases dans une situation reelle', 'revision globale A1'],
  ['A2', 'Passe et experiences', 'raconter ce que l on a fait', 'Perfekt avec haben/sein'],
  ['A2', 'Voyages et reservations', 'organiser un voyage et resoudre un probleme', 'modalites; datif; questions polies'],
  ['A2', 'Travail et candidature simple', 'parler de competences et de taches', 'koennen; infinitif avec zu introduction'],
  ['A2', 'Ecole et apprentissage', 'expliquer comment on apprend', 'comparatif; weil'],
  ['A2', 'Medias et technologie', 'utiliser et expliquer des outils quotidiens', 'imperatif; datif/accusatif'],
  ['A2', 'Relations et emotions', 'exprimer sentiments et opinions simples', 'weil/dass; adjectifs emotionnels'],
  ['A2', 'Services et administration', 'faire une demande et remplir une demarche', 'questions indirectes simples'],
  ['A2', 'Environnement et meteo', 'parler du climat et des habitudes', 'comparatif; futur proche contextuel'],
  ['A2', 'Fetes et traditions', 'raconter une tradition et inviter', 'man; verbes reflechis introduction'],
  ['A2', 'Logement et voisinage', 'gerer un probleme de logement', 'seit + datif; subordonnees'],
  ['A2', 'Opinions et decisions', 'justifier un choix', 'wenn; weil; dass'],
  ['A2', 'Revision A2 et projet', 'gerer une journee complete en allemand', 'revision globale A2'],
  ['B1', 'Recits detailles', 'raconter clairement un evenement', 'Praeteritum frequent; als; obwohl'],
  ['B1', 'Argumentation du quotidien', 'developper une opinion avec arguments', 'connecteurs; dass/obwohl'],
  ['B1', 'Travail et entretien', 'repondre a un entretien professionnel', 'Konjunktiv II poli; infinitif zu'],
  ['B1', 'Etudes et presentations', 'faire une presentation structuree', 'structure du discours; passif introduction'],
  ['B1', 'Sante et mode de vie', 'discuter habitudes et recommandations', 'sollte; wuerde; sich vornehmen'],
  ['B1', 'Actualite et medias', 'resumer une information et distinguer les sources', 'discours indirect introductif; passif'],
  ['B1', 'Environnement et societe', 'discuter d un probleme social', 'ob; darin dass; Konjunktiv II'],
  ['B1', 'Relations et conflits', 'exprimer un desaccord avec diplomatie', 'conditionnel poli; subordonnees'],
  ['B1', 'Mobilite et logement', 'comparer des choix de vie', 'je ... desto; comparatifs avances'],
  ['B1', 'Administration et reclamations', 'ecrire une demande ou reclamation formelle', 'registre formel; passif'],
  ['B1', 'Culture et interculturalite', 'comparer des habitudes sans generaliser', 'nominalisation introduction'],
  ['B1', 'Revision B1 et examen', 'reussir les taches classiques B1', 'revision globale B1'],
  ['B2', 'Argumentation nuancee', 'defendre une position avec nuances', 'connecteurs complexes; concessions'],
  ['B2', 'Langue professionnelle', 'participer a des reunions et negocier', 'registre professionnel; propositions'],
  ['B2', 'Rapports et syntheses', 'resumer plusieurs informations', 'passif; nominalisations'],
  ['B2', 'Science et technologie', 'expliquer un concept complexe clairement', 'relations logiques; participe'],
  ['B2', 'Economie et travail', 'analyser tendances et consequences', 'causalite formelle; Konjunktiv II'],
  ['B2', 'Politique et societe', 'discuter des enjeux sociaux avec neutralite', 'discours rapporte; neutralite'],
  ['B2', 'Psychologie et communication', 'analyser comportements et malentendus', 'nicht nur ... sondern auch; dadurch dass'],
  ['B2', 'Culture, litterature et film', 'analyser une oeuvre et son effet', 'langage analytique; adjectifs participiaux'],
  ['B2', 'Debats et prise de parole', 'reagir spontanement et structurer', 'cohesion orale; reformulation'],
  ['B2', 'Ecrits formels avances', 'rediger rapports, avis et courriels complexes', 'style nominal; passif'],
  ['B2', 'Comprehension authentique', 'travailler avec un allemand rapide et implicite', 'inference; reformulation'],
  ['B2', 'Revision B2 et examen', 'maitriser les formats B2', 'revision globale B2'],
  ['C1', 'Precision et registre', 'choisir le mot et le registre exacts', 'registre; collocations; nuances'],
  ['C1', 'Structures complexes', 'maitriser la syntaxe dense sans perdre la clarte', 'subordonnees complexes; position du verbe'],
  ['C1', 'Argumentation academique', 'developper une these solide', 'style academique; concession'],
  ['C1', 'Synthese de sources', 'combiner plusieurs documents sans les copier', 'paraphrase; references'],
  ['C1', 'Presentations expertes', 'parler longtemps avec structure et impact', 'marqueurs de discours avances'],
  ['C1', 'Negociation et leadership', 'gerer desaccords, risques et decisions', 'langue de negociation'],
  ['C1', 'Medias et rhetorique', 'analyser cadrage, intention et persuasion', 'analyse rhetorique; modalite'],
  ['C1', 'Science et recherche', 'presenter methode, resultats et limites', 'langue scientifique'],
  ['C1', 'Droit, administration et institutions', 'comprendre et reformuler des textes institutionnels', 'style administratif; participes'],
  ['C1', 'Litterature et essai', 'interpreter et ecrire avec style', 'analyse litteraire; essai'],
  ['C1', 'Spontaneite et idiomatique', 'parler naturellement sans perdre la precision', 'idiomes; particules modales'],
  ['C1', 'Revision C1 et certification', 'reussir une production complexe et autonome', 'revision globale C1'],
];

const levelMeta = {
  A1: { title: 'A1 - Bases fonctionnelles', focus: 'survie quotidienne, phrases simples, prononciation, premiers automatismes' },
  A2: { title: 'A2 - Autonomie du quotidien', focus: 'passe, services, voyages, opinions simples et interactions pratiques' },
  B1: { title: 'B1 - Communication autonome', focus: 'recits, argumentation simple, travail, conflits et examen B1' },
  B2: { title: 'B2 - Expression nuancee', focus: 'debats, textes authentiques, synthese, allemand professionnel et formel' },
  C1: { title: 'C1 - Maitrise avancee', focus: 'registre, precision, argumentation academique, leadership et certification' },
};

const germanSamples = {
  A1: ['Guten Tag, ich moechte mich vorstellen.', 'Ich brauche diese Information im Alltag.', 'Koennen Sie das bitte wiederholen?', 'Das ist fuer mich wichtig.'],
  A2: ['Ich habe diese Situation schon erlebt.', 'Ich moechte eine passende Loesung finden.', 'Koennten Sie mir bitte helfen?', 'Deshalb entscheide ich mich fuer diese Option.'],
  B1: ['Meiner Meinung nach gibt es zwei wichtige Gruende.', 'Ein konkretes Beispiel dafuer ist mein Alltag.', 'Obwohl das Problem schwierig ist, gibt es eine Loesung.', 'Wie sehen Sie diese Situation?'],
  B2: ['Aus meiner Sicht sollte man die Vorteile und Nachteile getrennt betrachten.', 'Ein zentrales Argument dafuer ist die langfristige Wirkung.', 'Gleichzeitig darf man die Risiken nicht unterschaetzen.', 'Daraus ergibt sich eine differenzierte Schlussfolgerung.'],
  C1: ['Entscheidend ist nicht nur der Inhalt, sondern auch das passende Register.', 'Diese Position laesst sich durch mehrere Beobachtungen stuetzen.', 'Gleichwohl bleibt die Frage nach den praktischen Folgen offen.', 'Abschliessend laesst sich die These praezisieren.'],
};

function wordsFromModule(title, goal, grammar) {
  return [...new Set(`${title} ${goal} ${grammar}`
    .split(/[^A-Za-zÀ-ÿ]+/)
    .filter((word) => word.length > 3)
    .slice(0, 8))];
}

const fullGermanLevelData = Object.entries(levelMeta).map(([cefr, meta]) => {
  const units = functionalGermanModules
    .filter(([level]) => level === cefr)
    .map(([, title, goal, grammar], index) => ({
      title,
      moduleTitle: `${cefr} - Module ${index + 1} - ${title}`,
      grammar,
      vocabulary: wordsFromModule(title, goal, grammar),
      scenario: `Vous devez ${goal} dans une situation reelle de niveau ${cefr}.`,
      language: germanSamples[cefr],
      moduleGoal: goal,
    }));
  return {
    cefr,
    title: meta.title,
    focus: meta.focus,
    minutes: units.length * 600,
    outcomes: units.slice(0, 4).map((unit) => `Savoir ${unit.moduleGoal} avec la grammaire: ${unit.grammar}`),
    units,
  };
});

const buildExercises = (level, unit) => {
  const words = unit.vocabulary;
  const question = unit.language.find((line) => line.includes('?')) || 'Koennen Sie das bitte wiederholen?';
  return [
    { id: 'fill', type: 'fill', title: '1. Schluesselsaetze ergaenzen', instruction: `Einfach. Ergaenzen Sie mit Wortschatz aus der Einheit: ${words.slice(0, 8).join(', ')}.`, items: [
      { prompt: unit.language[0].replace(words[0] || 'Deutsch', '_____'), answer: words[0] || 'Deutsch' },
      { prompt: `In dieser Situation brauche ich eine klare _____.`, answer: 'Antwort' },
      { prompt: `Ich spreche mit ${unit.scenario.includes('Besprechung') ? 'Kollegen' : 'einer Person'} und stelle eine _____.`, answer: 'Frage' },
      { prompt: 'Eine starke Antwort enthaelt einen Grund und ein _____.', answer: 'Beispiel' },
      { prompt: `Das Thema der Einheit ist _____.`, answer: unit.title },
    ] },
    { id: 'choice', type: 'choice', title: '2. Natuerliche Formulierung waehlen', instruction: 'Einfach. Waehlen Sie die passendste und natuerlichste Formulierung.', items: [
      { prompt: 'Welche Formulierung passt?', options: [unit.language[0], 'Ich gut Deutsch mache.', 'Deutsch ich sprechen klar.'], answer: unit.language[0] },
      { prompt: 'Welche Strategie ist sinnvoll?', options: ['Satzmuster hoeren, variieren und persoenlich anwenden', 'Jedes Wort einzeln uebersetzen', 'Schnell sprechen ohne Struktur'], answer: 'Satzmuster hoeren, variieren und persoenlich anwenden' },
      { prompt: 'Welche Frage fuehrt das Gespraech weiter?', options: [question, 'Ja gut.', 'Ich Kurs gehen.'], answer: question },
      { prompt: 'Was macht eine Antwort stark?', options: ['Struktur, Beispiel und Rueckfrage', 'Nur ein isoliertes Wort', 'Viele komplizierte Woerter ohne Sinn'], answer: 'Struktur, Beispiel und Rueckfrage' },
    ] },
    { id: 'vocabulary-use', type: 'vocabulary-use', title: '3. Wortschatz im Kontext anwenden', instruction: 'Mittel. Schreiben Sie mit jedem Wort einen konkreten deutschen Satz.', items: words.slice(0, 8).map((word) => ({ prompt: `Verwenden Sie "${word}" in einem sinnvollen Satz.`, model: `Ich kann "${word}" in der Situation "${unit.scenario}" verwenden.` })) },
    { id: 'grammar-drill', type: 'grammar-drill', title: '4. Grammatik automatisieren', instruction: `Mittel. Bilden Sie Saetze mit: ${unit.grammar}.`, items: [
      { prompt: 'Schreiben Sie einen Aussagesatz.', model: unit.language[0] },
      { prompt: 'Schreiben Sie eine Verneinung.', model: 'Das ist keine einfache Entscheidung.' },
      { prompt: 'Schreiben Sie eine direkte Frage.', model: question },
      { prompt: 'Schreiben Sie einen Satz mit Begruendung.', model: `${unit.language[1] || unit.language[0]}, weil es mir im Alltag hilft.` },
      { prompt: 'Schreiben Sie einen Satz mit Zeit-, Orts- oder Kontextangabe.', model: 'In dieser Situation brauche ich eine klare Struktur.' },
    ] },
    { id: 'transform', type: 'transform', title: '5. Satzmuster transformieren', instruction: 'Mittel. Veraendern Sie die Modelle fuer Ihr eigenes Leben.', items: unit.language.map((line) => ({ prompt: `Modell: ${line}`, model: `${line} Ich passe den Satz an meine eigene Situation an.` })) },
    { id: 'correction', type: 'correction', title: '6. Typische Fehler korrigieren', instruction: 'Mittel. Korrigieren Sie Wortstellung, Verbform, Artikel und Kasus.', items: [
      { prompt: 'Ich bin lernen Deutsch.', model: 'Ich lerne Deutsch.' },
      { prompt: 'Gestern ich habe Berlin besucht.', model: 'Gestern habe ich Berlin besucht.' },
      { prompt: 'Ich moechte ein Kaffee.', model: 'Ich moechte einen Kaffee.' },
      { prompt: 'Der Zug ist schneller wie der Bus.', model: 'Der Zug ist schneller als der Bus.' },
      { prompt: 'Ich denke, das ist wichtig weil wir Zeit sparen.', model: 'Ich denke, dass das wichtig ist, weil wir Zeit sparen.' },
    ] },
    { id: 'translation', type: 'translation', title: '7. Idee natuerlich auf Deutsch ausdruecken', instruction: 'Mittel. Schreiben Sie natuerliches Deutsch, nicht Wort-fuer-Wort-Uebersetzung.', items: [
      { prompt: 'I need a clear answer in this situation.', model: 'Ich brauche in dieser Situation eine klare Antwort.' },
      { prompt: 'Could you give me an example?', model: 'Koennten Sie mir ein Beispiel geben?' },
      { prompt: 'In my opinion, this option is more useful.', model: 'Meiner Meinung nach ist diese Option nuetzlicher.' },
      { prompt: 'I would like to explain my idea with a reason.', model: 'Ich moechte meine Idee mit einem Grund erklaeren.' },
      { prompt: 'The important point is to answer naturally.', model: 'Wichtig ist, natuerlich zu antworten.' },
    ] },
    { id: 'scenario', type: 'scenario', title: '8. Auf echte Situationen reagieren', instruction: 'Mittel bis schwer. Schreiben Sie, was Sie wirklich sagen wuerden.', items: [
      { prompt: `Situation: ${unit.scenario}`, model: `${unit.language[0]} Danach fuege ich einen Grund hinzu und stelle eine Rueckfrage.` },
      { prompt: 'Die andere Person versteht Sie nicht sofort. Was sagen Sie?', model: 'Ich formuliere es anders: ... Koennen Sie mir folgen?' },
      { prompt: 'Sie brauchen mehr Informationen. Welche Frage stellen Sie?', model: question },
    ] },
    { id: 'dialogue-build', type: 'dialogue-build', title: '9. Vollstaendigen Dialog bauen', instruction: 'Schwer. Schreiben Sie einen natuerlichen Dialog mit Rollen.', items: [
      { prompt: 'Person A beginnt.', model: `A: ${unit.language[0]}` },
      { prompt: 'Person B antwortet mit Detail.', model: `B: ${unit.language[1] || unit.language[0]}` },
      { prompt: 'Person A begruendet.', model: `A: Das ist wichtig, weil ich ${words[0]} brauche.` },
      { prompt: 'Person B stellt eine Rueckfrage.', model: `B: ${question}` },
    ] },
    { id: 'listening-note', type: 'listening-note', title: '10. Hoeren und Notizen vorbereiten', instruction: 'Schwer. Bereiten Sie das Hoeren aktiv vor.', items: [
      { prompt: 'Notieren Sie drei Woerter, die Sie im Video hoeren wollen.', model: words.slice(0, 3).join(', ') },
      { prompt: 'Notieren Sie eine moegliche Frage.', model: question },
      { prompt: 'Notieren Sie einen Satz, den Sie nachsprechen.', model: unit.language[0] },
      { prompt: 'Fassen Sie die Audio-Idee in einem Satz zusammen.', model: `Die Sprecher sprechen ueber ${unit.title}.` },
    ] },
    { id: 'reflection', type: 'reflection', title: '11. Sprachreflexion', instruction: 'Schwer. Erklaeren Sie, warum die Struktur funktioniert.', items: [
      { prompt: `Warum ist "${unit.grammar}" hier nuetzlich?`, model: 'Es gibt mir eine klare Struktur fuer eine reale Antwort.' },
      { prompt: 'Welchen Fehler machen Sie leicht?', model: 'Ich vergesse vielleicht die Verbposition, deshalb pruefe ich den Satz.' },
      { prompt: 'Welchen Satz merken Sie sich als ganzen Baustein?', model: unit.language[0] },
      { prompt: `Wie wird die Antwort auf Niveau ${level.cefr} anspruchsvoller?`, model: 'Sie wird laenger, genauer, besser strukturiert und begruendet.' },
    ] },
    { id: 'roleplay', type: 'roleplay', title: '12. Muendliches Rollenspiel', instruction: 'Schwer. Schreiben Sie ein Skript und sprechen Sie es danach laut.', minLength: level.cefr === 'A1' ? 70 : 110, checklist: [`Situation: ${unit.scenario}`, `Grammatik: ${unit.grammar}`, 'Mindestens eine Rueckfrage', 'Klares Ende'], model: `A: ${unit.language[0]}\nB: ${unit.language[1] || unit.language[0]}\nA: ${unit.language[2] || question}\nB: ${question}` },
    { id: 'production', type: 'production', title: '13. Gefuehrte Produktion', instruction: 'Schwer. Schreiben Sie einen strukturierten Mini-Dialog.', minLength: level.cefr === 'A1' ? 90 : 140, checklist: [`Verwenden: ${unit.grammar}`, `Mindestens 6 Woerter: ${words.slice(0, 6).join(', ')}`, 'Ein Grund', 'Eine Rueckfrage'], model: `A: ${unit.language[0]}\nB: ${unit.language[1] || unit.language[0]}\nA: Das ist wichtig, weil ich sicher kommunizieren moechte.\nB: ${question}` },
    { id: 'challenge', type: 'challenge', title: '14. Meisterungsaufgabe', instruction: 'Sehr schwer. Produzieren Sie frei, ohne Modell abzuschreiben.', minLength: level.cefr === 'A1' ? 100 : level.cefr === 'A2' ? 140 : 220, checklist: ['Klare Einleitung', 'Zielgrammatik', 'Variierter Wortschatz', 'Konkretes Beispiel', 'Selbstkorrektur'], model: `Ich spreche ueber ${unit.title}. Zuerst beschreibe ich die Situation. Dann verwende ich die Grammatik: ${unit.grammar}. Zum Schluss gebe ich ein Beispiel und stelle eine Rueckfrage.` },
    { id: 'mastery', type: 'mastery', title: '15. Persoenlicher Mastery-Check', instruction: 'Letzte Etappe. Antworten Sie genau: Was beherrschen Sie, was muessen Sie wiederholen?', items: [
      { prompt: 'Ich kann diese Lektion jetzt verwenden, um...', model: `Ich kann ${unit.title} in einer echten Situation anwenden.` },
      { prompt: 'Mein staerkster deutscher Satz ist...', model: unit.language[0] },
      { prompt: 'Mein aktueller Schwachpunkt ist...', model: `Ich muss ${unit.grammar} weiter ueben.` },
      { prompt: 'Mein naechstes Sprechtraining ist...', model: `Ich nehme mich eine Minute lang zum Thema ${unit.title} auf.` },
    ] },
  ];
};

function buildContent(level, unit, kind) {
  return `${unit.title}

Niveau: ${level.cefr}
Lernziel: ${kind.goal}
Reale Situation: ${unit.scenario}

Ausfuehrliche Erklaerung:
Diese Lektion trainiert Deutsch als Werkzeug fuer echte Kommunikation. Zuerst klaeren Sie, wer spricht, welches Ziel das Gespraech hat, welches Register passt und welche Information ausgetauscht werden muss. Danach verbinden Sie die Grammatik mit einer kommunikativen Absicht: vorstellen, berichten, vergleichen, begruenden, argumentieren oder ueberzeugen.

Grammatikschwerpunkt:
${unit.grammar}

Nuetzliche Sprache:
- ${unit.language.join('\n- ')}

Wortschatzbank:
${unit.vocabulary.map((word) => `- ${word}`).join('\n')}

Anwendung:
Schreiben Sie eigene Saetze, sprechen Sie sie laut, korrigieren Sie Verbposition, Artikel und Kasus, und produzieren Sie am Ende eine freie Antwort mit Beispiel und Rueckfrage.`;
}

function buildDetailedSections(level, unit) {
  return [
    { title: '1. Reale Kommunikationssituation verstehen', body: `Kontext: ${unit.scenario} Sie erkennen zuerst Rolle, Ziel, Ton und benoetigte Information. So wird Grammatik sofort praktisch.` },
    { title: '2. Sprachmuster beobachten', body: `Die Modellsaetze zeigen natuerliche deutsche Strukturen. "${unit.language[0]}" ist ein Satzrahmen, den Sie variieren und persoenlich anwenden.` },
    { title: '3. Form und Funktion beherrschen', body: `Der Kernpunkt ist: ${unit.grammar}. Wichtig sind Verbposition, Artikel, Kasus, Satzklammer und passende Redemittel.` },
    { title: '4. Frei produzieren', body: `Auf Niveau ${level.cefr} muessen Sie nicht nur erkennen, sondern selbst produzieren: korrekt, persoenlich, verstaendlich und mit Rueckfrage.` },
  ];
}

function buildQuiz(level, unit) {
  return [
    { question: `Welcher Satz passt am besten zu "${unit.title}"?`, options: unit.language, answer: unit.language[0], explanation: `Der Satz nutzt die Zielsprache fuer ${level.cefr}: ${unit.grammar}.` },
    { question: 'Was sollte man mit einem neuen Satzmuster tun?', options: ['Ohne Kontext auswendig lernen', 'Persoenlich variieren und laut sprechen', 'Nie laut aussprechen'], answer: 'Persoenlich variieren und laut sprechen', explanation: 'Persoenliche Beispiele machen Sprache aktiv.' },
    { question: 'Welcher Grammatikpunkt wird trainiert?', options: [unit.grammar, 'nur Passiv', 'nur indirekte Rede'], answer: unit.grammar, explanation: `Diese Einheit baut auf ${unit.grammar}.` },
  ];
}

function buildVideoRecommendations(level, unit) {
  return (videoLibrary[level.cefr] || []).map((video, index) => ({
    id: `de-yt-${level.cefr}-${unit.title}-${index}`,
    title: `${unit.title}: ${video.title}`,
    channel: video.channel,
    youtube_video_id: video.id,
    youtube_url: `https://www.youtube.com/watch?v=${video.id}`,
    thumbnail_url: `https://img.youtube.com/vi/${video.id}/hqdefault.jpg`,
    minutes: video.minutes,
    description: `Integrierte Videopraxis fuer ${unit.title}, Niveau ${level.cefr}.`,
  }));
}

function makeLessons(level, unit, levelIndex, unitIndex) {
  return lessonKinds.map((kind, kindIndex) => {
    const id = `de-${level.cefr.toLowerCase()}-u${unitIndex + 1}-${kind.suffix}`;
    return {
      id,
      title: `${level.cefr} ${unit.title}: ${kind.title}`,
      lesson_type: kind.type,
      duration_seconds: kind.minutes * 60,
      content: buildContent(level, unit, kind),
      ui_locale: 'de',
      image_url: levelImages[level.cefr],
      theme: levelThemes[level.cefr],
      lesson_objectives: [
        `Die Situation sicher verstehen: ${unit.scenario}`,
        `Die Zielgrammatik korrekt anwenden: ${unit.grammar}`,
        `Mindestens sechs Woerter aktiv verwenden: ${unit.vocabulary.slice(0, 6).join(', ')}`,
        kind.type === 'audio' ? 'Rhythmus, Aussprache und Satzmelodie nachsprechen' : 'Eine eigene muendliche oder schriftliche Antwort produzieren',
      ],
      learning_objects: [
        { label: 'Situation', value: unit.scenario },
        { label: 'Grammatikobjekt', value: unit.grammar },
        { label: 'Wortschatzobjekt', value: unit.vocabulary.slice(0, 6).join(', ') },
        { label: 'Sprechobjekt', value: 'hoeren, nachsprechen, variieren, frei antworten' },
        { label: 'GER-Niveau', value: level.cefr },
      ],
      detailed_sections: buildDetailedSections(level, unit),
      examples: [
        { title: 'Modellsatz', text: unit.language[0] },
        { title: 'Nuetzliche Frage', text: unit.language.find((line) => line.includes('?')) || 'Koennen Sie das bitte erklaeren?' },
        { title: 'Persoenliche Variante', text: `${unit.language[1] || unit.language[0]} Das ist fuer mich wichtig, weil ich besser kommunizieren moechte.` },
        { title: 'Mini-Dialog', text: `A: ${unit.language[0]}\nB: ${unit.language[1] || unit.language[0]}\nA: ${unit.language[2] || 'Ich brauche ein Beispiel.'}` },
      ],
      use_cases: [
        { title: 'Alltag', text: 'Die Struktur in einem kurzen Gespraech verwenden.' },
        { title: 'Schreiben', text: 'Eine Nachricht oder kurze Stellungnahme formulieren.' },
        { title: 'Sprechen', text: 'Eine Antwort laut ueben und mit einer Rueckfrage beenden.' },
      ],
      grammar_cards: [
        { title: 'Zielform', formula: unit.grammar, example: unit.language[0], note: `Auf Niveau ${level.cefr} muessen Form und Funktion zusammen funktionieren.` },
        { title: 'Frageform', formula: 'Fragewort / Verb + Subjekt + Ergaenzung?', example: unit.language.find((line) => line.includes('?')) || 'Was bedeutet das genau?', note: 'Die Rueckfrage haelt das Gespraech offen.' },
        { title: 'Erweiterung', formula: 'Antwort + Grund + Beispiel', example: `${unit.language[1] || unit.language[0]} Zum Beispiel ...`, note: 'So wird aus Grammatik echte Kommunikation.' },
      ],
      vocabulary_focus: unit.vocabulary.map((word, index) => ({ word, meaning: `Nuetzliches Wort fuer: ${unit.scenario}`, example: `${unit.language[index % unit.language.length]} (${word})`, collocation: index % 2 ? `${word} verwenden` : `${word} im Kontext` })),
      dialogues: [
        { title: 'Modelldialog', lines: [`A: ${unit.language[0]}`, `B: ${unit.language[1] || unit.language[0]}`, `A: ${unit.language[2] || 'Ich gebe ein Beispiel.'}`, `B: ${unit.language.find((line) => line.includes('?')) || 'Koennen Sie das wiederholen?'}`] },
        { title: 'Dialog zum Transformieren', lines: [`A: Ich uebe ${unit.title}.`, `B: Verwenden Sie diese Struktur: ${unit.grammar}.`, `A: ${unit.language[0]} Dann fuege ich ein persoenliches Detail hinzu.`, 'B: Gut. Beenden Sie mit einer Rueckfrage.'] },
      ],
      common_mistakes: [
        'Verbposition im Hauptsatz oder Nebensatz vergessen.',
        `Artikel, Kasus oder Endung im Zusammenhang mit ${unit.grammar} nicht pruefen.`,
        'Zu direkt aus einer anderen Sprache uebersetzen, statt ein deutsches Satzmuster zu verwenden.',
      ],
      corrected_exercise: {
        prompt: `Produzieren Sie sechs persoenliche Saetze fuer diese Situation: ${unit.scenario}`,
        answer: `${unit.language[0]} ${unit.language[1] || ''}`,
        correction: `Die Antwort ist stark, wenn sie ${unit.grammar}, mindestens vier Woerter aus der Einheit und eine Rueckfrage enthaelt.`,
      },
      oral_practice: {
        prompt: `Sprechen Sie 60 bis 90 Sekunden auf Deutsch. Situation: ${unit.scenario}`,
        checklist: [`Verwenden Sie: ${unit.grammar}`, `Verwenden Sie Wortschatz: ${unit.vocabulary.slice(0, 5).join(', ')}`, 'Sprechen Sie klar und enden Sie mit einer Rueckfrage'],
        modelAnswer: `${unit.language[0]} ${unit.language[1] || ''} Ich erklaere die Situation klar, gebe ein Beispiel und stelle am Ende eine Rueckfrage.`,
      },
      resources: [
        resource('DW Deutsch lernen', 'https://learngerman.dw.com/de/learn-german/s-9528', 'Deutsch'),
        resource('Goethe-Institut Deutsch ueben', 'https://www.goethe.de/de/spr/ueb.html', 'Uebung'),
        resource('Duden Woerterbuch', 'https://www.duden.de/', 'Woerterbuch'),
      ],
      youtube_videos: buildVideoRecommendations(level, unit),
      interactive_exercises: buildExercises(level, unit),
      vocabulary: unit.vocabulary,
      grammar_focus: unit.grammar,
      audio_script: `${unit.language.join(' ')} ${unit.scenario} Bitte wiederholen Sie jeden Satz und bilden Sie danach ein eigenes Beispiel.`,
      quiz: buildQuiz(level, unit),
      annotations: [`GER ${level.cefr}: ${level.focus}.`, `Grammatikziel: ${unit.grammar}.`, `Sprechsituation: ${unit.scenario}`],
      study_method: ['Modellsatz hoeren und laut nachsprechen.', 'Verbposition, Artikel und Kasus markieren.', 'Zwei Woerter austauschen und eine persoenliche Variante bilden.', 'Eine Rueckfrage hinzufuegen.', 'Die Antwort aufnehmen und selbst korrigieren.'],
      is_preview: levelIndex === 0 && unitIndex === 0 && kindIndex === 0,
    };
  });
}

export const germanCourseFallback = {
  course: {
    id: GERMAN_COURSE_SLUG,
    slug: GERMAN_COURSE_SLUG,
    title: 'Allemand complet A1 a C1',
    short_description: 'Un parcours complet pour apprendre l allemand de A1 a C1 avec grammaire, vocabulaire, audio, videos, exercices massifs, quiz et oral.',
    description: 'Ce parcours StudyLink construit une progression complete en allemand de A1 a C1. Chaque niveau combine situations reelles, grammaire approfondie, vocabulaire actif, exemples, cas d utilisation, videos integrees, audio, oral et exercices progressifs du plus simple au plus exigeant.',
    category_name: 'Langues',
    level: 'all',
    language: 'de',
    estimated_minutes: fullGermanLevelData.reduce((sum, level) => sum + level.minutes, 0),
    cover_url: 'https://images.unsplash.com/photo-1467269204594-9661b134dd2b?auto=format&fit=crop&w=1600&q=85',
    author_name: 'StudyLink Deutsch Akademie',
    enrollment_count: 1840,
    objectives: [
      'Construire une progression solide de A1 a C1 en allemand',
      'Comprendre dialogues, annonces, conversations, reunions et presentations',
      'Maitriser verbes, articles, cas, Satzklammer, Nebensaetze, Passiv, Konjunktiv II et Nominalstil',
      'Parler avec plus de fluidite grace aux scripts audio et entrainements oraux',
      'Valider chaque unite avec des exercices, quiz, productions et defis de maitrise',
    ],
    prerequisites: ['Aucun prerequis pour commencer en A1', 'Un micro est recommande pour pratiquer l oral'],
    is_free: true,
    module_count: fullGermanLevelData.reduce((sum, level) => sum + level.units.length, 0),
    lesson_count: fullGermanLevelData.reduce((sum, level) => sum + level.units.length * lessonKinds.length, 0),
  },
  files: [
    resource('DW Deutsch lernen', 'https://learngerman.dw.com/de/learn-german/s-9528', 'reference'),
    resource('Goethe-Institut Deutsch ueben', 'https://www.goethe.de/de/spr/ueb.html', 'reference'),
    resource('Duden Woerterbuch', 'https://www.duden.de/', 'reference'),
  ].map((item) => ({ ...item, file_name: item.title, file_url: item.url, mime_type: 'text/html' })),
  modules: fullGermanLevelData.flatMap((level, levelIndex) => level.units.map((unit, unitIndex) => ({
    id: `de-${level.cefr.toLowerCase()}-m${unitIndex + 1}`,
    title: unit.moduleTitle,
    description: `Niveau ${level.cefr}: ${unit.moduleGoal}. Grammaire: ${unit.grammar}. 8 lecons avec theorie, audio, exercices, quiz et mission reelle.`,
    position: (levelIndex * 12) + unitIndex + 1,
    lessons: makeLessons(level, unit, levelIndex, unitIndex),
  }))),
};

export const germanCourseSummary = {
  ...germanCourseFallback.course,
  module_count: germanCourseFallback.modules.length,
  lesson_count: germanCourseFallback.modules.reduce((sum, module) => sum + module.lessons.length, 0),
};

export function isGermanCourseId(id) {
  return id === GERMAN_COURSE_SLUG || id === 'demo-allemand' || id === 'german-a1-c1' || id === 'allemand-a1-c1';
}
