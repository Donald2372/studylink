import { Router } from 'express';
import { query, pool } from '../db.js';
import { requireAuth } from '../middleware/auth.js';

const router = Router();
const ok = (res, data, status = 200) => res.status(status).json(data);
const fail = (res, e, status = 500) => {
  console.error(e);
  res.status(e.status || status).json({ error: e.message || 'Erreur serveur.' });
};

function whereSearch(q, fields, values) {
  const term = (q || '').toString().trim();
  if (!term) return '';
  values.push(`%${term}%`);
  const i = values.length;
  return ` AND (${fields.map((f) => `${f} ILIKE $${i}`).join(' OR ')})`;
}

async function resolvePublishedCourse(identifier) {
  return (await query(`
    SELECT c.*, lc.name AS category_name, u.full_name AS author_name, u.avatar_url AS author_avatar_url,
      (SELECT COUNT(*) FROM course_enrollments ce WHERE ce.course_id=c.id) AS enrollment_count,
      (SELECT COUNT(*) FROM course_modules cm WHERE cm.course_id=c.id) AS module_count,
      (SELECT COUNT(*) FROM lessons l JOIN course_modules cm ON cm.id=l.module_id WHERE cm.course_id=c.id) AS lesson_count
    FROM courses c
    LEFT JOIN learning_categories lc ON lc.id=c.category_id
    LEFT JOIN users u ON u.id=c.author_id
    WHERE (c.id::text=$1 OR c.slug=$1) AND c.status='published'
    LIMIT 1`, [identifier])).rows[0];
}

async function loadCourseStructure(courseId) {
  const modules = (await query('SELECT * FROM course_modules WHERE course_id=$1 ORDER BY position', [courseId])).rows;
  for (const m of modules) {
    m.lessons = (await query(`SELECT l.*,
      (SELECT COUNT(*) FROM lesson_resources lr WHERE lr.lesson_id=l.id) AS resource_count
      FROM lessons l WHERE l.module_id=$1 ORDER BY l.position`, [m.id])).rows;
    for (const lesson of m.lessons) {
      lesson.resources = (await query('SELECT * FROM lesson_resources WHERE lesson_id=$1 ORDER BY created_at', [lesson.id])).rows;
    }
  }
  return modules;
}

// -----------------------------------------------------------------------------
// CATALOGUE / COURS PUBLICS
// -----------------------------------------------------------------------------
router.get('/courses', async (req, res) => {
  try {
    const values = [];
    let sql = `
      SELECT
        c.*,
        lc.name AS category_name,
        u.full_name AS author_name,
        u.avatar_url AS author_avatar_url,
        (SELECT COUNT(*) FROM course_modules m WHERE m.course_id=c.id) AS module_count,
        (SELECT COUNT(*) FROM course_files cf WHERE cf.course_id=c.id) AS file_count,
        (SELECT COUNT(*) FROM course_enrollments ce WHERE ce.course_id=c.id) AS enrollment_count
      FROM courses c
      LEFT JOIN learning_categories lc ON lc.id=c.category_id
      LEFT JOIN users u ON u.id=c.author_id
      WHERE c.status='published'
    `;
    sql += whereSearch(req.query.q, ['c.title', "COALESCE(c.short_description,'')", "COALESCE(c.description,'')", "COALESCE(lc.name,'')"], values);
    sql += ' ORDER BY COALESCE(c.published_at,c.created_at) DESC LIMIT 200';
    const result = await query(sql, values);
    ok(res, { courses: result.rows });
  } catch (e) { fail(res, e); }
});

router.get('/courses/:id', async (req, res) => {
  try {
    const course = await resolvePublishedCourse(req.params.id);
    if (!course) return res.status(404).json({ error: 'Cours introuvable ou non publié.' });
    const modules = await loadCourseStructure(course.id);
    const files = (await query('SELECT * FROM course_files WHERE course_id=$1 ORDER BY created_at DESC', [course.id])).rows;
    ok(res, { course, modules, files });
  } catch (e) { fail(res, e); }
});

