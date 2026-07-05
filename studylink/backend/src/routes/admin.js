import { Router } from 'express';
import { query, pool } from '../db.js';
import { requireRole } from '../middleware/auth.js';

const router = Router();
router.use(requireRole('admin'));

const slugify = (value='') => value.toString().normalize('NFD').replace(/[\u0300-\u036f]/g,'').toLowerCase().trim().replace(/[^a-z0-9]+/g,'-').replace(/(^-|-$)/g,'') || `item-${Date.now()}`;
const youtubeId = (url='') => {
  try {
    const u = new URL(url);
    if (u.hostname.includes('youtu.be')) return u.pathname.split('/').filter(Boolean)[0] || null;
    if (u.hostname.includes('youtube.com')) return u.searchParams.get('v') || u.pathname.split('/').filter(Boolean).pop() || null;
  } catch {}
  return null;
};
const uniqueSlug = async (table, title, excludeId=null) => {
  const base = slugify(title); let candidate = base; let i=2;
  while (true) {
    const r = await query(`SELECT id FROM ${table} WHERE slug=$1 ${excludeId ? 'AND id<>$2' : ''} LIMIT 1`, excludeId ? [candidate, excludeId] : [candidate]);
    if (!r.rows.length) return candidate;
    candidate = `${base}-${i++}`;
  }
};
const ok = (res, data, status=200) => res.status(status).json(data);
const fail = (res, err, message='Erreur serveur') => { console.error(err); res.status(500).json({error:message}); };

router.get('/dashboard', async (_req,res) => {
  try {
    const names=['users','courses','tutorials','books','bootcamps','personal_programs','entrepreneur_tools'];
    const counts={};
    for (const n of names) { try { counts[n]=Number((await query(`SELECT COUNT(*) AS c FROM ${n}`)).rows[0].c); } catch { counts[n]=0; } }
    ok(res,{counts});
  } catch(e){fail(res,e)}
});
router.get('/categories', async (req,res)=>{ try { const {universe}=req.query; const r=await query(`SELECT * FROM learning_categories ${universe?'WHERE universe=$1':''} ORDER BY sort_order,name`, universe?[universe]:[]); ok(res,{categories:r.rows}); } catch(e){fail(res,e)} });
router.get('/users', async (_req,res)=>{ try { const r=await query(`SELECT id,email,full_name,role,avatar_url,created_at FROM users ORDER BY created_at DESC LIMIT 200`); ok(res,{users:r.rows}); } catch(e){fail(res,e)} });
router.patch('/users/:id/role', async (req,res)=>{ try { const role=req.body.role; if(!['student','tutor','admin'].includes(role)) return res.status(400).json({error:'Rôle invalide'}); const r=await query(`UPDATE users SET role=$1 WHERE id=$2 RETURNING id,email,full_name,role`,[role,req.params.id]); ok(res,{user:r.rows[0]}); } catch(e){fail(res,e)} });

