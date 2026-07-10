-- StudyLink 020 - Allemand A1-C1 - Partie 3/10
-- Modules 13 Ã  18
DO $$
DECLARE v_course UUID; v_module UUID; v_lesson UUID;
BEGIN
  SELECT id INTO v_course FROM public.courses WHERE slug='allemand-complet-a1-c1' ORDER BY created_at DESC NULLS LAST LIMIT 1;
  IF v_course IS NULL THEN RAISE EXCEPTION 'Le cours allemand n existe pas encore. Executez d abord la partie 01.'; END IF;
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'A2 Â· Module 1 â€” PassÃ© et expÃ©riences','Niveau A2 : raconter ce que lâ€™on a fait. Grammaire : Perfekt avec haben/sein. 8 leÃ§ons avec thÃ©orie, audio, exercices, quiz et mission rÃ©elle.',13) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre â€” PassÃ© et expÃ©riences','allemand-a2-m01-l01','text','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 1/12 â€” PassÃ© et expÃ©riences
LEÃ‡ON 1/8 â€” Comprendre

OBJECTIF
Raconter ce que lâ€™on a fait.

EXPLICATION EN FRANÃ‡AIS
Ã€ ce niveau, vous devez apprendre Ã  communiquer avec Ã©changes courants, passÃ©, dÃ©marches et autonomie quotidienne. Le thÃ¨me Â« PassÃ© et expÃ©riences Â» sert de contexte rÃ©el. Commencez par comprendre lâ€™intention, puis repÃ©rez le verbe, les informations importantes et enfin les dÃ©tails.

MÃ‰THODE
1. Lisez les phrases sans traduire mot Ã  mot.
2. Soulignez le verbe conjuguÃ©.
3. RepÃ©rez qui parle, Ã  qui et dans quel but.
4. RÃ©pÃ©tez chaque phrase Ã  voix haute trois fois.
5. Changez un Ã©lÃ©ment pour crÃ©er votre propre exemple.

EXEMPLES ALLEMANDS
â€¢ Ich habe gestern gearbeitet.
â€¢ Wir sind nach Hamburg gefahren.
â€¢ Hast du das schon gemacht?
â€¢ Noch nie!

Ã€ RETENIR
Grammaire centrale : Perfekt avec haben/sein.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” PassÃ© et expÃ©riences','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” PassÃ© et expÃ©riences');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif â€” PassÃ© et expÃ©riences','allemand-a2-m01-l02','text','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 1/12 â€” PassÃ© et expÃ©riences
LEÃ‡ON 2/8 â€” Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur Â« PassÃ© et expÃ©riences Â».

VOCABULAIRE Ã€ ACTIVER
Hamburg, Hast, Noch, gearbeitet, gefahren, gemacht, gestern, habe, nach, schon, sind

TECHNIQUE 4 Ã‰TAPES
1. Ã‰coutez le mot avec le bouton audio.
2. RÃ©pÃ©tez-le dans une phrase complÃ¨te.
3. CrÃ©ez une phrase vraie sur votre vie.
4. RÃ©utilisez-le 24 heures plus tard.

MODÃˆLES
â€¢ Ich habe gestern gearbeitet.
â€¢ Wir sind nach Hamburg gefahren.
â€¢ Hast du das schon gemacht?
â€¢ Noch nie!

EXERCICES
1. Choisissez 10 mots et Ã©crivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez lâ€™allemand et traduisez vos phrases du franÃ§ais vers lâ€™allemand.
4. Enregistrez oralement un rÃ©sumÃ© de 60 secondes.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” PassÃ© et expÃ©riences','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” PassÃ© et expÃ©riences');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation â€” PassÃ© et expÃ©riences','allemand-a2-m01-l03','audio','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 1/12 â€” PassÃ© et expÃ©riences
LEÃ‡ON 3/8 â€” Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÃˆLE
A: Ich habe gestern gearbeitet.
B: Wir sind nach Hamburg gefahren.
A: Hast du das schon gemacht?
B: Noch nie!

PRONONCIATION
â€¢ Ã‰coutez dâ€™abord sans lire.
â€¢ RÃ©Ã©coutez en suivant le texte.
â€¢ Faites du shadowing : rÃ©pÃ©tez presque en mÃªme temps que la voix.
â€¢ Jouez ensuite les deux rÃ´les sans regarder.

MISSION ORALE
CrÃ©ez un nouveau dialogue de 8 Ã  12 rÃ©pliques sur le mÃªme thÃ¨me. Utilisez au moins 6 expressions du module. Enregistrez-vous deux fois : une premiÃ¨re version lente, puis une version naturelle.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” PassÃ© et expÃ©riences','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” PassÃ© et expÃ©riences');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur â€” PassÃ© et expÃ©riences','allemand-a2-m01-l04','text','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 1/12 â€” PassÃ© et expÃ©riences
LEÃ‡ON 4/8 â€” Grammaire en profondeur

POINT DE GRAMMAIRE
Perfekt avec haben/sein.

EXPLICATION
La grammaire nâ€™est pas une liste de rÃ¨gles Ã  mÃ©moriser sÃ©parÃ©ment : elle sert Ã  exprimer une intention. Observez dâ€™abord la place du verbe, puis les complÃ©ments, et enfin les Ã©lÃ©ments de temps, cause ou opinion.

EXEMPLES
â€¢ Ich habe gestern gearbeitet.
â€¢ Wir sind nach Hamburg gefahren.
â€¢ Hast du das schon gemacht?
â€¢ Noch nie!

TRANSFORMATION GUIDÃ‰E
1. Mettez chaque phrase Ã  la forme nÃ©gative.
2. Transformez-la en question.
3. Changez la personne grammaticale.
4. Changez le temps si votre niveau le permet.
5. Combinez deux phrases avec un connecteur adaptÃ©.

ERREUR FRÃ‰QUENTE
Ne traduisez pas directement lâ€™ordre des mots du franÃ§ais. VÃ©rifiez toujours la position du verbe dans la proposition principale et la subordonnÃ©e.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” PassÃ© et expÃ©riences','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” PassÃ© et expÃ©riences');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'ComprÃ©hension et production â€” PassÃ© et expÃ©riences','allemand-a2-m01-l05','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 1/12 â€” PassÃ© et expÃ©riences
LEÃ‡ON 5/8 â€” ComprÃ©hension et production

TEXTE / SITUATION
Imaginez une situation rÃ©elle autour de Â« PassÃ© et expÃ©riences Â». Les personnes utilisent les expressions suivantes :
â€¢ Ich habe gestern gearbeitet.
â€¢ Wir sind nach Hamburg gefahren.
â€¢ Hast du das schon gemacht?
â€¢ Noch nie!

COMPRÃ‰HENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou Ã©motion peut-on dÃ©duire ?
4. Reformulez le contenu en franÃ§ais, puis en allemand simple.

PRODUCTION Ã‰CRITE
RÃ©digez un texte adaptÃ© au niveau A2. Utilisez au moins 8 Ã©lÃ©ments du module et 3 structures liÃ©es Ã  : Perfekt avec haben/sein.

PRODUCTION ORALE
Parlez pendant 1 minute sans lire. Recommencez en amÃ©liorant la fluiditÃ©.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” PassÃ© et expÃ©riences','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” PassÃ© et expÃ©riences');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif â€” PassÃ© et expÃ©riences','allemand-a2-m01-l06','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 1/12 â€” PassÃ© et expÃ©riences
LEÃ‡ON 6/8 â€” Atelier intensif

ATELIER â€” 12 EXERCICES
1. Traduisez 5 phrases du franÃ§ais vers lâ€™allemand.
2. Transformez 5 affirmations en questions.
3. Corrigez 5 phrases contenant une erreur.
4. ComplÃ©tez un mini-dialogue de 10 lignes.
5. Remplacez les mots simples par des expressions du module.
6. Faites une dictÃ©e avec le bouton audio.
7. RÃ©sumez le dialogue en 5 phrases.
8. Parlez 90 secondes sans notes.
9. Ã‰crivez un message rÃ©el adaptÃ© au thÃ¨me.
10. Reformulez votre texte dans un registre plus poli.
11. CrÃ©ez 10 cartes mÃ©moire.
12. Refaites lâ€™exercice le plus difficile aprÃ¨s 24 heures.

