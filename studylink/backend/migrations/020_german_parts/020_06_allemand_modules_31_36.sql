-- StudyLink 020 - Allemand A1-C1 - Partie 6/10
-- Modules 31 Ã  36
DO $$
DECLARE v_course UUID; v_module UUID; v_lesson UUID;
BEGIN
  SELECT id INTO v_course FROM public.courses WHERE slug='allemand-complet-a1-c1' ORDER BY created_at DESC NULLS LAST LIMIT 1;
  IF v_course IS NULL THEN RAISE EXCEPTION 'Le cours allemand n existe pas encore. Executez d abord la partie 01.'; END IF;
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B1 Â· Module 7 â€” Environnement et sociÃ©tÃ©','Niveau B1 : discuter dâ€™un problÃ¨me social. Grammaire : ob; darin dass; Konjunktiv II. 8 leÃ§ons avec thÃ©orie, audio, exercices, quiz et mission rÃ©elle.',31) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre â€” Environnement et sociÃ©tÃ©','allemand-b1-m07-l01','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 7/12 â€” Environnement et sociÃ©tÃ©
LEÃ‡ON 1/8 â€” Comprendre

OBJECTIF
Discuter dâ€™un problÃ¨me social.

EXPLICATION EN FRANÃ‡AIS
Ã€ ce niveau, vous devez apprendre Ã  communiquer avec discours suivi, justification, rÃ©cit et communication professionnelle simple. Le thÃ¨me Â« Environnement et sociÃ©tÃ© Â» sert de contexte rÃ©el. Commencez par comprendre lâ€™intention, puis repÃ©rez le verbe, les informations importantes et enfin les dÃ©tails.

MÃ‰THODE
1. Lisez les phrases sans traduire mot Ã  mot.
2. Soulignez le verbe conjuguÃ©.
3. RepÃ©rez qui parle, Ã  qui et dans quel but.
4. RÃ©pÃ©tez chaque phrase Ã  voix haute trois fois.
5. Changez un Ã©lÃ©ment pour crÃ©er votre propre exemple.

EXEMPLES ALLEMANDS
â€¢ Es geht um die Frage, ob â€¦
â€¢ Die Ursache liegt darin, dass â€¦
â€¢ Eine mÃ¶gliche LÃ¶sung wÃ¤re â€¦
â€¢ DafÃ¼r mÃ¼sste man â€¦

Ã€ RETENIR
Grammaire centrale : ob; darin dass; Konjunktiv II.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Environnement et sociÃ©tÃ©','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Environnement et sociÃ©tÃ©');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif â€” Environnement et sociÃ©tÃ©','allemand-b1-m07-l02','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 7/12 â€” Environnement et sociÃ©tÃ©
LEÃ‡ON 2/8 â€” Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur Â« Environnement et sociÃ©tÃ© Â».

VOCABULAIRE Ã€ ACTIVER
DafÃ¼r, Eine, Frage, LÃ¶sung, Ursache, darin, dass, geht, liegt, mÃ¶gliche, mÃ¼sste, wÃ¤re

TECHNIQUE 4 Ã‰TAPES
1. Ã‰coutez le mot avec le bouton audio.
2. RÃ©pÃ©tez-le dans une phrase complÃ¨te.
3. CrÃ©ez une phrase vraie sur votre vie.
4. RÃ©utilisez-le 24 heures plus tard.

MODÃˆLES
â€¢ Es geht um die Frage, ob â€¦
â€¢ Die Ursache liegt darin, dass â€¦
â€¢ Eine mÃ¶gliche LÃ¶sung wÃ¤re â€¦
â€¢ DafÃ¼r mÃ¼sste man â€¦

EXERCICES
1. Choisissez 10 mots et Ã©crivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez lâ€™allemand et traduisez vos phrases du franÃ§ais vers lâ€™allemand.
4. Enregistrez oralement un rÃ©sumÃ© de 60 secondes.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Environnement et sociÃ©tÃ©','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Environnement et sociÃ©tÃ©');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation â€” Environnement et sociÃ©tÃ©','allemand-b1-m07-l03','audio','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 7/12 â€” Environnement et sociÃ©tÃ©
LEÃ‡ON 3/8 â€” Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÃˆLE
A: Es geht um die Frage, ob â€¦
B: Die Ursache liegt darin, dass â€¦
A: Eine mÃ¶gliche LÃ¶sung wÃ¤re â€¦
B: DafÃ¼r mÃ¼sste man â€¦

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Environnement et sociÃ©tÃ©','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Environnement et sociÃ©tÃ©');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur â€” Environnement et sociÃ©tÃ©','allemand-b1-m07-l04','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 7/12 â€” Environnement et sociÃ©tÃ©
LEÃ‡ON 4/8 â€” Grammaire en profondeur

POINT DE GRAMMAIRE
ob; darin dass; Konjunktiv II.

EXPLICATION
La grammaire nâ€™est pas une liste de rÃ¨gles Ã  mÃ©moriser sÃ©parÃ©ment : elle sert Ã  exprimer une intention. Observez dâ€™abord la place du verbe, puis les complÃ©ments, et enfin les Ã©lÃ©ments de temps, cause ou opinion.

EXEMPLES
â€¢ Es geht um die Frage, ob â€¦
â€¢ Die Ursache liegt darin, dass â€¦
â€¢ Eine mÃ¶gliche LÃ¶sung wÃ¤re â€¦
â€¢ DafÃ¼r mÃ¼sste man â€¦

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Environnement et sociÃ©tÃ©','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Environnement et sociÃ©tÃ©');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'ComprÃ©hension et production â€” Environnement et sociÃ©tÃ©','allemand-b1-m07-l05','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 7/12 â€” Environnement et sociÃ©tÃ©
LEÃ‡ON 5/8 â€” ComprÃ©hension et production

TEXTE / SITUATION
Imaginez une situation rÃ©elle autour de Â« Environnement et sociÃ©tÃ© Â». Les personnes utilisent les expressions suivantes :
â€¢ Es geht um die Frage, ob â€¦
â€¢ Die Ursache liegt darin, dass â€¦
â€¢ Eine mÃ¶gliche LÃ¶sung wÃ¤re â€¦
â€¢ DafÃ¼r mÃ¼sste man â€¦

COMPRÃ‰HENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou Ã©motion peut-on dÃ©duire ?
4. Reformulez le contenu en franÃ§ais, puis en allemand simple.

