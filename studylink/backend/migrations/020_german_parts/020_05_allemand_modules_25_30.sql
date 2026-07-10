-- StudyLink 020 - Allemand A1-C1 - Partie 5/10
-- Modules 25 Ã  30
DO $$
DECLARE v_course UUID; v_module UUID; v_lesson UUID;
BEGIN
  SELECT id INTO v_course FROM public.courses WHERE slug='allemand-complet-a1-c1' ORDER BY created_at DESC NULLS LAST LIMIT 1;
  IF v_course IS NULL THEN RAISE EXCEPTION 'Le cours allemand n existe pas encore. Executez d abord la partie 01.'; END IF;
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B1 Â· Module 1 â€” RÃ©cits dÃ©taillÃ©s','Niveau B1 : raconter clairement un Ã©vÃ©nement. Grammaire : PrÃ¤teritum frÃ©quent; als; obwohl. 8 leÃ§ons avec thÃ©orie, audio, exercices, quiz et mission rÃ©elle.',25) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre â€” RÃ©cits dÃ©taillÃ©s','allemand-b1-m01-l01','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 1/12 â€” RÃ©cits dÃ©taillÃ©s
LEÃ‡ON 1/8 â€” Comprendre

OBJECTIF
Raconter clairement un Ã©vÃ©nement.

EXPLICATION EN FRANÃ‡AIS
Ã€ ce niveau, vous devez apprendre Ã  communiquer avec discours suivi, justification, rÃ©cit et communication professionnelle simple. Le thÃ¨me Â« RÃ©cits dÃ©taillÃ©s Â» sert de contexte rÃ©el. Commencez par comprendre lâ€™intention, puis repÃ©rez le verbe, les informations importantes et enfin les dÃ©tails.

MÃ‰THODE
1. Lisez les phrases sans traduire mot Ã  mot.
2. Soulignez le verbe conjuguÃ©.
3. RepÃ©rez qui parle, Ã  qui et dans quel but.
4. RÃ©pÃ©tez chaque phrase Ã  voix haute trois fois.
5. Changez un Ã©lÃ©ment pour crÃ©er votre propre exemple.

EXEMPLES ALLEMANDS
â€¢ Als ich klein war, â€¦
â€¢ PlÃ¶tzlich passierte etwas.
â€¢ Obwohl ich mÃ¼de war, â€¦
â€¢ Am Ende war ich erleichtert.

Ã€ RETENIR
Grammaire centrale : PrÃ¤teritum frÃ©quent; als; obwohl.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” RÃ©cits dÃ©taillÃ©s','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” RÃ©cits dÃ©taillÃ©s');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif â€” RÃ©cits dÃ©taillÃ©s','allemand-b1-m01-l02','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 1/12 â€” RÃ©cits dÃ©taillÃ©s
LEÃ‡ON 2/8 â€” Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur Â« RÃ©cits dÃ©taillÃ©s Â».

VOCABULAIRE Ã€ ACTIVER
Ende, Obwohl, PlÃ¶tzlich, erleichtert, etwas, klein, mÃ¼de, passierte

TECHNIQUE 4 Ã‰TAPES
1. Ã‰coutez le mot avec le bouton audio.
2. RÃ©pÃ©tez-le dans une phrase complÃ¨te.
3. CrÃ©ez une phrase vraie sur votre vie.
4. RÃ©utilisez-le 24 heures plus tard.

MODÃˆLES
â€¢ Als ich klein war, â€¦
â€¢ PlÃ¶tzlich passierte etwas.
â€¢ Obwohl ich mÃ¼de war, â€¦
â€¢ Am Ende war ich erleichtert.

EXERCICES
1. Choisissez 10 mots et Ã©crivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez lâ€™allemand et traduisez vos phrases du franÃ§ais vers lâ€™allemand.
4. Enregistrez oralement un rÃ©sumÃ© de 60 secondes.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” RÃ©cits dÃ©taillÃ©s','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” RÃ©cits dÃ©taillÃ©s');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation â€” RÃ©cits dÃ©taillÃ©s','allemand-b1-m01-l03','audio','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 1/12 â€” RÃ©cits dÃ©taillÃ©s
LEÃ‡ON 3/8 â€” Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÃˆLE
A: Als ich klein war, â€¦
B: PlÃ¶tzlich passierte etwas.
A: Obwohl ich mÃ¼de war, â€¦
B: Am Ende war ich erleichtert.

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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” RÃ©cits dÃ©taillÃ©s','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” RÃ©cits dÃ©taillÃ©s');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur â€” RÃ©cits dÃ©taillÃ©s','allemand-b1-m01-l04','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 1/12 â€” RÃ©cits dÃ©taillÃ©s
LEÃ‡ON 4/8 â€” Grammaire en profondeur

POINT DE GRAMMAIRE
PrÃ¤teritum frÃ©quent; als; obwohl.

EXPLICATION
La grammaire nâ€™est pas une liste de rÃ¨gles Ã  mÃ©moriser sÃ©parÃ©ment : elle sert Ã  exprimer une intention. Observez dâ€™abord la place du verbe, puis les complÃ©ments, et enfin les Ã©lÃ©ments de temps, cause ou opinion.

EXEMPLES
â€¢ Als ich klein war, â€¦
â€¢ PlÃ¶tzlich passierte etwas.
â€¢ Obwohl ich mÃ¼de war, â€¦
â€¢ Am Ende war ich erleichtert.

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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” RÃ©cits dÃ©taillÃ©s','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” RÃ©cits dÃ©taillÃ©s');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'ComprÃ©hension et production â€” RÃ©cits dÃ©taillÃ©s','allemand-b1-m01-l05','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 1/12 â€” RÃ©cits dÃ©taillÃ©s
LEÃ‡ON 5/8 â€” ComprÃ©hension et production

TEXTE / SITUATION
Imaginez une situation rÃ©elle autour de Â« RÃ©cits dÃ©taillÃ©s Â». Les personnes utilisent les expressions suivantes :
â€¢ Als ich klein war, â€¦
â€¢ PlÃ¶tzlich passierte etwas.
â€¢ Obwohl ich mÃ¼de war, â€¦
â€¢ Am Ende war ich erleichtert.

COMPRÃ‰HENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou Ã©motion peut-on dÃ©duire ?
4. Reformulez le contenu en franÃ§ais, puis en allemand simple.