BANQUE DE PHRASES
â€¢ Ich habe gestern gearbeitet.
â€¢ Wir sind nach Hamburg gefahren.
â€¢ Hast du das schon gemacht?
â€¢ Noch nie!

GRAMMAIRE Ã€ RÃ‰UTILISER
Perfekt avec haben/sein.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” PassÃ© et expÃ©riences','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” PassÃ© et expÃ©riences');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module â€” PassÃ© et expÃ©riences','allemand-a2-m01-l07','quiz','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 1/12 â€” PassÃ© et expÃ©riences
LEÃ‡ON 7/8 â€” Quiz de module

QUIZ DE VALIDATION â€” PassÃ© et expÃ©riences

Avant de valider, vous devez pouvoir :
â€¢ comprendre les quatre expressions du module ;
â€¢ expliquer le point de grammaire Â« Perfekt avec haben/sein Â» ;
â€¢ crÃ©er vos propres exemples ;
â€¢ parler spontanÃ©ment sur le thÃ¨me ;
â€¢ corriger une erreur typique.

AUTO-TEST
1. Dites les quatre exemples sans lire.
2. CrÃ©ez cinq nouvelles phrases.
3. Expliquez la rÃ¨gle Ã  quelquâ€™un en franÃ§ais.
4. RÃ©pondez Ã  une question imprÃ©vue pendant 60 secondes.
5. Ã‰crivez un mini-texte et corrigez-le vous-mÃªme.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” PassÃ© et expÃ©riences','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” PassÃ© et expÃ©riences');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission rÃ©elle â€” PassÃ© et expÃ©riences','allemand-a2-m01-l08','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 1/12 â€” PassÃ© et expÃ©riences
LEÃ‡ON 8/8 â€” Mission rÃ©elle

MISSION RÃ‰ELLE â€” PassÃ© et expÃ©riences

SCÃ‰NARIO
Vous devez raconter ce que lâ€™on a fait. Vous nâ€™avez droit quâ€™Ã  lâ€™allemand.

LIVRABLES
1. Un texte de 80 Ã  120 mots.
2. Un enregistrement oral de 1 Ã  2 minutes.
3. Un dialogue de 10 rÃ©pliques.
4. Une liste de 15 mots ou expressions rÃ©ellement utiles.
5. Une auto-correction : trois erreurs repÃ©rÃ©es et expliquÃ©es.

CRITÃˆRES
ClartÃ©, correction, vocabulaire adaptÃ©, fluiditÃ© et capacitÃ© Ã  accomplir la tÃ¢che.

EXPRESSIONS Ã€ RÃ‰UTILISER
â€¢ Ich habe gestern gearbeitet.
â€¢ Wir sind nach Hamburg gefahren.
â€¢ Hast du das schon gemacht?
â€¢ Noch nie!

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” PassÃ© et expÃ©riences','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” PassÃ© et expÃ©riences');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'A2 Â· Module 2 â€” Voyages et rÃ©servations','Niveau A2 : organiser un voyage et rÃ©soudre un problÃ¨me. Grammaire : modalitÃ©s; datif; questions polies. 8 leÃ§ons avec thÃ©orie, audio, exercices, quiz et mission rÃ©elle.',14) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre â€” Voyages et rÃ©servations','allemand-a2-m02-l01','text','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 2/12 â€” Voyages et rÃ©servations
LEÃ‡ON 1/8 â€” Comprendre

OBJECTIF
Organiser un voyage et rÃ©soudre un problÃ¨me.

EXPLICATION EN FRANÃ‡AIS
Ã€ ce niveau, vous devez apprendre Ã  communiquer avec Ã©changes courants, passÃ©, dÃ©marches et autonomie quotidienne. Le thÃ¨me Â« Voyages et rÃ©servations Â» sert de contexte rÃ©el. Commencez par comprendre lâ€™intention, puis repÃ©rez le verbe, les informations importantes et enfin les dÃ©tails.

MÃ‰THODE
1. Lisez les phrases sans traduire mot Ã  mot.
2. Soulignez le verbe conjuguÃ©.
3. RepÃ©rez qui parle, Ã  qui et dans quel but.
4. RÃ©pÃ©tez chaque phrase Ã  voix haute trois fois.
5. Changez un Ã©lÃ©ment pour crÃ©er votre propre exemple.

EXEMPLES ALLEMANDS
â€¢ Ich mÃ¶chte ein Zimmer buchen.
â€¢ Ist FrÃ¼hstÃ¼ck inklusive?
â€¢ Mein Zug hat VerspÃ¤tung.
â€¢ KÃ¶nnen Sie mir helfen?

Ã€ RETENIR
Grammaire centrale : modalitÃ©s; datif; questions polies.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Voyages et rÃ©servations','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Voyages et rÃ©servations');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif â€” Voyages et rÃ©servations','allemand-a2-m02-l02','text','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 2/12 â€” Voyages et rÃ©servations
LEÃ‡ON 2/8 â€” Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur Â« Voyages et rÃ©servations Â».

VOCABULAIRE Ã€ ACTIVER
FrÃ¼hstÃ¼ck, KÃ¶nnen, Mein, VerspÃ¤tung, Zimmer, buchen, helfen, inklusive, mÃ¶chte

TECHNIQUE 4 Ã‰TAPES
1. Ã‰coutez le mot avec le bouton audio.
2. RÃ©pÃ©tez-le dans une phrase complÃ¨te.
3. CrÃ©ez une phrase vraie sur votre vie.
4. RÃ©utilisez-le 24 heures plus tard.

MODÃˆLES
â€¢ Ich mÃ¶chte ein Zimmer buchen.
â€¢ Ist FrÃ¼hstÃ¼ck inklusive?
â€¢ Mein Zug hat VerspÃ¤tung.
â€¢ KÃ¶nnen Sie mir helfen?

EXERCICES
1. Choisissez 10 mots et Ã©crivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez lâ€™allemand et traduisez vos phrases du franÃ§ais vers lâ€™allemand.
4. Enregistrez oralement un rÃ©sumÃ© de 60 secondes.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Voyages et rÃ©servations','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Voyages et rÃ©servations');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation â€” Voyages et rÃ©servations','allemand-a2-m02-l03','audio','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 2/12 â€” Voyages et rÃ©servations
LEÃ‡ON 3/8 â€” Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÃˆLE
A: Ich mÃ¶chte ein Zimmer buchen.
B: Ist FrÃ¼hstÃ¼ck inklusive?
A: Mein Zug hat VerspÃ¤tung.
B: KÃ¶nnen Sie mir helfen?

PRONONCIATION
â€¢ Ã‰coutez dâ€™abord sans lire.
â€¢ RÃ©Ã©coutez en suivant le texte.
â€¢ Faites du shadowing : rÃ©pÃ©tez presque en mÃªme temps que la voix.
â€¢ Jouez ensuite les deux rÃ´les sans regarder.

MISSION ORALE
CrÃ©ez un nouveau dialogue de 8 Ã  12 rÃ©pliques sur le mÃªme thÃ¨me. Utilisez au moins 6 expressions du module. Enregistrez-vous deux fois : une premiÃ¨re version lente, puis une version naturelle.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Voyages et rÃ©servations','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Voyages et rÃ©servations');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur â€” Voyages et rÃ©servations','allemand-a2-m02-l04','text','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 2/12 â€” Voyages et rÃ©servations
LEÃ‡ON 4/8 â€” Grammaire en profondeur

POINT DE GRAMMAIRE
modalitÃ©s; datif; questions polies.