router.get('/courses', async (_req,res)=>{ try { const r=await query(`SELECT c.*,lc.name category_name,u.full_name author_name,(SELECT COUNT(*) FROM course_modules m WHERE m.course_id=c.id) module_count FROM courses c LEFT JOIN learning_categories lc ON lc.id=c.category_id LEFT JOIN users u ON u.id=c.author_id ORDER BY c.created_at DESC`); ok(res,{courses:r.rows}); } catch(e){fail(res,e,'Les tables de cours ne sont pas encore installées. Exécutez la migration SQL.')} });
router.post('/courses', async (req,res)=>{ try { const b=req.body; if(!b.title) return res.status(400).json({error:'Titre requis'}); const slug=await uniqueSlug('courses',b.title); const r=await query(`INSERT INTO courses(author_id,category_id,title,slug,short_description,description,cover_url,level,language,estimated_minutes,price,is_free,status,content_type,objectives,prerequisites,published_at) VALUES($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,CASE WHEN $13='published' THEN now() ELSE NULL END) RETURNING *`,[req.user.id,b.category_id||null,b.title,slug,b.short_description||'',b.description||'',b.cover_url||null,b.level||'beginner',b.language||'fr',Number(b.estimated_minutes)||0,Number(b.price)||0,b.is_free!==false,b.status||'draft',b.content_type||'course',b.objectives||[],b.prerequisites||[]]); ok(res,{course:r.rows[0]},201); } catch(e){fail(res,e)} });
router.put('/courses/:id', async (req,res)=>{ try { const b=req.body; const slug=await uniqueSlug('courses',b.title,req.params.id); const r=await query(`UPDATE courses SET category_id=$1,title=$2,slug=$3,short_description=$4,description=$5,cover_url=$6,level=$7,language=$8,estimated_minutes=$9,price=$10,is_free=$11,status=$12,content_type=$13,objectives=$14,prerequisites=$15,published_at=CASE WHEN $12='published' AND published_at IS NULL THEN now() ELSE published_at END WHERE id=$16 RETURNING *`,[b.category_id||null,b.title,slug,b.short_description||'',b.description||'',b.cover_url||null,b.level||'beginner',b.language||'fr',Number(b.estimated_minutes)||0,Number(b.price)||0,b.is_free!==false,b.status||'draft',b.content_type||'course',b.objectives||[],b.prerequisites||[],req.params.id]); ok(res,{course:r.rows[0]}); } catch(e){fail(res,e)} });
router.delete('/courses/:id', async (req,res)=>{ try { await query('DELETE FROM courses WHERE id=$1',[req.params.id]); ok(res,{ok:true}); } catch(e){fail(res,e)} });
router.get('/courses/:id/structure', async (req,res)=>{ try { const c=(await query('SELECT * FROM courses WHERE id=$1',[req.params.id])).rows[0]; const mods=(await query('SELECT * FROM course_modules WHERE course_id=$1 ORDER BY position',[req.params.id])).rows; for(const m of mods) m.lessons=(await query('SELECT * FROM lessons WHERE module_id=$1 ORDER BY position',[m.id])).rows; ok(res,{course:c,modules:mods}); } catch(e){fail(res,e)} });
router.post('/courses/:id/modules', async (req,res)=>{ try { const b=req.body; const pos=b.position||Number((await query('SELECT COALESCE(MAX(position),0)+1 p FROM course_modules WHERE course_id=$1',[req.params.id])).rows[0].p); const r=await query('INSERT INTO course_modules(course_id,title,description,position) VALUES($1,$2,$3,$4) RETURNING *',[req.params.id,b.title,b.description||'',pos]); ok(res,{module:r.rows[0]},201); } catch(e){fail(res,e)} });
router.delete('/modules/:id', async (req,res)=>{ try { await query('DELETE FROM course_modules WHERE id=$1',[req.params.id]); ok(res,{ok:true}); } catch(e){fail(res,e)} });
router.post('/modules/:id/lessons', async (req,res)=>{ try { const b=req.body; const pos=b.position||Number((await query('SELECT COALESCE(MAX(position),0)+1 p FROM lessons WHERE module_id=$1',[req.params.id])).rows[0].p); const yid=b.lesson_type==='youtube'?youtubeId(b.youtube_url):null; const r=await query(`INSERT INTO lessons(module_id,title,slug,lesson_type,content,youtube_url,youtube_video_id,media_url,duration_seconds,position,is_preview) VALUES($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11) RETURNING *`,[req.params.id,b.title,slugify(b.title),b.lesson_type||'text',b.content||'',b.youtube_url||null,yid,b.media_url||null,Number(b.duration_seconds)||0,pos,!!b.is_preview]); ok(res,{lesson:r.rows[0]},201); } catch(e){fail(res,e)} });
router.delete('/lessons/:id', async (req,res)=>{ try { await query('DELETE FROM lessons WHERE id=$1',[req.params.id]); ok(res,{ok:true}); } catch(e){fail(res,e)} });