PRODUCTION Ã‰CRITE
RÃ©digez un texte adaptÃ© au niveau B1. Utilisez au moins 8 Ã©lÃ©ments du module et 3 structures liÃ©es Ã  : ob; darin dass; Konjunktiv II.

PRODUCTION ORALE
Parlez pendant 2 Ã  4 minutes sans lire. Recommencez en amÃ©liorant la fluiditÃ©.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Environnement et sociÃ©tÃ©','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Environnement et sociÃ©tÃ©');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif â€” Environnement et sociÃ©tÃ©','allemand-b1-m07-l06','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 7/12 â€” Environnement et sociÃ©tÃ©
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
â€¢ Es geht um die Frage, ob â€¦
â€¢ Die Ursache liegt darin, dass â€¦
â€¢ Eine mÃ¶gliche LÃ¶sung wÃ¤re â€¦
â€¢ DafÃ¼r mÃ¼sste man â€¦

GRAMMAIRE Ã€ RÃ‰UTILISER
ob; darin dass; Konjunktiv II.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Environnement et sociÃ©tÃ©','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Environnement et sociÃ©tÃ©');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module â€” Environnement et sociÃ©tÃ©','allemand-b1-m07-l07','quiz','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 7/12 â€” Environnement et sociÃ©tÃ©
LEÃ‡ON 7/8 â€” Quiz de module

QUIZ DE VALIDATION â€” Environnement et sociÃ©tÃ©

Avant de valider, vous devez pouvoir :
â€¢ comprendre les quatre expressions du module ;
â€¢ expliquer le point de grammaire Â« ob; darin dass; Konjunktiv II Â» ;
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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Environnement et sociÃ©tÃ©','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Environnement et sociÃ©tÃ©');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission rÃ©elle â€” Environnement et sociÃ©tÃ©','allemand-b1-m07-l08','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 7/12 â€” Environnement et sociÃ©tÃ©
LEÃ‡ON 8/8 â€” Mission rÃ©elle

MISSION RÃ‰ELLE â€” Environnement et sociÃ©tÃ©

SCÃ‰NARIO
Vous devez discuter dâ€™un problÃ¨me social. Vous nâ€™avez droit quâ€™Ã  lâ€™allemand.

LIVRABLES
1. Un texte de 180 Ã  350 mots.
2. Un enregistrement oral de 3 Ã  6 minutes.
3. Un dialogue de 10 rÃ©pliques.
4. Une liste de 15 mots ou expressions rÃ©ellement utiles.
5. Une auto-correction : trois erreurs repÃ©rÃ©es et expliquÃ©es.

CRITÃˆRES
ClartÃ©, correction, vocabulaire adaptÃ©, fluiditÃ© et capacitÃ© Ã  accomplir la tÃ¢che.

EXPRESSIONS Ã€ RÃ‰UTILISER
â€¢ Es geht um die Frage, ob â€¦
â€¢ Die Ursache liegt darin, dass â€¦
â€¢ Eine mÃ¶gliche LÃ¶sung wÃ¤re â€¦
â€¢ DafÃ¼r mÃ¼sste man â€¦

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Environnement et sociÃ©tÃ©','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Environnement et sociÃ©tÃ©');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B1 Â· Module 8 â€” Relations et conflits','Niveau B1 : exprimer un dÃ©saccord avec diplomatie. Grammaire : conditionnel poli; subordonnÃ©es. 8 leÃ§ons avec thÃ©orie, audio, exercices, quiz et mission rÃ©elle.',32) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre â€” Relations et conflits','allemand-b1-m08-l01','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 8/12 â€” Relations et conflits
LEÃ‡ON 1/8 â€” Comprendre

OBJECTIF
Exprimer un dÃ©saccord avec diplomatie.

EXPLICATION EN FRANÃ‡AIS
Ã€ ce niveau, vous devez apprendre Ã  communiquer avec discours suivi, justification, rÃ©cit et communication professionnelle simple. Le thÃ¨me Â« Relations et conflits Â» sert de contexte rÃ©el. Commencez par comprendre lâ€™intention, puis repÃ©rez le verbe, les informations importantes et enfin les dÃ©tails.

MÃ‰THODE
1. Lisez les phrases sans traduire mot Ã  mot.
2. Soulignez le verbe conjuguÃ©.
3. RepÃ©rez qui parle, Ã  qui et dans quel but.
4. RÃ©pÃ©tez chaque phrase Ã  voix haute trois fois.
5. Changez un Ã©lÃ©ment pour crÃ©er votre propre exemple.

EXEMPLES ALLEMANDS
â€¢ Ich verstehe deinen Punkt, aber â€¦
â€¢ Das sehe ich anders.
â€¢ KÃ¶nnten wir einen Kompromiss finden?
â€¢ Mir wÃ¤re wichtig, dass â€¦

Ã€ RETENIR
Grammaire centrale : conditionnel poli; subordonnÃ©es.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Relations et conflits','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Relations et conflits');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif â€” Relations et conflits','allemand-b1-m08-l02','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 8/12 â€” Relations et conflits
LEÃ‡ON 2/8 â€” Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur Â« Relations et conflits Â».

VOCABULAIRE Ã€ ACTIVER
Kompromiss, KÃ¶nnten, Punkt, aber, anders, dass, deinen, einen, finden, sehe, verstehe, wichtig, wÃ¤re

TECHNIQUE 4 Ã‰TAPES
1. Ã‰coutez le mot avec le bouton audio.
2. RÃ©pÃ©tez-le dans une phrase complÃ¨te.
3. CrÃ©ez une phrase vraie sur votre vie.
4. RÃ©utilisez-le 24 heures plus tard.

MODÃˆLES
â€¢ Ich verstehe deinen Punkt, aber â€¦
â€¢ Das sehe ich anders.
â€¢ KÃ¶nnten wir einen Kompromiss finden?
â€¢ Mir wÃ¤re wichtig, dass â€¦

EXERCICES
1. Choisissez 10 mots et Ã©crivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez lâ€™allemand et traduisez vos phrases du franÃ§ais vers lâ€™allemand.
4. Enregistrez oralement un rÃ©sumÃ© de 60 secondes.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Relations et conflits','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Relations et conflits');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation â€” Relations et conflits','allemand-b1-m08-l03','audio','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 8/12 â€” Relations et conflits
LEÃ‡ON 3/8 â€” Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÃˆLE
A: Ich verstehe deinen Punkt, aber â€¦
B: Das sehe ich anders.
A: KÃ¶nnten wir einen Kompromiss finden?
B: Mir wÃ¤re wichtig, dass â€¦

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Relations et conflits','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Relations et conflits');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur â€” Relations et conflits','allemand-b1-m08-l04','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 8/12 â€” Relations et conflits
LEÃ‡ON 4/8 â€” Grammaire en profondeur

