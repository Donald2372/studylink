import { Router } from 'express';
import { query } from '../db.js';

const router = Router();

// Catégories du forum
router.get('/categories', async (req, res) => {
  try {
    const r = await query('SELECT * FROM forum_categories ORDER BY id');
    res.json({ categories: r.rows });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur lors du chargement des catégories.' });
  }
});

// Liste des discussions (avec nombre de réponses, recherche, filtre catégorie)
router.get('/threads', async (req, res) => {
  try {
    const { search, category } = req.query;
    const conditions = [];
    const params = [];
    if (search) {
      params.push(`%${search}%`);
      conditions.push(`(t.title ILIKE $${params.length} OR t.body ILIKE $${params.length})`);
    }
    if (category) {
      params.push(category);
      conditions.push(`fc.name = $${params.length}`);
    }
    const where = conditions.length ? `WHERE ${conditions.join(' AND ')}` : '';

    const r = await query(
      `SELECT t.id, t.title, t.body, t.created_at,
              fc.name AS category_name, fc.color AS category_color, fc.icon AS category_icon,
              u.full_name AS author_name,
              (SELECT COUNT(*) FROM forum_replies WHERE thread_id = t.id) AS reply_count
       FROM forum_threads t
       LEFT JOIN forum_categories fc ON fc.id = t.category_id
       JOIN users u ON u.id = t.author_id
       ${where}
       ORDER BY t.created_at DESC`,
      params
    );
    res.json({ threads: r.rows });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur lors du chargement des discussions.' });
  }
});

// Détail d'une discussion + ses réponses
router.get('/threads/:id', async (req, res) => {
  try {
    const t = await query(
      `SELECT t.*, fc.name AS category_name, fc.color AS category_color,
              u.full_name AS author_name, u.avatar_url AS author_avatar
       FROM forum_threads t
       LEFT JOIN forum_categories fc ON fc.id = t.category_id
       JOIN users u ON u.id = t.author_id
       WHERE t.id = $1`,
      [req.params.id]
    );
    if (t.rows.length === 0) return res.status(404).json({ error: 'Discussion introuvable.' });

    const replies = await query(
      `SELECT r.id, r.body, r.created_at, u.full_name AS author_name, u.avatar_url AS author_avatar
       FROM forum_replies r JOIN users u ON u.id = r.author_id
       WHERE r.thread_id = $1 ORDER BY r.created_at ASC`,
      [req.params.id]
    );
    res.json({ thread: t.rows[0], replies: replies.rows });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur lors du chargement de la discussion.' });
  }
});

// Créer une discussion (auth requise)
router.post('/threads', async (req, res) => {
  try {
    const { title, body, categoryId } = req.body;
    if (!title || !body) return res.status(400).json({ error: 'Titre et message requis.' });
    const r = await query(
      `INSERT INTO forum_threads (author_id, category_id, title, body) VALUES ($1, $2, $3, $4) RETURNING *`,
      [req.user.id, categoryId || null, title, body]
    );
    res.status(201).json({ thread: r.rows[0] });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur lors de la création de la discussion.' });
  }
});

// Répondre à une discussion (auth requise)
router.post('/threads/:id/replies', async (req, res) => {
  try {
    const { body } = req.body;
    if (!body) return res.status(400).json({ error: 'Message requis.' });
    const r = await query(
      `INSERT INTO forum_replies (thread_id, author_id, body) VALUES ($1, $2, $3) RETURNING *`,
      [req.params.id, req.user.id, body]
    );
    res.status(201).json({ reply: r.rows[0] });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Erreur lors de l'envoi de la réponse." });
  }
});

export default router;