PRODUCTION Ã‰CRITE
RÃ©digez un texte adaptÃ© au niveau B1. Utilisez au moins 8 Ã©lÃ©ments du module et 3 structures liÃ©es Ã  : PrÃ¤teritum frÃ©quent; als; obwohl.

PRODUCTION ORALE
Parlez pendant 2 Ã  4 minutes sans lire. Recommencez en amÃ©liorant la fluiditÃ©.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” RÃ©cits dÃ©taillÃ©s','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” RÃ©cits dÃ©taillÃ©s');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif â€” RÃ©cits dÃ©taillÃ©s','allemand-b1-m01-l06','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 1/12 â€” RÃ©cits dÃ©taillÃ©s
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
â€¢ Als ich klein war, â€¦
â€¢ PlÃ¶tzlich passierte etwas.
â€¢ Obwohl ich mÃ¼de war, â€¦
â€¢ Am Ende war ich erleichtert.

GRAMMAIRE Ã€ RÃ‰UTILISER
PrÃ¤teritum frÃ©quent; als; obwohl.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” RÃ©cits dÃ©taillÃ©s','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” RÃ©cits dÃ©taillÃ©s');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module â€” RÃ©cits dÃ©taillÃ©s','allemand-b1-m01-l07','quiz','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 1/12 â€” RÃ©cits dÃ©taillÃ©s
LEÃ‡ON 7/8 â€” Quiz de module

QUIZ DE VALIDATION â€” RÃ©cits dÃ©taillÃ©s

Avant de valider, vous devez pouvoir :
â€¢ comprendre les quatre expressions du module ;
â€¢ expliquer le point de grammaire Â« PrÃ¤teritum frÃ©quent; als; obwohl Â» ;
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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” RÃ©cits dÃ©taillÃ©s','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” RÃ©cits dÃ©taillÃ©s');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission rÃ©elle â€” RÃ©cits dÃ©taillÃ©s','allemand-b1-m01-l08','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 1/12 â€” RÃ©cits dÃ©taillÃ©s
LEÃ‡ON 8/8 â€” Mission rÃ©elle

MISSION RÃ‰ELLE â€” RÃ©cits dÃ©taillÃ©s

SCÃ‰NARIO
Vous devez raconter clairement un Ã©vÃ©nement. Vous nâ€™avez droit quâ€™Ã  lâ€™allemand.

LIVRABLES
1. Un texte de 180 Ã  350 mots.
2. Un enregistrement oral de 3 Ã  6 minutes.
3. Un dialogue de 10 rÃ©pliques.
4. Une liste de 15 mots ou expressions rÃ©ellement utiles.
5. Une auto-correction : trois erreurs repÃ©rÃ©es et expliquÃ©es.

CRITÃˆRES
ClartÃ©, correction, vocabulaire adaptÃ©, fluiditÃ© et capacitÃ© Ã  accomplir la tÃ¢che.

EXPRESSIONS Ã€ RÃ‰UTILISER
â€¢ Als ich klein war, â€¦
â€¢ PlÃ¶tzlich passierte etwas.
â€¢ Obwohl ich mÃ¼de war, â€¦
â€¢ Am Ende war ich erleichtert.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” RÃ©cits dÃ©taillÃ©s','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” RÃ©cits dÃ©taillÃ©s');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B1 Â· Module 2 â€” Argumentation du quotidien','Niveau B1 : dÃ©velopper une opinion avec arguments. Grammaire : connecteurs; dass/obwohl. 8 leÃ§ons avec thÃ©orie, audio, exercices, quiz et mission rÃ©elle.',26) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre â€” Argumentation du quotidien','allemand-b1-m02-l01','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 2/12 â€” Argumentation du quotidien
LEÃ‡ON 1/8 â€” Comprendre

OBJECTIF
DÃ©velopper une opinion avec arguments.

EXPLICATION EN FRANÃ‡AIS
Ã€ ce niveau, vous devez apprendre Ã  communiquer avec discours suivi, justification, rÃ©cit et communication professionnelle simple. Le thÃ¨me Â« Argumentation du quotidien Â» sert de contexte rÃ©el. Commencez par comprendre lâ€™intention, puis repÃ©rez le verbe, les informations importantes et enfin les dÃ©tails.

MÃ‰THODE
1. Lisez les phrases sans traduire mot Ã  mot.
2. Soulignez le verbe conjuguÃ©.
3. RepÃ©rez qui parle, Ã  qui et dans quel but.
4. RÃ©pÃ©tez chaque phrase Ã  voix haute trois fois.
5. Changez un Ã©lÃ©ment pour crÃ©er votre propre exemple.

EXEMPLES ALLEMANDS
â€¢ Ich vertrete die Ansicht, dass â€¦
â€¢ Ein Vorteil ist â€¦
â€¢ Andererseits â€¦
â€¢ Zusammenfassend â€¦

Ã€ RETENIR
Grammaire centrale : connecteurs; dass/obwohl.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Argumentation du quotidien','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Argumentation du quotidien');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif â€” Argumentation du quotidien','allemand-b1-m02-l02','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 2/12 â€” Argumentation du quotidien
LEÃ‡ON 2/8 â€” Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur Â« Argumentation du quotidien Â».

VOCABULAIRE Ã€ ACTIVER
Andererseits, Ansicht, Vorteil, Zusammenfassend, dass, vertrete

TECHNIQUE 4 Ã‰TAPES
1. Ã‰coutez le mot avec le bouton audio.
2. RÃ©pÃ©tez-le dans une phrase complÃ¨te.
3. CrÃ©ez une phrase vraie sur votre vie.
4. RÃ©utilisez-le 24 heures plus tard.

MODÃˆLES
â€¢ Ich vertrete die Ansicht, dass â€¦
â€¢ Ein Vorteil ist â€¦
â€¢ Andererseits â€¦
â€¢ Zusammenfassend â€¦

EXERCICES
1. Choisissez 10 mots et Ã©crivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez lâ€™allemand et traduisez vos phrases du franÃ§ais vers lâ€™allemand.
4. Enregistrez oralement un rÃ©sumÃ© de 60 secondes.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Argumentation du quotidien','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Argumentation du quotidien');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation â€” Argumentation du quotidien','allemand-b1-m02-l03','audio','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 2/12 â€” Argumentation du quotidien
LEÃ‡ON 3/8 â€” Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÃˆLE
A: Ich vertrete die Ansicht, dass â€¦
B: Ein Vorteil ist â€¦
A: Andererseits â€¦
B: Zusammenfassend â€¦

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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Argumentation du quotidien','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Argumentation du quotidien');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur â€” Argumentation du quotidien','allemand-b1-m02-l04','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 2/12 â€” Argumentation du quotidien
LEÃ‡ON 4/8 â€” Grammaire en profondeur