POINT DE GRAMMAIRE
conditionnel poli; subordonnÃ©es.

EXPLICATION
La grammaire nâ€™est pas une liste de rÃ¨gles Ã  mÃ©moriser sÃ©parÃ©ment : elle sert Ã  exprimer une intention. Observez dâ€™abord la place du verbe, puis les complÃ©ments, et enfin les Ã©lÃ©ments de temps, cause ou opinion.

EXEMPLES
â€¢ Ich verstehe deinen Punkt, aber â€¦
â€¢ Das sehe ich anders.
â€¢ KÃ¶nnten wir einen Kompromiss finden?
â€¢ Mir wÃ¤re wichtig, dass â€¦

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Relations et conflits','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Relations et conflits');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'ComprÃ©hension et production â€” Relations et conflits','allemand-b1-m08-l05','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 8/12 â€” Relations et conflits
LEÃ‡ON 5/8 â€” ComprÃ©hension et production

TEXTE / SITUATION
Imaginez une situation rÃ©elle autour de Â« Relations et conflits Â». Les personnes utilisent les expressions suivantes :
â€¢ Ich verstehe deinen Punkt, aber â€¦
â€¢ Das sehe ich anders.
â€¢ KÃ¶nnten wir einen Kompromiss finden?
â€¢ Mir wÃ¤re wichtig, dass â€¦

COMPRÃ‰HENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou Ã©motion peut-on dÃ©duire ?
4. Reformulez le contenu en franÃ§ais, puis en allemand simple.

PRODUCTION Ã‰CRITE
RÃ©digez un texte adaptÃ© au niveau B1. Utilisez au moins 8 Ã©lÃ©ments du module et 3 structures liÃ©es Ã  : conditionnel poli; subordonnÃ©es.

PRODUCTION ORALE
Parlez pendant 2 Ã  4 minutes sans lire. Recommencez en amÃ©liorant la fluiditÃ©.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Relations et conflits','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Relations et conflits');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif â€” Relations et conflits','allemand-b1-m08-l06','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 8/12 â€” Relations et conflits
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
â€¢ Ich verstehe deinen Punkt, aber â€¦
â€¢ Das sehe ich anders.
â€¢ KÃ¶nnten wir einen Kompromiss finden?
â€¢ Mir wÃ¤re wichtig, dass â€¦

GRAMMAIRE Ã€ RÃ‰UTILISER
conditionnel poli; subordonnÃ©es.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Relations et conflits','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Relations et conflits');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module â€” Relations et conflits','allemand-b1-m08-l07','quiz','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 8/12 â€” Relations et conflits
LEÃ‡ON 7/8 â€” Quiz de module

QUIZ DE VALIDATION â€” Relations et conflits

Avant de valider, vous devez pouvoir :
â€¢ comprendre les quatre expressions du module ;
â€¢ expliquer le point de grammaire Â« conditionnel poli; subordonnÃ©es Â» ;
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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Relations et conflits','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Relations et conflits');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission rÃ©elle â€” Relations et conflits','allemand-b1-m08-l08','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 8/12 â€” Relations et conflits
LEÃ‡ON 8/8 â€” Mission rÃ©elle

MISSION RÃ‰ELLE â€” Relations et conflits

SCÃ‰NARIO
Vous devez exprimer un dÃ©saccord avec diplomatie. Vous nâ€™avez droit quâ€™Ã  lâ€™allemand.

LIVRABLES
1. Un texte de 180 Ã  350 mots.
2. Un enregistrement oral de 3 Ã  6 minutes.
3. Un dialogue de 10 rÃ©pliques.
4. Une liste de 15 mots ou expressions rÃ©ellement utiles.
5. Une auto-correction : trois erreurs repÃ©rÃ©es et expliquÃ©es.

CRITÃˆRES
ClartÃ©, correction, vocabulaire adaptÃ©, fluiditÃ© et capacitÃ© Ã  accomplir la tÃ¢che.

EXPRESSIONS Ã€ RÃ‰UTILISER
â€¢ Ich verstehe deinen Punkt, aber â€¦
â€¢ Das sehe ich anders.
â€¢ KÃ¶nnten wir einen Kompromiss finden?
â€¢ Mir wÃ¤re wichtig, dass â€¦

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Relations et conflits','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Relations et conflits');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B1 Â· Module 9 â€” MobilitÃ© et logement','Niveau B1 : comparer des choix de vie. Grammaire : jeâ€¦desto; comparatifs avancÃ©s. 8 leÃ§ons avec thÃ©orie, audio, exercices, quiz et mission rÃ©elle.',33) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre â€” MobilitÃ© et logement','allemand-b1-m09-l01','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 9/12 â€” MobilitÃ© et logement
LEÃ‡ON 1/8 â€” Comprendre

OBJECTIF
Comparer des choix de vie.

EXPLICATION EN FRANÃ‡AIS
Ã€ ce niveau, vous devez apprendre Ã  communiquer avec discours suivi, justification, rÃ©cit et communication professionnelle simple. Le thÃ¨me Â« MobilitÃ© et logement Â» sert de contexte rÃ©el. Commencez par comprendre lâ€™intention, puis repÃ©rez le verbe, les informations importantes et enfin les dÃ©tails.

MÃ‰THODE
1. Lisez les phrases sans traduire mot Ã  mot.
2. Soulignez le verbe conjuguÃ©.
3. RepÃ©rez qui parle, Ã  qui et dans quel but.
4. RÃ©pÃ©tez chaque phrase Ã  voix haute trois fois.
5. Changez un Ã©lÃ©ment pour crÃ©er votre propre exemple.

EXEMPLES ALLEMANDS
â€¢ Auf dem Land ist es ruhiger.
â€¢ DafÃ¼r gibt es weniger Angebote.
â€¢ Je grÃ¶ÃŸer die Stadt, desto â€¦
â€¢ Ich wÃ¼rde lieber â€¦