router.get('/tutorials', async (_req,res)=>{ try { const r=await query(`SELECT t.*,lc.name category_name,(SELECT COUNT(*) FROM tutorial_steps s WHERE s.tutorial_id=t.id) step_count FROM tutorials t LEFT JOIN learning_categories lc ON lc.id=t.category_id ORDER BY t.created_at DESC`); ok(res,{tutorials:r.rows}); } catch(e){fail(res,e)} });
router.post('/tutorials', async (req,res)=>{ try { const b=req.body, slug=await uniqueSlug('tutorials',b.title); const r=await query(`INSERT INTO tutorials(author_id,category_id,title,slug,description,cover_url,level,language,estimated_minutes,status) VALUES($1,$2,$3,$4,$5,$6,$7,$8,$9,$10) RETURNING *`,[req.user.id,b.category_id||null,b.title,slug,b.description||'',b.cover_url||null,b.level||'beginner',b.language||'fr',Number(b.estimated_minutes)||0,b.status||'draft']); ok(res,{tutorial:r.rows[0]},201); } catch(e){fail(res,e)} });
router.post('/tutorials/:id/steps', async (req,res)=>{ try { const b=req.body; const pos=b.position||Number((await query('SELECT COALESCE(MAX(position),0)+1 p FROM tutorial_steps WHERE tutorial_id=$1',[req.params.id])).rows[0].p); const r=await query(`INSERT INTO tutorial_steps(tutorial_id,title,content,youtube_url,youtube_video_id,image_url,resource_url,estimated_minutes,position) VALUES($1,$2,$3,$4,$5,$6,$7,$8,$9) RETURNING *`,[req.params.id,b.title,b.content||'',b.youtube_url||null,youtubeId(b.youtube_url),b.image_url||null,b.resource_url||null,Number(b.estimated_minutes)||0,pos]); ok(res,{step:r.rows[0]},201); } catch(e){fail(res,e)} });
router.delete('/tutorials/:id', async (req,res)=>{ try { await query('DELETE FROM tutorials WHERE id=$1',[req.params.id]); ok(res,{ok:true}); } catch(e){fail(res,e)} });

router.get('/books', async (_req,res)=>{ try { const r=await query(`SELECT b.*,lc.name category_name FROM books b LEFT JOIN learning_categories lc ON lc.id=b.category_id ORDER BY b.created_at DESC`); ok(res,{books:r.rows}); } catch(e){fail(res,e)} });
router.post('/books', async (req,res)=>{ try { const b=req.body, slug=await uniqueSlug('books',b.title); const r=await query(`INSERT INTO books(uploaded_by,category_id,title,slug,author_name,description,cover_url,file_url,audio_url,file_type,language,page_count,is_free,rights_status,status) VALUES($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15) RETURNING *`,[req.user.id,b.category_id||null,b.title,slug,b.author_name||'',b.description||'',b.cover_url||null,b.file_url||null,b.audio_url||null,b.file_type||'pdf',b.language||'fr',Number(b.page_count)||null,b.is_free!==false,b.rights_status||'licensed',b.status||'draft']); ok(res,{book:r.rows[0]},201); } catch(e){fail(res,e)} });
router.delete('/books/:id', async (req,res)=>{ try { await query('DELETE FROM books WHERE id=$1',[req.params.id]); ok(res,{ok:true}); } catch(e){fail(res,e)} });