POINT DE GRAMMAIRE
connecteurs; dass/obwohl.

EXPLICATION
La grammaire nâ€™est pas une liste de rÃ¨gles Ã  mÃ©moriser sÃ©parÃ©ment : elle sert Ã  exprimer une intention. Observez dâ€™abord la place du verbe, puis les complÃ©ments, et enfin les Ã©lÃ©ments de temps, cause ou opinion.

EXEMPLES
â€¢ Ich vertrete die Ansicht, dass â€¦
â€¢ Ein Vorteil ist â€¦
â€¢ Andererseits â€¦
â€¢ Zusammenfassend â€¦

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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Argumentation du quotidien','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Argumentation du quotidien');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'ComprÃ©hension et production â€” Argumentation du quotidien','allemand-b1-m02-l05','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 2/12 â€” Argumentation du quotidien
LEÃ‡ON 5/8 â€” ComprÃ©hension et production

TEXTE / SITUATION
Imaginez une situation rÃ©elle autour de Â« Argumentation du quotidien Â». Les personnes utilisent les expressions suivantes :
â€¢ Ich vertrete die Ansicht, dass â€¦
â€¢ Ein Vorteil ist â€¦
â€¢ Andererseits â€¦
â€¢ Zusammenfassend â€¦

COMPRÃ‰HENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou Ã©motion peut-on dÃ©duire ?
4. Reformulez le contenu en franÃ§ais, puis en allemand simple.

PRODUCTION Ã‰CRITE
RÃ©digez un texte adaptÃ© au niveau B1. Utilisez au moins 8 Ã©lÃ©ments du module et 3 structures liÃ©es Ã  : connecteurs; dass/obwohl.

PRODUCTION ORALE
Parlez pendant 2 Ã  4 minutes sans lire. Recommencez en amÃ©liorant la fluiditÃ©.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Argumentation du quotidien','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Argumentation du quotidien');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif â€” Argumentation du quotidien','allemand-b1-m02-l06','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 2/12 â€” Argumentation du quotidien
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
â€¢ Ich vertrete die Ansicht, dass â€¦
â€¢ Ein Vorteil ist â€¦
â€¢ Andererseits â€¦
â€¢ Zusammenfassend â€¦

GRAMMAIRE Ã€ RÃ‰UTILISER
connecteurs; dass/obwohl.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Argumentation du quotidien','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Argumentation du quotidien');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module â€” Argumentation du quotidien','allemand-b1-m02-l07','quiz','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 2/12 â€” Argumentation du quotidien
LEÃ‡ON 7/8 â€” Quiz de module

QUIZ DE VALIDATION â€” Argumentation du quotidien

Avant de valider, vous devez pouvoir :
â€¢ comprendre les quatre expressions du module ;
â€¢ expliquer le point de grammaire Â« connecteurs; dass/obwohl Â» ;
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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Argumentation du quotidien','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Argumentation du quotidien');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission rÃ©elle â€” Argumentation du quotidien','allemand-b1-m02-l08','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 2/12 â€” Argumentation du quotidien
LEÃ‡ON 8/8 â€” Mission rÃ©elle

MISSION RÃ‰ELLE â€” Argumentation du quotidien

SCÃ‰NARIO
Vous devez dÃ©velopper une opinion avec arguments. Vous nâ€™avez droit quâ€™Ã  lâ€™allemand.

LIVRABLES
1. Un texte de 180 Ã  350 mots.
2. Un enregistrement oral de 3 Ã  6 minutes.
3. Un dialogue de 10 rÃ©pliques.
4. Une liste de 15 mots ou expressions rÃ©ellement utiles.
5. Une auto-correction : trois erreurs repÃ©rÃ©es et expliquÃ©es.

CRITÃˆRES
ClartÃ©, correction, vocabulaire adaptÃ©, fluiditÃ© et capacitÃ© Ã  accomplir la tÃ¢che.

EXPRESSIONS Ã€ RÃ‰UTILISER
â€¢ Ich vertrete die Ansicht, dass â€¦
â€¢ Ein Vorteil ist â€¦
â€¢ Andererseits â€¦
â€¢ Zusammenfassend â€¦

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Argumentation du quotidien','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Argumentation du quotidien');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B1 Â· Module 3 â€” Travail et entretien','Niveau B1 : rÃ©pondre Ã  un entretien professionnel. Grammaire : Konjunktiv II poli; infinitif zu. 8 leÃ§ons avec thÃ©orie, audio, exercices, quiz et mission rÃ©elle.',27) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre â€” Travail et entretien','allemand-b1-m03-l01','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 3/12 â€” Travail et entretien
LEÃ‡ON 1/8 â€” Comprendre

OBJECTIF
RÃ©pondre Ã  un entretien professionnel.

EXPLICATION EN FRANÃ‡AIS
Ã€ ce niveau, vous devez apprendre Ã  communiquer avec discours suivi, justification, rÃ©cit et communication professionnelle simple. Le thÃ¨me Â« Travail et entretien Â» sert de contexte rÃ©el. Commencez par comprendre lâ€™intention, puis repÃ©rez le verbe, les informations importantes et enfin les dÃ©tails.

MÃ‰THODE
1. Lisez les phrases sans traduire mot Ã  mot.
2. Soulignez le verbe conjuguÃ©.
3. RepÃ©rez qui parle, Ã  qui et dans quel but.
4. RÃ©pÃ©tez chaque phrase Ã  voix haute trois fois.
5. Changez un Ã©lÃ©ment pour crÃ©er votre propre exemple.

EXEMPLES ALLEMANDS
â€¢ Ich interessiere mich fÃ¼r diese Stelle.
â€¢ Zu meinen StÃ¤rken gehÃ¶ren â€¦
â€¢ Ich habe gelernt, â€¦
â€¢ KÃ¶nnten Sie die Aufgabe genauer beschreiben?

Ã€ RETENIR
Grammaire centrale : Konjunktiv II poli; infinitif zu.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Travail et entretien','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Travail et entretien');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif â€” Travail et entretien','allemand-b1-m03-l02','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 3/12 â€” Travail et entretien
LEÃ‡ON 2/8 â€” Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur Â« Travail et entretien Â».