EXPLICATION
La grammaire nâ€™est pas une liste de rÃ¨gles Ã  mÃ©moriser sÃ©parÃ©ment : elle sert Ã  exprimer une intention. Observez dâ€™abord la place du verbe, puis les complÃ©ments, et enfin les Ã©lÃ©ments de temps, cause ou opinion.

EXEMPLES
â€¢ Ich mÃ¶chte ein Zimmer buchen.
â€¢ Ist FrÃ¼hstÃ¼ck inklusive?
â€¢ Mein Zug hat VerspÃ¤tung.
â€¢ KÃ¶nnen Sie mir helfen?

TRANSFORMATION GUIDÃ‰E
1. Mettez chaque phrase Ã  la forme nÃ©gative.
2. Transformez-la en question.
3. Changez la personne grammaticale.
4. Changez le temps si votre niveau le permet.
5. Combinez deux phrases avec un connecteur adaptÃ©.

ERREUR FRÃ‰QUENTE
Ne traduisez pas directement lâ€™ordre des mots du franÃ§ais. VÃ©rifiez toujours la position du verbe dans la proposition principale et la subordonnÃ©e.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Voyages et rÃ©servations','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Voyages et rÃ©servations');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'ComprÃ©hension et production â€” Voyages et rÃ©servations','allemand-a2-m02-l05','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 2/12 â€” Voyages et rÃ©servations
LEÃ‡ON 5/8 â€” ComprÃ©hension et production

TEXTE / SITUATION
Imaginez une situation rÃ©elle autour de Â« Voyages et rÃ©servations Â». Les personnes utilisent les expressions suivantes :
â€¢ Ich mÃ¶chte ein Zimmer buchen.
â€¢ Ist FrÃ¼hstÃ¼ck inklusive?
â€¢ Mein Zug hat VerspÃ¤tung.
â€¢ KÃ¶nnen Sie mir helfen?

COMPRÃ‰HENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou Ã©motion peut-on dÃ©duire ?
4. Reformulez le contenu en franÃ§ais, puis en allemand simple.

PRODUCTION Ã‰CRITE
RÃ©digez un texte adaptÃ© au niveau A2. Utilisez au moins 8 Ã©lÃ©ments du module et 3 structures liÃ©es Ã  : modalitÃ©s; datif; questions polies.

PRODUCTION ORALE
Parlez pendant 1 minute sans lire. Recommencez en amÃ©liorant la fluiditÃ©.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Voyages et rÃ©servations','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Voyages et rÃ©servations');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif â€” Voyages et rÃ©servations','allemand-a2-m02-l06','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 2/12 â€” Voyages et rÃ©servations
LEÃ‡ON 6/8 â€” Atelier intensif

ATELIER â€” 12 EXERCICES
1. Traduisez 5 phrases du franÃ§ais vers lâ€™allemand.
2. Transformez 5 affirmations en questions.
3. Corrigez 5 phrases contenant une erreur.
4. ComplÃ©tez un mini-dialogue de 10 lignes.
5. Remplacez les mots simples par des expressions du module.
6. Faites une dictÃ©e avec le bouton audio.
7. RÃ©sumez le dialogue en 5 phrases.
8. Parlez 90 secondes sans notes.
9. Ã‰crivez un message rÃ©el adaptÃ© au thÃ¨me.
10. Reformulez votre texte dans un registre plus poli.
11. CrÃ©ez 10 cartes mÃ©moire.
12. Refaites lâ€™exercice le plus difficile aprÃ¨s 24 heures.

BANQUE DE PHRASES
â€¢ Ich mÃ¶chte ein Zimmer buchen.
â€¢ Ist FrÃ¼hstÃ¼ck inklusive?
â€¢ Mein Zug hat VerspÃ¤tung.
â€¢ KÃ¶nnen Sie mir helfen?

GRAMMAIRE Ã€ RÃ‰UTILISER
modalitÃ©s; datif; questions polies.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Voyages et rÃ©servations','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Voyages et rÃ©servations');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module â€” Voyages et rÃ©servations','allemand-a2-m02-l07','quiz','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 2/12 â€” Voyages et rÃ©servations
LEÃ‡ON 7/8 â€” Quiz de module

QUIZ DE VALIDATION â€” Voyages et rÃ©servations

Avant de valider, vous devez pouvoir :
â€¢ comprendre les quatre expressions du module ;
â€¢ expliquer le point de grammaire Â« modalitÃ©s; datif; questions polies Â» ;
â€¢ crÃ©er vos propres exemples ;
â€¢ parler spontanÃ©ment sur le thÃ¨me ;
â€¢ corriger une erreur typique.

AUTO-TEST
1. Dites les quatre exemples sans lire.
2. CrÃ©ez cinq nouvelles phrases.
3. Expliquez la rÃ¨gle Ã  quelquâ€™un en franÃ§ais.
4. RÃ©pondez Ã  une question imprÃ©vue pendant 60 secondes.
5. Ã‰crivez un mini-texte et corrigez-le vous-mÃªme.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Voyages et rÃ©servations','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Voyages et rÃ©servations');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission rÃ©elle â€” Voyages et rÃ©servations','allemand-a2-m02-l08','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 2/12 â€” Voyages et rÃ©servations
LEÃ‡ON 8/8 â€” Mission rÃ©elle

MISSION RÃ‰ELLE â€” Voyages et rÃ©servations

SCÃ‰NARIO
Vous devez organiser un voyage et rÃ©soudre un problÃ¨me. Vous nâ€™avez droit quâ€™Ã  lâ€™allemand.

LIVRABLES
1. Un texte de 80 Ã  120 mots.
2. Un enregistrement oral de 1 Ã  2 minutes.
3. Un dialogue de 10 rÃ©pliques.
4. Une liste de 15 mots ou expressions rÃ©ellement utiles.
5. Une auto-correction : trois erreurs repÃ©rÃ©es et expliquÃ©es.

CRITÃˆRES
ClartÃ©, correction, vocabulaire adaptÃ©, fluiditÃ© et capacitÃ© Ã  accomplir la tÃ¢che.

EXPRESSIONS Ã€ RÃ‰UTILISER
â€¢ Ich mÃ¶chte ein Zimmer buchen.
â€¢ Ist FrÃ¼hstÃ¼ck inklusive?
â€¢ Mein Zug hat VerspÃ¤tung.
â€¢ KÃ¶nnen Sie mir helfen?

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Voyages et rÃ©servations','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Voyages et rÃ©servations');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'A2 Â· Module 3 â€” Travail et candidature simple','Niveau A2 : parler de compÃ©tences et de tÃ¢ches. Grammaire : kÃ¶nnen; infinitif avec zu introduction. 8 leÃ§ons avec thÃ©orie, audio, exercices, quiz et mission rÃ©elle.',15) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre â€” Travail et candidature simple','allemand-a2-m03-l01','text','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 3/12 â€” Travail et candidature simple
LEÃ‡ON 1/8 â€” Comprendre

OBJECTIF
Parler de compÃ©tences et de tÃ¢ches.

EXPLICATION EN FRANÃ‡AIS
Ã€ ce niveau, vous devez apprendre Ã  communiquer avec Ã©changes courants, passÃ©, dÃ©marches et autonomie quotidienne. Le thÃ¨me Â« Travail et candidature simple Â» sert de contexte rÃ©el. Commencez par comprendre lâ€™intention, puis repÃ©rez le verbe, les informations importantes et enfin les dÃ©tails.

MÃ‰THODE
1. Lisez les phrases sans traduire mot Ã  mot.
2. Soulignez le verbe conjuguÃ©.
3. RepÃ©rez qui parle, Ã  qui et dans quel but.
4. RÃ©pÃ©tez chaque phrase Ã  voix haute trois fois.
5. Changez un Ã©lÃ©ment pour crÃ©er votre propre exemple.

EXEMPLES ALLEMANDS
â€¢ Ich kann gut organisieren.
â€¢ Ich habe Erfahrung mit Kunden.
â€¢ Meine Aufgabe ist â€¦
â€¢ Wann kann ich anfangen?

