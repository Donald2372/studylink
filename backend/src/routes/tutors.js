import { Router } from 'express';
import { query } from '../db.js';

const router = Router();

// GET /api/tutors?subject=Mathematics&minPrice=0&maxPrice=300&masteryLevel=Native+Speaker
// Recherche/filtrage des tuteurs, reproduisant les filtres de la maquette Studylink
router.get('/', async (req, res) => {
  try {
    const { subject, minPrice, maxPrice, masteryLevel, search } = req.query;

    const conditions = [];
    const params = [];
    let i = 1;

    let sql = `
      SELECT
        tp.id AS tutor_id,
        u.id AS user_id,
        u.full_name,
        u.avatar_url,
        tp.headline,
        tp.hourly_rate,
        tp.mastery_level,
        tp.years_experience,
        COALESCE(ARRAY_AGG(DISTINCT s.name) FILTER (WHERE s.name IS NOT NULL), '{}') AS subjects,
        COALESCE(ROUND(AVG(r.rating)::numeric, 1), 0) AS avg_rating,
        COUNT(DISTINCT r.id) AS review_count
      FROM tutor_profiles tp
      JOIN users u ON u.id = tp.user_id
      LEFT JOIN tutor_subjects ts ON ts.tutor_id = tp.id
      LEFT JOIN subjects s ON s.id = ts.subject_id
      LEFT JOIN reviews r ON r.tutor_id = tp.id
    `;

    if (subject) {
      conditions.push(`tp.id IN (
        SELECT ts2.tutor_id FROM tutor_subjects ts2
        JOIN subjects s2 ON s2.id = ts2.subject_id
        WHERE s2.name = $${i++}
      )`);
      params.push(subject);
    }
    if (minPrice) {
      conditions.push(`tp.hourly_rate >= $${i++}`);
      params.push(minPrice);
    }
    if (maxPrice) {
      conditions.push(`tp.hourly_rate <= $${i++}`);
      params.push(maxPrice);
    }
    if (masteryLevel) {
      conditions.push(`tp.mastery_level = $${i++}`);
      params.push(masteryLevel);
    }
    if (search) {
      conditions.push(`u.full_name ILIKE $${i++}`);
      params.push(`%${search}%`);
    }

    if (conditions.length > 0) {
      sql += ' WHERE ' + conditions.join(' AND ');
    }

    sql += ' GROUP BY tp.id, u.id ORDER BY avg_rating DESC NULLS LAST';

    const result = await query(sql, params);
    res.json({ tutors: result.rows });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur lors de la recherche des tuteurs.' });
  }
});

// GET /api/tutors/:id - profil détaillé d'un tuteur
router.get('/:id', async (req, res) => {
  try {
    const { id } = req.params;

    const tutorResult = await query(
      `SELECT
         tp.id AS tutor_id, u.id AS user_id, u.full_name, u.avatar_url, u.email,
         tp.headline, tp.bio, tp.hourly_rate, tp.mastery_level, tp.years_experience,
         COALESCE(ARRAY_AGG(DISTINCT s.name) FILTER (WHERE s.name IS NOT NULL), '{}') AS subjects,
         COALESCE(ROUND(AVG(r.rating)::numeric, 1), 0) AS avg_rating,
         COUNT(DISTINCT r.id) AS review_count
       FROM tutor_profiles tp
       JOIN users u ON u.id = tp.user_id
       LEFT JOIN tutor_subjects ts ON ts.tutor_id = tp.id
       LEFT JOIN subjects s ON s.id = ts.subject_id
       LEFT JOIN reviews r ON r.tutor_id = tp.id
       WHERE tp.id = $1
       GROUP BY tp.id, u.id`,
      [id]
    );

    if (tutorResult.rows.length === 0) {
      return res.status(404).json({ error: 'Tuteur introuvable.' });
    }

    const slotsResult = await query(
      `SELECT id, start_time, end_time, status
       FROM availability_slots
       WHERE tutor_id = $1 AND start_time >= NOW() - INTERVAL '1 day'
       ORDER BY start_time ASC`,
      [id]
    );

    const reviewsResult = await query(
      `SELECT r.rating, r.comment, r.created_at, u.full_name AS student_name
       FROM reviews r
       JOIN users u ON u.id = r.student_id
       WHERE r.tutor_id = $1
       ORDER BY r.created_at DESC
       LIMIT 20`,
      [id]
    );

    res.json({
      tutor: tutorResult.rows[0],
      slots: slotsResult.rows,
      reviews: reviewsResult.rows,
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur lors du chargement du profil tuteur.' });
  }
});

// PUT /api/tutors/:id - mise à jour du profil (le tuteur lui-même uniquement)
router.put('/:id', async (req, res) => {
  try {
    const { id } = req.params;

    // Vérifie que l'utilisateur connecté est bien propriétaire de ce profil tuteur
    const owner = await query('SELECT user_id FROM tutor_profiles WHERE id = $1', [id]);
    if (owner.rows.length === 0) return res.status(404).json({ error: 'Tuteur introuvable.' });
    if (owner.rows[0].user_id !== req.user.id) {
      return res.status(403).json({ error: 'Vous ne pouvez modifier que votre propre profil.' });
    }

    const { headline, bio, hourlyRate, masteryLevel, yearsExperience } = req.body;
    const result = await query(
      `UPDATE tutor_profiles
       SET headline = COALESCE($1, headline),
           bio = COALESCE($2, bio),
           hourly_rate = COALESCE($3, hourly_rate),
           mastery_level = COALESCE($4, mastery_level),
           years_experience = COALESCE($5, years_experience)
       WHERE id = $6
       RETURNING *`,
      [headline, bio, hourlyRate, masteryLevel, yearsExperience, id]
    );

    res.json({ tutor: result.rows[0] });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur lors de la mise à jour du profil.' });
  }
});

// POST /api/tutors/:id/availability - le tuteur ajoute un créneau de disponibilité
router.post('/:id/availability', async (req, res) => {
  try {
    const { id } = req.params;
    const owner = await query('SELECT user_id FROM tutor_profiles WHERE id = $1', [id]);
    if (owner.rows.length === 0) return res.status(404).json({ error: 'Tuteur introuvable.' });
    if (owner.rows[0].user_id !== req.user.id) {
      return res.status(403).json({ error: 'Action réservée au tuteur concerné.' });
    }

    const { startTime, endTime } = req.body;
    if (!startTime || !endTime) {
      return res.status(400).json({ error: 'startTime et endTime sont requis.' });
    }

    const result = await query(
      `INSERT INTO availability_slots (tutor_id, start_time, end_time, status)
       VALUES ($1, $2, $3, 'available')
       RETURNING *`,
      [id, startTime, endTime]
    );

    res.status(201).json({ slot: result.rows[0] });
  } catch (err) {
    if (err.code === '23505') {
      return res.status(409).json({ error: 'Ce créneau existe déjà.' });
    }
    console.error(err);
    res.status(500).json({ error: "Erreur lors de l'ajout du créneau." });
  }
});

export default router;