VOCABULAIRE Ã€ ACTIVER
Aufgabe, KÃ¶nnten, Stelle, StÃ¤rken, beschreiben, diese, gehÃ¶ren, gelernt, genauer, habe, interessiere, meinen, mich

TECHNIQUE 4 Ã‰TAPES
1. Ã‰coutez le mot avec le bouton audio.
2. RÃ©pÃ©tez-le dans une phrase complÃ¨te.
3. CrÃ©ez une phrase vraie sur votre vie.
4. RÃ©utilisez-le 24 heures plus tard.

MODÃˆLES
â€¢ Ich interessiere mich fÃ¼r diese Stelle.
â€¢ Zu meinen StÃ¤rken gehÃ¶ren â€¦
â€¢ Ich habe gelernt, â€¦
â€¢ KÃ¶nnten Sie die Aufgabe genauer beschreiben?

EXERCICES
1. Choisissez 10 mots et Ã©crivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez lâ€™allemand et traduisez vos phrases du franÃ§ais vers lâ€™allemand.
4. Enregistrez oralement un rÃ©sumÃ© de 60 secondes.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Travail et entretien','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Travail et entretien');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation â€” Travail et entretien','allemand-b1-m03-l03','audio','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 3/12 â€” Travail et entretien
LEÃ‡ON 3/8 â€” Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÃˆLE
A: Ich interessiere mich fÃ¼r diese Stelle.
B: Zu meinen StÃ¤rken gehÃ¶ren â€¦
A: Ich habe gelernt, â€¦
B: KÃ¶nnten Sie die Aufgabe genauer beschreiben?

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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Travail et entretien','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Travail et entretien');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur â€” Travail et entretien','allemand-b1-m03-l04','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 3/12 â€” Travail et entretien
LEÃ‡ON 4/8 â€” Grammaire en profondeur

POINT DE GRAMMAIRE
Konjunktiv II poli; infinitif zu.

EXPLICATION
La grammaire nâ€™est pas une liste de rÃ¨gles Ã  mÃ©moriser sÃ©parÃ©ment : elle sert Ã  exprimer une intention. Observez dâ€™abord la place du verbe, puis les complÃ©ments, et enfin les Ã©lÃ©ments de temps, cause ou opinion.

EXEMPLES
â€¢ Ich interessiere mich fÃ¼r diese Stelle.
â€¢ Zu meinen StÃ¤rken gehÃ¶ren â€¦
â€¢ Ich habe gelernt, â€¦
â€¢ KÃ¶nnten Sie die Aufgabe genauer beschreiben?

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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Travail et entretien','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Travail et entretien');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'ComprÃ©hension et production â€” Travail et entretien','allemand-b1-m03-l05','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 3/12 â€” Travail et entretien
LEÃ‡ON 5/8 â€” ComprÃ©hension et production

TEXTE / SITUATION
Imaginez une situation rÃ©elle autour de Â« Travail et entretien Â». Les personnes utilisent les expressions suivantes :
â€¢ Ich interessiere mich fÃ¼r diese Stelle.
â€¢ Zu meinen StÃ¤rken gehÃ¶ren â€¦
â€¢ Ich habe gelernt, â€¦
â€¢ KÃ¶nnten Sie die Aufgabe genauer beschreiben?

COMPRÃ‰HENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou Ã©motion peut-on dÃ©duire ?
4. Reformulez le contenu en franÃ§ais, puis en allemand simple.

PRODUCTION Ã‰CRITE
RÃ©digez un texte adaptÃ© au niveau B1. Utilisez au moins 8 Ã©lÃ©ments du module et 3 structures liÃ©es Ã  : Konjunktiv II poli; infinitif zu.

PRODUCTION ORALE
Parlez pendant 2 Ã  4 minutes sans lire. Recommencez en amÃ©liorant la fluiditÃ©.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Travail et entretien','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Travail et entretien');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif â€” Travail et entretien','allemand-b1-m03-l06','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 3/12 â€” Travail et entretien
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
â€¢ Ich interessiere mich fÃ¼r diese Stelle.
â€¢ Zu meinen StÃ¤rken gehÃ¶ren â€¦
â€¢ Ich habe gelernt, â€¦
â€¢ KÃ¶nnten Sie die Aufgabe genauer beschreiben?

GRAMMAIRE Ã€ RÃ‰UTILISER
Konjunktiv II poli; infinitif zu.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Travail et entretien','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Travail et entretien');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module â€” Travail et entretien','allemand-b1-m03-l07','quiz','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 3/12 â€” Travail et entretien
LEÃ‡ON 7/8 â€” Quiz de module

QUIZ DE VALIDATION â€” Travail et entretien

Avant de valider, vous devez pouvoir :
â€¢ comprendre les quatre expressions du module ;
â€¢ expliquer le point de grammaire Â« Konjunktiv II poli; infinitif zu Â» ;
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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Travail et entretien','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Travail et entretien');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission rÃ©elle â€” Travail et entretien','allemand-b1-m03-l08','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 3/12 â€” Travail et entretien
LEÃ‡ON 8/8 â€” Mission rÃ©elle

MISSION RÃ‰ELLE â€” Travail et entretien

SCÃ‰NARIO
Vous devez rÃ©pondre Ã  un entretien professionnel. Vous nâ€™avez droit quâ€™Ã  lâ€™allemand.

LIVRABLES
1. Un texte de 180 Ã  350 mots.
2. Un enregistrement oral de 3 Ã  6 minutes.
3. Un dialogue de 10 rÃ©pliques.
4. Une liste de 15 mots ou expressions rÃ©ellement utiles.
5. Une auto-correction : trois erreurs repÃ©rÃ©es et expliquÃ©es.

CRITÃˆRES
ClartÃ©, correction, vocabulaire adaptÃ©, fluiditÃ© et capacitÃ© Ã  accomplir la tÃ¢che.

EXPRESSIONS Ã€ RÃ‰UTILISER
â€¢ Ich interessiere mich fÃ¼r diese Stelle.
â€¢ Zu meinen StÃ¤rken gehÃ¶ren â€¦
â€¢ Ich habe gelernt, â€¦
â€¢ KÃ¶nnten Sie die Aufgabe genauer beschreiben?

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Travail et entretien','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Travail et entretien');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B1 Â· Module 4 â€” Ã‰tudes et prÃ©sentations','Niveau B1 : faire une prÃ©sentation structurÃ©e. Grammaire : structure du discours; passif introduction. 8 leÃ§ons avec thÃ©orie, audio, exercices, quiz et mission rÃ©elle.',28) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre â€” Ã‰tudes et prÃ©sentations','allemand-b1-m04-l01','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 4/12 â€” Ã‰tudes et prÃ©sentations
LEÃ‡ON 1/8 â€” Comprendre

