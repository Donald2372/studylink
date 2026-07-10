-- StudyLink 020 - Allemand A1-C1 - Partie 8/10
-- Modules 43 Ã  48
DO $$
DECLARE v_course UUID; v_module UUID; v_lesson UUID;
BEGIN
  SELECT id INTO v_course FROM public.courses WHERE slug='allemand-complet-a1-c1' ORDER BY created_at DESC NULLS LAST LIMIT 1;
  IF v_course IS NULL THEN RAISE EXCEPTION 'Le cours allemand n existe pas encore. Executez d abord la partie 01.'; END IF;
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B2 Â· Module 7 â€” Psychologie et communication','Niveau B2 : analyser comportements et malentendus. Grammaire : nicht nurâ€¦sondern auch; dadurch dass. 8 leÃ§ons avec thÃ©orie, audio, exercices, quiz et mission rÃ©elle.',43) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre â€” Psychologie et communication','allemand-b2-m07-l01','text','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 7/12 â€” Psychologie et communication
LEÃ‡ON 1/8 â€” Comprendre

OBJECTIF
Analyser comportements et malentendus.

EXPLICATION EN FRANÃ‡AIS
Ã€ ce niveau, vous devez apprendre Ã  communiquer avec argumentation nuancÃ©e, comprÃ©hension authentique et langue professionnelle. Le thÃ¨me Â« Psychologie et communication Â» sert de contexte rÃ©el. Commencez par comprendre lâ€™intention, puis repÃ©rez le verbe, les informations importantes et enfin les dÃ©tails.

MÃ‰THODE
1. Lisez les phrases sans traduire mot Ã  mot.
2. Soulignez le verbe conjuguÃ©.
3. RepÃ©rez qui parle, Ã  qui et dans quel but.
4. RÃ©pÃ©tez chaque phrase Ã  voix haute trois fois.
5. Changez un Ã©lÃ©ment pour crÃ©er votre propre exemple.

EXEMPLES ALLEMANDS
â€¢ MissverstÃ¤ndnisse entstehen hÃ¤ufig dadurch, dass â€¦
â€¢ Entscheidend ist nicht nur â€¦, sondern auch â€¦
â€¢ Je nach Kontext â€¦
â€¢ Es wÃ¤re sinnvoll, â€¦

Ã€ RETENIR
Grammaire centrale : nicht nurâ€¦sondern auch; dadurch dass.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Psychologie et communication','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Psychologie et communication');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif â€” Psychologie et communication','allemand-b2-m07-l02','text','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 7/12 â€” Psychologie et communication
LEÃ‡ON 2/8 â€” Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur Â« Psychologie et communication Â».

VOCABULAIRE Ã€ ACTIVER
Entscheidend, Kontext, MissverstÃ¤ndnisse, auch, dadurch, dass, entstehen, hÃ¤ufig, nach, nicht, sinnvoll, sondern, wÃ¤re

TECHNIQUE 4 Ã‰TAPES
1. Ã‰coutez le mot avec le bouton audio.
2. RÃ©pÃ©tez-le dans une phrase complÃ¨te.
3. CrÃ©ez une phrase vraie sur votre vie.
4. RÃ©utilisez-le 24 heures plus tard.

MODÃˆLES
â€¢ MissverstÃ¤ndnisse entstehen hÃ¤ufig dadurch, dass â€¦
â€¢ Entscheidend ist nicht nur â€¦, sondern auch â€¦
â€¢ Je nach Kontext â€¦
â€¢ Es wÃ¤re sinnvoll, â€¦

EXERCICES
1. Choisissez 10 mots et Ã©crivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez lâ€™allemand et traduisez vos phrases du franÃ§ais vers lâ€™allemand.
4. Enregistrez oralement un rÃ©sumÃ© de 60 secondes.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Psychologie et communication','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Psychologie et communication');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation â€” Psychologie et communication','allemand-b2-m07-l03','audio','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 7/12 â€” Psychologie et communication
LEÃ‡ON 3/8 â€” Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÃˆLE
A: MissverstÃ¤ndnisse entstehen hÃ¤ufig dadurch, dass â€¦
B: Entscheidend ist nicht nur â€¦, sondern auch â€¦
A: Je nach Kontext â€¦
B: Es wÃ¤re sinnvoll, â€¦

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Psychologie et communication','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Psychologie et communication');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur â€” Psychologie et communication','allemand-b2-m07-l04','text','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 7/12 â€” Psychologie et communication
LEÃ‡ON 4/8 â€” Grammaire en profondeur

POINT DE GRAMMAIRE
nicht nurâ€¦sondern auch; dadurch dass.

EXPLICATION
La grammaire nâ€™est pas une liste de rÃ¨gles Ã  mÃ©moriser sÃ©parÃ©ment : elle sert Ã  exprimer une intention. Observez dâ€™abord la place du verbe, puis les complÃ©ments, et enfin les Ã©lÃ©ments de temps, cause ou opinion.

EXEMPLES
â€¢ MissverstÃ¤ndnisse entstehen hÃ¤ufig dadurch, dass â€¦
â€¢ Entscheidend ist nicht nur â€¦, sondern auch â€¦
â€¢ Je nach Kontext â€¦
â€¢ Es wÃ¤re sinnvoll, â€¦

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Psychologie et communication','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Psychologie et communication');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'ComprÃ©hension et production â€” Psychologie et communication','allemand-b2-m07-l05','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 7/12 â€” Psychologie et communication
LEÃ‡ON 5/8 â€” ComprÃ©hension et production

TEXTE / SITUATION
Imaginez une situation rÃ©elle autour de Â« Psychologie et communication Â». Les personnes utilisent les expressions suivantes :
â€¢ MissverstÃ¤ndnisse entstehen hÃ¤ufig dadurch, dass â€¦
â€¢ Entscheidend ist nicht nur â€¦, sondern auch â€¦
â€¢ Je nach Kontext â€¦
â€¢ Es wÃ¤re sinnvoll, â€¦

COMPRÃ‰HENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou Ã©motion peut-on dÃ©duire ?
4. Reformulez le contenu en franÃ§ais, puis en allemand simple.

PRODUCTION Ã‰CRITE
RÃ©digez un texte adaptÃ© au niveau B2. Utilisez au moins 8 Ã©lÃ©ments du module et 3 structures liÃ©es Ã  : nicht nurâ€¦sondern auch; dadurch dass.