Ã€ RETENIR
Grammaire centrale : kÃ¶nnen; infinitif avec zu introduction.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Travail et candidature simple','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Travail et candidature simple');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif â€” Travail et candidature simple','allemand-a2-m03-l02','text','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 3/12 â€” Travail et candidature simple
LEÃ‡ON 2/8 â€” Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur Â« Travail et candidature simple Â».

VOCABULAIRE Ã€ ACTIVER
Aufgabe, Erfahrung, Kunden, Meine, Wann, anfangen, habe, kann, organisieren

TECHNIQUE 4 Ã‰TAPES
1. Ã‰coutez le mot avec le bouton audio.
2. RÃ©pÃ©tez-le dans une phrase complÃ¨te.
3. CrÃ©ez une phrase vraie sur votre vie.
4. RÃ©utilisez-le 24 heures plus tard.

MODÃˆLES
â€¢ Ich kann gut organisieren.
â€¢ Ich habe Erfahrung mit Kunden.
â€¢ Meine Aufgabe ist â€¦
â€¢ Wann kann ich anfangen?

EXERCICES
1. Choisissez 10 mots et Ã©crivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez lâ€™allemand et traduisez vos phrases du franÃ§ais vers lâ€™allemand.
4. Enregistrez oralement un rÃ©sumÃ© de 60 secondes.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Travail et candidature simple','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Travail et candidature simple');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation â€” Travail et candidature simple','allemand-a2-m03-l03','audio','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 3/12 â€” Travail et candidature simple
LEÃ‡ON 3/8 â€” Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÃˆLE
A: Ich kann gut organisieren.
B: Ich habe Erfahrung mit Kunden.
A: Meine Aufgabe ist â€¦
B: Wann kann ich anfangen?

PRONONCIATION
â€¢ Ã‰coutez dâ€™abord sans lire.
â€¢ RÃ©Ã©coutez en suivant le texte.
â€¢ Faites du shadowing : rÃ©pÃ©tez presque en mÃªme temps que la voix.
â€¢ Jouez ensuite les deux rÃ´les sans regarder.

MISSION ORALE
CrÃ©ez un nouveau dialogue de 8 Ã  12 rÃ©pliques sur le mÃªme thÃ¨me. Utilisez au moins 6 expressions du module. Enregistrez-vous deux fois : une premiÃ¨re version lente, puis une version naturelle.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Travail et candidature simple','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Travail et candidature simple');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur â€” Travail et candidature simple','allemand-a2-m03-l04','text','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 3/12 â€” Travail et candidature simple
LEÃ‡ON 4/8 â€” Grammaire en profondeur

POINT DE GRAMMAIRE
kÃ¶nnen; infinitif avec zu introduction.

EXPLICATION
La grammaire nâ€™est pas une liste de rÃ¨gles Ã  mÃ©moriser sÃ©parÃ©ment : elle sert Ã  exprimer une intention. Observez dâ€™abord la place du verbe, puis les complÃ©ments, et enfin les Ã©lÃ©ments de temps, cause ou opinion.

EXEMPLES
â€¢ Ich kann gut organisieren.
â€¢ Ich habe Erfahrung mit Kunden.
â€¢ Meine Aufgabe ist â€¦
â€¢ Wann kann ich anfangen?

TRANSFORMATION GUIDÃ‰E
1. Mettez chaque phrase Ã  la forme nÃ©gative.
2. Transformez-la en question.
3. Changez la personne grammaticale.
4. Changez le temps si votre niveau le permet.
5. Combinez deux phrases avec un connecteur adaptÃ©.

ERREUR FRÃ‰QUENTE
Ne traduisez pas directement lâ€™ordre des mots du franÃ§ais. VÃ©rifiez toujours la position du verbe dans la proposition principale et la subordonnÃ©e.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Travail et candidature simple','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Travail et candidature simple');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'ComprÃ©hension et production â€” Travail et candidature simple','allemand-a2-m03-l05','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 3/12 â€” Travail et candidature simple
LEÃ‡ON 5/8 â€” ComprÃ©hension et production

TEXTE / SITUATION
Imaginez une situation rÃ©elle autour de Â« Travail et candidature simple Â». Les personnes utilisent les expressions suivantes :
â€¢ Ich kann gut organisieren.
â€¢ Ich habe Erfahrung mit Kunden.
â€¢ Meine Aufgabe ist â€¦
â€¢ Wann kann ich anfangen?

COMPRÃ‰HENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou Ã©motion peut-on dÃ©duire ?
4. Reformulez le contenu en franÃ§ais, puis en allemand simple.

PRODUCTION Ã‰CRITE
RÃ©digez un texte adaptÃ© au niveau A2. Utilisez au moins 8 Ã©lÃ©ments du module et 3 structures liÃ©es Ã  : kÃ¶nnen; infinitif avec zu introduction.

PRODUCTION ORALE
Parlez pendant 1 minute sans lire. Recommencez en amÃ©liorant la fluiditÃ©.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Travail et candidature simple','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Travail et candidature simple');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif â€” Travail et candidature simple','allemand-a2-m03-l06','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 3/12 â€” Travail et candidature simple
LEÃ‡ON 6/8 â€” Atelier intensif

ATELIER â€” 12 EXERCICES
1. Traduisez 5 phrases du franÃ§ais vers lâ€™allemand.
2. Transformez 5 affirmations en questions.
3. Corrigez 5 phrases contenant une erreur.
4. ComplÃ©tez un mini-dialogue de 10 lignes.
5. Remplacez les mots simples par des expressions du module.
6. Faites une dictÃ©e avec le bouton audio.
7. RÃ©sumez le dialogue en 5 phrases.
8. Parlez 90 secondes sans notes.
9. Ã‰crivez un message rÃ©el adaptÃ© au thÃ¨me.
10. Reformulez votre texte dans un registre plus poli.
11. CrÃ©ez 10 cartes mÃ©moire.
12. Refaites lâ€™exercice le plus difficile aprÃ¨s 24 heures.

BANQUE DE PHRASES
â€¢ Ich kann gut organisieren.
â€¢ Ich habe Erfahrung mit Kunden.
â€¢ Meine Aufgabe ist â€¦
â€¢ Wann kann ich anfangen?

GRAMMAIRE Ã€ RÃ‰UTILISER
kÃ¶nnen; infinitif avec zu introduction.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Travail et candidature simple','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Travail et candidature simple');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module â€” Travail et candidature simple','allemand-a2-m03-l07','quiz','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 3/12 â€” Travail et candidature simple
LEÃ‡ON 7/8 â€” Quiz de module

QUIZ DE VALIDATION â€” Travail et candidature simple

Avant de valider, vous devez pouvoir :
â€¢ comprendre les quatre expressions du module ;
â€¢ expliquer le point de grammaire Â« kÃ¶nnen; infinitif avec zu introduction Â» ;
â€¢ crÃ©er vos propres exemples ;
â€¢ parler spontanÃ©ment sur le thÃ¨me ;
â€¢ corriger une erreur typique.

AUTO-TEST
1. Dites les quatre exemples sans lire.
2. CrÃ©ez cinq nouvelles phrases.
3. Expliquez la rÃ¨gle Ã  quelquâ€™un en franÃ§ais.
4. RÃ©pondez Ã  une question imprÃ©vue pendant 60 secondes.
5. Ã‰crivez un mini-texte et corrigez-le vous-mÃªme.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Travail et candidature simple','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Travail et candidature simple');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission rÃ©elle â€” Travail et candidature simple','allemand-a2-m03-l08','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 3/12 â€” Travail et candidature simple
LEÃ‡ON 8/8 â€” Mission rÃ©elle

MISSION RÃ‰ELLE â€” Travail et candidature simple

SCÃ‰NARIO
Vous devez parler de compÃ©tences et de tÃ¢ches. Vous nâ€™avez droit quâ€™Ã  lâ€™allemand.