Ã€ RETENIR
Grammaire centrale : jeâ€¦desto; comparatifs avancÃ©s.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” MobilitÃ© et logement','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” MobilitÃ© et logement');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif â€” MobilitÃ© et logement','allemand-b1-m09-l02','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 9/12 â€” MobilitÃ© et logement
LEÃ‡ON 2/8 â€” Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur Â« MobilitÃ© et logement Â».

VOCABULAIRE Ã€ ACTIVER
Angebote, DafÃ¼r, Land, Stadt, desto, gibt, grÃ¶ÃŸer, lieber, ruhiger, weniger, wÃ¼rde

TECHNIQUE 4 Ã‰TAPES
1. Ã‰coutez le mot avec le bouton audio.
2. RÃ©pÃ©tez-le dans une phrase complÃ¨te.
3. CrÃ©ez une phrase vraie sur votre vie.
4. RÃ©utilisez-le 24 heures plus tard.

MODÃˆLES
â€¢ Auf dem Land ist es ruhiger.
â€¢ DafÃ¼r gibt es weniger Angebote.
â€¢ Je grÃ¶ÃŸer die Stadt, desto â€¦
â€¢ Ich wÃ¼rde lieber â€¦

EXERCICES
1. Choisissez 10 mots et Ã©crivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez lâ€™allemand et traduisez vos phrases du franÃ§ais vers lâ€™allemand.
4. Enregistrez oralement un rÃ©sumÃ© de 60 secondes.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” MobilitÃ© et logement','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” MobilitÃ© et logement');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation â€” MobilitÃ© et logement','allemand-b1-m09-l03','audio','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 9/12 â€” MobilitÃ© et logement
LEÃ‡ON 3/8 â€” Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÃˆLE
A: Auf dem Land ist es ruhiger.
B: DafÃ¼r gibt es weniger Angebote.
A: Je grÃ¶ÃŸer die Stadt, desto â€¦
B: Ich wÃ¼rde lieber â€¦

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” MobilitÃ© et logement','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” MobilitÃ© et logement');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur â€” MobilitÃ© et logement','allemand-b1-m09-l04','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 9/12 â€” MobilitÃ© et logement
LEÃ‡ON 4/8 â€” Grammaire en profondeur

POINT DE GRAMMAIRE
jeâ€¦desto; comparatifs avancÃ©s.

EXPLICATION
La grammaire nâ€™est pas une liste de rÃ¨gles Ã  mÃ©moriser sÃ©parÃ©ment : elle sert Ã  exprimer une intention. Observez dâ€™abord la place du verbe, puis les complÃ©ments, et enfin les Ã©lÃ©ments de temps, cause ou opinion.

EXEMPLES
â€¢ Auf dem Land ist es ruhiger.
â€¢ DafÃ¼r gibt es weniger Angebote.
â€¢ Je grÃ¶ÃŸer die Stadt, desto â€¦
â€¢ Ich wÃ¼rde lieber â€¦

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” MobilitÃ© et logement','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” MobilitÃ© et logement');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'ComprÃ©hension et production â€” MobilitÃ© et logement','allemand-b1-m09-l05','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 9/12 â€” MobilitÃ© et logement
LEÃ‡ON 5/8 â€” ComprÃ©hension et production

TEXTE / SITUATION
Imaginez une situation rÃ©elle autour de Â« MobilitÃ© et logement Â». Les personnes utilisent les expressions suivantes :
â€¢ Auf dem Land ist es ruhiger.
â€¢ DafÃ¼r gibt es weniger Angebote.
â€¢ Je grÃ¶ÃŸer die Stadt, desto â€¦
â€¢ Ich wÃ¼rde lieber â€¦

COMPRÃ‰HENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou Ã©motion peut-on dÃ©duire ?
4. Reformulez le contenu en franÃ§ais, puis en allemand simple.

PRODUCTION Ã‰CRITE
RÃ©digez un texte adaptÃ© au niveau B1. Utilisez au moins 8 Ã©lÃ©ments du module et 3 structures liÃ©es Ã  : jeâ€¦desto; comparatifs avancÃ©s.

PRODUCTION ORALE
Parlez pendant 2 Ã  4 minutes sans lire. Recommencez en amÃ©liorant la fluiditÃ©.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” MobilitÃ© et logement','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” MobilitÃ© et logement');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif â€” MobilitÃ© et logement','allemand-b1-m09-l06','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 9/12 â€” MobilitÃ© et logement
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
â€¢ Auf dem Land ist es ruhiger.
â€¢ DafÃ¼r gibt es weniger Angebote.
â€¢ Je grÃ¶ÃŸer die Stadt, desto â€¦
â€¢ Ich wÃ¼rde lieber â€¦

GRAMMAIRE Ã€ RÃ‰UTILISER
jeâ€¦desto; comparatifs avancÃ©s.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” MobilitÃ© et logement','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” MobilitÃ© et logement');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module â€” MobilitÃ© et logement','allemand-b1-m09-l07','quiz','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 9/12 â€” MobilitÃ© et logement
LEÃ‡ON 7/8 â€” Quiz de module

QUIZ DE VALIDATION â€” MobilitÃ© et logement

Avant de valider, vous devez pouvoir :
â€¢ comprendre les quatre expressions du module ;
â€¢ expliquer le point de grammaire Â« jeâ€¦desto; comparatifs avancÃ©s Â» ;
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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” MobilitÃ© et logement','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” MobilitÃ© et logement');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission rÃ©elle â€” MobilitÃ© et logement','allemand-b1-m09-l08','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 9/12 â€” MobilitÃ© et logement
LEÃ‡ON 8/8 â€” Mission rÃ©elle

MISSION RÃ‰ELLE â€” MobilitÃ© et logement

SCÃ‰NARIO
Vous devez comparer des choix de vie. Vous nâ€™avez droit quâ€™Ã  lâ€™allemand.

LIVRABLES
1. Un texte de 180 Ã  350 mots.
2. Un enregistrement oral de 3 Ã  6 minutes.
3. Un dialogue de 10 rÃ©pliques.
4. Une liste de 15 mots ou expressions rÃ©ellement utiles.
5. Une auto-correction : trois erreurs repÃ©rÃ©es et expliquÃ©es.

CRITÃˆRES
ClartÃ©, correction, vocabulaire adaptÃ©, fluiditÃ© et capacitÃ© Ã  accomplir la tÃ¢che.