PRODUCTION ORALE
Parlez pendant 2 Ã  4 minutes sans lire. Recommencez en amÃ©liorant la fluiditÃ©.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Psychologie et communication','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Psychologie et communication');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif â€” Psychologie et communication','allemand-b2-m07-l06','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 7/12 â€” Psychologie et communication
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
â€¢ MissverstÃ¤ndnisse entstehen hÃ¤ufig dadurch, dass â€¦
â€¢ Entscheidend ist nicht nur â€¦, sondern auch â€¦
â€¢ Je nach Kontext â€¦
â€¢ Es wÃ¤re sinnvoll, â€¦

GRAMMAIRE Ã€ RÃ‰UTILISER
nicht nurâ€¦sondern auch; dadurch dass.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Psychologie et communication','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Psychologie et communication');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module â€” Psychologie et communication','allemand-b2-m07-l07','quiz','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 7/12 â€” Psychologie et communication
LEÃ‡ON 7/8 â€” Quiz de module

QUIZ DE VALIDATION â€” Psychologie et communication

Avant de valider, vous devez pouvoir :
â€¢ comprendre les quatre expressions du module ;
â€¢ expliquer le point de grammaire Â« nicht nurâ€¦sondern auch; dadurch dass Â» ;
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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Psychologie et communication','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Psychologie et communication');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission rÃ©elle â€” Psychologie et communication','allemand-b2-m07-l08','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 7/12 â€” Psychologie et communication
LEÃ‡ON 8/8 â€” Mission rÃ©elle

MISSION RÃ‰ELLE â€” Psychologie et communication

SCÃ‰NARIO
Vous devez analyser comportements et malentendus. Vous nâ€™avez droit quâ€™Ã  lâ€™allemand.

LIVRABLES
1. Un texte de 180 Ã  350 mots.
2. Un enregistrement oral de 3 Ã  6 minutes.
3. Un dialogue de 10 rÃ©pliques.
4. Une liste de 15 mots ou expressions rÃ©ellement utiles.
5. Une auto-correction : trois erreurs repÃ©rÃ©es et expliquÃ©es.

CRITÃˆRES
ClartÃ©, correction, vocabulaire adaptÃ©, fluiditÃ© et capacitÃ© Ã  accomplir la tÃ¢che.

EXPRESSIONS Ã€ RÃ‰UTILISER
â€¢ MissverstÃ¤ndnisse entstehen hÃ¤ufig dadurch, dass â€¦
â€¢ Entscheidend ist nicht nur â€¦, sondern auch â€¦
â€¢ Je nach Kontext â€¦
â€¢ Es wÃ¤re sinnvoll, â€¦

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Psychologie et communication','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Psychologie et communication');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B2 Â· Module 8 â€” Culture, littÃ©rature et film','Niveau B2 : analyser une Å“uvre et son effet. Grammaire : langage analytique; adjectifs participiaux. 8 leÃ§ons avec thÃ©orie, audio, exercices, quiz et mission rÃ©elle.',44) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre â€” Culture, littÃ©rature et film','allemand-b2-m08-l01','text','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 8/12 â€” Culture, littÃ©rature et film
LEÃ‡ON 1/8 â€” Comprendre

OBJECTIF
Analyser une Å“uvre et son effet.

EXPLICATION EN FRANÃ‡AIS
Ã€ ce niveau, vous devez apprendre Ã  communiquer avec argumentation nuancÃ©e, comprÃ©hension authentique et langue professionnelle. Le thÃ¨me Â« Culture, littÃ©rature et film Â» sert de contexte rÃ©el. Commencez par comprendre lâ€™intention, puis repÃ©rez le verbe, les informations importantes et enfin les dÃ©tails.

MÃ‰THODE
1. Lisez les phrases sans traduire mot Ã  mot.
2. Soulignez le verbe conjuguÃ©.
3. RepÃ©rez qui parle, Ã  qui et dans quel but.
4. RÃ©pÃ©tez chaque phrase Ã  voix haute trois fois.
5. Changez un Ã©lÃ©ment pour crÃ©er votre propre exemple.

EXEMPLES ALLEMANDS
â€¢ Das Werk thematisiert â€¦
â€¢ Die Figur verkÃ¶rpert â€¦
â€¢ Besonders auffÃ¤llig ist â€¦
â€¢ Die Wirkung entsteht durch â€¦

Ã€ RETENIR
Grammaire centrale : langage analytique; adjectifs participiaux.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Culture, littÃ©rature et film','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Culture, littÃ©rature et film');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif â€” Culture, littÃ©rature et film','allemand-b2-m08-l02','text','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 8/12 â€” Culture, littÃ©rature et film
LEÃ‡ON 2/8 â€” Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur Â« Culture, littÃ©rature et film Â».

VOCABULAIRE Ã€ ACTIVER
Besonders, Figur, Werk, Wirkung, auffÃ¤llig, durch, entsteht, thematisiert, verkÃ¶rpert

TECHNIQUE 4 Ã‰TAPES
1. Ã‰coutez le mot avec le bouton audio.
2. RÃ©pÃ©tez-le dans une phrase complÃ¨te.
3. CrÃ©ez une phrase vraie sur votre vie.
4. RÃ©utilisez-le 24 heures plus tard.

MODÃˆLES
â€¢ Das Werk thematisiert â€¦
â€¢ Die Figur verkÃ¶rpert â€¦
â€¢ Besonders auffÃ¤llig ist â€¦
â€¢ Die Wirkung entsteht durch â€¦

EXERCICES
1. Choisissez 10 mots et Ã©crivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez lâ€™allemand et traduisez vos phrases du franÃ§ais vers lâ€™allemand.
4. Enregistrez oralement un rÃ©sumÃ© de 60 secondes.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Culture, littÃ©rature et film','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Culture, littÃ©rature et film');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation â€” Culture, littÃ©rature et film','allemand-b2-m08-l03','audio','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 8/12 â€” Culture, littÃ©rature et film
LEÃ‡ON 3/8 â€” Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÃˆLE
A: Das Werk thematisiert â€¦
B: Die Figur verkÃ¶rpert â€¦
A: Besonders auffÃ¤llig ist â€¦
B: Die Wirkung entsteht durch â€¦

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Culture, littÃ©rature et film','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Culture, littÃ©rature et film');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur â€” Culture, littÃ©rature et film','allemand-b2-m08-l04','text','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 8/12 â€” Culture, littÃ©rature et film
LEÃ‡ON 4/8 â€” Grammaire en profondeur

POINT DE GRAMMAIRE
langage analytique; adjectifs participiaux.