LIVRABLES
1. Un texte de 80 Ã  120 mots.
2. Un enregistrement oral de 1 Ã  2 minutes.
3. Un dialogue de 10 rÃ©pliques.
4. Une liste de 15 mots ou expressions rÃ©ellement utiles.
5. Une auto-correction : trois erreurs repÃ©rÃ©es et expliquÃ©es.

CRITÃˆRES
ClartÃ©, correction, vocabulaire adaptÃ©, fluiditÃ© et capacitÃ© Ã  accomplir la tÃ¢che.

EXPRESSIONS Ã€ RÃ‰UTILISER
â€¢ Ich kann gut organisieren.
â€¢ Ich habe Erfahrung mit Kunden.
â€¢ Meine Aufgabe ist â€¦
â€¢ Wann kann ich anfangen?

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Travail et candidature simple','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Travail et candidature simple');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'A2 Â· Module 4 â€” Ã‰cole et apprentissage','Niveau A2 : expliquer comment on apprend. Grammaire : comparatif; weil. 8 leÃ§ons avec thÃ©orie, audio, exercices, quiz et mission rÃ©elle.',16) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre â€” Ã‰cole et apprentissage','allemand-a2-m04-l01','text','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 4/12 â€” Ã‰cole et apprentissage
LEÃ‡ON 1/8 â€” Comprendre

OBJECTIF
Expliquer comment on apprend.

EXPLICATION EN FRANÃ‡AIS
Ã€ ce niveau, vous devez apprendre Ã  communiquer avec Ã©changes courants, passÃ©, dÃ©marches et autonomie quotidienne. Le thÃ¨me Â« Ã‰cole et apprentissage Â» sert de contexte rÃ©el. Commencez par comprendre lâ€™intention, puis repÃ©rez le verbe, les informations importantes et enfin les dÃ©tails.

MÃ‰THODE
1. Lisez les phrases sans traduire mot Ã  mot.
2. Soulignez le verbe conjuguÃ©.
3. RepÃ©rez qui parle, Ã  qui et dans quel but.
4. RÃ©pÃ©tez chaque phrase Ã  voix haute trois fois.
5. Changez un Ã©lÃ©ment pour crÃ©er votre propre exemple.

EXEMPLES ALLEMANDS
â€¢ Ich lerne am besten mit Beispielen.
â€¢ Diese Aufgabe ist schwierig.
â€¢ Kannst du das erklÃ¤ren?
â€¢ Ich muss mehr Ã¼ben.

Ã€ RETENIR
Grammaire centrale : comparatif; weil.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Ã‰cole et apprentissage','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Ã‰cole et apprentissage');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif â€” Ã‰cole et apprentissage','allemand-a2-m04-l02','text','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 4/12 â€” Ã‰cole et apprentissage
LEÃ‡ON 2/8 â€” Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur Â« Ã‰cole et apprentissage Â».

VOCABULAIRE Ã€ ACTIVER
Aufgabe, Beispielen, Diese, Kannst, besten, erklÃ¤ren, lerne, mehr, muss, schwierig, Ã¼ben

TECHNIQUE 4 Ã‰TAPES
1. Ã‰coutez le mot avec le bouton audio.
2. RÃ©pÃ©tez-le dans une phrase complÃ¨te.
3. CrÃ©ez une phrase vraie sur votre vie.
4. RÃ©utilisez-le 24 heures plus tard.

MODÃˆLES
â€¢ Ich lerne am besten mit Beispielen.
â€¢ Diese Aufgabe ist schwierig.
â€¢ Kannst du das erklÃ¤ren?
â€¢ Ich muss mehr Ã¼ben.

EXERCICES
1. Choisissez 10 mots et Ã©crivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez lâ€™allemand et traduisez vos phrases du franÃ§ais vers lâ€™allemand.
4. Enregistrez oralement un rÃ©sumÃ© de 60 secondes.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Ã‰cole et apprentissage','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Ã‰cole et apprentissage');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation â€” Ã‰cole et apprentissage','allemand-a2-m04-l03','audio','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 4/12 â€” Ã‰cole et apprentissage
LEÃ‡ON 3/8 â€” Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÃˆLE
A: Ich lerne am besten mit Beispielen.
B: Diese Aufgabe ist schwierig.
A: Kannst du das erklÃ¤ren?
B: Ich muss mehr Ã¼ben.

PRONONCIATION
â€¢ Ã‰coutez dâ€™abord sans lire.
â€¢ RÃ©Ã©coutez en suivant le texte.
â€¢ Faites du shadowing : rÃ©pÃ©tez presque en mÃªme temps que la voix.
â€¢ Jouez ensuite les deux rÃ´les sans regarder.

MISSION ORALE
CrÃ©ez un nouveau dialogue de 8 Ã  12 rÃ©pliques sur le mÃªme thÃ¨me. Utilisez au moins 6 expressions du module. Enregistrez-vous deux fois : une premiÃ¨re version lente, puis une version naturelle.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Ã‰cole et apprentissage','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Ã‰cole et apprentissage');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur â€” Ã‰cole et apprentissage','allemand-a2-m04-l04','text','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 4/12 â€” Ã‰cole et apprentissage
LEÃ‡ON 4/8 â€” Grammaire en profondeur

POINT DE GRAMMAIRE
comparatif; weil.

EXPLICATION
La grammaire nâ€™est pas une liste de rÃ¨gles Ã  mÃ©moriser sÃ©parÃ©ment : elle sert Ã  exprimer une intention. Observez dâ€™abord la place du verbe, puis les complÃ©ments, et enfin les Ã©lÃ©ments de temps, cause ou opinion.

EXEMPLES
â€¢ Ich lerne am besten mit Beispielen.
â€¢ Diese Aufgabe ist schwierig.
â€¢ Kannst du das erklÃ¤ren?
â€¢ Ich muss mehr Ã¼ben.

TRANSFORMATION GUIDÃ‰E
1. Mettez chaque phrase Ã  la forme nÃ©gative.
2. Transformez-la en question.
3. Changez la personne grammaticale.
4. Changez le temps si votre niveau le permet.
5. Combinez deux phrases avec un connecteur adaptÃ©.

ERREUR FRÃ‰QUENTE
Ne traduisez pas directement lâ€™ordre des mots du franÃ§ais. VÃ©rifiez toujours la position du verbe dans la proposition principale et la subordonnÃ©e.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Ã‰cole et apprentissage','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Ã‰cole et apprentissage');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'ComprÃ©hension et production â€” Ã‰cole et apprentissage','allemand-a2-m04-l05','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 4/12 â€” Ã‰cole et apprentissage
LEÃ‡ON 5/8 â€” ComprÃ©hension et production

TEXTE / SITUATION
Imaginez une situation rÃ©elle autour de Â« Ã‰cole et apprentissage Â». Les personnes utilisent les expressions suivantes :
â€¢ Ich lerne am besten mit Beispielen.
â€¢ Diese Aufgabe ist schwierig.
â€¢ Kannst du das erklÃ¤ren?
â€¢ Ich muss mehr Ã¼ben.

COMPRÃ‰HENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou Ã©motion peut-on dÃ©duire ?
4. Reformulez le contenu en franÃ§ais, puis en allemand simple.

PRODUCTION Ã‰CRITE
RÃ©digez un texte adaptÃ© au niveau A2. Utilisez au moins 8 Ã©lÃ©ments du module et 3 structures liÃ©es Ã  : comparatif; weil.

PRODUCTION ORALE
Parlez pendant 1 minute sans lire. Recommencez en amÃ©liorant la fluiditÃ©.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Ã‰cole et apprentissage','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Ã‰cole et apprentissage');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif â€” Ã‰cole et apprentissage','allemand-a2-m04-l06','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 4/12 â€” Ã‰cole et apprentissage
LEÃ‡ON 6/8 â€” Atelier intensif

