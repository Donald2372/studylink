import dotenv from 'dotenv';
import { pool, query } from './db.js';

dotenv.config();

// Peuple le catalogue de cours de démo, fidèle aux maquettes StudyLink.
// Idempotent : on nettoie les tables cours avant de réinsérer.
async function seedCourses() {
  console.log('🌱 Seed du catalogue de cours...');

  await query('TRUNCATE lesson_progress, enrollments, lessons, course_modules, course_objectives, courses, course_categories RESTART IDENTITY CASCADE');

  // --- Catégories (fidèles à l'écran "Catalogue des cours") ---
  const categories = [
    ['Informatique', 'code', '#2563eb', 128],
    ['Mathématiques', 'sigma', '#16a34a', 96],
    ['Physique', 'atom', '#ea580c', 64],
    ['Langues', 'globe', '#9333ea', 72],
    ['Emploi & Carrière', 'briefcase', '#db2777', 58],
    ['Développement personnel', 'brain', '#0d9488', 45],
    ['Data Science', 'network', '#4f46e5', 83],
    ['Business', 'chart', '#f59e0b', 67],
  ];
  const catIds = {};
  for (const [name, icon, color, count] of categories) {
    const r = await query(
      'INSERT INTO course_categories (name, icon, color, course_count) VALUES ($1, $2, $3, $4) RETURNING id',
      [name, icon, color, count]
    );
    catIds[name] = r.rows[0].id;
  }

  // --- Récupère un instructeur existant (Emily Chen si présente) pour lier les cours ---
  const instr = await query("SELECT id FROM users WHERE role = 'tutor' LIMIT 1");
  const instructorId = instr.rows[0]?.id || null;

  // --- Cours "Python pour débutants" (fidèle aux écrans Détail cours + Contenu) ---
  const pyCourse = await query(
    `INSERT INTO courses (title, subtitle, description, category_id, instructor_id, level, language, rating, rating_count, duration_minutes)
     VALUES ($1, $2, $3, $4, $5, 'Débutant', 'FR', 4.9, 256, 510)
     RETURNING id`,
    [
      'Python pour débutants',
      'Apprenez les bases de Python et créez vos premiers programmes.',
      "Ce cours est conçu pour les débutants souhaitant apprendre Python pas à pas. Vous découvrirez les concepts essentiels du langage et serez guidé à travers des exemples concrets et des exercices pratiques.",
      catIds['Informatique'],
      instructorId,
    ]
  );
  const pyId = pyCourse.rows[0].id;

  const pyObjectives = [
    'Comprendre les bases de Python et son écosystème',
    'Écrire vos premiers programmes avec confiance',
    'Manipuler des données avec des structures clés',
    'Réaliser un projet pratique pour appliquer vos compétences',
  ];
  for (let i = 0; i < pyObjectives.length; i++) {
    await query('INSERT INTO course_objectives (course_id, label, position) VALUES ($1, $2, $3)', [
      pyId, pyObjectives[i], i,
    ]);
  }

  // Modules + leçons (fidèle à l'écran "Contenu du cours")
  const modules = [
    ['Module 1 – Introduction', ['Bienvenue dans Python', 'Installer Python', 'Premier programme en Python', 'La fonction print()']],
    ['Module 2 – Variables & Types', ['Les variables', 'Les nombres', 'Les chaînes de caractères', 'Les booléens', 'Conversions de types', 'Exercices pratiques']],
    ['Module 3 – Conditions & Boucles', ['Les conditions if/else', 'Opérateurs de comparaison', 'La boucle for', 'La boucle while', 'break et continue', 'Boucles imbriquées', 'Exercices']],
    ['Module 4 – Fonctions', ['Définir une fonction', 'Paramètres et arguments', 'Valeurs de retour', 'Portée des variables', 'Fonctions lambda']],
    ['Module 5 – Structures de données', ['Les listes', 'Les tuples', 'Les dictionnaires', 'Les ensembles', 'Compréhensions de liste', 'Projet intermédiaire']],
    ['Module 6 – Projet final', ['Présentation du projet', 'Construction pas à pas', 'Aller plus loin']],
  ];
  // Une vraie vidéo YouTube publique de démo (cours Python)
  const demoYoutube = 'rfscVS0vtbw';
  let modPos = 0;
  for (const [title, lessons] of modules) {
    const modRes = await query(
      'INSERT INTO course_modules (course_id, title, position) VALUES ($1, $2, $3) RETURNING id',
      [pyId, title, modPos++]
    );
    const modId = modRes.rows[0].id;
    let lessPos = 0;
    for (const lessonTitle of lessons) {
      await query(
        `INSERT INTO lessons (module_id, title, youtube_id, duration_minutes, summary, position)
         VALUES ($1, $2, $3, $4, $5, $6)`,
        [
          modId,
          lessonTitle,
          demoYoutube,
          15 + Math.floor(Math.random() * 15),
          "Dans cette leçon, vous allez : créer votre premier programme, comprendre les concepts clés, et pratiquer pas à pas.",
          lessPos++,
        ]
      );
    }
  }

  // --- Quelques autres cours pour remplir "Cours populaires" ---
  const otherCourses = [
    ['Machine Learning', 'Découvrez les fondements du ML et des réseaux de neurones.', catIds['Data Science'], 'Intermédiaire', 4.8, 198],
    ['Algorithmes & Structures', 'Maîtrisez les algorithmes fondamentaux et la complexité.', catIds['Informatique'], 'Intermédiaire', 4.7, 173],
    ['Anglais professionnel', "Communiquez avec aisance dans un contexte professionnel.", catIds['Langues'], 'Tous niveaux', 4.6, 142],
    ['Réussir ses entretiens', 'Préparez-vous aux entretiens techniques et RH.', catIds['Emploi & Carrière'], 'Débutant', 4.5, 89],
  ];
  for (const [title, subtitle, catId, level, rating, count] of otherCourses) {
    await query(
      `INSERT INTO courses (title, subtitle, category_id, instructor_id, level, language, rating, rating_count, duration_minutes)
       VALUES ($1, $2, $3, $4, $5, 'FR', $6, $7, 300)`,
      [title, subtitle, catId, instructorId, level, rating, count]
    );
  }

  console.log('✅ Catalogue de cours créé !');
  console.log(`   - ${categories.length} catégories`);
  console.log(`   - Cours "Python pour débutants" avec 6 modules et 34 leçons`);
  console.log(`   - ${otherCourses.length} cours supplémentaires`);
}

seedCourses()
  .then(() => pool.end())
  .catch((err) => {
    console.error('❌ Erreur seed cours:', err);
    pool.end();
    process.exit(1);
  });