EXPLICATION
La grammaire nâ€™est pas une liste de rÃ¨gles Ã  mÃ©moriser sÃ©parÃ©ment : elle sert Ã  exprimer une intention. Observez dâ€™abord la place du verbe, puis les complÃ©ments, et enfin les Ã©lÃ©ments de temps, cause ou opinion.

EXEMPLES
â€¢ Das Werk thematisiert â€¦
â€¢ Die Figur verkÃ¶rpert â€¦
â€¢ Besonders auffÃ¤llig ist â€¦
â€¢ Die Wirkung entsteht durch â€¦

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Culture, littÃ©rature et film','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Culture, littÃ©rature et film');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'ComprÃ©hension et production â€” Culture, littÃ©rature et film','allemand-b2-m08-l05','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 8/12 â€” Culture, littÃ©rature et film
LEÃ‡ON 5/8 â€” ComprÃ©hension et production

TEXTE / SITUATION
Imaginez une situation rÃ©elle autour de Â« Culture, littÃ©rature et film Â». Les personnes utilisent les expressions suivantes :
â€¢ Das Werk thematisiert â€¦
â€¢ Die Figur verkÃ¶rpert â€¦
â€¢ Besonders auffÃ¤llig ist â€¦
â€¢ Die Wirkung entsteht durch â€¦

COMPRÃ‰HENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou Ã©motion peut-on dÃ©duire ?
4. Reformulez le contenu en franÃ§ais, puis en allemand simple.

PRODUCTION Ã‰CRITE
RÃ©digez un texte adaptÃ© au niveau B2. Utilisez au moins 8 Ã©lÃ©ments du module et 3 structures liÃ©es Ã  : langage analytique; adjectifs participiaux.

PRODUCTION ORALE
Parlez pendant 2 Ã  4 minutes sans lire. Recommencez en amÃ©liorant la fluiditÃ©.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Culture, littÃ©rature et film','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Culture, littÃ©rature et film');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif â€” Culture, littÃ©rature et film','allemand-b2-m08-l06','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 8/12 â€” Culture, littÃ©rature et film
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
â€¢ Das Werk thematisiert â€¦
â€¢ Die Figur verkÃ¶rpert â€¦
â€¢ Besonders auffÃ¤llig ist â€¦
â€¢ Die Wirkung entsteht durch â€¦

GRAMMAIRE Ã€ RÃ‰UTILISER
langage analytique; adjectifs participiaux.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Culture, littÃ©rature et film','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Culture, littÃ©rature et film');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module â€” Culture, littÃ©rature et film','allemand-b2-m08-l07','quiz','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 8/12 â€” Culture, littÃ©rature et film
LEÃ‡ON 7/8 â€” Quiz de module

QUIZ DE VALIDATION â€” Culture, littÃ©rature et film

Avant de valider, vous devez pouvoir :
â€¢ comprendre les quatre expressions du module ;
â€¢ expliquer le point de grammaire Â« langage analytique; adjectifs participiaux Â» ;
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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Culture, littÃ©rature et film','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Culture, littÃ©rature et film');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission rÃ©elle â€” Culture, littÃ©rature et film','allemand-b2-m08-l08','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 8/12 â€” Culture, littÃ©rature et film
LEÃ‡ON 8/8 â€” Mission rÃ©elle

MISSION RÃ‰ELLE â€” Culture, littÃ©rature et film

SCÃ‰NARIO
Vous devez analyser une Å“uvre et son effet. Vous nâ€™avez droit quâ€™Ã  lâ€™allemand.

LIVRABLES
1. Un texte de 180 Ã  350 mots.
2. Un enregistrement oral de 3 Ã  6 minutes.
3. Un dialogue de 10 rÃ©pliques.
4. Une liste de 15 mots ou expressions rÃ©ellement utiles.
5. Une auto-correction : trois erreurs repÃ©rÃ©es et expliquÃ©es.

CRITÃˆRES
ClartÃ©, correction, vocabulaire adaptÃ©, fluiditÃ© et capacitÃ© Ã  accomplir la tÃ¢che.

EXPRESSIONS Ã€ RÃ‰UTILISER
â€¢ Das Werk thematisiert â€¦
â€¢ Die Figur verkÃ¶rpert â€¦
â€¢ Besonders auffÃ¤llig ist â€¦
â€¢ Die Wirkung entsteht durch â€¦

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Culture, littÃ©rature et film','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Culture, littÃ©rature et film');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B2 Â· Module 9 â€” DÃ©bats et prise de parole','Niveau B2 : rÃ©agir spontanÃ©ment et structurer. Grammaire : cohÃ©sion orale; reformulation. 8 leÃ§ons avec thÃ©orie, audio, exercices, quiz et mission rÃ©elle.',45) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre â€” DÃ©bats et prise de parole','allemand-b2-m09-l01','text','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 9/12 â€” DÃ©bats et prise de parole
LEÃ‡ON 1/8 â€” Comprendre

OBJECTIF
RÃ©agir spontanÃ©ment et structurer.

EXPLICATION EN FRANÃ‡AIS
Ã€ ce niveau, vous devez apprendre Ã  communiquer avec argumentation nuancÃ©e, comprÃ©hension authentique et langue professionnelle. Le thÃ¨me Â« DÃ©bats et prise de parole Â» sert de contexte rÃ©el. Commencez par comprendre lâ€™intention, puis repÃ©rez le verbe, les informations importantes et enfin les dÃ©tails.

MÃ‰THODE
1. Lisez les phrases sans traduire mot Ã  mot.
2. Soulignez le verbe conjuguÃ©.
3. RepÃ©rez qui parle, Ã  qui et dans quel but.
4. RÃ©pÃ©tez chaque phrase Ã  voix haute trois fois.
5. Changez un Ã©lÃ©ment pour crÃ©er votre propre exemple.

EXEMPLES ALLEMANDS
â€¢ Ich wÃ¼rde die Frage gern anders formulieren.
â€¢ Daran anschlieÃŸend â€¦
â€¢ Ich mÃ¶chte zwischen zwei Ebenen unterscheiden.
â€¢ Lassen Sie mich ein Beispiel nennen.

Ã€ RETENIR
Grammaire centrale : cohÃ©sion orale; reformulation.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” DÃ©bats et prise de parole','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” DÃ©bats et prise de parole');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif â€” DÃ©bats et prise de parole','allemand-b2-m09-l02','text','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 9/12 â€” DÃ©bats et prise de parole
LEÃ‡ON 2/8 â€” Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur Â« DÃ©bats et prise de parole Â».