ATELIER â€” 12 EXERCICES
1. Traduisez 5 phrases du franÃ§ais vers lâ€™allemand.
2. Transformez 5 affirmations en questions.
3. Corrigez 5 phrases contenant une erreur.
4. ComplÃ©tez un mini-dialogue de 10 lignes.
5. Remplacez les mots simples par des expressions du module.
6. Faites une dictÃ©e avec le bouton audio.
7. RÃ©sumez le dialogue en 5 phrases.
8. Parlez 90 secondes sans notes.
9. Ã‰crivez un message rÃ©el adaptÃ© au thÃ¨me.
10. Reformulez votre texte dans un registre plus poli.
11. CrÃ©ez 10 cartes mÃ©moire.
12. Refaites lâ€™exercice le plus difficile aprÃ¨s 24 heures.

BANQUE DE PHRASES
â€¢ Ich lerne am besten mit Beispielen.
â€¢ Diese Aufgabe ist schwierig.
â€¢ Kannst du das erklÃ¤ren?
â€¢ Ich muss mehr Ã¼ben.

GRAMMAIRE Ã€ RÃ‰UTILISER
comparatif; weil.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Ã‰cole et apprentissage','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Ã‰cole et apprentissage');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module â€” Ã‰cole et apprentissage','allemand-a2-m04-l07','quiz','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 4/12 â€” Ã‰cole et apprentissage
LEÃ‡ON 7/8 â€” Quiz de module

QUIZ DE VALIDATION â€” Ã‰cole et apprentissage

Avant de valider, vous devez pouvoir :
â€¢ comprendre les quatre expressions du module ;
â€¢ expliquer le point de grammaire Â« comparatif; weil Â» ;
â€¢ crÃ©er vos propres exemples ;
â€¢ parler spontanÃ©ment sur le thÃ¨me ;
â€¢ corriger une erreur typique.

AUTO-TEST
1. Dites les quatre exemples sans lire.
2. CrÃ©ez cinq nouvelles phrases.
3. Expliquez la rÃ¨gle Ã  quelquâ€™un en franÃ§ais.
4. RÃ©pondez Ã  une question imprÃ©vue pendant 60 secondes.
5. Ã‰crivez un mini-texte et corrigez-le vous-mÃªme.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Ã‰cole et apprentissage','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Ã‰cole et apprentissage');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission rÃ©elle â€” Ã‰cole et apprentissage','allemand-a2-m04-l08','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 4/12 â€” Ã‰cole et apprentissage
LEÃ‡ON 8/8 â€” Mission rÃ©elle

MISSION RÃ‰ELLE â€” Ã‰cole et apprentissage

SCÃ‰NARIO
Vous devez expliquer comment on apprend. Vous nâ€™avez droit quâ€™Ã  lâ€™allemand.

LIVRABLES
1. Un texte de 80 Ã  120 mots.
2. Un enregistrement oral de 1 Ã  2 minutes.
3. Un dialogue de 10 rÃ©pliques.
4. Une liste de 15 mots ou expressions rÃ©ellement utiles.
5. Une auto-correction : trois erreurs repÃ©rÃ©es et expliquÃ©es.

CRITÃˆRES
ClartÃ©, correction, vocabulaire adaptÃ©, fluiditÃ© et capacitÃ© Ã  accomplir la tÃ¢che.

EXPRESSIONS Ã€ RÃ‰UTILISER
â€¢ Ich lerne am besten mit Beispielen.
â€¢ Diese Aufgabe ist schwierig.
â€¢ Kannst du das erklÃ¤ren?
â€¢ Ich muss mehr Ã¼ben.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Ã‰cole et apprentissage','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Ã‰cole et apprentissage');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'A2 Â· Module 5 â€” MÃ©dias et technologie','Niveau A2 : utiliser et expliquer des outils quotidiens. Grammaire : impÃ©ratif; datif/accusatif. 8 leÃ§ons avec thÃ©orie, audio, exercices, quiz et mission rÃ©elle.',17) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre â€” MÃ©dias et technologie','allemand-a2-m05-l01','text','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 5/12 â€” MÃ©dias et technologie
LEÃ‡ON 1/8 â€” Comprendre

OBJECTIF
Utiliser et expliquer des outils quotidiens.

EXPLICATION EN FRANÃ‡AIS
Ã€ ce niveau, vous devez apprendre Ã  communiquer avec Ã©changes courants, passÃ©, dÃ©marches et autonomie quotidienne. Le thÃ¨me Â« MÃ©dias et technologie Â» sert de contexte rÃ©el. Commencez par comprendre lâ€™intention, puis repÃ©rez le verbe, les informations importantes et enfin les dÃ©tails.

MÃ‰THODE
1. Lisez les phrases sans traduire mot Ã  mot.
2. Soulignez le verbe conjuguÃ©.
3. RepÃ©rez qui parle, Ã  qui et dans quel but.
4. RÃ©pÃ©tez chaque phrase Ã  voix haute trois fois.
5. Changez un Ã©lÃ©ment pour crÃ©er votre propre exemple.

EXEMPLES ALLEMANDS
â€¢ Mein Handy funktioniert nicht.
â€¢ Ich habe die App installiert.
â€¢ Schick mir bitte den Link.
â€¢ Das WLAN ist langsam.

Ã€ RETENIR
Grammaire centrale : impÃ©ratif; datif/accusatif.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” MÃ©dias et technologie','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” MÃ©dias et technologie');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif â€” MÃ©dias et technologie','allemand-a2-m05-l02','text','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 5/12 â€” MÃ©dias et technologie
LEÃ‡ON 2/8 â€” Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur Â« MÃ©dias et technologie Â».

VOCABULAIRE Ã€ ACTIVER
Handy, Link, Mein, Schick, WLAN, bitte, funktioniert, habe, installiert, langsam, nicht

TECHNIQUE 4 Ã‰TAPES
1. Ã‰coutez le mot avec le bouton audio.
2. RÃ©pÃ©tez-le dans une phrase complÃ¨te.
3. CrÃ©ez une phrase vraie sur votre vie.
4. RÃ©utilisez-le 24 heures plus tard.

MODÃˆLES
â€¢ Mein Handy funktioniert nicht.
â€¢ Ich habe die App installiert.
â€¢ Schick mir bitte den Link.
â€¢ Das WLAN ist langsam.

EXERCICES
1. Choisissez 10 mots et Ã©crivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez lâ€™allemand et traduisez vos phrases du franÃ§ais vers lâ€™allemand.
4. Enregistrez oralement un rÃ©sumÃ© de 60 secondes.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” MÃ©dias et technologie','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” MÃ©dias et technologie');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation â€” MÃ©dias et technologie','allemand-a2-m05-l03','audio','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 5/12 â€” MÃ©dias et technologie
LEÃ‡ON 3/8 â€” Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÃˆLE
A: Mein Handy funktioniert nicht.
B: Ich habe die App installiert.
A: Schick mir bitte den Link.
B: Das WLAN ist langsam.

PRONONCIATION
â€¢ Ã‰coutez dâ€™abord sans lire.
â€¢ RÃ©Ã©coutez en suivant le texte.
â€¢ Faites du shadowing : rÃ©pÃ©tez presque en mÃªme temps que la voix.
â€¢ Jouez ensuite les deux rÃ´les sans regarder.

MISSION ORALE
CrÃ©ez un nouveau dialogue de 8 Ã  12 rÃ©pliques sur le mÃªme thÃ¨me. Utilisez au moins 6 expressions du module. Enregistrez-vous deux fois : une premiÃ¨re version lente, puis une version naturelle.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” MÃ©dias et technologie','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” MÃ©dias et technologie');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur â€” MÃ©dias et technologie','allemand-a2-m05-l04','text','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 5/12 â€” MÃ©dias et technologie
LEÃ‡ON 4/8 â€” Grammaire en profondeur

POINT DE GRAMMAIRE
impÃ©ratif; datif/accusatif.

EXPLICATION
La grammaire nâ€™est pas une liste de rÃ¨gles Ã  mÃ©moriser sÃ©parÃ©ment : elle sert Ã  exprimer une intention. Observez dâ€™abord la place du verbe, puis les complÃ©ments, et enfin les Ã©lÃ©ments de temps, cause ou opinion.

