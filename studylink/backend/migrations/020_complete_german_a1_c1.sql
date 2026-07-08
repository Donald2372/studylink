-- StudyLink 020 - Allemand complet A1 a C1
-- Migration idempotente : cree le cours, 5 modules CECRL, 60 lecons et videos integrees.
DO $$
DECLARE
  v_author UUID;
  v_cat INTEGER;
  v_course UUID;
  v_module UUID;
  v_level JSONB;
  v_unit JSONB;
  v_levels JSONB := '[
    {"cefr":"A1","title":"A1 - Grundlagen","video_ids":["4-eDoThe6qo","9l6m9Qh8Q1E","MSEqchtpTIk"],"units":[
      {"title":"Sich vorstellen","grammar":"sein, heissen, kommen aus, Personalpronomen, W-Fragen","scenario":"Du triffst eine neue Person im Deutschkurs und stellst dich klar vor.","vocab":"Name, Land, Stadt, Beruf, Sprache, Adresse, Telefonnummer, Kurs"},
      {"title":"Alltag und Zeit","grammar":"Praesens, trennbare Verben, Uhrzeit, Wortstellung im Hauptsatz","scenario":"Du beschreibst deinen Tag und fragst eine andere Person nach ihrer Routine.","vocab":"aufstehen, fruehstuecken, arbeiten, lernen, manchmal, immer, Uhr, Wochenende"},
      {"title":"In der Stadt","grammar":"es gibt, lokale Praepositionen, Akkusativ nach Richtung","scenario":"Du fragst nach dem Weg und beschreibst Orte in der Stadt.","vocab":"Bahnhof, Apotheke, Supermarkt, links, rechts, geradeaus, neben, gegenueber"}]},
    {"cefr":"A2","title":"A2 - Alltag sicher meistern","video_ids":["GfrZ8xkL9oE","3y8gP6Y2xHk","L-3bS2Qm2bI"],"units":[
      {"title":"Erlebnisse im Perfekt","grammar":"Perfekt mit haben/sein, Partizip II, Zeitangaben","scenario":"Du erzaehlst einem Freund von einem Wochenendausflug.","vocab":"gestern, letzte Woche, besucht, gekauft, gefahren, gesehen, Reise, Ausflug"},
      {"title":"Essen und Einkaufen","grammar":"Akkusativ, moechte, kein/keine, Mengenangaben","scenario":"Du bestellst im Cafe, fragst nach Preisen und kaufst Lebensmittel.","vocab":"Rechnung, Angebot, frisch, scharf, Flasche, Stueck, billig, teuer"},
      {"title":"Vergleichen und Entscheiden","grammar":"Komparativ, Superlativ, als, so wie, zu/genug","scenario":"Du vergleichst Wohnungen, Telefone und Verkehrsmittel, bevor du entscheidest.","vocab":"schneller, bequemer, am billigsten, ruhig, modern, sicher, praktisch, voll"}]},
    {"cefr":"B1","title":"B1 - Selbststaendig kommunizieren","video_ids":["F6khA8eZaD4","B07mVhwkzGk","P5dTDDV1K5Y"],"units":[
      {"title":"Arbeit und Studium","grammar":"Perfekt vs. Praeteritum, seit/seitdem, dass-Saetze","scenario":"Du sprichst ueber Studium, Berufserfahrung und aktuelle Ziele.","vocab":"Frist, Aufgabe, Kollege, Erfahrung, bewerben, verbessern, Faehigkeit, Rueckmeldung"},
      {"title":"Plaene und Organisation","grammar":"werden, vorhaben, Praesens fuer Zukunft, Nebensaetze mit wenn","scenario":"Du organisierst einen Termin und erklaerst deine naechsten Schritte.","vocab":"Termin, verschieben, wahrscheinlich, bestimmt, vereinbaren, verfuegbar, Plan, Vorbereitung"},
      {"title":"Rat geben und Probleme loesen","grammar":"sollte, muesste, duerfte, erste Konditionalsaetze","scenario":"Du gibst praktische Ratschlaege zu Lernen, Gesundheit und Arbeit.","vocab":"empfehlen, vermeiden, gesund, stressig, Loesung, Entscheidung, Risiko, Vorteil"}]},
    {"cefr":"B2","title":"B2 - Fluessig und differenziert","video_ids":["jR3pNf7Kj2M","zH3sQ4NQhGc","x1Y2N6dM8Rk"],"units":[
      {"title":"Meinungen diskutieren","grammar":"Konnektoren, Konzession, Gegensatz, Relativsaetze","scenario":"Du diskutierst ueber Homeoffice, Technologie und Bildung.","vocab":"allerdings, obwohl, Beleg, Behauptung, Auswirkung, Bedenken, Kompromiss, Perspektive"},
      {"title":"Berufliches Deutsch","grammar":"Passiv, formelles Register, indirekte Fragen","scenario":"Du praesentierst den Stand eines Projekts in einer Besprechung.","vocab":"Vorschlag, Beteiligte, Zeitplan, Ergebnis, Budget, genehmigt, umgesetzt, ueberprueft"},
      {"title":"Hypothetische Situationen","grammar":"Konjunktiv II, irreale Bedingungen, haette/waere/wuerde","scenario":"Du analysierst Entscheidungen und stellst dir alternative Ergebnisse vor.","vocab":"Gelegenheit, Bedauern, Alternative, Ergebnis, Investition, Entscheidung, Strategie, Annahme"}]},
    {"cefr":"C1","title":"C1 - Praezision und Meisterschaft","video_ids":["uJ4m6V9wA2s","q4T8bN6xK1A","pN4zR9K8q7E"],"units":[
      {"title":"Nuance und Praezision","grammar":"Einschraenkungen, Hervorhebung, Nominalstil, Modalpartikeln","scenario":"Du praesentierst eine ausgewogene Analyse zu einem gesellschaftlichen Thema.","vocab":"wohl, durchaus, vielschichtig, dennoch, Tragweite, Annahme, belastbar, Nachteil"},
      {"title":"Akademisch und professionell schreiben","grammar":"Nominalisierung, komplexe Nominalgruppen, Kohaesion","scenario":"Du fasst Forschungsergebnisse fuer ein professionelles Publikum zusammen.","vocab":"Rahmen, Methodik, Ergebnisse, Implikationen, folglich, wohingegen, angesichts, ungeachtet"},
      {"title":"Ueberzeugend praesentieren","grammar":"rhetorische Fragen, Signposting, fortgeschrittene Redemittel","scenario":"Du haeltst einen fuenfminuetigen ueberzeugenden Vortrag und beantwortest Rueckfragen.","vocab":"ueberzeugen, Publikum, Glaubwuerdigkeit, evidenzbasiert, Handlungsaufruf, praegnant, einpraegsam"}]}
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
  VALUES(v_author,v_cat,'Allemand complet A1 a C1','allemand-complet-a1-c1','Un parcours complet avec videos integrees, objets de cours, explications, exercices, quiz, audio et oral.','Cours complet d allemand structure par niveaux CECRL. Chaque lecon contient une situation reelle, des objectifs, des objets de cours, une explication detaillee, du vocabulaire, des erreurs frequentes, des exercices corriges, un quiz et une video jouable directement dans StudyLink.','https://images.unsplash.com/photo-1467269204594-9661b134dd2b?auto=format&fit=crop&w=1600&q=85','all','de',5400,0,true,'published','course',ARRAY['Progresser de A1 a C1 en allemand','Comprendre et parler dans des situations reelles','Maitriser verbes, articles, cas, Satzklammer et Nebensaetze','S entrainer avec videos, quiz et exercices corriges'],ARRAY['Aucun prerequis pour A1','Un micro est recommande pour l oral'],now())
  ON CONFLICT(slug) DO UPDATE SET title=EXCLUDED.title,short_description=EXCLUDED.short_description,description=EXCLUDED.description,cover_url=EXCLUDED.cover_url,level='all',language='de',estimated_minutes=EXCLUDED.estimated_minutes,status='published',objectives=EXCLUDED.objectives,prerequisites=EXCLUDED.prerequisites,updated_at=now()
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
      v_base_content := 'ZIELE' || chr(10) ||
        '- Situation verstehen: ' || (v_unit->>'scenario') || chr(10) ||
        '- Grammatik anwenden: ' || (v_unit->>'grammar') || chr(10) ||
        '- Wortschatz aktiv nutzen: ' || (v_unit->>'vocab') || chr(10) || chr(10) ||
        'AUSFUEHRLICHE ERKLAERUNG' || chr(10) ||
        'Diese Lektion beginnt mit einer realen Situation. Lernende erkennen zuerst Rolle, Ziel, Register und wichtige Informationen. Danach verbinden sie Grammatik, Wortschatz und Aussprache mit einer konkreten kommunikativen Aufgabe.' || chr(10) || chr(10) ||
        'KURSOBJEKTE' || chr(10) ||
        'Situation: ' || (v_unit->>'scenario') || chr(10) ||
        'Grammatik: ' || (v_unit->>'grammar') || chr(10) ||
        'Wortschatz: ' || (v_unit->>'vocab') || chr(10) || chr(10) ||
        'KORRIGIERTE UEBUNG' || chr(10) ||
        'Aufgabe: Produzieren Sie sechs persoenliche Saetze und eine muendliche Antwort von 60 bis 90 Sekunden.' || chr(10) ||
        'Korrektur: Die Antwort muss die Zielgrammatik, mindestens vier Woerter aus der Einheit und eine Rueckfrage enthalten.';

      INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,youtube_url,youtube_video_id,duration_seconds,position,is_preview)
      VALUES(v_module,(v_level->>'cefr') || ' ' || (v_unit->>'title') || ' - Video der Lektion',lower(replace((v_level->>'cefr') || '-' || (v_unit->>'title') || '-video',' ','-')),'youtube',v_base_content,'https://www.youtube.com/watch?v=' || v_video_id,v_video_id,1200,((v_unit_index - 1) * 4) + 1,v_level_index=1 AND v_unit_index=1)
      ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,youtube_url=EXCLUDED.youtube_url,youtube_video_id=EXCLUDED.youtube_video_id,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview;

      INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview)
      VALUES(v_module,(v_level->>'cefr') || ' ' || (v_unit->>'title') || ' - Erklaerung und Objekte',lower(replace((v_level->>'cefr') || '-' || (v_unit->>'title') || '-erklaerung',' ','-')),'text',v_base_content,1800,((v_unit_index - 1) * 4) + 2,false)
      ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview;

      INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview)
      VALUES(v_module,(v_level->>'cefr') || ' ' || (v_unit->>'title') || ' - Korrigierte Uebungen',lower(replace((v_level->>'cefr') || '-' || (v_unit->>'title') || '-uebungen',' ','-')),'exercise',v_base_content,2400,((v_unit_index - 1) * 4) + 3,false)
      ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview;

      INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview)
      VALUES(v_module,(v_level->>'cefr') || ' ' || (v_unit->>'title') || ' - Quiz und Oral',lower(replace((v_level->>'cefr') || '-' || (v_unit->>'title') || '-quiz-oral',' ','-')),'quiz',v_base_content,1200,((v_unit_index - 1) * 4) + 4,false)
      ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview;
    END LOOP;
  END LOOP;
END $$;