EXPRESSIONS Ã€ RÃ‰UTILISER
â€¢ Auf dem Land ist es ruhiger.
â€¢ DafÃ¼r gibt es weniger Angebote.
â€¢ Je grÃ¶ÃŸer die Stadt, desto â€¦
â€¢ Ich wÃ¼rde lieber â€¦

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” MobilitÃ© et logement','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” MobilitÃ© et logement');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B1 Â· Module 10 â€” Administration et rÃ©clamations','Niveau B1 : Ã©crire une demande ou rÃ©clamation formelle. Grammaire : registre formel; passif. 8 leÃ§ons avec thÃ©orie, audio, exercices, quiz et mission rÃ©elle.',34) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre â€” Administration et rÃ©clamations','allemand-b1-m10-l01','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 10/12 â€” Administration et rÃ©clamations
LEÃ‡ON 1/8 â€” Comprendre

OBJECTIF
Ã‰crire une demande ou rÃ©clamation formelle.

EXPLICATION EN FRANÃ‡AIS
Ã€ ce niveau, vous devez apprendre Ã  communiquer avec discours suivi, justification, rÃ©cit et communication professionnelle simple. Le thÃ¨me Â« Administration et rÃ©clamations Â» sert de contexte rÃ©el. Commencez par comprendre lâ€™intention, puis repÃ©rez le verbe, les informations importantes et enfin les dÃ©tails.

MÃ‰THODE
1. Lisez les phrases sans traduire mot Ã  mot.
2. Soulignez le verbe conjuguÃ©.
3. RepÃ©rez qui parle, Ã  qui et dans quel but.
4. RÃ©pÃ©tez chaque phrase Ã  voix haute trois fois.
5. Changez un Ã©lÃ©ment pour crÃ©er votre propre exemple.

EXEMPLES ALLEMANDS
â€¢ Hiermit mÃ¶chte ich mich beschweren.
â€¢ Leider musste ich feststellen, dass â€¦
â€¢ Ich bitte Sie um â€¦
â€¢ Ich freue mich auf Ihre RÃ¼ckmeldung.

Ã€ RETENIR
Grammaire centrale : registre formel; passif.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Administration et rÃ©clamations','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Administration et rÃ©clamations');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif â€” Administration et rÃ©clamations','allemand-b1-m10-l02','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 10/12 â€” Administration et rÃ©clamations
LEÃ‡ON 2/8 â€” Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur Â« Administration et rÃ©clamations Â».

VOCABULAIRE Ã€ ACTIVER
Hiermit, Ihre, Leider, RÃ¼ckmeldung, beschweren, bitte, dass, feststellen, freue, mich, musste, mÃ¶chte

TECHNIQUE 4 Ã‰TAPES
1. Ã‰coutez le mot avec le bouton audio.
2. RÃ©pÃ©tez-le dans une phrase complÃ¨te.
3. CrÃ©ez une phrase vraie sur votre vie.
4. RÃ©utilisez-le 24 heures plus tard.

MODÃˆLES
â€¢ Hiermit mÃ¶chte ich mich beschweren.
â€¢ Leider musste ich feststellen, dass â€¦
â€¢ Ich bitte Sie um â€¦
â€¢ Ich freue mich auf Ihre RÃ¼ckmeldung.

EXERCICES
1. Choisissez 10 mots et Ã©crivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez lâ€™allemand et traduisez vos phrases du franÃ§ais vers lâ€™allemand.
4. Enregistrez oralement un rÃ©sumÃ© de 60 secondes.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Administration et rÃ©clamations','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Administration et rÃ©clamations');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation â€” Administration et rÃ©clamations','allemand-b1-m10-l03','audio','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 10/12 â€” Administration et rÃ©clamations
LEÃ‡ON 3/8 â€” Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÃˆLE
A: Hiermit mÃ¶chte ich mich beschweren.
B: Leider musste ich feststellen, dass â€¦
A: Ich bitte Sie um â€¦
B: Ich freue mich auf Ihre RÃ¼ckmeldung.

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Administration et rÃ©clamations','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Administration et rÃ©clamations');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur â€” Administration et rÃ©clamations','allemand-b1-m10-l04','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 10/12 â€” Administration et rÃ©clamations
LEÃ‡ON 4/8 â€” Grammaire en profondeur

POINT DE GRAMMAIRE
registre formel; passif.

EXPLICATION
La grammaire nâ€™est pas une liste de rÃ¨gles Ã  mÃ©moriser sÃ©parÃ©ment : elle sert Ã  exprimer une intention. Observez dâ€™abord la place du verbe, puis les complÃ©ments, et enfin les Ã©lÃ©ments de temps, cause ou opinion.

EXEMPLES
â€¢ Hiermit mÃ¶chte ich mich beschweren.
â€¢ Leider musste ich feststellen, dass â€¦
â€¢ Ich bitte Sie um â€¦
â€¢ Ich freue mich auf Ihre RÃ¼ckmeldung.

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Administration et rÃ©clamations','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Administration et rÃ©clamations');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'ComprÃ©hension et production â€” Administration et rÃ©clamations','allemand-b1-m10-l05','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 10/12 â€” Administration et rÃ©clamations
LEÃ‡ON 5/8 â€” ComprÃ©hension et production

TEXTE / SITUATION
Imaginez une situation rÃ©elle autour de Â« Administration et rÃ©clamations Â». Les personnes utilisent les expressions suivantes :
â€¢ Hiermit mÃ¶chte ich mich beschweren.
â€¢ Leider musste ich feststellen, dass â€¦
â€¢ Ich bitte Sie um â€¦
â€¢ Ich freue mich auf Ihre RÃ¼ckmeldung.

COMPRÃ‰HENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou Ã©motion peut-on dÃ©duire ?
4. Reformulez le contenu en franÃ§ais, puis en allemand simple.

PRODUCTION Ã‰CRITE
RÃ©digez un texte adaptÃ© au niveau B1. Utilisez au moins 8 Ã©lÃ©ments du module et 3 structures liÃ©es Ã  : registre formel; passif.

PRODUCTION ORALE
Parlez pendant 2 Ã  4 minutes sans lire. Recommencez en amÃ©liorant la fluiditÃ©.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Administration et rÃ©clamations','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Administration et rÃ©clamations');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif â€” Administration et rÃ©clamations','allemand-b1-m10-l06','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 10/12 â€” Administration et rÃ©clamations
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
â€¢ Hiermit mÃ¶chte ich mich beschweren.
â€¢ Leider musste ich feststellen, dass â€¦
â€¢ Ich bitte Sie um â€¦
â€¢ Ich freue mich auf Ihre RÃ¼ckmeldung.