VOCABULAIRE Ã€ ACTIVER
Beispiel, Daran, Ebenen, Frage, Lassen, anders, anschlieÃŸend, formulieren, gern, mich, mÃ¶chte, nennen, unterscheiden, wÃ¼rde, zwei, zwischen

TECHNIQUE 4 Ã‰TAPES
1. Ã‰coutez le mot avec le bouton audio.
2. RÃ©pÃ©tez-le dans une phrase complÃ¨te.
3. CrÃ©ez une phrase vraie sur votre vie.
4. RÃ©utilisez-le 24 heures plus tard.

MODÃˆLES
â€¢ Ich wÃ¼rde die Frage gern anders formulieren.
â€¢ Daran anschlieÃŸend â€¦
â€¢ Ich mÃ¶chte zwischen zwei Ebenen unterscheiden.
â€¢ Lassen Sie mich ein Beispiel nennen.

EXERCICES
1. Choisissez 10 mots et Ã©crivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez lâ€™allemand et traduisez vos phrases du franÃ§ais vers lâ€™allemand.
4. Enregistrez oralement un rÃ©sumÃ© de 60 secondes.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” DÃ©bats et prise de parole','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” DÃ©bats et prise de parole');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation â€” DÃ©bats et prise de parole','allemand-b2-m09-l03','audio','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 9/12 â€” DÃ©bats et prise de parole
LEÃ‡ON 3/8 â€” Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÃˆLE
A: Ich wÃ¼rde die Frage gern anders formulieren.
B: Daran anschlieÃŸend â€¦
A: Ich mÃ¶chte zwischen zwei Ebenen unterscheiden.
B: Lassen Sie mich ein Beispiel nennen.

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” DÃ©bats et prise de parole','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” DÃ©bats et prise de parole');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur â€” DÃ©bats et prise de parole','allemand-b2-m09-l04','text','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 9/12 â€” DÃ©bats et prise de parole
LEÃ‡ON 4/8 â€” Grammaire en profondeur

POINT DE GRAMMAIRE
cohÃ©sion orale; reformulation.

EXPLICATION
La grammaire nâ€™est pas une liste de rÃ¨gles Ã  mÃ©moriser sÃ©parÃ©ment : elle sert Ã  exprimer une intention. Observez dâ€™abord la place du verbe, puis les complÃ©ments, et enfin les Ã©lÃ©ments de temps, cause ou opinion.

EXEMPLES
â€¢ Ich wÃ¼rde die Frage gern anders formulieren.
â€¢ Daran anschlieÃŸend â€¦
â€¢ Ich mÃ¶chte zwischen zwei Ebenen unterscheiden.
â€¢ Lassen Sie mich ein Beispiel nennen.

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” DÃ©bats et prise de parole','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” DÃ©bats et prise de parole');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'ComprÃ©hension et production â€” DÃ©bats et prise de parole','allemand-b2-m09-l05','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 9/12 â€” DÃ©bats et prise de parole
LEÃ‡ON 5/8 â€” ComprÃ©hension et production

TEXTE / SITUATION
Imaginez une situation rÃ©elle autour de Â« DÃ©bats et prise de parole Â». Les personnes utilisent les expressions suivantes :
â€¢ Ich wÃ¼rde die Frage gern anders formulieren.
â€¢ Daran anschlieÃŸend â€¦
â€¢ Ich mÃ¶chte zwischen zwei Ebenen unterscheiden.
â€¢ Lassen Sie mich ein Beispiel nennen.

COMPRÃ‰HENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou Ã©motion peut-on dÃ©duire ?
4. Reformulez le contenu en franÃ§ais, puis en allemand simple.

PRODUCTION Ã‰CRITE
RÃ©digez un texte adaptÃ© au niveau B2. Utilisez au moins 8 Ã©lÃ©ments du module et 3 structures liÃ©es Ã  : cohÃ©sion orale; reformulation.

PRODUCTION ORALE
Parlez pendant 2 Ã  4 minutes sans lire. Recommencez en amÃ©liorant la fluiditÃ©.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” DÃ©bats et prise de parole','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” DÃ©bats et prise de parole');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif â€” DÃ©bats et prise de parole','allemand-b2-m09-l06','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 9/12 â€” DÃ©bats et prise de parole
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
â€¢ Ich wÃ¼rde die Frage gern anders formulieren.
â€¢ Daran anschlieÃŸend â€¦
â€¢ Ich mÃ¶chte zwischen zwei Ebenen unterscheiden.
â€¢ Lassen Sie mich ein Beispiel nennen.

GRAMMAIRE Ã€ RÃ‰UTILISER
cohÃ©sion orale; reformulation.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” DÃ©bats et prise de parole','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” DÃ©bats et prise de parole');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module â€” DÃ©bats et prise de parole','allemand-b2-m09-l07','quiz','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 9/12 â€” DÃ©bats et prise de parole
LEÃ‡ON 7/8 â€” Quiz de module

QUIZ DE VALIDATION â€” DÃ©bats et prise de parole

Avant de valider, vous devez pouvoir :
â€¢ comprendre les quatre expressions du module ;
â€¢ expliquer le point de grammaire Â« cohÃ©sion orale; reformulation Â» ;
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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” DÃ©bats et prise de parole','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” DÃ©bats et prise de parole');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission rÃ©elle â€” DÃ©bats et prise de parole','allemand-b2-m09-l08','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 9/12 â€” DÃ©bats et prise de parole
LEÃ‡ON 8/8 â€” Mission rÃ©elle

MISSION RÃ‰ELLE â€” DÃ©bats et prise de parole

SCÃ‰NARIO
Vous devez rÃ©agir spontanÃ©ment et structurer. Vous nâ€™avez droit quâ€™Ã  lâ€™allemand.

LIVRABLES
1. Un texte de 180 Ã  350 mots.
2. Un enregistrement oral de 3 Ã  6 minutes.
3. Un dialogue de 10 rÃ©pliques.
4. Une liste de 15 mots ou expressions rÃ©ellement utiles.
5. Une auto-correction : trois erreurs repÃ©rÃ©es et expliquÃ©es.

CRITÃˆRES
ClartÃ©, correction, vocabulaire adaptÃ©, fluiditÃ© et capacitÃ© Ã  accomplir la tÃ¢che.

