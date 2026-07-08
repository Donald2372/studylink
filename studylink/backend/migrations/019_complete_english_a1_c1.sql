-- StudyLink 019 - Anglais complet A1 a C1
-- Migration idempotente : cree le cours, 5 modules CECRL, 60 lecons et videos YouTube integrees.
DO $$
DECLARE
  v_author UUID;
  v_cat INTEGER;
  v_course UUID;
  v_module UUID;
  v_lesson UUID;
  v_level JSONB;
  v_unit JSONB;
  v_levels JSONB := '[
    {"cefr":"A1","title":"A1 - Foundations","video_ids":["I_tRSrPru94","I_tRSrPru94","SHXPpsIJTb0"],"units":[
      {"title":"Meeting People","grammar":"be, subject pronouns, possessive adjectives","scenario":"You meet a new classmate at an international language school.","vocab":"first name, surname, country, city, job, student, teacher, phone number"},
      {"title":"Daily Life","grammar":"present simple, adverbs of frequency","scenario":"You describe your normal day and ask someone about their routine.","vocab":"wake up, commute, breakfast, usually, sometimes, never, weekday, weekend"},
      {"title":"Around Town","grammar":"there is / there are, prepositions of place","scenario":"You ask for directions and describe places in a city.","vocab":"station, pharmacy, corner, opposite, next to, near, left, right"}]},
    {"cefr":"A2","title":"A2 - Everyday Communication","video_ids":["PgsG98vByiw","bVRIpmjTSxM","FAhpT7BH7GE"],"units":[
      {"title":"Past Experiences","grammar":"past simple, regular and irregular verbs","scenario":"You tell a friend about a weekend trip.","vocab":"visited, met, bought, went, yesterday, last week, ago, trip"},
      {"title":"Food and Shopping","grammar":"countable and uncountable nouns, some / any, much / many","scenario":"You buy food, ask about prices and order in a cafe.","vocab":"receipt, discount, fresh, spicy, a bottle of, a piece of, cheap, expensive"},
      {"title":"Comparing Choices","grammar":"comparatives, superlatives, too / enough","scenario":"You compare apartments, phones and transport options.","vocab":"faster, more comfortable, the cheapest, crowded, quiet, modern, safe, convenient"}]},
    {"cefr":"B1","title":"B1 - Independent English","video_ids":["jwmKjgwlMk8","elPHkXNxi2g","O-jJPd5ZYo4"],"units":[
      {"title":"Work and Study","grammar":"present perfect, for / since, already / yet","scenario":"You talk about studies, work experience and current goals.","vocab":"deadline, assignment, colleague, experience, apply, improve, skill, feedback"},
      {"title":"Making Plans","grammar":"will, going to, present continuous for future","scenario":"You organize a meeting and explain future intentions.","vocab":"appointment, schedule, reschedule, probably, definitely, arrangement, available, plan"},
      {"title":"Giving Advice","grammar":"should, have to, must, first conditional","scenario":"You give practical advice about learning, health and work.","vocab":"recommend, avoid, healthy, stressful, solution, choice, risk, benefit"}]},
    {"cefr":"B2","title":"B2 - Fluent Communication","video_ids":["D58LCh_1jmM","7GSrQ4DX8gY","uDoBdq0s8eY"],"units":[
      {"title":"Debating Ideas","grammar":"linking words, concession, contrast","scenario":"You discuss remote work, technology and education.","vocab":"however, although, evidence, claim, impact, concern, trade-off, perspective"},
      {"title":"Professional English","grammar":"passive voice, formal register","scenario":"You present a project update in a meeting.","vocab":"proposal, stakeholder, timeline, deliverable, budget, approved, implemented, reviewed"},
      {"title":"Hypothetical Situations","grammar":"second and third conditionals","scenario":"You analyze decisions and imagine different outcomes.","vocab":"opportunity, regret, alternative, outcome, investment, decision, strategy, assumption"}]},
    {"cefr":"C1","title":"C1 - Advanced Mastery","video_ids":["VxQNOXpoLC8","LEi8Cs2z0Q4","K-Nps59NeBA"],"units":[
      {"title":"Nuance and Precision","grammar":"hedging, emphasis, inversion","scenario":"You present a balanced analysis of an important social issue.","vocab":"arguably, subtle, compelling, nevertheless, scope, assumption, robust, drawback"},
      {"title":"Academic and Professional Writing","grammar":"nominalisation, complex noun phrases, cohesion","scenario":"You summarize research findings for a professional audience.","vocab":"framework, methodology, findings, implications, therefore, whereas, in light of, notwithstanding"},
      {"title":"Persuasive Speaking","grammar":"rhetorical questions, signposting, advanced discourse markers","scenario":"You deliver a five-minute persuasive talk and answer follow-up questions.","vocab":"persuade, resonate, audience, credibility, evidence-based, call to action, memorable, concise"}]}
  ]'::jsonb;
  v_level_index INTEGER := 0;
  v_unit_index INTEGER := 0;
  v_video_id TEXT;
  v_base_content TEXT;