router.get('/courses/:id/learning', requireAuth, async (req, res) => {
  try {
    const course = await resolvePublishedCourse(req.params.id);
    if (!course) return res.status(404).json({ error: 'Cours introuvable ou non publié.' });
    const enrollment = (await query('SELECT * FROM course_enrollments WHERE course_id=$1 AND user_id=$2 LIMIT 1', [course.id, req.user.id])).rows[0] || null;
    const progress = (await query(`SELECT lp.* FROM lesson_progress lp
      JOIN lessons l ON l.id=lp.lesson_id JOIN course_modules cm ON cm.id=l.module_id
      WHERE cm.course_id=$1 AND lp.user_id=$2`, [course.id, req.user.id])).rows;
    const notes = (await query(`SELECT ln.* FROM lesson_notes ln
      JOIN lessons l ON l.id=ln.lesson_id JOIN course_modules cm ON cm.id=l.module_id
      WHERE cm.course_id=$1 AND ln.user_id=$2 ORDER BY ln.updated_at DESC`, [course.id, req.user.id])).rows;
    ok(res, { enrollment, progress, notes });
  } catch (e) { fail(res, e); }
});

router.post('/courses/:id/enroll', requireAuth, async (req, res) => {
  try {
    const course = await resolvePublishedCourse(req.params.id);
    if (!course) return res.status(404).json({ error: 'Cours introuvable ou non publié.' });
    const r = await query(`INSERT INTO course_enrollments(user_id,course_id,status)
      VALUES($1,$2,'active') ON CONFLICT (course_id,user_id) DO UPDATE SET status='active', updated_at=now()
      RETURNING *`, [req.user.id, course.id]);
    ok(res, { enrollment: r.rows[0] }, 201);
  } catch (e) { fail(res, e); }
});

router.get('/my/learning', requireAuth, async (req, res) => {
  try {
    const r = await query(`SELECT ce.*, c.title, c.cover_url, c.level, lc.name AS category_name,
      COALESCE((SELECT ROUND(AVG(CASE WHEN lp.status='completed' THEN 100 ELSE COALESCE(lp.progress_percent,0) END))
        FROM lesson_progress lp JOIN lessons l ON l.id=lp.lesson_id JOIN course_modules cm ON cm.id=l.module_id
        WHERE cm.course_id=c.id AND lp.user_id=$1),0) AS progress_percent
      FROM course_enrollments ce
      JOIN courses c ON c.id=ce.course_id
      LEFT JOIN learning_categories lc ON lc.id=c.category_id
      WHERE ce.user_id=$1
      ORDER BY ce.updated_at DESC`, [req.user.id]);
    ok(res, { enrollments: r.rows });
  } catch (e) { fail(res, e); }
});

router.post('/lessons/:id/progress', requireAuth, async (req, res) => {
  try {
    const percent = Math.max(0, Math.min(100, Number(req.body.progress_percent ?? 0)));
    const completed = Boolean(req.body.completed) || percent >= 100;
    const status = completed ? 'completed' : (percent > 0 ? 'in_progress' : 'not_started');
    const lesson = (await query(`SELECT l.id, cm.course_id FROM lessons l JOIN course_modules cm ON cm.id=l.module_id WHERE l.id=$1`, [req.params.id])).rows[0];
    if (!lesson) return res.status(404).json({ error: 'Leçon introuvable.' });
    const r = await query(`INSERT INTO lesson_progress(user_id,lesson_id,progress_percent,progress_seconds,status,completed_at)
      VALUES($1,$2,$3,$4,$5,CASE WHEN $5='completed' THEN now() ELSE NULL END)
      ON CONFLICT (user_id,lesson_id)
      DO UPDATE SET progress_percent=$3,progress_seconds=$4,status=$5,
        completed_at=CASE WHEN $5='completed' THEN COALESCE(lesson_progress.completed_at,now()) ELSE NULL END,
        updated_at=now()
      RETURNING *`, [req.user.id, req.params.id, percent, Number(req.body.last_position_seconds)||0, status]);

    await query(`INSERT INTO course_enrollments(user_id,course_id,status,last_lesson_id)
      VALUES($1,$2,'active',$3)
      ON CONFLICT (course_id,user_id) DO UPDATE SET last_lesson_id=$3, status='active', updated_at=now()`, [req.user.id, lesson.course_id, lesson.id]);
    const aggregate = (await query(`SELECT COALESCE(ROUND(AVG(COALESCE(lp.progress_percent,0))),0) AS progress
      FROM lessons l JOIN course_modules cm ON cm.id=l.module_id
      LEFT JOIN lesson_progress lp ON lp.lesson_id=l.id AND lp.user_id=$1
      WHERE cm.course_id=$2`, [req.user.id, lesson.course_id])).rows[0];
    const courseProgress = Number(aggregate?.progress || 0);
    await query(`UPDATE course_enrollments SET progress_percent=$1,
      status=CASE WHEN $1>=100 THEN 'completed' ELSE 'active' END,
      completed_at=CASE WHEN $1>=100 THEN COALESCE(completed_at,now()) ELSE NULL END,
      updated_at=now() WHERE course_id=$2 AND user_id=$3`, [courseProgress, lesson.course_id, req.user.id]);
    ok(res, { progress: r.rows[0], course_progress_percent: courseProgress });
  } catch (e) { fail(res, e); }
});