EXPRESSIONS Ã€ RÃ‰UTILISER
â€¢ Ich wÃ¼rde die Frage gern anders formulieren.
â€¢ Daran anschlieÃŸend â€¦
â€¢ Ich mÃ¶chte zwischen zwei Ebenen unterscheiden.
â€¢ Lassen Sie mich ein Beispiel nennen.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” DÃ©bats et prise de parole','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” DÃ©bats et prise de parole');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B2 Â· Module 10 â€” Ã‰crits formels avancÃ©s','Niveau B2 : rÃ©diger rapports, avis et courriels complexes. Grammaire : style nominal; passif. 8 leÃ§ons avec thÃ©orie, audio, exercices, quiz et mission rÃ©elle.',46) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre â€” Ã‰crits formels avancÃ©s','allemand-b2-m10-l01','text','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 10/12 â€” Ã‰crits formels avancÃ©s
LEÃ‡ON 1/8 â€” Comprendre

OBJECTIF
RÃ©diger rapports, avis et courriels complexes.

EXPLICATION EN FRANÃ‡AIS
Ã€ ce niveau, vous devez apprendre Ã  communiquer avec argumentation nuancÃ©e, comprÃ©hension authentique et langue professionnelle. Le thÃ¨me Â« Ã‰crits formels avancÃ©s Â» sert de contexte rÃ©el. Commencez par comprendre lâ€™intention, puis repÃ©rez le verbe, les informations importantes et enfin les dÃ©tails.

MÃ‰THODE
1. Lisez les phrases sans traduire mot Ã  mot.
2. Soulignez le verbe conjuguÃ©.
3. RepÃ©rez qui parle, Ã  qui et dans quel but.
4. RÃ©pÃ©tez chaque phrase Ã  voix haute trois fois.
5. Changez un Ã©lÃ©ment pour crÃ©er votre propre exemple.

EXEMPLES ALLEMANDS
â€¢ Bezugnehmend auf â€¦
â€¢ Im Folgenden werden â€¦
â€¢ Es empfiehlt sich, â€¦
â€¢ FÃ¼r RÃ¼ckfragen stehe ich gern zur VerfÃ¼gung.

Ã€ RETENIR
Grammaire centrale : style nominal; passif.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Ã‰crits formels avancÃ©s','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Ã‰crits formels avancÃ©s');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif â€” Ã‰crits formels avancÃ©s','allemand-b2-m10-l02','text','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 10/12 â€” Ã‰crits formels avancÃ©s
LEÃ‡ON 2/8 â€” Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur Â« Ã‰crits formels avancÃ©s Â».

VOCABULAIRE Ã€ ACTIVER
Bezugnehmend, Folgenden, RÃ¼ckfragen, VerfÃ¼gung, empfiehlt, gern, sich, stehe, werden

TECHNIQUE 4 Ã‰TAPES
1. Ã‰coutez le mot avec le bouton audio.
2. RÃ©pÃ©tez-le dans une phrase complÃ¨te.
3. CrÃ©ez une phrase vraie sur votre vie.
4. RÃ©utilisez-le 24 heures plus tard.

MODÃˆLES
â€¢ Bezugnehmend auf â€¦
â€¢ Im Folgenden werden â€¦
â€¢ Es empfiehlt sich, â€¦
â€¢ FÃ¼r RÃ¼ckfragen stehe ich gern zur VerfÃ¼gung.

EXERCICES
1. Choisissez 10 mots et Ã©crivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez lâ€™allemand et traduisez vos phrases du franÃ§ais vers lâ€™allemand.
4. Enregistrez oralement un rÃ©sumÃ© de 60 secondes.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Ã‰crits formels avancÃ©s','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Ã‰crits formels avancÃ©s');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation â€” Ã‰crits formels avancÃ©s','allemand-b2-m10-l03','audio','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 10/12 â€” Ã‰crits formels avancÃ©s
LEÃ‡ON 3/8 â€” Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÃˆLE
A: Bezugnehmend auf â€¦
B: Im Folgenden werden â€¦
A: Es empfiehlt sich, â€¦
B: FÃ¼r RÃ¼ckfragen stehe ich gern zur VerfÃ¼gung.

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Ã‰crits formels avancÃ©s','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Ã‰crits formels avancÃ©s');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur â€” Ã‰crits formels avancÃ©s','allemand-b2-m10-l04','text','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 10/12 â€” Ã‰crits formels avancÃ©s
LEÃ‡ON 4/8 â€” Grammaire en profondeur

POINT DE GRAMMAIRE
style nominal; passif.

EXPLICATION
La grammaire nâ€™est pas une liste de rÃ¨gles Ã  mÃ©moriser sÃ©parÃ©ment : elle sert Ã  exprimer une intention. Observez dâ€™abord la place du verbe, puis les complÃ©ments, et enfin les Ã©lÃ©ments de temps, cause ou opinion.

EXEMPLES
â€¢ Bezugnehmend auf â€¦
â€¢ Im Folgenden werden â€¦
â€¢ Es empfiehlt sich, â€¦
â€¢ FÃ¼r RÃ¼ckfragen stehe ich gern zur VerfÃ¼gung.

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Ã‰crits formels avancÃ©s','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Ã‰crits formels avancÃ©s');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'ComprÃ©hension et production â€” Ã‰crits formels avancÃ©s','allemand-b2-m10-l05','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 10/12 â€” Ã‰crits formels avancÃ©s
LEÃ‡ON 5/8 â€” ComprÃ©hension et production

TEXTE / SITUATION
Imaginez une situation rÃ©elle autour de Â« Ã‰crits formels avancÃ©s Â». Les personnes utilisent les expressions suivantes :
â€¢ Bezugnehmend auf â€¦
â€¢ Im Folgenden werden â€¦
â€¢ Es empfiehlt sich, â€¦
â€¢ FÃ¼r RÃ¼ckfragen stehe ich gern zur VerfÃ¼gung.

COMPRÃ‰HENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou Ã©motion peut-on dÃ©duire ?
4. Reformulez le contenu en franÃ§ais, puis en allemand simple.

PRODUCTION Ã‰CRITE
RÃ©digez un texte adaptÃ© au niveau B2. Utilisez au moins 8 Ã©lÃ©ments du module et 3 structures liÃ©es Ã  : style nominal; passif.

