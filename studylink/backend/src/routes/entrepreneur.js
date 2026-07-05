import { Router } from 'express';
import { query } from '../db.js';

const router = Router();

// Catégories entrepreneuriat
router.get('/categories', async (req, res) => {
  try {
    const r = await query('SELECT * FROM entrepreneur_categories ORDER BY id');
    res.json({ categories: r.rows });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur chargement catégories.' });
  }
});

// Parcours
router.get('/paths', async (req, res) => {
  try {
    const r = await query('SELECT * FROM entrepreneur_paths ORDER BY rating DESC');
    res.json({ paths: r.rows });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur chargement parcours.' });
  }
});

router.get('/paths/:id', async (req, res) => {
  try {
    const r = await query('SELECT * FROM entrepreneur_paths WHERE id = $1', [req.params.id]);
    if (r.rows.length === 0) return res.status(404).json({ error: 'Parcours introuvable.' });
    res.json({ path: r.rows[0] });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur chargement parcours.' });
  }
});

// Boîte à outils (modèles téléchargeables)
router.get('/tools', async (req, res) => {
  try {
    const { category } = req.query;
    const where = category && category !== 'Tous' ? 'WHERE category = $1' : '';
    const params = category && category !== 'Tous' ? [category] : [];
    const r = await query(`SELECT * FROM entrepreneur_tools ${where} ORDER BY title`, params);
    res.json({ tools: r.rows });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur chargement outils.' });
  }
});

// ===== Projet entrepreneurial de l'utilisateur (auth) =====
router.get('/project', async (req, res) => {
  try {
    const p = await query('SELECT * FROM entrepreneur_projects WHERE user_id = $1 ORDER BY created_at DESC LIMIT 1', [req.user.id]);
    if (p.rows.length === 0) return res.json({ project: null });
    const project = p.rows[0];
    const [tasks, goals, docs] = await Promise.all([
      query('SELECT * FROM project_tasks WHERE project_id = $1 ORDER BY position', [project.id]),
      query('SELECT * FROM project_goals WHERE project_id = $1 ORDER BY position', [project.id]),
      query('SELECT * FROM project_documents WHERE project_id = $1 ORDER BY created_at DESC', [project.id]),
    ]);
    res.json({ project, tasks: tasks.rows, goals: goals.rows, documents: docs.rows });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur chargement projet.' });
  }
});

// Créer / mettre à jour le projet
router.post('/project', async (req, res) => {
  try {
    const { name, description, problemSolved, targetAudience, budgetTotal, launchDate } = req.body;
    if (!name) return res.status(400).json({ error: 'Nom du projet requis.' });
    const r = await query(
      `INSERT INTO entrepreneur_projects (user_id, name, description, problem_solved, target_audience, budget_total, launch_date)
       VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *`,
      [req.user.id, name, description, problemSolved, targetAudience, budgetTotal || 0, launchDate || null]
    );
    res.status(201).json({ project: r.rows[0] });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur création projet.' });
  }
});

// Ajouter une tâche
router.post('/project/:projectId/tasks', async (req, res) => {
  try {
    const { title } = req.body;
    const r = await query(
      'INSERT INTO project_tasks (project_id, title) VALUES ($1, $2) RETURNING *',
      [req.params.projectId, title]
    );
    res.status(201).json({ task: r.rows[0] });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur ajout tâche.' });
  }
});

// Changer le statut d'une tâche
router.patch('/tasks/:taskId', async (req, res) => {
  try {
    const { status } = req.body;
    const r = await query('UPDATE project_tasks SET status = $1 WHERE id = $2 RETURNING *', [status, req.params.taskId]);
    res.json({ task: r.rows[0] });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erreur mise à jour tâche.' });
  }
});

export default router;