router.post('/lessons/:id/notes', requireAuth, async (req, res) => {
  try {
    const content = (req.body.content || '').toString().trim();
    if (!content) {
      await query('DELETE FROM lesson_notes WHERE lesson_id=$1 AND user_id=$2', [req.params.id, req.user.id]);
      return ok(res, { note: null });
    }
    const existing = (await query('SELECT id FROM lesson_notes WHERE lesson_id=$1 AND user_id=$2 ORDER BY updated_at DESC LIMIT 1', [req.params.id, req.user.id])).rows[0];
    const result = existing
      ? await query('UPDATE lesson_notes SET content=$1,updated_at=now() WHERE id=$2 RETURNING *', [content, existing.id])
      : await query('INSERT INTO lesson_notes(lesson_id,user_id,content) VALUES($1,$2,$3) RETURNING *', [req.params.id, req.user.id, content]);
    ok(res, { note: result.rows[0] });
  } catch (e) { fail(res, e); }
});

// -----------------------------------------------------------------------------
// DOCUMENTS PUBLICS
// -----------------------------------------------------------------------------
router.get('/materials', async (req, res) => {
  try {
    const values = [];
    let sql = `
      SELECT cf.id, cf.title, cf.file_url, cf.file_name, cf.mime_type, cf.file_size, cf.created_at,
        c.id AS course_id, c.title AS course_title, c.cover_url AS course_cover_url,
        c.level, c.language, lc.name AS category_name, u.full_name AS uploaded_by_name, 'course'::text AS source_type
      FROM course_files cf
      JOIN courses c ON c.id = cf.course_id
      LEFT JOIN learning_categories lc ON lc.id = c.category_id
      LEFT JOIN users u ON u.id = cf.uploaded_by
      WHERE c.status='published'
    `;
    sql += whereSearch(req.query.q, ['cf.title', 'cf.file_name', 'c.title', "COALESCE(lc.name,'')"], values);
    sql += ' ORDER BY cf.created_at DESC LIMIT 300';
    const result = await query(sql, values);
    ok(res, { materials: result.rows });
  } catch (e) { fail(res, e); }
});

// -----------------------------------------------------------------------------
// TUTORIELS PUBLICS
// -----------------------------------------------------------------------------
router.get('/tutorials', async (req, res) => {
  try {
    const values = [];
    let sql = `SELECT t.*, lc.name AS category_name, u.full_name AS author_name,
        (SELECT COUNT(*) FROM tutorial_steps s WHERE s.tutorial_id=t.id) AS step_count,
        (SELECT s.youtube_video_id FROM tutorial_steps s WHERE s.tutorial_id=t.id AND s.youtube_video_id IS NOT NULL ORDER BY s.position LIMIT 1) AS youtube_video_id
      FROM tutorials t
      LEFT JOIN learning_categories lc ON lc.id=t.category_id
      LEFT JOIN users u ON u.id=t.author_id
      WHERE t.status='published'`;
    sql += whereSearch(req.query.q, ['t.title', "COALESCE(t.description,'')", "COALESCE(lc.name,'')"], values);
    sql += ' ORDER BY t.created_at DESC LIMIT 200';
    const result = await query(sql, values);
    ok(res, { tutorials: result.rows });
  } catch (e) { fail(res, e); }
});