PRODUCTION ORALE
Parlez pendant 2 Ã  4 minutes sans lire. Recommencez en amÃ©liorant la fluiditÃ©.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Ã‰crits formels avancÃ©s','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Ã‰crits formels avancÃ©s');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif â€” Ã‰crits formels avancÃ©s','allemand-b2-m10-l06','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 10/12 â€” Ã‰crits formels avancÃ©s
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
â€¢ Bezugnehmend auf â€¦
â€¢ Im Folgenden werden â€¦
â€¢ Es empfiehlt sich, â€¦
â€¢ FÃ¼r RÃ¼ckfragen stehe ich gern zur VerfÃ¼gung.

GRAMMAIRE Ã€ RÃ‰UTILISER
style nominal; passif.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Ã‰crits formels avancÃ©s','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Ã‰crits formels avancÃ©s');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module â€” Ã‰crits formels avancÃ©s','allemand-b2-m10-l07','quiz','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 10/12 â€” Ã‰crits formels avancÃ©s
LEÃ‡ON 7/8 â€” Quiz de module

QUIZ DE VALIDATION â€” Ã‰crits formels avancÃ©s

Avant de valider, vous devez pouvoir :
â€¢ comprendre les quatre expressions du module ;
â€¢ expliquer le point de grammaire Â« style nominal; passif Â» ;
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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Ã‰crits formels avancÃ©s','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Ã‰crits formels avancÃ©s');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission rÃ©elle â€” Ã‰crits formels avancÃ©s','allemand-b2-m10-l08','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 10/12 â€” Ã‰crits formels avancÃ©s
LEÃ‡ON 8/8 â€” Mission rÃ©elle

MISSION RÃ‰ELLE â€” Ã‰crits formels avancÃ©s

SCÃ‰NARIO
Vous devez rÃ©diger rapports, avis et courriels complexes. Vous nâ€™avez droit quâ€™Ã  lâ€™allemand.

LIVRABLES
1. Un texte de 180 Ã  350 mots.
2. Un enregistrement oral de 3 Ã  6 minutes.
3. Un dialogue de 10 rÃ©pliques.
4. Une liste de 15 mots ou expressions rÃ©ellement utiles.
5. Une auto-correction : trois erreurs repÃ©rÃ©es et expliquÃ©es.

CRITÃˆRES
ClartÃ©, correction, vocabulaire adaptÃ©, fluiditÃ© et capacitÃ© Ã  accomplir la tÃ¢che.

EXPRESSIONS Ã€ RÃ‰UTILISER
â€¢ Bezugnehmend auf â€¦
â€¢ Im Folgenden werden â€¦
â€¢ Es empfiehlt sich, â€¦
â€¢ FÃ¼r RÃ¼ckfragen stehe ich gern zur VerfÃ¼gung.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Ã‰crits formels avancÃ©s','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Ã‰crits formels avancÃ©s');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B2 Â· Module 11 â€” ComprÃ©hension authentique','Niveau B2 : travailler avec un allemand rapide et implicite. Grammaire : infÃ©rence; reformulation. 8 leÃ§ons avec thÃ©orie, audio, exercices, quiz et mission rÃ©elle.',47) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre â€” ComprÃ©hension authentique','allemand-b2-m11-l01','text','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 11/12 â€” ComprÃ©hension authentique
LEÃ‡ON 1/8 â€” Comprendre

OBJECTIF
Travailler avec un allemand rapide et implicite.

EXPLICATION EN FRANÃ‡AIS
Ã€ ce niveau, vous devez apprendre Ã  communiquer avec argumentation nuancÃ©e, comprÃ©hension authentique et langue professionnelle. Le thÃ¨me Â« ComprÃ©hension authentique Â» sert de contexte rÃ©el. Commencez par comprendre lâ€™intention, puis repÃ©rez le verbe, les informations importantes et enfin les dÃ©tails.

MÃ‰THODE
1. Lisez les phrases sans traduire mot Ã  mot.
2. Soulignez le verbe conjuguÃ©.
3. RepÃ©rez qui parle, Ã  qui et dans quel but.
4. RÃ©pÃ©tez chaque phrase Ã  voix haute trois fois.
5. Changez un Ã©lÃ©ment pour crÃ©er votre propre exemple.

EXEMPLES ALLEMANDS
â€¢ Wenn ich es richtig verstanden habe â€¦
â€¢ Zwischen den Zeilen wird deutlich â€¦
â€¢ Der Sprecher deutet an, dass â€¦
â€¢ Die Kernaussage lautet â€¦

Ã€ RETENIR
Grammaire centrale : infÃ©rence; reformulation.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” ComprÃ©hension authentique','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” ComprÃ©hension authentique');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif â€” ComprÃ©hension authentique','allemand-b2-m11-l02','text','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 11/12 â€” ComprÃ©hension authentique
LEÃ‡ON 2/8 â€” Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur Â« ComprÃ©hension authentique Â».

VOCABULAIRE Ã€ ACTIVER
Kernaussage, Sprecher, Wenn, Zeilen, Zwischen, dass, deutet, deutlich, habe, lautet, richtig, verstanden, wird

TECHNIQUE 4 Ã‰TAPES
1. Ã‰coutez le mot avec le bouton audio.
2. RÃ©pÃ©tez-le dans une phrase complÃ¨te.
3. CrÃ©ez une phrase vraie sur votre vie.
4. RÃ©utilisez-le 24 heures plus tard.

MODÃˆLES
â€¢ Wenn ich es richtig verstanden habe â€¦
â€¢ Zwischen den Zeilen wird deutlich â€¦
â€¢ Der Sprecher deutet an, dass â€¦
â€¢ Die Kernaussage lautet â€¦

EXERCICES
1. Choisissez 10 mots et Ã©crivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez lâ€™allemand et traduisez vos phrases du franÃ§ais vers lâ€™allemand.
4. Enregistrez oralement un rÃ©sumÃ© de 60 secondes.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” ComprÃ©hension authentique','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” ComprÃ©hension authentique');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation â€” ComprÃ©hension authentique','allemand-b2-m11-l03','audio','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 11/12 â€” ComprÃ©hension authentique
LEÃ‡ON 3/8 â€” Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÃˆLE
A: Wenn ich es richtig verstanden habe â€¦
B: Zwischen den Zeilen wird deutlich â€¦
A: Der Sprecher deutet an, dass â€¦
B: Die Kernaussage lautet â€¦

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” ComprÃ©hension authentique','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” ComprÃ©hension authentique');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur â€” ComprÃ©hension authentique','allemand-b2-m11-l04','text','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 11/12 â€” ComprÃ©hension authentique
LEÃ‡ON 4/8 â€” Grammaire en profondeur

POINT DE GRAMMAIRE
infÃ©rence; reformulation.

