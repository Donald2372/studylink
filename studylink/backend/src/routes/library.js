import { Router } from 'express';
import { query } from '../db.js';

const router = Router();

// Liste des livres (recherche, filtre catégorie) + progression si connecté
router.get('/', async (req, res) => {
  try {
    const { search, category } = req.query;
    const conditions = [];
    const params = [];
    if (search) {
      params.push(`%${search}%`);
      conditions.push(`(b.title ILIKE $${params.length} OR b.author ILIKE $${params.length})`);
    }
    if (category && category !== 'Tous') {
      params.push(category);
      conditions.push(`b.category = $${params.length}`);
    }
    const where = conditions.length ? `WHERE ${conditions.join(' AND ')}` : '';

    // Jointure progression pour l'utilisateur (si token fourni par middleware optionnel)
    const userId = req.user?.id || null;
    params.push(userId);
    const userParam = `$${params.length}`;

    const r = await query(
      `SELECT b.*, COALESCE(rp.percent, 0) AS percent
       FROM books b
       LEFT JOIN reading_progress rp ON rp.book_id = b.id AND rp.user_id = ${userParam}
       ${where}
       ORDER BY b.title`,
      params
    );
    res.json({ books: r.rows });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur chargement bibliothèque.' });
  }
});

// Livres en cours de lecture ("Continuer la lecture") - auth
router.get('/reading', async (req, res) => {
  try {
    const r = await query(
      `SELECT b.*, rp.percent, rp.current_page
       FROM reading_progress rp JOIN books b ON b.id = rp.book_id
       WHERE rp.user_id = $1 AND rp.percent > 0 AND rp.percent < 100
       ORDER BY rp.updated_at DESC`,
      [req.user.id]
    );
    res.json({ books: r.rows });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur chargement lectures en cours.' });
  }
});

// Détail d'un livre + progression
router.get('/:id', async (req, res) => {
  try {
    const b = await query('SELECT * FROM books WHERE id = $1', [req.params.id]);
    if (b.rows.length === 0) return res.status(404).json({ error: 'Livre introuvable.' });
    let progress = { percent: 0, current_page: 1 };
    if (req.user) {
      const rp = await query('SELECT percent, current_page FROM reading_progress WHERE user_id = $1 AND book_id = $2', [req.user.id, req.params.id]);
      if (rp.rows.length) progress = rp.rows[0];
    }
    res.json({ book: b.rows[0], progress });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur chargement livre.' });
  }
});

// Sauver la progression de lecture (auth)
router.post('/:id/progress', async (req, res) => {
  try {
    const { percent, currentPage } = req.body;
    await query(
      `INSERT INTO reading_progress (user_id, book_id, percent, current_page, updated_at)
       VALUES ($1, $2, $3, $4, now())
       ON CONFLICT (user_id, book_id) DO UPDATE SET percent = $3, current_page = $4, updated_at = now()`,
      [req.user.id, req.params.id, percent || 0, currentPage || 1]
    );
    res.json({ message: 'Progression enregistrée.' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur enregistrement progression.' });
  }
});

export default router;
