import { Router } from 'express';
import { query } from '../db.js';

const router = Router();

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