GRAMMAIRE Ã€ RÃ‰UTILISER
registre formel; passif.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Administration et rÃ©clamations','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Administration et rÃ©clamations');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module â€” Administration et rÃ©clamations','allemand-b1-m10-l07','quiz','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 10/12 â€” Administration et rÃ©clamations
LEÃ‡ON 7/8 â€” Quiz de module

QUIZ DE VALIDATION â€” Administration et rÃ©clamations

Avant de valider, vous devez pouvoir :
â€¢ comprendre les quatre expressions du module ;
â€¢ expliquer le point de grammaire Â« registre formel; passif Â» ;
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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Administration et rÃ©clamations','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Administration et rÃ©clamations');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission rÃ©elle â€” Administration et rÃ©clamations','allemand-b1-m10-l08','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 10/12 â€” Administration et rÃ©clamations
LEÃ‡ON 8/8 â€” Mission rÃ©elle

MISSION RÃ‰ELLE â€” Administration et rÃ©clamations

SCÃ‰NARIO
Vous devez Ã©crire une demande ou rÃ©clamation formelle. Vous nâ€™avez droit quâ€™Ã  lâ€™allemand.

LIVRABLES
1. Un texte de 180 Ã  350 mots.
2. Un enregistrement oral de 3 Ã  6 minutes.
3. Un dialogue de 10 rÃ©pliques.
4. Une liste de 15 mots ou expressions rÃ©ellement utiles.
5. Une auto-correction : trois erreurs repÃ©rÃ©es et expliquÃ©es.

CRITÃˆRES
ClartÃ©, correction, vocabulaire adaptÃ©, fluiditÃ© et capacitÃ© Ã  accomplir la tÃ¢che.

EXPRESSIONS Ã€ RÃ‰UTILISER
â€¢ Hiermit mÃ¶chte ich mich beschweren.
â€¢ Leider musste ich feststellen, dass â€¦
â€¢ Ich bitte Sie um â€¦
â€¢ Ich freue mich auf Ihre RÃ¼ckmeldung.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Administration et rÃ©clamations','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Administration et rÃ©clamations');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B1 Â· Module 11 â€” Culture et interculturalitÃ©','Niveau B1 : comparer des habitudes sans gÃ©nÃ©raliser. Grammaire : nominalisation introduction. 8 leÃ§ons avec thÃ©orie, audio, exercices, quiz et mission rÃ©elle.',35) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre â€” Culture et interculturalitÃ©','allemand-b1-m11-l01','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 11/12 â€” Culture et interculturalitÃ©
LEÃ‡ON 1/8 â€” Comprendre

OBJECTIF
Comparer des habitudes sans gÃ©nÃ©raliser.

EXPLICATION EN FRANÃ‡AIS
Ã€ ce niveau, vous devez apprendre Ã  communiquer avec discours suivi, justification, rÃ©cit et communication professionnelle simple. Le thÃ¨me Â« Culture et interculturalitÃ© Â» sert de contexte rÃ©el. Commencez par comprendre lâ€™intention, puis repÃ©rez le verbe, les informations importantes et enfin les dÃ©tails.

MÃ‰THODE
1. Lisez les phrases sans traduire mot Ã  mot.
2. Soulignez le verbe conjuguÃ©.
3. RepÃ©rez qui parle, Ã  qui et dans quel but.
4. RÃ©pÃ©tez chaque phrase Ã  voix haute trois fois.
5. Changez un Ã©lÃ©ment pour crÃ©er votre propre exemple.

EXEMPLES ALLEMANDS
â€¢ Mir ist aufgefallen, dass â€¦
â€¢ Im Vergleich zu â€¦
â€¢ Man darf nicht vergessen, dass â€¦
â€¢ Das hÃ¤ngt von der Person ab.

Ã€ RETENIR
Grammaire centrale : nominalisation introduction.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Culture et interculturalitÃ©','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Culture et interculturalitÃ©');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif â€” Culture et interculturalitÃ©','allemand-b1-m11-l02','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 11/12 â€” Culture et interculturalitÃ©
LEÃ‡ON 2/8 â€” Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur Â« Culture et interculturalitÃ© Â».

VOCABULAIRE Ã€ ACTIVER
Person, Vergleich, aufgefallen, darf, dass, hÃ¤ngt, nicht, vergessen

TECHNIQUE 4 Ã‰TAPES
1. Ã‰coutez le mot avec le bouton audio.
2. RÃ©pÃ©tez-le dans une phrase complÃ¨te.
3. CrÃ©ez une phrase vraie sur votre vie.
4. RÃ©utilisez-le 24 heures plus tard.

MODÃˆLES
â€¢ Mir ist aufgefallen, dass â€¦
â€¢ Im Vergleich zu â€¦
â€¢ Man darf nicht vergessen, dass â€¦
â€¢ Das hÃ¤ngt von der Person ab.

EXERCICES
1. Choisissez 10 mots et Ã©crivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez lâ€™allemand et traduisez vos phrases du franÃ§ais vers lâ€™allemand.
4. Enregistrez oralement un rÃ©sumÃ© de 60 secondes.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Culture et interculturalitÃ©','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Culture et interculturalitÃ©');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation â€” Culture et interculturalitÃ©','allemand-b1-m11-l03','audio','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 11/12 â€” Culture et interculturalitÃ©
LEÃ‡ON 3/8 â€” Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÃˆLE
A: Mir ist aufgefallen, dass â€¦
B: Im Vergleich zu â€¦
A: Man darf nicht vergessen, dass â€¦
B: Das hÃ¤ngt von der Person ab.

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Culture et interculturalitÃ©','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Culture et interculturalitÃ©');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur â€” Culture et interculturalitÃ©','allemand-b1-m11-l04','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 11/12 â€” Culture et interculturalitÃ©
LEÃ‡ON 4/8 â€” Grammaire en profondeur

POINT DE GRAMMAIRE
nominalisation introduction.

EXPLICATION
La grammaire nâ€™est pas une liste de rÃ¨gles Ã  mÃ©moriser sÃ©parÃ©ment : elle sert Ã  exprimer une intention. Observez dâ€™abord la place du verbe, puis les complÃ©ments, et enfin les Ã©lÃ©ments de temps, cause ou opinion.

