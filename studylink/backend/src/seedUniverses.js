import dotenv from 'dotenv';
import { pool, query } from './db.js';

dotenv.config();

async function seedUniverses() {
  console.log('🌱 Seed des univers (dev perso, biblio, entrepreneuriat, bootcamps)...');

  // Nettoyage
  await query(`TRUNCATE program_objectives, program_enrollments, programs,
    reading_progress, books, entrepreneur_tools, entrepreneur_paths,
    project_documents, project_goals, project_tasks, entrepreneur_projects,
    bootcamp_enrollments, bootcamps, forum_replies, forum_threads RESTART IDENTITY CASCADE`);

  // ===== PROGRAMMES (dév perso) =====
  const programs = [
    ['Discipline 30 jours', 'Transformez vos habitudes. Changez votre vie.', 'Discipline', 'Coach Sarah M.', 'Experte en développement personnel', 'Débutant', 30, 4.8, 1246, '#1D4FD8'],
    ['Yoga du matin', 'Réveillez votre corps en douceur.', 'Yoga', 'Coach Léa R.', 'Professeure de yoga', 'Tous niveaux', 21, 4.9, 856, '#16a34a'],
    ['Routine anti-procrastination', 'Passez enfin à l\'action.', 'Productivité', 'Coach Tom B.', 'Coach en productivité', 'Débutant', 14, 4.7, 1100, '#f59e0b'],
  ];
  for (const [title, subtitle, cat, coach, role, level, days, rating, count, color] of programs) {
    const p = await query(
      `INSERT INTO programs (title, subtitle, description, category, coach_name, coach_role, level, duration_days, rating, rating_count, accent_color)
       VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11) RETURNING id`,
      [title, subtitle, `${title} est un programme pratique et progressif conçu pour vous aider à progresser jour après jour.`, cat, coach, role, level, days, rating, count, color]
    );
    const objectives = ['Développer une discipline quotidienne durable', 'Créer et suivre une routine efficace', 'Améliorer votre concentration et votre productivité', 'Vaincre la procrastination et passer à l\'action'];
    for (let i = 0; i < objectives.length; i++) {
      await query('INSERT INTO program_objectives (program_id, label, position) VALUES ($1,$2,$3)', [p.rows[0].id, objectives[i], i]);
    }
  }

  // ===== LIVRES =====
  const books = [
    ['Atomic Habits', 'James Clear', 'Productivité', 'PDF', 320, 4.7, '#C9A227'],
    ['Pouvoir de la discipline', 'Brian Tracy', 'Discipline', 'ePub', 256, 4.6, '#0A1B3D'],
    ['Yoga pour débutants', 'Elodie Martin', 'Yoga', 'PDF', 184, 4.8, '#6D4C41'],
    ['Maîtriser son temps', 'Thibault Meurisse', 'Productivité', 'ePub', 208, 4.5, '#1565C0'],
    ['Confiance en soi', 'Sarah Ben Ali', 'Psychologie', 'Audio', 192, 4.6, '#00838F'],
    ['Les 5 AM Club', 'Robin Sharma', 'Productivité', 'PDF', 336, 4.8, '#2E7D32'],
  ];
  for (const [title, author, cat, format, pages, rating, color] of books) {
    await query(
      `INSERT INTO books (title, author, category, format, pages, rating, cover_color) VALUES ($1,$2,$3,$4,$5,$6,$7)`,
      [title, author, cat, format, pages, rating, color]
    );
  }

  // ===== PARCOURS ENTREPRENEURIAT =====
  const paths = [
    ['Créer son entreprise', 'Les étapes clés pour passer de l\'idée au lancement.', 'Idée & Validation', 'Nadia K.', 'Mentore en entrepreneuriat', 'Débutant', 8, 390, 4.8, 256],
    ['Business plan complet', 'Réalisez un business plan solide et convaincant.', 'Business Plan', 'Nadia K.', 'Mentore en entrepreneuriat', 'Intermédiaire', 10, 465, 4.8, 256],
    ['Trouver ses premiers clients', 'Attirez, convertissez et fidélisez vos premiers clients.', 'Vente', 'Marc D.', 'Expert en vente', 'Débutant', 7, 320, 4.7, 189],
  ];
  for (const [title, subtitle, cat, mentor, role, level, modules, dur, rating, count] of paths) {
    await query(
      `INSERT INTO entrepreneur_paths (title, subtitle, description, category, mentor_name, mentor_role, level, modules_count, duration_minutes, rating, rating_count)
       VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11)`,
      [title, subtitle, `Ce parcours vous accompagne pas à pas pour ${subtitle.toLowerCase()}`, cat, mentor, role, level, modules, dur, rating, count]
    );
  }

  // ===== OUTILS ENTREPRENEUR =====
  const tools = [
    ['Modèle de business plan', 'Structure complète pour présenter votre projet et convaincre vos partenaires.', 'Modèles', 'DOCX', '#2563EB'],
    ['Prévision financière', 'Modèle pour estimer vos revenus, charges et rentabilité sur 3 ans.', 'Finances', 'XLSX', '#16a34a'],
    ['Modèle de budget', 'Suivez vos dépenses et revenus avec un budget prévisionnel simple.', 'Finances', 'XLSX', '#f59e0b'],
    ['Modèle de facture', 'Créez des factures professionnelles prêtes à l\'emploi.', 'Documents', 'DOCX', '#9333ea'],
    ['Checklist de lancement', 'Toutes les étapes clés pour lancer votre projet sans rien oublier.', 'Documents', 'PDF', '#22c55e'],
    ['Pitch deck', 'Modèle de présentation pour pitcher votre projet de manière percutante.', 'Pitch', 'PPTX', '#f97316'],
  ];
  for (const [title, desc, cat, format, color] of tools) {
    await query(
      `INSERT INTO entrepreneur_tools (title, description, category, format, icon_color) VALUES ($1,$2,$3,$4,$5)`,
      [title, desc, cat, format, color]
    );
  }

  // ===== BOOTCAMPS =====
  const instr = await query("SELECT id FROM users WHERE role = 'tutor' LIMIT 1");
  const instructorId = instr.rows[0]?.id || null;
  const now = new Date();
  const bootcamps = [
    ['Data Science pour débutants', 'Découvrez les fondamentaux de la data science.', 'Data Science', 'Débutant', 'À venir', 7],
    ['Développement Web Full-Stack', 'Devenez développeur web en 6 semaines.', 'Informatique', 'Intermédiaire', 'En cours', 3],
    ['Introduction à l\'IA', 'Les bases de l\'intelligence artificielle.', 'IA & ML', 'Débutant', 'Terminé', -14],
  ];
  for (const [title, desc, cat, level, status, daysOffset] of bootcamps) {
    const start = new Date(now.getTime() + daysOffset * 86400000);
    await query(
      `INSERT INTO bootcamps (title, description, category, level, instructor_id, start_date, end_date, status, seats, is_free)
       VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,true)`,
      [title, desc, cat, level, instructorId, start, new Date(start.getTime() + 14 * 86400000), status, 30]
    );
  }

  // ===== NOTIFICATIONS de démo pour l'élève =====
  const student = await query("SELECT id FROM users WHERE email = 'student@studylink.com' LIMIT 1");
  if (student.rows.length) {
    const uid = student.rows[0].id;
    const notifs = [
      ['message', 'Nouveau message de Marc T.', 'Bonjour ! J\'ai une question sur l\'exercice 3.'],
      ['forum', 'Sophie L. a répondu à votre discussion.', 'Merci pour votre question, voici ma réponse...'],
      ['session', 'Rappel : votre session commence dans 30 min.', 'Python – Programmation avancée avec Marie T.'],
      ['bootcamp', 'Nouveau bootcamp disponible !', 'Data Science pour débutants – Inscrivez-vous dès maintenant.'],
    ];
    for (const [type, title, body] of notifs) {
      await query('INSERT INTO notifications (user_id, type, title, body) VALUES ($1,$2,$3,$4)', [uid, type, title, body]);
    }
  }

  console.log('✅ Univers peuplés !');
  console.log(`   - ${programs.length} programmes, ${books.length} livres`);
  console.log(`   - ${paths.length} parcours + ${tools.length} outils entrepreneur`);
  console.log(`   - ${bootcamps.length} bootcamps, notifications de démo`);
}

seedUniverses()
  .then(() => pool.end())
  .catch((err) => {
    console.error('❌ Erreur seed univers:', err);
    pool.end();
    process.exit(1);
  });