OBJECTIF
Faire une prÃ©sentation structurÃ©e.

EXPLICATION EN FRANÃ‡AIS
Ã€ ce niveau, vous devez apprendre Ã  communiquer avec discours suivi, justification, rÃ©cit et communication professionnelle simple. Le thÃ¨me Â« Ã‰tudes et prÃ©sentations Â» sert de contexte rÃ©el. Commencez par comprendre lâ€™intention, puis repÃ©rez le verbe, les informations importantes et enfin les dÃ©tails.

MÃ‰THODE
1. Lisez les phrases sans traduire mot Ã  mot.
2. Soulignez le verbe conjuguÃ©.
3. RepÃ©rez qui parle, Ã  qui et dans quel but.
4. RÃ©pÃ©tez chaque phrase Ã  voix haute trois fois.
5. Changez un Ã©lÃ©ment pour crÃ©er votre propre exemple.

EXEMPLES ALLEMANDS
â€¢ Heute spreche ich Ã¼ber â€¦
â€¢ ZunÃ¤chst mÃ¶chte ich â€¦
â€¢ Wie die Grafik zeigt â€¦
â€¢ Vielen Dank fÃ¼r Ihre Aufmerksamkeit.

Ã€ RETENIR
Grammaire centrale : structure du discours; passif introduction.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Ã‰tudes et prÃ©sentations','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Ã‰tudes et prÃ©sentations');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif â€” Ã‰tudes et prÃ©sentations','allemand-b1-m04-l02','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 4/12 â€” Ã‰tudes et prÃ©sentations
LEÃ‡ON 2/8 â€” Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur Â« Ã‰tudes et prÃ©sentations Â».

VOCABULAIRE Ã€ ACTIVER
Aufmerksamkeit, Dank, Grafik, Heute, Ihre, Vielen, ZunÃ¤chst, mÃ¶chte, spreche, zeigt, Ã¼ber

TECHNIQUE 4 Ã‰TAPES
1. Ã‰coutez le mot avec le bouton audio.
2. RÃ©pÃ©tez-le dans une phrase complÃ¨te.
3. CrÃ©ez une phrase vraie sur votre vie.
4. RÃ©utilisez-le 24 heures plus tard.

MODÃˆLES
â€¢ Heute spreche ich Ã¼ber â€¦
â€¢ ZunÃ¤chst mÃ¶chte ich â€¦
â€¢ Wie die Grafik zeigt â€¦
â€¢ Vielen Dank fÃ¼r Ihre Aufmerksamkeit.

EXERCICES
1. Choisissez 10 mots et Ã©crivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez lâ€™allemand et traduisez vos phrases du franÃ§ais vers lâ€™allemand.
4. Enregistrez oralement un rÃ©sumÃ© de 60 secondes.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Ã‰tudes et prÃ©sentations','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Ã‰tudes et prÃ©sentations');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation â€” Ã‰tudes et prÃ©sentations','allemand-b1-m04-l03','audio','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 4/12 â€” Ã‰tudes et prÃ©sentations
LEÃ‡ON 3/8 â€” Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÃˆLE
A: Heute spreche ich Ã¼ber â€¦
B: ZunÃ¤chst mÃ¶chte ich â€¦
A: Wie die Grafik zeigt â€¦
B: Vielen Dank fÃ¼r Ihre Aufmerksamkeit.

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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Ã‰tudes et prÃ©sentations','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Ã‰tudes et prÃ©sentations');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur â€” Ã‰tudes et prÃ©sentations','allemand-b1-m04-l04','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 4/12 â€” Ã‰tudes et prÃ©sentations
LEÃ‡ON 4/8 â€” Grammaire en profondeur

POINT DE GRAMMAIRE
structure du discours; passif introduction.

EXPLICATION
La grammaire nâ€™est pas une liste de rÃ¨gles Ã  mÃ©moriser sÃ©parÃ©ment : elle sert Ã  exprimer une intention. Observez dâ€™abord la place du verbe, puis les complÃ©ments, et enfin les Ã©lÃ©ments de temps, cause ou opinion.

EXEMPLES
â€¢ Heute spreche ich Ã¼ber â€¦
â€¢ ZunÃ¤chst mÃ¶chte ich â€¦
â€¢ Wie die Grafik zeigt â€¦
â€¢ Vielen Dank fÃ¼r Ihre Aufmerksamkeit.

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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Ã‰tudes et prÃ©sentations','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Ã‰tudes et prÃ©sentations');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'ComprÃ©hension et production â€” Ã‰tudes et prÃ©sentations','allemand-b1-m04-l05','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 4/12 â€” Ã‰tudes et prÃ©sentations
LEÃ‡ON 5/8 â€” ComprÃ©hension et production

TEXTE / SITUATION
Imaginez une situation rÃ©elle autour de Â« Ã‰tudes et prÃ©sentations Â». Les personnes utilisent les expressions suivantes :
â€¢ Heute spreche ich Ã¼ber â€¦
â€¢ ZunÃ¤chst mÃ¶chte ich â€¦
â€¢ Wie die Grafik zeigt â€¦
â€¢ Vielen Dank fÃ¼r Ihre Aufmerksamkeit.

COMPRÃ‰HENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou Ã©motion peut-on dÃ©duire ?
4. Reformulez le contenu en franÃ§ais, puis en allemand simple.

PRODUCTION Ã‰CRITE
RÃ©digez un texte adaptÃ© au niveau B1. Utilisez au moins 8 Ã©lÃ©ments du module et 3 structures liÃ©es Ã  : structure du discours; passif introduction.

PRODUCTION ORALE
Parlez pendant 2 Ã  4 minutes sans lire. Recommencez en amÃ©liorant la fluiditÃ©.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Ã‰tudes et prÃ©sentations','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Ã‰tudes et prÃ©sentations');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif â€” Ã‰tudes et prÃ©sentations','allemand-b1-m04-l06','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 4/12 â€” Ã‰tudes et prÃ©sentations
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
â€¢ Heute spreche ich Ã¼ber â€¦
â€¢ ZunÃ¤chst mÃ¶chte ich â€¦
â€¢ Wie die Grafik zeigt â€¦
â€¢ Vielen Dank fÃ¼r Ihre Aufmerksamkeit.

