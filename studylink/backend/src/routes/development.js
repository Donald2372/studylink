import { Router } from 'express';
import { query } from '../db.js';

const router = Router();

// Catégories de dév perso (Discipline, Yoga...)
router.get('/categories', async (req, res) => {
  try {
    const r = await query('SELECT * FROM dev_categories ORDER BY id');
    res.json({ categories: r.rows });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur chargement catégories.' });
  }
});

// Liste des programmes (avec filtre catégorie + recherche)
router.get('/programs', async (req, res) => {
  try {
    const { search, category } = req.query;
    const conditions = [];
    const params = [];
    if (search) {
      params.push(`%${search}%`);
      conditions.push(`(title ILIKE $${params.length} OR subtitle ILIKE $${params.length})`);
    }
    if (category) {
      params.push(category);
      conditions.push(`category = $${params.length}`);
    }
    const where = conditions.length ? `WHERE ${conditions.join(' AND ')}` : '';
    const r = await query(`SELECT * FROM programs ${where} ORDER BY rating DESC`, params);
    res.json({ programs: r.rows });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur chargement programmes.' });
  }
});

// Détail programme + objectifs
router.get('/programs/:id', async (req, res) => {
  try {
    const p = await query('SELECT * FROM programs WHERE id = $1', [req.params.id]);
    if (p.rows.length === 0) return res.status(404).json({ error: 'Programme introuvable.' });
    const obj = await query('SELECT label FROM program_objectives WHERE program_id = $1 ORDER BY position', [req.params.id]);
    res.json({ program: p.rows[0], objectives: obj.rows.map((o) => o.label) });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur chargement programme.' });
  }
});

// Démarrer un programme (auth)
router.post('/programs/:id/start', async (req, res) => {
  try {
    await query(
      `INSERT INTO program_enrollments (user_id, program_id) VALUES ($1, $2)
       ON CONFLICT (user_id, program_id) DO NOTHING`,
      [req.user.id, req.params.id]
    );
    res.status(201).json({ message: 'Programme démarré.' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur lors du démarrage.' });
  }
});

export default router;
