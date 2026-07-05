import { Router } from 'express';
import { query } from '../db.js';

const router = Router();

// GET /api/courses/categories - liste des catégories du catalogue
router.get('/categories', async (req, res) => {
  try {
    const result = await query('SELECT * FROM course_categories ORDER BY id');
    res.json({ categories: result.rows });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur lors du chargement des catégories.' });
  }
});

// GET /api/courses - catalogue avec recherche et filtres
// query params: search, category, level, language
router.get('/', async (req, res) => {
  try {
    const { search, category, level, language } = req.query;
    const conditions = ['c.is_published = true'];
    const params = [];

    if (search) {
      params.push(`%${search}%`);
      conditions.push(`(c.title ILIKE $${params.length} OR c.subtitle ILIKE $${params.length})`);
    }
    if (category) {
      params.push(category);
      conditions.push(`cat.name = $${params.length}`);
    }
    if (level) {
      params.push(level);
      conditions.push(`c.level = $${params.length}`);
    }
    if (language) {
      params.push(language);
      conditions.push(`c.language = $${params.length}`);
    }

    const result = await query(
      `SELECT c.id, c.title, c.subtitle, c.level, c.language, c.thumbnail_url,
              c.rating, c.rating_count, c.duration_minutes,
              cat.name AS category_name, cat.color AS category_color,
              u.full_name AS instructor_name, u.avatar_url AS instructor_avatar
       FROM courses c
       LEFT JOIN course_categories cat ON cat.id = c.category_id
       LEFT JOIN users u ON u.id = c.instructor_id
       WHERE ${conditions.join(' AND ')}
       ORDER BY c.rating DESC, c.rating_count DESC`,
      params
    );
    res.json({ courses: result.rows });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur lors du chargement des cours.' });
  }
});