GRAMMAIRE Ã€ RÃ‰UTILISER
structure du discours; passif introduction.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Ã‰tudes et prÃ©sentations','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Ã‰tudes et prÃ©sentations');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module â€” Ã‰tudes et prÃ©sentations','allemand-b1-m04-l07','quiz','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 4/12 â€” Ã‰tudes et prÃ©sentations
LEÃ‡ON 7/8 â€” Quiz de module

QUIZ DE VALIDATION â€” Ã‰tudes et prÃ©sentations

Avant de valider, vous devez pouvoir :
â€¢ comprendre les quatre expressions du module ;
â€¢ expliquer le point de grammaire Â« structure du discours; passif introduction Â» ;
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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Ã‰tudes et prÃ©sentations','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Ã‰tudes et prÃ©sentations');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission rÃ©elle â€” Ã‰tudes et prÃ©sentations','allemand-b1-m04-l08','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 4/12 â€” Ã‰tudes et prÃ©sentations
LEÃ‡ON 8/8 â€” Mission rÃ©elle

MISSION RÃ‰ELLE â€” Ã‰tudes et prÃ©sentations

SCÃ‰NARIO
Vous devez faire une prÃ©sentation structurÃ©e. Vous nâ€™avez droit quâ€™Ã  lâ€™allemand.

LIVRABLES
1. Un texte de 180 Ã  350 mots.
2. Un enregistrement oral de 3 Ã  6 minutes.
3. Un dialogue de 10 rÃ©pliques.
4. Une liste de 15 mots ou expressions rÃ©ellement utiles.
5. Une auto-correction : trois erreurs repÃ©rÃ©es et expliquÃ©es.

CRITÃˆRES
ClartÃ©, correction, vocabulaire adaptÃ©, fluiditÃ© et capacitÃ© Ã  accomplir la tÃ¢che.

EXPRESSIONS Ã€ RÃ‰UTILISER
â€¢ Heute spreche ich Ã¼ber â€¦
â€¢ ZunÃ¤chst mÃ¶chte ich â€¦
â€¢ Wie die Grafik zeigt â€¦
â€¢ Vielen Dank fÃ¼r Ihre Aufmerksamkeit.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Ã‰tudes et prÃ©sentations','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Ã‰tudes et prÃ©sentations');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B1 Â· Module 5 â€” SantÃ© et mode de vie','Niveau B1 : discuter habitudes et recommandations. Grammaire : sollte; wÃ¼rde; sich vornehmen. 8 leÃ§ons avec thÃ©orie, audio, exercices, quiz et mission rÃ©elle.',29) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre â€” SantÃ© et mode de vie','allemand-b1-m05-l01','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 5/12 â€” SantÃ© et mode de vie
LEÃ‡ON 1/8 â€” Comprendre

OBJECTIF
Discuter habitudes et recommandations.

EXPLICATION EN FRANÃ‡AIS
Ã€ ce niveau, vous devez apprendre Ã  communiquer avec discours suivi, justification, rÃ©cit et communication professionnelle simple. Le thÃ¨me Â« SantÃ© et mode de vie Â» sert de contexte rÃ©el. Commencez par comprendre lâ€™intention, puis repÃ©rez le verbe, les informations importantes et enfin les dÃ©tails.

MÃ‰THODE
1. Lisez les phrases sans traduire mot Ã  mot.
2. Soulignez le verbe conjuguÃ©.
3. RepÃ©rez qui parle, Ã  qui et dans quel but.
4. RÃ©pÃ©tez chaque phrase Ã  voix haute trois fois.
5. Changez un Ã©lÃ©ment pour crÃ©er votre propre exemple.

EXEMPLES ALLEMANDS
â€¢ Man sollte regelmÃ¤ÃŸig schlafen.
â€¢ Wenn man Stress hat, â€¦
â€¢ Es wÃ¤re besser, â€¦
â€¢ Ich habe mir vorgenommen, â€¦

Ã€ RETENIR
Grammaire centrale : sollte; wÃ¼rde; sich vornehmen.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” SantÃ© et mode de vie','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” SantÃ© et mode de vie');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif â€” SantÃ© et mode de vie','allemand-b1-m05-l02','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 5/12 â€” SantÃ© et mode de vie
LEÃ‡ON 2/8 â€” Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur Â« SantÃ© et mode de vie Â».

VOCABULAIRE Ã€ ACTIVER
Stress, Wenn, besser, habe, regelmÃ¤ÃŸig, schlafen, sollte, vorgenommen, wÃ¤re

TECHNIQUE 4 Ã‰TAPES
1. Ã‰coutez le mot avec le bouton audio.
2. RÃ©pÃ©tez-le dans une phrase complÃ¨te.
3. CrÃ©ez une phrase vraie sur votre vie.
4. RÃ©utilisez-le 24 heures plus tard.

MODÃˆLES
â€¢ Man sollte regelmÃ¤ÃŸig schlafen.
â€¢ Wenn man Stress hat, â€¦
â€¢ Es wÃ¤re besser, â€¦
â€¢ Ich habe mir vorgenommen, â€¦

EXERCICES
1. Choisissez 10 mots et Ã©crivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez lâ€™allemand et traduisez vos phrases du franÃ§ais vers lâ€™allemand.
4. Enregistrez oralement un rÃ©sumÃ© de 60 secondes.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” SantÃ© et mode de vie','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” SantÃ© et mode de vie');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation â€” SantÃ© et mode de vie','allemand-b1-m05-l03','audio','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 5/12 â€” SantÃ© et mode de vie
LEÃ‡ON 3/8 â€” Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÃˆLE
A: Man sollte regelmÃ¤ÃŸig schlafen.
B: Wenn man Stress hat, â€¦
A: Es wÃ¤re besser, â€¦
B: Ich habe mir vorgenommen, â€¦

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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” SantÃ© et mode de vie','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” SantÃ© et mode de vie');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur â€” SantÃ© et mode de vie','allemand-b1-m05-l04','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 5/12 â€” SantÃ© et mode de vie
LEÃ‡ON 4/8 â€” Grammaire en profondeur

POINT DE GRAMMAIRE
sollte; wÃ¼rde; sich vornehmen.

EXPLICATION
La grammaire nâ€™est pas une liste de rÃ¨gles Ã  mÃ©moriser sÃ©parÃ©ment : elle sert Ã  exprimer une intention. Observez dâ€™abord la place du verbe, puis les complÃ©ments, et enfin les Ã©lÃ©ments de temps, cause ou opinion.