EXEMPLES
â€¢ Mein Handy funktioniert nicht.
â€¢ Ich habe die App installiert.
â€¢ Schick mir bitte den Link.
â€¢ Das WLAN ist langsam.

TRANSFORMATION GUIDÃ‰E
1. Mettez chaque phrase Ã  la forme nÃ©gative.
2. Transformez-la en question.
3. Changez la personne grammaticale.
4. Changez le temps si votre niveau le permet.
5. Combinez deux phrases avec un connecteur adaptÃ©.

ERREUR FRÃ‰QUENTE
Ne traduisez pas directement lâ€™ordre des mots du franÃ§ais. VÃ©rifiez toujours la position du verbe dans la proposition principale et la subordonnÃ©e.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” MÃ©dias et technologie','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” MÃ©dias et technologie');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'ComprÃ©hension et production â€” MÃ©dias et technologie','allemand-a2-m05-l05','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 5/12 â€” MÃ©dias et technologie
LEÃ‡ON 5/8 â€” ComprÃ©hension et production

TEXTE / SITUATION
Imaginez une situation rÃ©elle autour de Â« MÃ©dias et technologie Â». Les personnes utilisent les expressions suivantes :
â€¢ Mein Handy funktioniert nicht.
â€¢ Ich habe die App installiert.
â€¢ Schick mir bitte den Link.
â€¢ Das WLAN ist langsam.

COMPRÃ‰HENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou Ã©motion peut-on dÃ©duire ?
4. Reformulez le contenu en franÃ§ais, puis en allemand simple.

PRODUCTION Ã‰CRITE
RÃ©digez un texte adaptÃ© au niveau A2. Utilisez au moins 8 Ã©lÃ©ments du module et 3 structures liÃ©es Ã  : impÃ©ratif; datif/accusatif.

PRODUCTION ORALE
Parlez pendant 1 minute sans lire. Recommencez en amÃ©liorant la fluiditÃ©.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” MÃ©dias et technologie','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” MÃ©dias et technologie');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif â€” MÃ©dias et technologie','allemand-a2-m05-l06','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 5/12 â€” MÃ©dias et technologie
LEÃ‡ON 6/8 â€” Atelier intensif

ATELIER â€” 12 EXERCICES
1. Traduisez 5 phrases du franÃ§ais vers lâ€™allemand.
2. Transformez 5 affirmations en questions.
3. Corrigez 5 phrases contenant une erreur.
4. ComplÃ©tez un mini-dialogue de 10 lignes.
5. Remplacez les mots simples par des expressions du module.
6. Faites une dictÃ©e avec le bouton audio.
7. RÃ©sumez le dialogue en 5 phrases.
8. Parlez 90 secondes sans notes.
9. Ã‰crivez un message rÃ©el adaptÃ© au thÃ¨me.
10. Reformulez votre texte dans un registre plus poli.
11. CrÃ©ez 10 cartes mÃ©moire.
12. Refaites lâ€™exercice le plus difficile aprÃ¨s 24 heures.

BANQUE DE PHRASES
â€¢ Mein Handy funktioniert nicht.
â€¢ Ich habe die App installiert.
â€¢ Schick mir bitte den Link.
â€¢ Das WLAN ist langsam.

GRAMMAIRE Ã€ RÃ‰UTILISER
impÃ©ratif; datif/accusatif.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” MÃ©dias et technologie','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” MÃ©dias et technologie');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module â€” MÃ©dias et technologie','allemand-a2-m05-l07','quiz','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 5/12 â€” MÃ©dias et technologie
LEÃ‡ON 7/8 â€” Quiz de module

QUIZ DE VALIDATION â€” MÃ©dias et technologie

Avant de valider, vous devez pouvoir :
â€¢ comprendre les quatre expressions du module ;
â€¢ expliquer le point de grammaire Â« impÃ©ratif; datif/accusatif Â» ;
â€¢ crÃ©er vos propres exemples ;
â€¢ parler spontanÃ©ment sur le thÃ¨me ;
â€¢ corriger une erreur typique.

AUTO-TEST
1. Dites les quatre exemples sans lire.
2. CrÃ©ez cinq nouvelles phrases.
3. Expliquez la rÃ¨gle Ã  quelquâ€™un en franÃ§ais.
4. RÃ©pondez Ã  une question imprÃ©vue pendant 60 secondes.
5. Ã‰crivez un mini-texte et corrigez-le vous-mÃªme.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” MÃ©dias et technologie','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” MÃ©dias et technologie');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission rÃ©elle â€” MÃ©dias et technologie','allemand-a2-m05-l08','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 5/12 â€” MÃ©dias et technologie
LEÃ‡ON 8/8 â€” Mission rÃ©elle

MISSION RÃ‰ELLE â€” MÃ©dias et technologie

SCÃ‰NARIO
Vous devez utiliser et expliquer des outils quotidiens. Vous nâ€™avez droit quâ€™Ã  lâ€™allemand.

LIVRABLES
1. Un texte de 80 Ã  120 mots.
2. Un enregistrement oral de 1 Ã  2 minutes.
3. Un dialogue de 10 rÃ©pliques.
4. Une liste de 15 mots ou expressions rÃ©ellement utiles.
5. Une auto-correction : trois erreurs repÃ©rÃ©es et expliquÃ©es.

CRITÃˆRES
ClartÃ©, correction, vocabulaire adaptÃ©, fluiditÃ© et capacitÃ© Ã  accomplir la tÃ¢che.

EXPRESSIONS Ã€ RÃ‰UTILISER
â€¢ Mein Handy funktioniert nicht.
â€¢ Ich habe die App installiert.
â€¢ Schick mir bitte den Link.
â€¢ Das WLAN ist langsam.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” MÃ©dias et technologie','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” MÃ©dias et technologie');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'A2 Â· Module 6 â€” Relations et Ã©motions','Niveau A2 : exprimer sentiments et opinions simples. Grammaire : weil/dass; adjectifs Ã©motionnels. 8 leÃ§ons avec thÃ©orie, audio, exercices, quiz et mission rÃ©elle.',18) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre â€” Relations et Ã©motions','allemand-a2-m06-l01','text','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 6/12 â€” Relations et Ã©motions
LEÃ‡ON 1/8 â€” Comprendre

OBJECTIF
Exprimer sentiments et opinions simples.

EXPLICATION EN FRANÃ‡AIS
Ã€ ce niveau, vous devez apprendre Ã  communiquer avec Ã©changes courants, passÃ©, dÃ©marches et autonomie quotidienne. Le thÃ¨me Â« Relations et Ã©motions Â» sert de contexte rÃ©el. Commencez par comprendre lâ€™intention, puis repÃ©rez le verbe, les informations importantes et enfin les dÃ©tails.

MÃ‰THODE
1. Lisez les phrases sans traduire mot Ã  mot.
2. Soulignez le verbe conjuguÃ©.
3. RepÃ©rez qui parle, Ã  qui et dans quel but.
4. RÃ©pÃ©tez chaque phrase Ã  voix haute trois fois.
5. Changez un Ã©lÃ©ment pour crÃ©er votre propre exemple.

EXEMPLES ALLEMANDS
â€¢ Ich freue mich.
â€¢ Das macht mich traurig.
â€¢ Ich finde das wichtig.
â€¢ Meiner Meinung nach â€¦

Ã€ RETENIR
Grammaire centrale : weil/dass; adjectifs Ã©motionnels.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Relations et Ã©motions','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Relations et Ã©motions');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif â€” Relations et Ã©motions','allemand-a2-m06-l02','text','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 6/12 â€” Relations et Ã©motions
LEÃ‡ON 2/8 â€” Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur Â« Relations et Ã©motions Â».

VOCABULAIRE Ã€ ACTIVER
Meiner, Meinung, finde, freue, macht, mich, nach, traurig, wichtig

TECHNIQUE 4 Ã‰TAPES
1. Ã‰coutez le mot avec le bouton audio.
2. RÃ©pÃ©tez-le dans une phrase complÃ¨te.
3. CrÃ©ez une phrase vraie sur votre vie.
4. RÃ©utilisez-le 24 heures plus tard.