router.get('/tutorials/:id', async (req, res) => {
  try {
    const tutorial = (await query(`SELECT t.*, lc.name AS category_name, u.full_name AS author_name
      FROM tutorials t LEFT JOIN learning_categories lc ON lc.id=t.category_id LEFT JOIN users u ON u.id=t.author_id
      WHERE t.id=$1 AND t.status='published' LIMIT 1`, [req.params.id])).rows[0];
    if (!tutorial) return res.status(404).json({ error: 'Tutoriel introuvable ou non publié.' });
    const steps = (await query('SELECT * FROM tutorial_steps WHERE tutorial_id=$1 ORDER BY position ASC', [req.params.id])).rows;
    ok(res, { tutorial, steps });
  } catch (e) { fail(res, e); }
});

// -----------------------------------------------------------------------------
// FORUM PUBLIC + ACTIONS UTILISATEUR
// -----------------------------------------------------------------------------
router.get('/forum/categories', async (_req, res) => {
  try {
    const categories = (await query('SELECT * FROM forum_categories ORDER BY name')).rows;
    ok(res, { categories });
  } catch (e) { fail(res, e); }
});

router.get('/forum/topics', async (req, res) => {
  try {
    const values = [];
    let sql = `SELECT ft.*, fc.name AS category_name, u.full_name AS author_name, u.avatar_url AS author_avatar_url,
      (SELECT COUNT(*) FROM forum_posts fp WHERE fp.topic_id=ft.id) AS reply_count
      FROM forum_topics ft
      LEFT JOIN forum_categories fc ON fc.id=ft.category_id
      LEFT JOIN users u ON u.id=ft.author_id
      WHERE ft.status='open'`;
    if (req.query.category_id) { values.push(req.query.category_id); sql += ` AND ft.category_id=$${values.length}`; }
    sql += whereSearch(req.query.q, ['ft.title', "COALESCE(ft.content,'')", "COALESCE(fc.name,'')"], values);
    sql += ' ORDER BY ft.last_activity_at DESC LIMIT 200';
    const topics = (await query(sql, values)).rows;
    ok(res, { topics });
  } catch (e) { fail(res, e); }
});

router.get('/forum/topics/:id', async (req, res) => {
  try {
    const topic = (await query(`SELECT ft.*, fc.name AS category_name, u.full_name AS author_name, u.avatar_url AS author_avatar_url
      FROM forum_topics ft LEFT JOIN forum_categories fc ON fc.id=ft.category_id LEFT JOIN users u ON u.id=ft.author_id
      WHERE ft.id=$1`, [req.params.id])).rows[0];
    if (!topic) return res.status(404).json({ error: 'Discussion introuvable.' });
    const posts = (await query(`SELECT fp.*, u.full_name AS author_name, u.avatar_url AS author_avatar_url
      FROM forum_posts fp LEFT JOIN users u ON u.id=fp.author_id WHERE fp.topic_id=$1 ORDER BY fp.created_at`, [req.params.id])).rows;
    ok(res, { topic, posts });
  } catch (e) { fail(res, e); }
});

router.post('/forum/topics', requireAuth, async (req, res) => {
  try {
    const { category_id, title, content } = req.body;
    if (!title?.trim()) return res.status(400).json({ error: 'Titre requis.' });
    const r = await query(`INSERT INTO forum_topics(category_id,author_id,title,content,last_activity_at) VALUES($1,$2,$3,$4,now()) RETURNING *`, [category_id || null, req.user.id, title.trim(), content || '']);
    ok(res, { topic: r.rows[0] }, 201);
  } catch (e) { fail(res, e); }
});

router.post('/forum/topics/:id/posts', requireAuth, async (req, res) => {
  try {
    const { content } = req.body;
    if (!content?.trim()) return res.status(400).json({ error: 'Message requis.' });
    const client = await pool.connect();
    try {
      await client.query('BEGIN');
      const r = await client.query('INSERT INTO forum_posts(topic_id,author_id,content) VALUES($1,$2,$3) RETURNING *', [req.params.id, req.user.id, content.trim()]);
      await client.query('UPDATE forum_topics SET last_activity_at=now() WHERE id=$1', [req.params.id]);
      await client.query('COMMIT');
      ok(res, { post: r.rows[0] }, 201);
    } catch (e) { await client.query('ROLLBACK'); throw e; } finally { client.release(); }
  } catch (e) { fail(res, e); }
});