BEGIN
  SELECT id INTO v_author FROM public.users ORDER BY CASE WHEN role='admin' THEN 0 ELSE 1 END, created_at LIMIT 1;
  IF v_author IS NULL THEN RAISE EXCEPTION 'Aucun utilisateur existe. Creez d abord un compte StudyLink.'; END IF;

  INSERT INTO public.learning_categories(name,slug,description)
  SELECT 'Langues','langues','Cours de langues, communication et preparation CECRL'
  WHERE NOT EXISTS (SELECT 1 FROM public.learning_categories WHERE name='Langues');
  SELECT id INTO v_cat FROM public.learning_categories WHERE name='Langues' ORDER BY id LIMIT 1;

  INSERT INTO public.courses(author_id,category_id,title,slug,short_description,description,cover_url,level,language,estimated_minutes,price,is_free,status,content_type,objectives,prerequisites,published_at)
  VALUES(v_author,v_cat,'Anglais complet A1 a C1','anglais-complet-a1-c1','Un parcours complet avec videos integrees, objets de cours, explications, exercices, quiz, audio et oral.','Cours complet d anglais structure par niveaux CECRL. Chaque lecon contient une situation reelle, des objectifs, des objets de cours, une explication detaillee, du vocabulaire, des erreurs frequentes, des exercices corriges, un quiz et une video YouTube jouable directement dans StudyLink.','https://images.unsplash.com/photo-1546410531-bb4caa6b424d?auto=format&fit=crop&w=1600&q=85','all','en',5400,0,true,'published','course',ARRAY['Progresser de A1 a C1','Comprendre et parler dans des situations reelles','Maitriser grammaire, vocabulaire et prononciation','S entrainer avec videos, quiz et exercices corriges'],ARRAY['Aucun prerequis pour A1','Un micro est recommande pour l oral'],now())
  ON CONFLICT(slug) DO UPDATE SET title=EXCLUDED.title,short_description=EXCLUDED.short_description,description=EXCLUDED.description,cover_url=EXCLUDED.cover_url,level='all',estimated_minutes=EXCLUDED.estimated_minutes,status='published',objectives=EXCLUDED.objectives,prerequisites=EXCLUDED.prerequisites,updated_at=now()
  RETURNING id INTO v_course;

  FOR v_level IN SELECT * FROM jsonb_array_elements(v_levels) LOOP
    v_level_index := v_level_index + 1;
    INSERT INTO public.course_modules(course_id,title,description,position)
    VALUES(v_course, v_level->>'title', 'Niveau CECRL ' || (v_level->>'cefr') || ' avec videos, objets, explications, exercices et quiz.', v_level_index)
    ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description
    RETURNING id INTO v_module;

    v_unit_index := 0;
    FOR v_unit IN SELECT * FROM jsonb_array_elements(v_level->'units') LOOP
      v_unit_index := v_unit_index + 1;
      v_video_id := (v_level->'video_ids'->>(v_unit_index - 1));
      v_base_content := 'OBJECTIFS' || chr(10) ||
        '- Comprendre la situation : ' || (v_unit->>'scenario') || chr(10) ||
        '- Utiliser la grammaire : ' || (v_unit->>'grammar') || chr(10) ||
        '- Employer le vocabulaire : ' || (v_unit->>'vocab') || chr(10) || chr(10) ||
        'EXPLICATION DETAILLEE' || chr(10) ||
        'Cette lecon part d une situation concrete. L apprenant observe d abord le contexte, puis repere les phrases utiles, la grammaire et le vocabulaire. La pratique se fait en trois temps : comprendre, transformer, produire. Le but n est pas de memoriser une liste, mais de parler ou ecrire avec une intention claire.' || chr(10) || chr(10) ||
        'OBJETS DU COURS' || chr(10) ||
        'Situation : ' || (v_unit->>'scenario') || chr(10) ||
        'Grammaire : ' || (v_unit->>'grammar') || chr(10) ||
        'Vocabulaire : ' || (v_unit->>'vocab') || chr(10) || chr(10) ||
        'EXERCICE CORRIGE' || chr(10) ||
        'Consigne : produisez 6 phrases personnelles et une reponse orale de 60 secondes.' || chr(10) ||
        'Correction : la reponse doit utiliser la grammaire cible, au moins quatre mots de vocabulaire et une question de relance.';

      INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,youtube_url,youtube_video_id,duration_seconds,position,is_preview)
      VALUES(v_module,(v_level->>'cefr') || ' ' || (v_unit->>'title') || ' - Video de la lecon',lower(replace((v_level->>'cefr') || '-' || (v_unit->>'title') || '-video',' ','-')),'youtube',v_base_content,'https://www.youtube.com/watch?v=' || v_video_id,v_video_id,1200,((v_unit_index - 1) * 4) + 1,v_level_index=1 AND v_unit_index=1)
      ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,youtube_url=EXCLUDED.youtube_url,youtube_video_id=EXCLUDED.youtube_video_id,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview
      RETURNING id INTO v_lesson;

      INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview)
      VALUES(v_module,(v_level->>'cefr') || ' ' || (v_unit->>'title') || ' - Explication et objets',lower(replace((v_level->>'cefr') || '-' || (v_unit->>'title') || '-explication',' ','-')),'text',v_base_content,1800,((v_unit_index - 1) * 4) + 2,false)
      ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview;

      INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview)
      VALUES(v_module,(v_level->>'cefr') || ' ' || (v_unit->>'title') || ' - Exercices corriges',lower(replace((v_level->>'cefr') || '-' || (v_unit->>'title') || '-exercices',' ','-')),'exercise',v_base_content,2100,((v_unit_index - 1) * 4) + 3,false)
      ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview;

      INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview)
      VALUES(v_module,(v_level->>'cefr') || ' ' || (v_unit->>'title') || ' - Quiz et oral',lower(replace((v_level->>'cefr') || '-' || (v_unit->>'title') || '-quiz-oral',' ','-')),'quiz',v_base_content,1200,((v_unit_index - 1) * 4) + 4,false)
      ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview;
    END LOOP;
  END LOOP;
END $$;