MODÃˆLES
â€¢ Ich freue mich.
â€¢ Das macht mich traurig.
â€¢ Ich finde das wichtig.
â€¢ Meiner Meinung nach â€¦

EXERCICES
1. Choisissez 10 mots et Ã©crivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez lâ€™allemand et traduisez vos phrases du franÃ§ais vers lâ€™allemand.
4. Enregistrez oralement un rÃ©sumÃ© de 60 secondes.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Relations et Ã©motions','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Relations et Ã©motions');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation â€” Relations et Ã©motions','allemand-a2-m06-l03','audio','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 6/12 â€” Relations et Ã©motions
LEÃ‡ON 3/8 â€” Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÃˆLE
A: Ich freue mich.
B: Das macht mich traurig.
A: Ich finde das wichtig.
B: Meiner Meinung nach â€¦

PRONONCIATION
â€¢ Ã‰coutez dâ€™abord sans lire.
â€¢ RÃ©Ã©coutez en suivant le texte.
â€¢ Faites du shadowing : rÃ©pÃ©tez presque en mÃªme temps que la voix.
â€¢ Jouez ensuite les deux rÃ´les sans regarder.

MISSION ORALE
CrÃ©ez un nouveau dialogue de 8 Ã  12 rÃ©pliques sur le mÃªme thÃ¨me. Utilisez au moins 6 expressions du module. Enregistrez-vous deux fois : une premiÃ¨re version lente, puis une version naturelle.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Relations et Ã©motions','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Relations et Ã©motions');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur â€” Relations et Ã©motions','allemand-a2-m06-l04','text','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 6/12 â€” Relations et Ã©motions
LEÃ‡ON 4/8 â€” Grammaire en profondeur

POINT DE GRAMMAIRE
weil/dass; adjectifs Ã©motionnels.

EXPLICATION
La grammaire nâ€™est pas une liste de rÃ¨gles Ã  mÃ©moriser sÃ©parÃ©ment : elle sert Ã  exprimer une intention. Observez dâ€™abord la place du verbe, puis les complÃ©ments, et enfin les Ã©lÃ©ments de temps, cause ou opinion.

EXEMPLES
â€¢ Ich freue mich.
â€¢ Das macht mich traurig.
â€¢ Ich finde das wichtig.
â€¢ Meiner Meinung nach â€¦

TRANSFORMATION GUIDÃ‰E
1. Mettez chaque phrase Ã  la forme nÃ©gative.
2. Transformez-la en question.
3. Changez la personne grammaticale.
4. Changez le temps si votre niveau le permet.
5. Combinez deux phrases avec un connecteur adaptÃ©.

ERREUR FRÃ‰QUENTE
Ne traduisez pas directement lâ€™ordre des mots du franÃ§ais. VÃ©rifiez toujours la position du verbe dans la proposition principale et la subordonnÃ©e.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Relations et Ã©motions','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Relations et Ã©motions');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'ComprÃ©hension et production â€” Relations et Ã©motions','allemand-a2-m06-l05','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 6/12 â€” Relations et Ã©motions
LEÃ‡ON 5/8 â€” ComprÃ©hension et production

TEXTE / SITUATION
Imaginez une situation rÃ©elle autour de Â« Relations et Ã©motions Â». Les personnes utilisent les expressions suivantes :
â€¢ Ich freue mich.
â€¢ Das macht mich traurig.
â€¢ Ich finde das wichtig.
â€¢ Meiner Meinung nach â€¦

COMPRÃ‰HENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou Ã©motion peut-on dÃ©duire ?
4. Reformulez le contenu en franÃ§ais, puis en allemand simple.

PRODUCTION Ã‰CRITE
RÃ©digez un texte adaptÃ© au niveau A2. Utilisez au moins 8 Ã©lÃ©ments du module et 3 structures liÃ©es Ã  : weil/dass; adjectifs Ã©motionnels.

PRODUCTION ORALE
Parlez pendant 1 minute sans lire. Recommencez en amÃ©liorant la fluiditÃ©.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Relations et Ã©motions','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Relations et Ã©motions');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif â€” Relations et Ã©motions','allemand-a2-m06-l06','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 6/12 â€” Relations et Ã©motions
LEÃ‡ON 6/8 â€” Atelier intensif

ATELIER â€” 12 EXERCICES
1. Traduisez 5 phrases du franÃ§ais vers lâ€™allemand.
2. Transformez 5 affirmations en questions.
3. Corrigez 5 phrases contenant une erreur.
4. ComplÃ©tez un mini-dialogue de 10 lignes.
5. Remplacez les mots simples par des expressions du module.
6. Faites une dictÃ©e avec le bouton audio.
7. RÃ©sumez le dialogue en 5 phrases.
8. Parlez 90 secondes sans notes.
9. Ã‰crivez un message rÃ©el adaptÃ© au thÃ¨me.
10. Reformulez votre texte dans un registre plus poli.
11. CrÃ©ez 10 cartes mÃ©moire.
12. Refaites lâ€™exercice le plus difficile aprÃ¨s 24 heures.

BANQUE DE PHRASES
â€¢ Ich freue mich.
â€¢ Das macht mich traurig.
â€¢ Ich finde das wichtig.
â€¢ Meiner Meinung nach â€¦

GRAMMAIRE Ã€ RÃ‰UTILISER
weil/dass; adjectifs Ã©motionnels.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Relations et Ã©motions','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Relations et Ã©motions');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module â€” Relations et Ã©motions','allemand-a2-m06-l07','quiz','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 6/12 â€” Relations et Ã©motions
LEÃ‡ON 7/8 â€” Quiz de module

QUIZ DE VALIDATION â€” Relations et Ã©motions

Avant de valider, vous devez pouvoir :
â€¢ comprendre les quatre expressions du module ;
â€¢ expliquer le point de grammaire Â« weil/dass; adjectifs Ã©motionnels Â» ;
â€¢ crÃ©er vos propres exemples ;
â€¢ parler spontanÃ©ment sur le thÃ¨me ;
â€¢ corriger une erreur typique.

AUTO-TEST
1. Dites les quatre exemples sans lire.
2. CrÃ©ez cinq nouvelles phrases.
3. Expliquez la rÃ¨gle Ã  quelquâ€™un en franÃ§ais.
4. RÃ©pondez Ã  une question imprÃ©vue pendant 60 secondes.
5. Ã‰crivez un mini-texte et corrigez-le vous-mÃªme.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Relations et Ã©motions','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Relations et Ã©motions');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission rÃ©elle â€” Relations et Ã©motions','allemand-a2-m06-l08','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU A2
MODULE 6/12 â€” Relations et Ã©motions
LEÃ‡ON 8/8 â€” Mission rÃ©elle

MISSION RÃ‰ELLE â€” Relations et Ã©motions

SCÃ‰NARIO
Vous devez exprimer sentiments et opinions simples. Vous nâ€™avez droit quâ€™Ã  lâ€™allemand.

LIVRABLES
1. Un texte de 80 Ã  120 mots.
2. Un enregistrement oral de 1 Ã  2 minutes.
3. Un dialogue de 10 rÃ©pliques.
4. Une liste de 15 mots ou expressions rÃ©ellement utiles.
5. Une auto-correction : trois erreurs repÃ©rÃ©es et expliquÃ©es.

CRITÃˆRES
ClartÃ©, correction, vocabulaire adaptÃ©, fluiditÃ© et capacitÃ© Ã  accomplir la tÃ¢che.

EXPRESSIONS Ã€ RÃ‰UTILISER
â€¢ Ich freue mich.
â€¢ Das macht mich traurig.
â€¢ Ich finde das wichtig.
â€¢ Meiner Meinung nach â€¦

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2100,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Relations et Ã©motions','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Relations et Ã©motions');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
END $$;

SELECT 'Partie 3/10 installÃ©e : modules 13 Ã  18' AS resultat;