EXEMPLES
â€¢ Man sollte regelmÃ¤ÃŸig schlafen.
â€¢ Wenn man Stress hat, â€¦
â€¢ Es wÃ¤re besser, â€¦
â€¢ Ich habe mir vorgenommen, â€¦

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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” SantÃ© et mode de vie','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” SantÃ© et mode de vie');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'ComprÃ©hension et production â€” SantÃ© et mode de vie','allemand-b1-m05-l05','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 5/12 â€” SantÃ© et mode de vie
LEÃ‡ON 5/8 â€” ComprÃ©hension et production

TEXTE / SITUATION
Imaginez une situation rÃ©elle autour de Â« SantÃ© et mode de vie Â». Les personnes utilisent les expressions suivantes :
â€¢ Man sollte regelmÃ¤ÃŸig schlafen.
â€¢ Wenn man Stress hat, â€¦
â€¢ Es wÃ¤re besser, â€¦
â€¢ Ich habe mir vorgenommen, â€¦

COMPRÃ‰HENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou Ã©motion peut-on dÃ©duire ?
4. Reformulez le contenu en franÃ§ais, puis en allemand simple.

PRODUCTION Ã‰CRITE
RÃ©digez un texte adaptÃ© au niveau B1. Utilisez au moins 8 Ã©lÃ©ments du module et 3 structures liÃ©es Ã  : sollte; wÃ¼rde; sich vornehmen.

PRODUCTION ORALE
Parlez pendant 2 Ã  4 minutes sans lire. Recommencez en amÃ©liorant la fluiditÃ©.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” SantÃ© et mode de vie','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” SantÃ© et mode de vie');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif â€” SantÃ© et mode de vie','allemand-b1-m05-l06','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 5/12 â€” SantÃ© et mode de vie
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
â€¢ Man sollte regelmÃ¤ÃŸig schlafen.
â€¢ Wenn man Stress hat, â€¦
â€¢ Es wÃ¤re besser, â€¦
â€¢ Ich habe mir vorgenommen, â€¦

GRAMMAIRE Ã€ RÃ‰UTILISER
sollte; wÃ¼rde; sich vornehmen.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” SantÃ© et mode de vie','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” SantÃ© et mode de vie');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module â€” SantÃ© et mode de vie','allemand-b1-m05-l07','quiz','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 5/12 â€” SantÃ© et mode de vie
LEÃ‡ON 7/8 â€” Quiz de module

QUIZ DE VALIDATION â€” SantÃ© et mode de vie

Avant de valider, vous devez pouvoir :
â€¢ comprendre les quatre expressions du module ;
â€¢ expliquer le point de grammaire Â« sollte; wÃ¼rde; sich vornehmen Â» ;
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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” SantÃ© et mode de vie','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” SantÃ© et mode de vie');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission rÃ©elle â€” SantÃ© et mode de vie','allemand-b1-m05-l08','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 5/12 â€” SantÃ© et mode de vie
LEÃ‡ON 8/8 â€” Mission rÃ©elle

MISSION RÃ‰ELLE â€” SantÃ© et mode de vie

SCÃ‰NARIO
Vous devez discuter habitudes et recommandations. Vous nâ€™avez droit quâ€™Ã  lâ€™allemand.

LIVRABLES
1. Un texte de 180 Ã  350 mots.
2. Un enregistrement oral de 3 Ã  6 minutes.
3. Un dialogue de 10 rÃ©pliques.
4. Une liste de 15 mots ou expressions rÃ©ellement utiles.
5. Une auto-correction : trois erreurs repÃ©rÃ©es et expliquÃ©es.

CRITÃˆRES
ClartÃ©, correction, vocabulaire adaptÃ©, fluiditÃ© et capacitÃ© Ã  accomplir la tÃ¢che.

EXPRESSIONS Ã€ RÃ‰UTILISER
â€¢ Man sollte regelmÃ¤ÃŸig schlafen.
â€¢ Wenn man Stress hat, â€¦
â€¢ Es wÃ¤re besser, â€¦
â€¢ Ich habe mir vorgenommen, â€¦

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” SantÃ© et mode de vie','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” SantÃ© et mode de vie');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B1 Â· Module 6 â€” ActualitÃ© et mÃ©dias','Niveau B1 : rÃ©sumer une information et distinguer les sources. Grammaire : discours indirect introductif; passif. 8 leÃ§ons avec thÃ©orie, audio, exercices, quiz et mission rÃ©elle.',30) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre â€” ActualitÃ© et mÃ©dias','allemand-b1-m06-l01','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 6/12 â€” ActualitÃ© et mÃ©dias
LEÃ‡ON 1/8 â€” Comprendre

OBJECTIF
RÃ©sumer une information et distinguer les sources.

EXPLICATION EN FRANÃ‡AIS
Ã€ ce niveau, vous devez apprendre Ã  communiquer avec discours suivi, justification, rÃ©cit et communication professionnelle simple. Le thÃ¨me Â« ActualitÃ© et mÃ©dias Â» sert de contexte rÃ©el. Commencez par comprendre lâ€™intention, puis repÃ©rez le verbe, les informations importantes et enfin les dÃ©tails.

MÃ‰THODE
1. Lisez les phrases sans traduire mot Ã  mot.
2. Soulignez le verbe conjuguÃ©.
3. RepÃ©rez qui parle, Ã  qui et dans quel but.
4. RÃ©pÃ©tez chaque phrase Ã  voix haute trois fois.
5. Changez un Ã©lÃ©ment pour crÃ©er votre propre exemple.

EXEMPLES ALLEMANDS
â€¢ Der Bericht handelt von â€¦
â€¢ Laut der Quelle â€¦
â€¢ Es wird behauptet, dass â€¦
â€¢ Ich halte die Information fÃ¼r glaubwÃ¼rdig.

Ã€ RETENIR
Grammaire centrale : discours indirect introductif; passif.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” ActualitÃ© et mÃ©dias','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” ActualitÃ© et mÃ©dias');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif â€” ActualitÃ© et mÃ©dias','allemand-b1-m06-l02','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 6/12 â€” ActualitÃ© et mÃ©dias
LEÃ‡ON 2/8 â€” Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur Â« ActualitÃ© et mÃ©dias Â».

VOCABULAIRE Ã€ ACTIVER
Bericht, Information, Laut, Quelle, behauptet, dass, glaubwÃ¼rdig, halte, handelt, wird