router.get('/bootcamps', async (_req,res)=>{ try { const r=await query(`SELECT b.*,u.full_name tutor_name FROM bootcamps b JOIN tutor_profiles tp ON tp.id=b.tutor_id JOIN users u ON u.id=tp.user_id ORDER BY b.created_at DESC`); ok(res,{bootcamps:r.rows}); } catch(e){fail(res,e)} });
router.post('/bootcamps', async (req,res)=>{ const client=await pool.connect(); try { const b=req.body; await client.query('BEGIN'); let tp=(await client.query('SELECT id FROM tutor_profiles WHERE user_id=$1',[req.user.id])).rows[0]; if(!tp){ tp=(await client.query(`INSERT INTO tutor_profiles(user_id,headline,hourly_rate,mastery_level,years_experience) VALUES($1,'Administrateur',0,'Expert',0) RETURNING id`,[req.user.id])).rows[0]; } const slug=await uniqueSlug('bootcamps',b.title); const r=await client.query(`INSERT INTO bootcamps(tutor_id,category_id,title,slug,description,cover_url,level,language,mode,location,start_at,end_at,max_participants,is_free,status,meeting_url,replay_url) VALUES($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17) RETURNING *`,[tp.id,b.category_id||null,b.title,slug,b.description||'',b.cover_url||null,b.level||'all',b.language||'fr',b.mode||'online',b.location||null,b.start_at||null,b.end_at||null,Number(b.max_participants)||null,b.is_free!==false,b.status||'project',b.meeting_url||null,b.replay_url||null]); await client.query('COMMIT'); ok(res,{bootcamp:r.rows[0]},201); } catch(e){ await client.query('ROLLBACK'); fail(res,e); } finally{client.release()} });
router.delete('/bootcamps/:id', async (req,res)=>{ try { await query('DELETE FROM bootcamps WHERE id=$1',[req.params.id]); ok(res,{ok:true}); } catch(e){fail(res,e)} });

router.get('/personal-programs', async (_req,res)=>{ try { const r=await query('SELECT * FROM personal_programs ORDER BY created_at DESC'); ok(res,{programs:r.rows}); } catch(e){fail(res,e)} });
router.post('/personal-programs', async (req,res)=>{ try { const b=req.body, slug=await uniqueSlug('personal_programs',b.title); const r=await query(`INSERT INTO personal_programs(author_id,category_id,title,slug,description,cover_url,duration_days,level,status) VALUES($1,$2,$3,$4,$5,$6,$7,$8,$9) RETURNING *`,[req.user.id,b.category_id||null,b.title,slug,b.description||'',b.cover_url||null,Number(b.duration_days)||30,b.level||'all',b.status||'draft']); ok(res,{program:r.rows[0]},201); } catch(e){fail(res,e)} });
router.post('/personal-programs/:id/days', async (req,res)=>{ try { const b=req.body; const r=await query(`INSERT INTO personal_program_days(program_id,day_number,title,description,video_url,youtube_video_id) VALUES($1,$2,$3,$4,$5,$6) RETURNING *`,[req.params.id,Number(b.day_number),b.title,b.description||'',b.video_url||null,youtubeId(b.video_url)]); ok(res,{day:r.rows[0]},201); } catch(e){fail(res,e)} });
router.delete('/personal-programs/:id', async (req,res)=>{ try { await query('DELETE FROM personal_programs WHERE id=$1',[req.params.id]); ok(res,{ok:true}); } catch(e){fail(res,e)} });

router.get('/entrepreneur-tools', async (_req,res)=>{ try { const r=await query('SELECT * FROM entrepreneur_tools ORDER BY created_at DESC'); ok(res,{tools:r.rows}); } catch(e){fail(res,e)} });
router.post('/entrepreneur-tools', async (req,res)=>{ try { const b=req.body, slug=await uniqueSlug('entrepreneur_tools',b.title); const r=await query(`INSERT INTO entrepreneur_tools(title,slug,description,category,file_type,file_url,cover_url,is_free,status) VALUES($1,$2,$3,$4,$5,$6,$7,$8,$9) RETURNING *`,[b.title,slug,b.description||'',b.category||'Modèles',b.file_type||'link',b.file_url||null,b.cover_url||null,b.is_free!==false,b.status||'draft']); ok(res,{tool:r.rows[0]},201); } catch(e){fail(res,e)} });
router.delete('/entrepreneur-tools/:id', async (req,res)=>{ try { await query('DELETE FROM entrepreneur_tools WHERE id=$1',[req.params.id]); ok(res,{ok:true}); } catch(e){fail(res,e)} });

export default router;