// -----------------------------------------------------------------------------
// BOOTCAMPS
// -----------------------------------------------------------------------------
router.get('/bootcamps', async (req, res) => {
  try {
    const values = [];
    let sql = `SELECT b.*, lc.name AS category_name, u.full_name AS tutor_name, u.avatar_url AS tutor_avatar_url,
      (SELECT COUNT(*) FROM bootcamp_registrations br WHERE br.bootcamp_id=b.id AND br.status='registered') AS registered_count
      FROM bootcamps b
      LEFT JOIN learning_categories lc ON lc.id=b.category_id
      JOIN tutor_profiles tp ON tp.id=b.tutor_id
      JOIN users u ON u.id=tp.user_id
      WHERE b.status IN ('project','upcoming','ongoing','completed')`;
    sql += whereSearch(req.query.q, ['b.title', "COALESCE(b.description,'')", "COALESCE(lc.name,'')"], values);
    sql += ' ORDER BY b.start_at NULLS LAST, b.created_at DESC LIMIT 200';
    ok(res, { bootcamps: (await query(sql, values)).rows });
  } catch (e) { fail(res, e); }
});

router.post('/bootcamps/:id/register', requireAuth, async (req, res) => {
  try {
    const r = await query(`INSERT INTO bootcamp_registrations(bootcamp_id,user_id,status) VALUES($1,$2,'registered')
      ON CONFLICT (bootcamp_id,user_id) DO UPDATE SET status='registered', registered_at=now()
      RETURNING *`, [req.params.id, req.user.id]);
    ok(res, { registration: r.rows[0] }, 201);
  } catch (e) { fail(res, e); }
});

// -----------------------------------------------------------------------------
// DEVELOPPEMENT PERSONNEL / LIVRES
// -----------------------------------------------------------------------------
router.get('/personal-programs', async (req, res) => {
  try {
    const values = [];
    let sql = `SELECT pp.*, lc.name AS category_name, u.full_name AS author_name
      FROM personal_programs pp LEFT JOIN learning_categories lc ON lc.id=pp.category_id LEFT JOIN users u ON u.id=pp.author_id
      WHERE pp.status='published'`;
    sql += whereSearch(req.query.q, ['pp.title', "COALESCE(pp.description,'')", "COALESCE(lc.name,'')"], values);
    sql += ' ORDER BY pp.created_at DESC LIMIT 200';
    ok(res, { programs: (await query(sql, values)).rows });
  } catch (e) { fail(res, e); }
});

router.get('/personal-programs/:id', async (req, res) => {
  try {
    const program = (await query('SELECT * FROM personal_programs WHERE id=$1 AND status=$2', [req.params.id, 'published'])).rows[0];
    if (!program) return res.status(404).json({ error: 'Programme introuvable.' });
    const days = (await query('SELECT * FROM personal_program_days WHERE program_id=$1 ORDER BY day_number', [req.params.id])).rows;
    ok(res, { program, days });
  } catch (e) { fail(res, e); }
});

router.post('/personal-programs/:id/start', requireAuth, async (req, res) => {
  try {
    const r = await query(`INSERT INTO personal_program_enrollments(user_id,program_id,status) VALUES($1,$2,'active')
      ON CONFLICT (program_id,user_id) DO UPDATE SET status='active', updated_at=now()
      RETURNING *`, [req.user.id, req.params.id]);
    ok(res, { enrollment: r.rows[0] }, 201);
  } catch (e) { fail(res, e); }
});

router.get('/books', async (req, res) => {
  try {
    const values = [];
    let sql = `SELECT b.*, lc.name AS category_name, u.full_name AS uploaded_by_name
      FROM books b LEFT JOIN learning_categories lc ON lc.id=b.category_id LEFT JOIN users u ON u.id=b.uploaded_by
      WHERE b.status='published'`;
    sql += whereSearch(req.query.q, ['b.title', "COALESCE(b.author_name,'')", "COALESCE(b.description,'')", "COALESCE(lc.name,'')"], values);
    sql += ' ORDER BY b.created_at DESC LIMIT 200';
    ok(res, { books: (await query(sql, values)).rows });
  } catch (e) { fail(res, e); }
});

router.get('/books/:id', async (req, res) => {
  try {
    const book = (await query('SELECT * FROM books WHERE id=$1 AND status=$2', [req.params.id, 'published'])).rows[0];
    if (!book) return res.status(404).json({ error: 'Livre introuvable.' });
    ok(res, { book });
  } catch (e) { fail(res, e); }
});

