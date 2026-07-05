import { Router } from 'express';
import { query } from '../db.js';

const router = Router();


router.get('/materials', async (req, res) => {
  try {
    const q = (req.query.q || '').toString().trim();
    const type = (req.query.type || '').toString().trim();
    const values = [];
    const filters = ["c.status='published'"];

    if (q) {
      values.push(`%${q}%`);
      filters.push(`(
        cf.title ILIKE $${values.length}
        OR cf.file_name ILIKE $${values.length}
        OR c.title ILIKE $${values.length}
        OR COALESCE(lc.name, '') ILIKE $${values.length}
      )`);
    }

    if (type === 'courses') filters.push(`cf.course_id IS NOT NULL`);

    const result = await query(`
      SELECT
        cf.id,
        cf.title,
        cf.file_url,
        cf.file_name,
        cf.mime_type,
        cf.file_size,
        cf.created_at,
        c.id AS course_id,
        c.title AS course_title,
        c.cover_url AS course_cover_url,
        c.level,
        c.language,
        lc.name AS category_name,
        u.full_name AS uploaded_by_name,
        'course'::text AS source_type
      FROM course_files cf
      JOIN courses c ON c.id = cf.course_id
      LEFT JOIN learning_categories lc ON lc.id = c.category_id
      LEFT JOIN users u ON u.id = cf.uploaded_by
      WHERE ${filters.join(' AND ')}
      ORDER BY cf.created_at DESC
      LIMIT 300
    `, values);

    res.json({ materials: result.rows });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: error.message || 'Impossible de charger les documents.' });
  }
});

router.get('/tutorials', async (_req, res) => {
  try {
    const result = await query(`
      SELECT t.*, lc.name AS category_name,
        (SELECT COUNT(*) FROM tutorial_steps s WHERE s.tutorial_id=t.id) AS step_count,
        (SELECT s.youtube_video_id FROM tutorial_steps s
          WHERE s.tutorial_id=t.id AND s.youtube_video_id IS NOT NULL
          ORDER BY s.position LIMIT 1) AS youtube_video_id
      FROM tutorials t
      LEFT JOIN learning_categories lc ON lc.id=t.category_id
      WHERE t.status='published'
      ORDER BY t.created_at DESC
    `);
    res.json({ tutorials: result.rows });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: error.message || 'Impossible de charger les tutoriels.' });
  }
});

router.get('/tutorials/:id', async (req, res) => {
  try {
    const tutorialResult = await query(`
      SELECT t.*, lc.name AS category_name, u.full_name AS author_name
      FROM tutorials t
      LEFT JOIN learning_categories lc ON lc.id=t.category_id
      LEFT JOIN users u ON u.id=t.author_id
      WHERE t.id=$1 AND t.status='published'
      LIMIT 1
    `, [req.params.id]);

    const tutorial = tutorialResult.rows[0];
    if (!tutorial) return res.status(404).json({ error: 'Tutoriel introuvable ou non publié.' });

    const stepsResult = await query(`
      SELECT * FROM tutorial_steps
      WHERE tutorial_id=$1
      ORDER BY position ASC
    `, [req.params.id]);

    res.json({ tutorial, steps: stepsResult.rows });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: error.message || 'Impossible de charger le tutoriel.' });
  }
});

export default router;