EXEMPLES
â€¢ Mir ist aufgefallen, dass â€¦
â€¢ Im Vergleich zu â€¦
â€¢ Man darf nicht vergessen, dass â€¦
â€¢ Das hÃ¤ngt von der Person ab.

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Culture et interculturalitÃ©','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Culture et interculturalitÃ©');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'ComprÃ©hension et production â€” Culture et interculturalitÃ©','allemand-b1-m11-l05','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 11/12 â€” Culture et interculturalitÃ©
LEÃ‡ON 5/8 â€” ComprÃ©hension et production

TEXTE / SITUATION
Imaginez une situation rÃ©elle autour de Â« Culture et interculturalitÃ© Â». Les personnes utilisent les expressions suivantes :
â€¢ Mir ist aufgefallen, dass â€¦
â€¢ Im Vergleich zu â€¦
â€¢ Man darf nicht vergessen, dass â€¦
â€¢ Das hÃ¤ngt von der Person ab.

COMPRÃ‰HENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou Ã©motion peut-on dÃ©duire ?
4. Reformulez le contenu en franÃ§ais, puis en allemand simple.

PRODUCTION Ã‰CRITE
RÃ©digez un texte adaptÃ© au niveau B1. Utilisez au moins 8 Ã©lÃ©ments du module et 3 structures liÃ©es Ã  : nominalisation introduction.

PRODUCTION ORALE
Parlez pendant 2 Ã  4 minutes sans lire. Recommencez en amÃ©liorant la fluiditÃ©.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Culture et interculturalitÃ©','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Culture et interculturalitÃ©');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif â€” Culture et interculturalitÃ©','allemand-b1-m11-l06','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 11/12 â€” Culture et interculturalitÃ©
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
â€¢ Mir ist aufgefallen, dass â€¦
â€¢ Im Vergleich zu â€¦
â€¢ Man darf nicht vergessen, dass â€¦
â€¢ Das hÃ¤ngt von der Person ab.

GRAMMAIRE Ã€ RÃ‰UTILISER
nominalisation introduction.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Culture et interculturalitÃ©','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Culture et interculturalitÃ©');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module â€” Culture et interculturalitÃ©','allemand-b1-m11-l07','quiz','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 11/12 â€” Culture et interculturalitÃ©
LEÃ‡ON 7/8 â€” Quiz de module

QUIZ DE VALIDATION â€” Culture et interculturalitÃ©

Avant de valider, vous devez pouvoir :
â€¢ comprendre les quatre expressions du module ;
â€¢ expliquer le point de grammaire Â« nominalisation introduction Â» ;
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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Culture et interculturalitÃ©','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Culture et interculturalitÃ©');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission rÃ©elle â€” Culture et interculturalitÃ©','allemand-b1-m11-l08','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 11/12 â€” Culture et interculturalitÃ©
LEÃ‡ON 8/8 â€” Mission rÃ©elle

MISSION RÃ‰ELLE â€” Culture et interculturalitÃ©

SCÃ‰NARIO
Vous devez comparer des habitudes sans gÃ©nÃ©raliser. Vous nâ€™avez droit quâ€™Ã  lâ€™allemand.

LIVRABLES
1. Un texte de 180 Ã  350 mots.
2. Un enregistrement oral de 3 Ã  6 minutes.
3. Un dialogue de 10 rÃ©pliques.
4. Une liste de 15 mots ou expressions rÃ©ellement utiles.
5. Une auto-correction : trois erreurs repÃ©rÃ©es et expliquÃ©es.

CRITÃˆRES
ClartÃ©, correction, vocabulaire adaptÃ©, fluiditÃ© et capacitÃ© Ã  accomplir la tÃ¢che.

EXPRESSIONS Ã€ RÃ‰UTILISER
â€¢ Mir ist aufgefallen, dass â€¦
â€¢ Im Vergleich zu â€¦
â€¢ Man darf nicht vergessen, dass â€¦
â€¢ Das hÃ¤ngt von der Person ab.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Culture et interculturalitÃ©','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Culture et interculturalitÃ©');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B1 Â· Module 12 â€” RÃ©vision B1 et examen','Niveau B1 : rÃ©ussir les tÃ¢ches classiques B1. Grammaire : rÃ©vision globale B1. 8 leÃ§ons avec thÃ©orie, audio, exercices, quiz et mission rÃ©elle.',36) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre â€” RÃ©vision B1 et examen','allemand-b1-m12-l01','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 12/12 â€” RÃ©vision B1 et examen
LEÃ‡ON 1/8 â€” Comprendre

OBJECTIF
RÃ©ussir les tÃ¢ches classiques b1.

EXPLICATION EN FRANÃ‡AIS
Ã€ ce niveau, vous devez apprendre Ã  communiquer avec discours suivi, justification, rÃ©cit et communication professionnelle simple. Le thÃ¨me Â« RÃ©vision B1 et examen Â» sert de contexte rÃ©el. Commencez par comprendre lâ€™intention, puis repÃ©rez le verbe, les informations importantes et enfin les dÃ©tails.

MÃ‰THODE
1. Lisez les phrases sans traduire mot Ã  mot.
2. Soulignez le verbe conjuguÃ©.
3. RepÃ©rez qui parle, Ã  qui et dans quel but.
4. RÃ©pÃ©tez chaque phrase Ã  voix haute trois fois.
5. Changez un Ã©lÃ©ment pour crÃ©er votre propre exemple.

EXEMPLES ALLEMANDS
â€¢ Ich mÃ¶chte auf drei Punkte eingehen.
â€¢ Dazu habe ich folgende Erfahrung gemacht.
â€¢ Ein Beispiel dafÃ¼r ist â€¦
â€¢ AbschlieÃŸend lÃ¤sst sich sagen â€¦

Ã€ RETENIR
Grammaire centrale : rÃ©vision globale B1.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” RÃ©vision B1 et examen','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” RÃ©vision B1 et examen');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif â€” RÃ©vision B1 et examen','allemand-b1-m12-l02','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 12/12 â€” RÃ©vision B1 et examen
LEÃ‡ON 2/8 â€” Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur Â« RÃ©vision B1 et examen Â».

VOCABULAIRE Ã€ ACTIVER
AbschlieÃŸend, Beispiel, Dazu, Erfahrung, Punkte, dafÃ¼r, drei, eingehen, folgende, gemacht, habe, lÃ¤sst, mÃ¶chte, sagen, sich

TECHNIQUE 4 Ã‰TAPES
1. Ã‰coutez le mot avec le bouton audio.
2. RÃ©pÃ©tez-le dans une phrase complÃ¨te.
3. CrÃ©ez une phrase vraie sur votre vie.
4. RÃ©utilisez-le 24 heures plus tard.

