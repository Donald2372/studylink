import { Router } from 'express';
import { query } from '../db.js';

const router = Router();

// ===== NOTIFICATIONS / CENTRE D'ALERTES (auth) =====
router.get('/', async (req, res) => {
  try {
    const { type } = req.query;
    const where = type && type !== 'Tout' ? 'AND type = $2' : '';
    const params = type && type !== 'Tout' ? [req.user.id, type.toLowerCase()] : [req.user.id];
    const r = await query(
      `SELECT * FROM notifications WHERE user_id = $1 ${where} ORDER BY created_at DESC LIMIT 50`,
      params
    );
    res.json({ notifications: r.rows });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur chargement notifications.' });
  }
});

router.get('/unread-count', async (req, res) => {
  try {
    const r = await query('SELECT COUNT(*) FROM notifications WHERE user_id = $1 AND read_at IS NULL', [req.user.id]);
    res.json({ count: parseInt(r.rows[0].count, 10) });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur comptage.' });
  }
});

router.patch('/read-all', async (req, res) => {
  try {
    await query('UPDATE notifications SET read_at = now() WHERE user_id = $1 AND read_at IS NULL', [req.user.id]);
    res.json({ message: 'Tout marqué comme lu.' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur mise à jour.' });
  }
});

export default router;