TECHNIQUE 4 Ã‰TAPES
1. Ã‰coutez le mot avec le bouton audio.
2. RÃ©pÃ©tez-le dans une phrase complÃ¨te.
3. CrÃ©ez une phrase vraie sur votre vie.
4. RÃ©utilisez-le 24 heures plus tard.

MODÃˆLES
â€¢ Der Bericht handelt von â€¦
â€¢ Laut der Quelle â€¦
â€¢ Es wird behauptet, dass â€¦
â€¢ Ich halte die Information fÃ¼r glaubwÃ¼rdig.

EXERCICES
1. Choisissez 10 mots et Ã©crivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez lâ€™allemand et traduisez vos phrases du franÃ§ais vers lâ€™allemand.
4. Enregistrez oralement un rÃ©sumÃ© de 60 secondes.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” ActualitÃ© et mÃ©dias','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” ActualitÃ© et mÃ©dias');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation â€” ActualitÃ© et mÃ©dias','allemand-b1-m06-l03','audio','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 6/12 â€” ActualitÃ© et mÃ©dias
LEÃ‡ON 3/8 â€” Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÃˆLE
A: Der Bericht handelt von â€¦
B: Laut der Quelle â€¦
A: Es wird behauptet, dass â€¦
B: Ich halte die Information fÃ¼r glaubwÃ¼rdig.

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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” ActualitÃ© et mÃ©dias','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” ActualitÃ© et mÃ©dias');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur â€” ActualitÃ© et mÃ©dias','allemand-b1-m06-l04','text','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 6/12 â€” ActualitÃ© et mÃ©dias
LEÃ‡ON 4/8 â€” Grammaire en profondeur

POINT DE GRAMMAIRE
discours indirect introductif; passif.

EXPLICATION
La grammaire nâ€™est pas une liste de rÃ¨gles Ã  mÃ©moriser sÃ©parÃ©ment : elle sert Ã  exprimer une intention. Observez dâ€™abord la place du verbe, puis les complÃ©ments, et enfin les Ã©lÃ©ments de temps, cause ou opinion.

EXEMPLES
â€¢ Der Bericht handelt von â€¦
â€¢ Laut der Quelle â€¦
â€¢ Es wird behauptet, dass â€¦
â€¢ Ich halte die Information fÃ¼r glaubwÃ¼rdig.

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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” ActualitÃ© et mÃ©dias','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” ActualitÃ© et mÃ©dias');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'ComprÃ©hension et production â€” ActualitÃ© et mÃ©dias','allemand-b1-m06-l05','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 6/12 â€” ActualitÃ© et mÃ©dias
LEÃ‡ON 5/8 â€” ComprÃ©hension et production

TEXTE / SITUATION
Imaginez une situation rÃ©elle autour de Â« ActualitÃ© et mÃ©dias Â». Les personnes utilisent les expressions suivantes :
â€¢ Der Bericht handelt von â€¦
â€¢ Laut der Quelle â€¦
â€¢ Es wird behauptet, dass â€¦
â€¢ Ich halte die Information fÃ¼r glaubwÃ¼rdig.

COMPRÃ‰HENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou Ã©motion peut-on dÃ©duire ?
4. Reformulez le contenu en franÃ§ais, puis en allemand simple.

PRODUCTION Ã‰CRITE
RÃ©digez un texte adaptÃ© au niveau B1. Utilisez au moins 8 Ã©lÃ©ments du module et 3 structures liÃ©es Ã  : discours indirect introductif; passif.

PRODUCTION ORALE
Parlez pendant 2 Ã  4 minutes sans lire. Recommencez en amÃ©liorant la fluiditÃ©.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” ActualitÃ© et mÃ©dias','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” ActualitÃ© et mÃ©dias');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif â€” ActualitÃ© et mÃ©dias','allemand-b1-m06-l06','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 6/12 â€” ActualitÃ© et mÃ©dias
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
â€¢ Der Bericht handelt von â€¦
â€¢ Laut der Quelle â€¦
â€¢ Es wird behauptet, dass â€¦
â€¢ Ich halte die Information fÃ¼r glaubwÃ¼rdig.

GRAMMAIRE Ã€ RÃ‰UTILISER
discours indirect introductif; passif.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” ActualitÃ© et mÃ©dias','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” ActualitÃ© et mÃ©dias');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module â€” ActualitÃ© et mÃ©dias','allemand-b1-m06-l07','quiz','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 6/12 â€” ActualitÃ© et mÃ©dias
LEÃ‡ON 7/8 â€” Quiz de module

QUIZ DE VALIDATION â€” ActualitÃ© et mÃ©dias

Avant de valider, vous devez pouvoir :
â€¢ comprendre les quatre expressions du module ;
â€¢ expliquer le point de grammaire Â« discours indirect introductif; passif Â» ;
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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” ActualitÃ© et mÃ©dias','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” ActualitÃ© et mÃ©dias');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission rÃ©elle â€” ActualitÃ© et mÃ©dias','allemand-b1-m06-l08','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU B1
MODULE 6/12 â€” ActualitÃ© et mÃ©dias
LEÃ‡ON 8/8 â€” Mission rÃ©elle

MISSION RÃ‰ELLE â€” ActualitÃ© et mÃ©dias

SCÃ‰NARIO
Vous devez rÃ©sumer une information et distinguer les sources. Vous nâ€™avez droit quâ€™Ã  lâ€™allemand.

LIVRABLES
1. Un texte de 180 Ã  350 mots.
2. Un enregistrement oral de 3 Ã  6 minutes.
3. Un dialogue de 10 rÃ©pliques.
4. Une liste de 15 mots ou expressions rÃ©ellement utiles.
5. Une auto-correction : trois erreurs repÃ©rÃ©es et expliquÃ©es.

CRITÃˆRES
ClartÃ©, correction, vocabulaire adaptÃ©, fluiditÃ© et capacitÃ© Ã  accomplir la tÃ¢che.

EXPRESSIONS Ã€ RÃ‰UTILISER
â€¢ Der Bericht handelt von â€¦
â€¢ Laut der Quelle â€¦
â€¢ Es wird behauptet, dass â€¦
â€¢ Ich halte die Information fÃ¼r glaubwÃ¼rdig.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',2400,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” ActualitÃ© et mÃ©dias','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” ActualitÃ© et mÃ©dias');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
END $$;

SELECT 'Partie 5/10 installÃ©e : modules 25 Ã  30' AS resultat;