MODÃˆLES
â€¢ Ich mÃ¶chte auf drei Punkte eingehen.
â€¢ Dazu habe ich folgende Erfahrung gemacht.
â€¢ Ein Beispiel dafÃ¼r ist â€¦
â€¢ AbschlieÃŸend lÃ¤sst sich sagen â€¦

EXERCICES
1. Choisissez 10 mots et Ã©crivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez lâ€™allemand et traduisez vos phrases du franÃ§ais vers lâ€™allemand.
4. Enregistrez oralement un rÃ©sumÃ© de 60 secondes.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” RÃ©vision B1 et examen','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” RÃ©vision B1 et examen');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation â€” RÃ©vision B1 et examen','allemand-b1-m12-l03','audio','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 12/12 â€” RÃ©vision B1 et examen
LEÃ‡ON 3/8 â€” Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÃˆLE
A: Ich mÃ¶chte auf drei Punkte eingehen.
B: Dazu habe ich folgende Erfahrung gemacht.
A: Ein Beispiel dafÃ¼r ist â€¦
B: AbschlieÃŸend lÃ¤sst sich sagen â€¦

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” RÃ©vision B1 et examen','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” RÃ©vision B1 et examen');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur â€” RÃ©vision B1 et examen','allemand-b1-m12-l04','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 12/12 â€” RÃ©vision B1 et examen
LEÃ‡ON 4/8 â€” Grammaire en profondeur

POINT DE GRAMMAIRE
rÃ©vision globale B1.

EXPLICATION
La grammaire nâ€™est pas une liste de rÃ¨gles Ã  mÃ©moriser sÃ©parÃ©ment : elle sert Ã  exprimer une intention. Observez dâ€™abord la place du verbe, puis les complÃ©ments, et enfin les Ã©lÃ©ments de temps, cause ou opinion.

EXEMPLES
â€¢ Ich mÃ¶chte auf drei Punkte eingehen.
â€¢ Dazu habe ich folgende Erfahrung gemacht.
â€¢ Ein Beispiel dafÃ¼r ist â€¦
â€¢ AbschlieÃŸend lÃ¤sst sich sagen â€¦

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” RÃ©vision B1 et examen','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” RÃ©vision B1 et examen');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'ComprÃ©hension et production â€” RÃ©vision B1 et examen','allemand-b1-m12-l05','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 12/12 â€” RÃ©vision B1 et examen
LEÃ‡ON 5/8 â€” ComprÃ©hension et production

TEXTE / SITUATION
Imaginez une situation rÃ©elle autour de Â« RÃ©vision B1 et examen Â». Les personnes utilisent les expressions suivantes :
â€¢ Ich mÃ¶chte auf drei Punkte eingehen.
â€¢ Dazu habe ich folgende Erfahrung gemacht.
â€¢ Ein Beispiel dafÃ¼r ist â€¦
â€¢ AbschlieÃŸend lÃ¤sst sich sagen â€¦

COMPRÃ‰HENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou Ã©motion peut-on dÃ©duire ?
4. Reformulez le contenu en franÃ§ais, puis en allemand simple.

PRODUCTION Ã‰CRITE
RÃ©digez un texte adaptÃ© au niveau B1. Utilisez au moins 8 Ã©lÃ©ments du module et 3 structures liÃ©es Ã  : rÃ©vision globale B1.

PRODUCTION ORALE
Parlez pendant 2 Ã  4 minutes sans lire. Recommencez en amÃ©liorant la fluiditÃ©.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” RÃ©vision B1 et examen','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” RÃ©vision B1 et examen');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif â€” RÃ©vision B1 et examen','allemand-b1-m12-l06','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 12/12 â€” RÃ©vision B1 et examen
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
â€¢ Ich mÃ¶chte auf drei Punkte eingehen.
â€¢ Dazu habe ich folgende Erfahrung gemacht.
â€¢ Ein Beispiel dafÃ¼r ist â€¦
â€¢ AbschlieÃŸend lÃ¤sst sich sagen â€¦

GRAMMAIRE Ã€ RÃ‰UTILISER
rÃ©vision globale B1.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” RÃ©vision B1 et examen','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” RÃ©vision B1 et examen');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module â€” RÃ©vision B1 et examen','allemand-b1-m12-l07','quiz','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 12/12 â€” RÃ©vision B1 et examen
LEÃ‡ON 7/8 â€” Quiz de module

QUIZ DE VALIDATION â€” RÃ©vision B1 et examen

Avant de valider, vous devez pouvoir :
â€¢ comprendre les quatre expressions du module ;
â€¢ expliquer le point de grammaire Â« rÃ©vision globale B1 Â» ;
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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” RÃ©vision B1 et examen','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” RÃ©vision B1 et examen');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission rÃ©elle â€” RÃ©vision B1 et examen','allemand-b1-m12-l08','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 12/12 â€” RÃ©vision B1 et examen
LEÃ‡ON 8/8 â€” Mission rÃ©elle

MISSION RÃ‰ELLE â€” RÃ©vision B1 et examen

SCÃ‰NARIO
Vous devez rÃ©ussir les tÃ¢ches classiques B1. Vous nâ€™avez droit quâ€™Ã  lâ€™allemand.

LIVRABLES
1. Un texte de 180 Ã  350 mots.
2. Un enregistrement oral de 3 Ã  6 minutes.
3. Un dialogue de 10 rÃ©pliques.
4. Une liste de 15 mots ou expressions rÃ©ellement utiles.
5. Une auto-correction : trois erreurs repÃ©rÃ©es et expliquÃ©es.

CRITÃˆRES
ClartÃ©, correction, vocabulaire adaptÃ©, fluiditÃ© et capacitÃ© Ã  accomplir la tÃ¢che.

EXPRESSIONS Ã€ RÃ‰UTILISER
â€¢ Ich mÃ¶chte auf drei Punkte eingehen.
â€¢ Dazu habe ich folgende Erfahrung gemacht.
â€¢ Ein Beispiel dafÃ¼r ist â€¦
â€¢ AbschlieÃŸend lÃ¤sst sich sagen â€¦

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” RÃ©vision B1 et examen','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” RÃ©vision B1 et examen');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
END $$;

SELECT 'Partie 6/10 installÃ©e : modules 31 Ã  36' AS resultat;