EXPLICATION
La grammaire nâ€™est pas une liste de rÃ¨gles Ã  mÃ©moriser sÃ©parÃ©ment : elle sert Ã  exprimer une intention. Observez dâ€™abord la place du verbe, puis les complÃ©ments, et enfin les Ã©lÃ©ments de temps, cause ou opinion.

EXEMPLES
â€¢ Wenn ich es richtig verstanden habe â€¦
â€¢ Zwischen den Zeilen wird deutlich â€¦
â€¢ Der Sprecher deutet an, dass â€¦
â€¢ Die Kernaussage lautet â€¦

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” ComprÃ©hension authentique','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” ComprÃ©hension authentique');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'ComprÃ©hension et production â€” ComprÃ©hension authentique','allemand-b2-m11-l05','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 11/12 â€” ComprÃ©hension authentique
LEÃ‡ON 5/8 â€” ComprÃ©hension et production

TEXTE / SITUATION
Imaginez une situation rÃ©elle autour de Â« ComprÃ©hension authentique Â». Les personnes utilisent les expressions suivantes :
â€¢ Wenn ich es richtig verstanden habe â€¦
â€¢ Zwischen den Zeilen wird deutlich â€¦
â€¢ Der Sprecher deutet an, dass â€¦
â€¢ Die Kernaussage lautet â€¦

COMPRÃ‰HENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou Ã©motion peut-on dÃ©duire ?
4. Reformulez le contenu en franÃ§ais, puis en allemand simple.

PRODUCTION Ã‰CRITE
RÃ©digez un texte adaptÃ© au niveau B2. Utilisez au moins 8 Ã©lÃ©ments du module et 3 structures liÃ©es Ã  : infÃ©rence; reformulation.

PRODUCTION ORALE
Parlez pendant 2 Ã  4 minutes sans lire. Recommencez en amÃ©liorant la fluiditÃ©.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” ComprÃ©hension authentique','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” ComprÃ©hension authentique');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif â€” ComprÃ©hension authentique','allemand-b2-m11-l06','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 11/12 â€” ComprÃ©hension authentique
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
â€¢ Wenn ich es richtig verstanden habe â€¦
â€¢ Zwischen den Zeilen wird deutlich â€¦
â€¢ Der Sprecher deutet an, dass â€¦
â€¢ Die Kernaussage lautet â€¦

GRAMMAIRE Ã€ RÃ‰UTILISER
infÃ©rence; reformulation.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” ComprÃ©hension authentique','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” ComprÃ©hension authentique');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module â€” ComprÃ©hension authentique','allemand-b2-m11-l07','quiz','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 11/12 â€” ComprÃ©hension authentique
LEÃ‡ON 7/8 â€” Quiz de module

QUIZ DE VALIDATION â€” ComprÃ©hension authentique

Avant de valider, vous devez pouvoir :
â€¢ comprendre les quatre expressions du module ;
â€¢ expliquer le point de grammaire Â« infÃ©rence; reformulation Â» ;
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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” ComprÃ©hension authentique','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” ComprÃ©hension authentique');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission rÃ©elle â€” ComprÃ©hension authentique','allemand-b2-m11-l08','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 11/12 â€” ComprÃ©hension authentique
LEÃ‡ON 8/8 â€” Mission rÃ©elle

MISSION RÃ‰ELLE â€” ComprÃ©hension authentique

SCÃ‰NARIO
Vous devez travailler avec un allemand rapide et implicite. Vous nâ€™avez droit quâ€™Ã  lâ€™allemand.

LIVRABLES
1. Un texte de 180 Ã  350 mots.
2. Un enregistrement oral de 3 Ã  6 minutes.
3. Un dialogue de 10 rÃ©pliques.
4. Une liste de 15 mots ou expressions rÃ©ellement utiles.
5. Une auto-correction : trois erreurs repÃ©rÃ©es et expliquÃ©es.

CRITÃˆRES
ClartÃ©, correction, vocabulaire adaptÃ©, fluiditÃ© et capacitÃ© Ã  accomplir la tÃ¢che.

EXPRESSIONS Ã€ RÃ‰UTILISER
â€¢ Wenn ich es richtig verstanden habe â€¦
â€¢ Zwischen den Zeilen wird deutlich â€¦
â€¢ Der Sprecher deutet an, dass â€¦
â€¢ Die Kernaussage lautet â€¦

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” ComprÃ©hension authentique','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” ComprÃ©hension authentique');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B2 Â· Module 12 â€” RÃ©vision B2 et examen','Niveau B2 : maÃ®triser les formats B2. Grammaire : rÃ©vision globale B2. 8 leÃ§ons avec thÃ©orie, audio, exercices, quiz et mission rÃ©elle.',48) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre â€” RÃ©vision B2 et examen','allemand-b2-m12-l01','text','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 12/12 â€” RÃ©vision B2 et examen
LEÃ‡ON 1/8 â€” Comprendre

OBJECTIF
MaÃ®triser les formats b2.

EXPLICATION EN FRANÃ‡AIS
Ã€ ce niveau, vous devez apprendre Ã  communiquer avec argumentation nuancÃ©e, comprÃ©hension authentique et langue professionnelle. Le thÃ¨me Â« RÃ©vision B2 et examen Â» sert de contexte rÃ©el. Commencez par comprendre lâ€™intention, puis repÃ©rez le verbe, les informations importantes et enfin les dÃ©tails.

MÃ‰THODE
1. Lisez les phrases sans traduire mot Ã  mot.
2. Soulignez le verbe conjuguÃ©.
3. RepÃ©rez qui parle, Ã  qui et dans quel but.
4. RÃ©pÃ©tez chaque phrase Ã  voix haute trois fois.
5. Changez un Ã©lÃ©ment pour crÃ©er votre propre exemple.

EXEMPLES ALLEMANDS
â€¢ Die vorliegende Aufgabe befasst sich mit â€¦
â€¢ Im ersten Teil â€¦
â€¢ DarÃ¼ber hinaus â€¦
â€¢ Insgesamt Ã¼berwiegen â€¦

Ã€ RETENIR
Grammaire centrale : rÃ©vision globale B2.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” RÃ©vision B2 et examen','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” RÃ©vision B2 et examen');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif â€” RÃ©vision B2 et examen','allemand-b2-m12-l02','text','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 12/12 â€” RÃ©vision B2 et examen
LEÃ‡ON 2/8 â€” Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur Â« RÃ©vision B2 et examen Â».

