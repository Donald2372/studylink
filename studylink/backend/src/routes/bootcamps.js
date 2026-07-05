import { Router } from 'express';
import { query } from '../db.js';

const router = Router();

// Liste des bootcamps (filtre par statut)
router.get('/', async (req, res) => {
  try {
    const { status } = req.query;
    const where = status ? 'WHERE status = $1' : '';
    const params = status ? [status] : [];
    const r = await query(
      `SELECT b.*, u.full_name AS instructor_name,
              (SELECT COUNT(*) FROM bootcamp_enrollments WHERE bootcamp_id = b.id) AS enrolled_count
       FROM bootcamps b LEFT JOIN users u ON u.id = b.instructor_id
       ${where} ORDER BY b.start_date ASC NULLS LAST`,
      params
    );
    res.json({ bootcamps: r.rows });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur chargement bootcamps.' });
  }
});

// S'inscrire à un bootcamp (auth)
router.post('/:id/enroll', async (req, res) => {
  try {
    await query(
      `INSERT INTO bootcamp_enrollments (user_id, bootcamp_id) VALUES ($1, $2)
       ON CONFLICT (user_id, bootcamp_id) DO NOTHING`,
      [req.user.id, req.params.id]
    );
    res.status(201).json({ message: 'Inscription réussie.' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Erreur lors de l'inscription." });
  }
});

export default router;