// GET /api/courses/:id - détail complet d'un cours (avec objectifs, modules, leçons)
router.get('/:id([0-9a-fA-F-]{36})', async (req, res) => {
  try {
    const { id } = req.params;

    const courseResult = await query(
      `SELECT c.*, cat.name AS category_name, cat.color AS category_color,
              u.full_name AS instructor_name, u.avatar_url AS instructor_avatar
       FROM courses c
       LEFT JOIN course_categories cat ON cat.id = c.category_id
       LEFT JOIN users u ON u.id = c.instructor_id
       WHERE c.id = $1`,
      [id]
    );
    if (courseResult.rows.length === 0) {
      return res.status(404).json({ error: 'Cours introuvable.' });
    }
    const course = courseResult.rows[0];

    const objectives = await query(
      'SELECT label FROM course_objectives WHERE course_id = $1 ORDER BY position',
      [id]
    );

    const modules = await query(
      'SELECT id, title, position FROM course_modules WHERE course_id = $1 ORDER BY position',
      [id]
    );

    // Attache les leçons à chaque module
    for (const module of modules.rows) {
      const lessons = await query(
        'SELECT id, title, youtube_id, duration_minutes, position FROM lessons WHERE module_id = $1 ORDER BY position',
        [module.id]
      );
      module.lessons = lessons.rows;
    }

    res.json({
      course,
      objectives: objectives.rows.map((o) => o.label),
      modules: modules.rows,
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur lors du chargement du cours.' });
  }
});

// GET /api/courses/:id/progress - progression de l'utilisateur connecté sur ce cours
router.get('/:id([0-9a-fA-F-]{36})/progress', async (req, res) => {
  try {
    const { id } = req.params;
    const userId = req.user.id;

    // Toutes les leçons du cours
    const total = await query(
      `SELECT l.id FROM lessons l
       JOIN course_modules m ON m.id = l.module_id
       WHERE m.course_id = $1`,
      [id]
    );
    const totalCount = total.rows.length;

    // Leçons complétées
    const done = await query(
      `SELECT lp.lesson_id FROM lesson_progress lp
       JOIN lessons l ON l.id = lp.lesson_id
       JOIN course_modules m ON m.id = l.module_id
       WHERE m.course_id = $1 AND lp.user_id = $2 AND lp.completed = true`,
      [id, userId]
    );
    const completedIds = done.rows.map((r) => r.lesson_id);

    const enrollment = await query(
      'SELECT is_favorite, last_lesson_id FROM enrollments WHERE user_id = $1 AND course_id = $2',
      [userId, id]
    );

    res.json({
      total: totalCount,
      completed: completedIds.length,
      percent: totalCount > 0 ? Math.round((completedIds.length / totalCount) * 100) : 0,
      completedLessonIds: completedIds,
      isEnrolled: enrollment.rows.length > 0,
      isFavorite: enrollment.rows[0]?.is_favorite || false,
      lastLessonId: enrollment.rows[0]?.last_lesson_id || null,
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur lors du chargement de la progression.' });
  }
});

// POST /api/courses/:id/enroll - s'inscrire à un cours
router.post('/:id([0-9a-fA-F-]{36})/enroll', async (req, res) => {
  try {
    const { id } = req.params;
    await query(
      `INSERT INTO enrollments (user_id, course_id) VALUES ($1, $2)
       ON CONFLICT (user_id, course_id) DO NOTHING`,
      [req.user.id, id]
    );
    res.status(201).json({ message: 'Inscription réussie.' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Erreur lors de l'inscription." });
  }
});

// POST /api/courses/:id/favorite - basculer favori
router.post('/:id([0-9a-fA-F-]{36})/favorite', async (req, res) => {
  try {
    const { id } = req.params;
    await query(
      `INSERT INTO enrollments (user_id, course_id, is_favorite) VALUES ($1, $2, true)
       ON CONFLICT (user_id, course_id) DO UPDATE SET is_favorite = NOT enrollments.is_favorite`,
      [req.user.id, id]
    );
    const result = await query(
      'SELECT is_favorite FROM enrollments WHERE user_id = $1 AND course_id = $2',
      [req.user.id, id]
    );
    res.json({ isFavorite: result.rows[0].is_favorite });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur lors de la mise à jour du favori.' });
  }
});

// GET /api/courses/lessons/:lessonId - détail d'une leçon + navigation
router.get('/lessons/:lessonId', async (req, res) => {
  try {
    const { lessonId } = req.params;
    const result = await query(
      `SELECT l.*, m.title AS module_title, m.course_id, c.title AS course_title
       FROM lessons l
       JOIN course_modules m ON m.id = l.module_id
       JOIN courses c ON c.id = m.course_id
       WHERE l.id = $1`,
      [lessonId]
    );
    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Leçon introuvable.' });
    }
    const lesson = result.rows[0];

    // Est-elle déjà complétée par l'utilisateur ?
    const progress = await query(
      'SELECT completed FROM lesson_progress WHERE user_id = $1 AND lesson_id = $2',
      [req.user.id, lessonId]
    );

    res.json({
      lesson,
      completed: progress.rows[0]?.completed || false,
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur lors du chargement de la leçon.' });
  }
});

// POST /api/courses/lessons/:lessonId/complete - marquer une leçon comme terminée
router.post('/lessons/:lessonId/complete', async (req, res) => {
  try {
    const { lessonId } = req.params;
    const userId = req.user.id;

    await query(
      `INSERT INTO lesson_progress (user_id, lesson_id, completed, completed_at)
       VALUES ($1, $2, true, now())
       ON CONFLICT (user_id, lesson_id) DO UPDATE SET completed = true, completed_at = now()`,
      [userId, lessonId]
    );

    // Met à jour la dernière leçon vue + assure l'inscription
    const courseResult = await query(
      `SELECT m.course_id FROM lessons l JOIN course_modules m ON m.id = l.module_id WHERE l.id = $1`,
      [lessonId]
    );
    if (courseResult.rows.length > 0) {
      const courseId = courseResult.rows[0].course_id;
      await query(
        `INSERT INTO enrollments (user_id, course_id, last_lesson_id) VALUES ($1, $2, $3)
         ON CONFLICT (user_id, course_id) DO UPDATE SET last_lesson_id = $3`,
        [userId, courseId, lessonId]
      );
    }

    res.json({ message: 'Leçon terminée.' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur lors de la mise à jour.' });
  }
});

// GET /api/courses/mine/enrolled - les cours suivis par l'utilisateur ("Mes cours")
router.get('/mine/enrolled', async (req, res) => {
  try {
    const result = await query(
      `SELECT c.id, c.title, c.subtitle, c.thumbnail_url, c.level,
              cat.color AS category_color,
              u.full_name AS instructor_name,
              e.is_favorite, e.last_lesson_id
       FROM enrollments e
       JOIN courses c ON c.id = e.course_id
       LEFT JOIN course_categories cat ON cat.id = c.category_id
       LEFT JOIN users u ON u.id = c.instructor_id
       WHERE e.user_id = $1
       ORDER BY e.enrolled_at DESC`,
      [req.user.id]
    );
    res.json({ courses: result.rows });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur lors du chargement de vos cours.' });
  }
});

export default router;