VOCABULAIRE Ã€ ACTIVER
Aufgabe, DarÃ¼ber, Insgesamt, Teil, befasst, ersten, hinaus, sich, vorliegende, Ã¼berwiegen

TECHNIQUE 4 Ã‰TAPES
1. Ã‰coutez le mot avec le bouton audio.
2. RÃ©pÃ©tez-le dans une phrase complÃ¨te.
3. CrÃ©ez une phrase vraie sur votre vie.
4. RÃ©utilisez-le 24 heures plus tard.

MODÃˆLES
â€¢ Die vorliegende Aufgabe befasst sich mit â€¦
â€¢ Im ersten Teil â€¦
â€¢ DarÃ¼ber hinaus â€¦
â€¢ Insgesamt Ã¼berwiegen â€¦

EXERCICES
1. Choisissez 10 mots et Ã©crivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez lâ€™allemand et traduisez vos phrases du franÃ§ais vers lâ€™allemand.
4. Enregistrez oralement un rÃ©sumÃ© de 60 secondes.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” RÃ©vision B2 et examen','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” RÃ©vision B2 et examen');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation â€” RÃ©vision B2 et examen','allemand-b2-m12-l03','audio','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 12/12 â€” RÃ©vision B2 et examen
LEÃ‡ON 3/8 â€” Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÃˆLE
A: Die vorliegende Aufgabe befasst sich mit â€¦
B: Im ersten Teil â€¦
A: DarÃ¼ber hinaus â€¦
B: Insgesamt Ã¼berwiegen â€¦

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” RÃ©vision B2 et examen','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” RÃ©vision B2 et examen');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur â€” RÃ©vision B2 et examen','allemand-b2-m12-l04','text','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 12/12 â€” RÃ©vision B2 et examen
LEÃ‡ON 4/8 â€” Grammaire en profondeur

POINT DE GRAMMAIRE
rÃ©vision globale B2.

EXPLICATION
La grammaire nâ€™est pas une liste de rÃ¨gles Ã  mÃ©moriser sÃ©parÃ©ment : elle sert Ã  exprimer une intention. Observez dâ€™abord la place du verbe, puis les complÃ©ments, et enfin les Ã©lÃ©ments de temps, cause ou opinion.

EXEMPLES
â€¢ Die vorliegende Aufgabe befasst sich mit â€¦
â€¢ Im ersten Teil â€¦
â€¢ DarÃ¼ber hinaus â€¦
â€¢ Insgesamt Ã¼berwiegen â€¦

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” RÃ©vision B2 et examen','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” RÃ©vision B2 et examen');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'ComprÃ©hension et production â€” RÃ©vision B2 et examen','allemand-b2-m12-l05','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 12/12 â€” RÃ©vision B2 et examen
LEÃ‡ON 5/8 â€” ComprÃ©hension et production

TEXTE / SITUATION
Imaginez une situation rÃ©elle autour de Â« RÃ©vision B2 et examen Â». Les personnes utilisent les expressions suivantes :
â€¢ Die vorliegende Aufgabe befasst sich mit â€¦
â€¢ Im ersten Teil â€¦
â€¢ DarÃ¼ber hinaus â€¦
â€¢ Insgesamt Ã¼berwiegen â€¦

COMPRÃ‰HENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou Ã©motion peut-on dÃ©duire ?
4. Reformulez le contenu en franÃ§ais, puis en allemand simple.

PRODUCTION Ã‰CRITE
RÃ©digez un texte adaptÃ© au niveau B2. Utilisez au moins 8 Ã©lÃ©ments du module et 3 structures liÃ©es Ã  : rÃ©vision globale B2.

PRODUCTION ORALE
Parlez pendant 2 Ã  4 minutes sans lire. Recommencez en amÃ©liorant la fluiditÃ©.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” RÃ©vision B2 et examen','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” RÃ©vision B2 et examen');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif â€” RÃ©vision B2 et examen','allemand-b2-m12-l06','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 12/12 â€” RÃ©vision B2 et examen
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
â€¢ Die vorliegende Aufgabe befasst sich mit â€¦
â€¢ Im ersten Teil â€¦
â€¢ DarÃ¼ber hinaus â€¦
â€¢ Insgesamt Ã¼berwiegen â€¦

GRAMMAIRE Ã€ RÃ‰UTILISER
rÃ©vision globale B2.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” RÃ©vision B2 et examen','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” RÃ©vision B2 et examen');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module â€” RÃ©vision B2 et examen','allemand-b2-m12-l07','quiz','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 12/12 â€” RÃ©vision B2 et examen
LEÃ‡ON 7/8 â€” Quiz de module

QUIZ DE VALIDATION â€” RÃ©vision B2 et examen

Avant de valider, vous devez pouvoir :
â€¢ comprendre les quatre expressions du module ;
â€¢ expliquer le point de grammaire Â« rÃ©vision globale B2 Â» ;
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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” RÃ©vision B2 et examen','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” RÃ©vision B2 et examen');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission rÃ©elle â€” RÃ©vision B2 et examen','allemand-b2-m12-l08','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B2
MODULE 12/12 â€” RÃ©vision B2 et examen
LEÃ‡ON 8/8 â€” Mission rÃ©elle

MISSION RÃ‰ELLE â€” RÃ©vision B2 et examen

SCÃ‰NARIO
Vous devez maÃ®triser les formats B2. Vous nâ€™avez droit quâ€™Ã  lâ€™allemand.

LIVRABLES
1. Un texte de 180 Ã  350 mots.
2. Un enregistrement oral de 3 Ã  6 minutes.
3. Un dialogue de 10 rÃ©pliques.
4. Une liste de 15 mots ou expressions rÃ©ellement utiles.
5. Une auto-correction : trois erreurs repÃ©rÃ©es et expliquÃ©es.

CRITÃˆRES
ClartÃ©, correction, vocabulaire adaptÃ©, fluiditÃ© et capacitÃ© Ã  accomplir la tÃ¢che.

EXPRESSIONS Ã€ RÃ‰UTILISER
â€¢ Die vorliegende Aufgabe befasst sich mit â€¦
â€¢ Im ersten Teil â€¦
â€¢ DarÃ¼ber hinaus â€¦
â€¢ Insgesamt Ã¼berwiegen â€¦

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” RÃ©vision B2 et examen','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” RÃ©vision B2 et examen');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
END $$;

SELECT 'Partie 8/10 installÃ©e : modules 43 Ã  48' AS resultat;