router.post('/books/:id/progress', requireAuth, async (req, res) => {
  try {
    const r = await query(`INSERT INTO book_progress(user_id,book_id,current_page,progress_percent,font_size,night_mode)
      VALUES($1,$2,$3,$4,$5,$6)
      ON CONFLICT (book_id,user_id) DO UPDATE SET current_page=$3,progress_percent=$4,font_size=$5,night_mode=$6,updated_at=now()
      RETURNING *`, [req.user.id, req.params.id, Number(req.body.current_page)||1, Number(req.body.progress_percent)||0, req.body.font_size || 'medium', !!req.body.night_mode]);
    ok(res, { progress: r.rows[0] });
  } catch (e) { fail(res, e); }
});

// -----------------------------------------------------------------------------
// ENTREPRENEURIAT
// -----------------------------------------------------------------------------
router.get('/entrepreneur-tools', async (req, res) => {
  try {
    const values = [];
    let sql = `SELECT * FROM entrepreneur_tools WHERE status='published'`;
    sql += whereSearch(req.query.q, ['title', "COALESCE(description,'')", "COALESCE(category,'')"], values);
    sql += ' ORDER BY created_at DESC LIMIT 200';
    ok(res, { tools: (await query(sql, values)).rows });
  } catch (e) { fail(res, e); }
});

router.get('/entrepreneur-projects/me', requireAuth, async (req, res) => {
  try {
    let project = (await query('SELECT * FROM entrepreneur_projects WHERE user_id=$1 ORDER BY created_at DESC LIMIT 1', [req.user.id])).rows[0];
    if (!project) {
      project = (await query(`INSERT INTO entrepreneur_projects(user_id,name,idea,stage,status,budget_total)
        VALUES($1,'Mon projet entrepreneurial','Décrivez votre idée ici','idea','active',10000) RETURNING *`, [req.user.id])).rows[0];
      const tasks = ['Étude de marché','Création du logo','Rédaction du business plan','Recherche des premiers clients'];
      for (let i=0;i<tasks.length;i++) await query('INSERT INTO entrepreneur_project_tasks(project_id,title,position,status) VALUES($1,$2,$3,$4)', [project.id, tasks[i], i+1, i<2?'done':'todo']);
    }
    const tasks = (await query('SELECT * FROM entrepreneur_project_tasks WHERE project_id=$1 ORDER BY position', [project.id])).rows;
    const goals = (await query('SELECT * FROM entrepreneur_project_goals WHERE project_id=$1 ORDER BY created_at', [project.id])).rows;
    const budget = (await query('SELECT * FROM entrepreneur_budget_entries WHERE project_id=$1 ORDER BY entry_date DESC', [project.id])).rows;
    const docs = (await query('SELECT * FROM entrepreneur_project_documents WHERE project_id=$1 ORDER BY created_at DESC', [project.id])).rows;
    ok(res, { project, tasks, goals, budget, documents: docs });
  } catch (e) { fail(res, e); }
});

router.patch('/entrepreneur-tasks/:id', requireAuth, async (req, res) => {
  try {
    const status = req.body.status === 'done' ? 'done' : 'todo';
    const r = await query(`UPDATE entrepreneur_project_tasks t SET status=$1, completed_at=CASE WHEN $1='done' THEN now() ELSE NULL END, updated_at=now()
      FROM entrepreneur_projects p WHERE t.project_id=p.id AND p.user_id=$2 AND t.id=$3 RETURNING t.*`, [status, req.user.id, req.params.id]);
    if (!r.rows[0]) return res.status(404).json({ error: 'Tâche introuvable.' });
    ok(res, { task: r.rows[0] });
  } catch (e) { fail(res, e); }
});

// -----------------------------------------------------------------------------
// NOTIFICATIONS UTILISATEUR
// -----------------------------------------------------------------------------
router.get('/notifications', requireAuth, async (req, res) => {
  try {
    const r = await query('SELECT * FROM notifications WHERE user_id=$1 ORDER BY created_at DESC LIMIT 200', [req.user.id]);
    ok(res, { notifications: r.rows });
  } catch (e) { fail(res, e); }
});

router.patch('/notifications/:id/read', requireAuth, async (req, res) => {
  try {
    await query('UPDATE notifications SET read_at=now() WHERE id=$1 AND user_id=$2', [req.params.id, req.user.id]);
    ok(res, { ok: true });
  } catch (e) { fail(res, e); }
});

export default router;
