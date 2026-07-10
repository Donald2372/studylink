-- StudyLink 020 - Allemand A1-C1 - Partie 9/10
-- Modules 49 Ã  54
DO $$
DECLARE v_course UUID; v_module UUID; v_lesson UUID;
BEGIN
  SELECT id INTO v_course FROM public.courses WHERE slug='allemand-complet-a1-c1' ORDER BY created_at DESC NULLS LAST LIMIT 1;
  IF v_course IS NULL THEN RAISE EXCEPTION 'Le cours allemand n existe pas encore. Executez d abord la partie 01.'; END IF;
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'C1 Â· Module 1 â€” PrÃ©cision et registre','Niveau C1 : choisir le mot et le registre exacts. Grammaire : registre; collocations; nuances. 8 leÃ§ons avec thÃ©orie, audio, exercices, quiz et mission rÃ©elle.',49) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre â€” PrÃ©cision et registre','allemand-c1-m01-l01','text','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 1/12 â€” PrÃ©cision et registre
LEÃ‡ON 1/8 â€” Comprendre

OBJECTIF
Choisir le mot et le registre exacts.

EXPLICATION EN FRANÃ‡AIS
Ã€ ce niveau, vous devez apprendre Ã  communiquer avec prÃ©cision, registre, implicite, langue acadÃ©mique et professionnelle avancÃ©e. Le thÃ¨me Â« PrÃ©cision et registre Â» sert de contexte rÃ©el. Commencez par comprendre lâ€™intention, puis repÃ©rez le verbe, les informations importantes et enfin les dÃ©tails.

MÃ‰THODE
1. Lisez les phrases sans traduire mot Ã  mot.
2. Soulignez le verbe conjuguÃ©.
3. RepÃ©rez qui parle, Ã  qui et dans quel but.
4. RÃ©pÃ©tez chaque phrase Ã  voix haute trois fois.
5. Changez un Ã©lÃ©ment pour crÃ©er votre propre exemple.

EXEMPLES ALLEMANDS
â€¢ Diese Formulierung wirkt umgangssprachlich.
â€¢ PrÃ¤ziser wÃ¤re â€¦
â€¢ Der Ausdruck impliziert â€¦
â€¢ Im fachlichen Kontext verwendet man â€¦

Ã€ RETENIR
Grammaire centrale : registre; collocations; nuances.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” PrÃ©cision et registre','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” PrÃ©cision et registre');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif â€” PrÃ©cision et registre','allemand-c1-m01-l02','text','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 1/12 â€” PrÃ©cision et registre
LEÃ‡ON 2/8 â€” Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur Â« PrÃ©cision et registre Â».

VOCABULAIRE Ã€ ACTIVER
Ausdruck, Diese, Formulierung, Kontext, PrÃ¤ziser, fachlichen, impliziert, umgangssprachlich, verwendet, wirkt, wÃ¤re

TECHNIQUE 4 Ã‰TAPES
1. Ã‰coutez le mot avec le bouton audio.
2. RÃ©pÃ©tez-le dans une phrase complÃ¨te.
3. CrÃ©ez une phrase vraie sur votre vie.
4. RÃ©utilisez-le 24 heures plus tard.

MODÃˆLES
â€¢ Diese Formulierung wirkt umgangssprachlich.
â€¢ PrÃ¤ziser wÃ¤re â€¦
â€¢ Der Ausdruck impliziert â€¦
â€¢ Im fachlichen Kontext verwendet man â€¦

EXERCICES
1. Choisissez 10 mots et Ã©crivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez lâ€™allemand et traduisez vos phrases du franÃ§ais vers lâ€™allemand.
4. Enregistrez oralement un rÃ©sumÃ© de 60 secondes.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” PrÃ©cision et registre','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” PrÃ©cision et registre');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation â€” PrÃ©cision et registre','allemand-c1-m01-l03','audio','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 1/12 â€” PrÃ©cision et registre
LEÃ‡ON 3/8 â€” Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÃˆLE
A: Diese Formulierung wirkt umgangssprachlich.
B: PrÃ¤ziser wÃ¤re â€¦
A: Der Ausdruck impliziert â€¦
B: Im fachlichen Kontext verwendet man â€¦

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” PrÃ©cision et registre','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” PrÃ©cision et registre');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur â€” PrÃ©cision et registre','allemand-c1-m01-l04','text','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 1/12 â€” PrÃ©cision et registre
LEÃ‡ON 4/8 â€” Grammaire en profondeur

POINT DE GRAMMAIRE
registre; collocations; nuances.

EXPLICATION
La grammaire nâ€™est pas une liste de rÃ¨gles Ã  mÃ©moriser sÃ©parÃ©ment : elle sert Ã  exprimer une intention. Observez dâ€™abord la place du verbe, puis les complÃ©ments, et enfin les Ã©lÃ©ments de temps, cause ou opinion.

EXEMPLES
â€¢ Diese Formulierung wirkt umgangssprachlich.
â€¢ PrÃ¤ziser wÃ¤re â€¦
â€¢ Der Ausdruck impliziert â€¦
â€¢ Im fachlichen Kontext verwendet man â€¦

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” PrÃ©cision et registre','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” PrÃ©cision et registre');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'ComprÃ©hension et production â€” PrÃ©cision et registre','allemand-c1-m01-l05','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 1/12 â€” PrÃ©cision et registre
LEÃ‡ON 5/8 â€” ComprÃ©hension et production

TEXTE / SITUATION
Imaginez une situation rÃ©elle autour de Â« PrÃ©cision et registre Â». Les personnes utilisent les expressions suivantes :
â€¢ Diese Formulierung wirkt umgangssprachlich.
â€¢ PrÃ¤ziser wÃ¤re â€¦
â€¢ Der Ausdruck impliziert â€¦
â€¢ Im fachlichen Kontext verwendet man â€¦

COMPRÃ‰HENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou Ã©motion peut-on dÃ©duire ?
4. Reformulez le contenu en franÃ§ais, puis en allemand simple.

PRODUCTION Ã‰CRITE
RÃ©digez un texte adaptÃ© au niveau C1. Utilisez au moins 8 Ã©lÃ©ments du module et 3 structures liÃ©es Ã  : registre; collocations; nuances.

PRODUCTION ORALE
Parlez pendant 2 Ã  4 minutes sans lire. Recommencez en amÃ©liorant la fluiditÃ©.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” PrÃ©cision et registre','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” PrÃ©cision et registre');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif â€” PrÃ©cision et registre','allemand-c1-m01-l06','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 1/12 â€” PrÃ©cision et registre
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
â€¢ Diese Formulierung wirkt umgangssprachlich.
â€¢ PrÃ¤ziser wÃ¤re â€¦
â€¢ Der Ausdruck impliziert â€¦
â€¢ Im fachlichen Kontext verwendet man â€¦

GRAMMAIRE Ã€ RÃ‰UTILISER
registre; collocations; nuances.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” PrÃ©cision et registre','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” PrÃ©cision et registre');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module â€” PrÃ©cision et registre','allemand-c1-m01-l07','quiz','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 1/12 â€” PrÃ©cision et registre
LEÃ‡ON 7/8 â€” Quiz de module

QUIZ DE VALIDATION â€” PrÃ©cision et registre

Avant de valider, vous devez pouvoir :
â€¢ comprendre les quatre expressions du module ;
â€¢ expliquer le point de grammaire Â« registre; collocations; nuances Â» ;
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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” PrÃ©cision et registre','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” PrÃ©cision et registre');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission rÃ©elle â€” PrÃ©cision et registre','allemand-c1-m01-l08','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 1/12 â€” PrÃ©cision et registre
LEÃ‡ON 8/8 â€” Mission rÃ©elle

MISSION RÃ‰ELLE â€” PrÃ©cision et registre

SCÃ‰NARIO
Vous devez choisir le mot et le registre exacts. Vous nâ€™avez droit quâ€™Ã  lâ€™allemand.

LIVRABLES
1. Un texte de 180 Ã  350 mots.
2. Un enregistrement oral de 3 Ã  6 minutes.
3. Un dialogue de 10 rÃ©pliques.
4. Une liste de 15 mots ou expressions rÃ©ellement utiles.
5. Une auto-correction : trois erreurs repÃ©rÃ©es et expliquÃ©es.

CRITÃˆRES
ClartÃ©, correction, vocabulaire adaptÃ©, fluiditÃ© et capacitÃ© Ã  accomplir la tÃ¢che.

EXPRESSIONS Ã€ RÃ‰UTILISER
â€¢ Diese Formulierung wirkt umgangssprachlich.
â€¢ PrÃ¤ziser wÃ¤re â€¦
â€¢ Der Ausdruck impliziert â€¦
â€¢ Im fachlichen Kontext verwendet man â€¦

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” PrÃ©cision et registre','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” PrÃ©cision et registre');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'C1 Â· Module 2 â€” Structures complexes','Niveau C1 : maÃ®triser la syntaxe dense sans perdre la clartÃ©. Grammaire : subordonnÃ©es complexes; position du verbe. 8 leÃ§ons avec thÃ©orie, audio, exercices, quiz et mission rÃ©elle.',50) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre â€” Structures complexes','allemand-c1-m02-l01','text','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 2/12 â€” Structures complexes
LEÃ‡ON 1/8 â€” Comprendre

OBJECTIF
MaÃ®triser la syntaxe dense sans perdre la clartÃ©.

EXPLICATION EN FRANÃ‡AIS
Ã€ ce niveau, vous devez apprendre Ã  communiquer avec prÃ©cision, registre, implicite, langue acadÃ©mique et professionnelle avancÃ©e. Le thÃ¨me Â« Structures complexes Â» sert de contexte rÃ©el. Commencez par comprendre lâ€™intention, puis repÃ©rez le verbe, les informations importantes et enfin les dÃ©tails.

MÃ‰THODE
1. Lisez les phrases sans traduire mot Ã  mot.
2. Soulignez le verbe conjuguÃ©.
3. RepÃ©rez qui parle, Ã  qui et dans quel but.
4. RÃ©pÃ©tez chaque phrase Ã  voix haute trois fois.
5. Changez un Ã©lÃ©ment pour crÃ©er votre propre exemple.

EXEMPLES ALLEMANDS
â€¢ Ungeachtet dessen, dass â€¦
â€¢ Vorausgesetzt, dass â€¦
â€¢ Je nachdem, inwiefern â€¦
â€¢ Nicht zuletzt deshalb â€¦

Ã€ RETENIR
Grammaire centrale : subordonnÃ©es complexes; position du verbe.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Structures complexes','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Structures complexes');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif â€” Structures complexes','allemand-c1-m02-l02','text','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 2/12 â€” Structures complexes
LEÃ‡ON 2/8 â€” Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur Â« Structures complexes Â».

VOCABULAIRE Ã€ ACTIVER
Nicht, Ungeachtet, Vorausgesetzt, dass, deshalb, dessen, inwiefern, nachdem, zuletzt

TECHNIQUE 4 Ã‰TAPES
1. Ã‰coutez le mot avec le bouton audio.
2. RÃ©pÃ©tez-le dans une phrase complÃ¨te.
3. CrÃ©ez une phrase vraie sur votre vie.
4. RÃ©utilisez-le 24 heures plus tard.

MODÃˆLES
â€¢ Ungeachtet dessen, dass â€¦
â€¢ Vorausgesetzt, dass â€¦
â€¢ Je nachdem, inwiefern â€¦
â€¢ Nicht zuletzt deshalb â€¦

EXERCICES
1. Choisissez 10 mots et Ã©crivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez lâ€™allemand et traduisez vos phrases du franÃ§ais vers lâ€™allemand.
4. Enregistrez oralement un rÃ©sumÃ© de 60 secondes.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Structures complexes','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Structures complexes');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation â€” Structures complexes','allemand-c1-m02-l03','audio','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 2/12 â€” Structures complexes
LEÃ‡ON 3/8 â€” Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÃˆLE
A: Ungeachtet dessen, dass â€¦
B: Vorausgesetzt, dass â€¦
A: Je nachdem, inwiefern â€¦
B: Nicht zuletzt deshalb â€¦

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Structures complexes','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Structures complexes');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur â€” Structures complexes','allemand-c1-m02-l04','text','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 2/12 â€” Structures complexes
LEÃ‡ON 4/8 â€” Grammaire en profondeur

POINT DE GRAMMAIRE
subordonnÃ©es complexes; position du verbe.

EXPLICATION
La grammaire nâ€™est pas une liste de rÃ¨gles Ã  mÃ©moriser sÃ©parÃ©ment : elle sert Ã  exprimer une intention. Observez dâ€™abord la place du verbe, puis les complÃ©ments, et enfin les Ã©lÃ©ments de temps, cause ou opinion.

EXEMPLES
â€¢ Ungeachtet dessen, dass â€¦
â€¢ Vorausgesetzt, dass â€¦
â€¢ Je nachdem, inwiefern â€¦
â€¢ Nicht zuletzt deshalb â€¦

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Structures complexes','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Structures complexes');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'ComprÃ©hension et production â€” Structures complexes','allemand-c1-m02-l05','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 2/12 â€” Structures complexes
LEÃ‡ON 5/8 â€” ComprÃ©hension et production

TEXTE / SITUATION
Imaginez une situation rÃ©elle autour de Â« Structures complexes Â». Les personnes utilisent les expressions suivantes :
â€¢ Ungeachtet dessen, dass â€¦
â€¢ Vorausgesetzt, dass â€¦
â€¢ Je nachdem, inwiefern â€¦
â€¢ Nicht zuletzt deshalb â€¦

COMPRÃ‰HENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou Ã©motion peut-on dÃ©duire ?
4. Reformulez le contenu en franÃ§ais, puis en allemand simple.

PRODUCTION Ã‰CRITE
RÃ©digez un texte adaptÃ© au niveau C1. Utilisez au moins 8 Ã©lÃ©ments du module et 3 structures liÃ©es Ã  : subordonnÃ©es complexes; position du verbe.

PRODUCTION ORALE
Parlez pendant 2 Ã  4 minutes sans lire. Recommencez en amÃ©liorant la fluiditÃ©.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Structures complexes','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Structures complexes');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif â€” Structures complexes','allemand-c1-m02-l06','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 2/12 â€” Structures complexes
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
â€¢ Ungeachtet dessen, dass â€¦
â€¢ Vorausgesetzt, dass â€¦
â€¢ Je nachdem, inwiefern â€¦
â€¢ Nicht zuletzt deshalb â€¦

GRAMMAIRE Ã€ RÃ‰UTILISER
subordonnÃ©es complexes; position du verbe.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Structures complexes','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Structures complexes');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module â€” Structures complexes','allemand-c1-m02-l07','quiz','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 2/12 â€” Structures complexes
LEÃ‡ON 7/8 â€” Quiz de module

QUIZ DE VALIDATION â€” Structures complexes

Avant de valider, vous devez pouvoir :
â€¢ comprendre les quatre expressions du module ;
â€¢ expliquer le point de grammaire Â« subordonnÃ©es complexes; position du verbe Â» ;
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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Structures complexes','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Structures complexes');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission rÃ©elle â€” Structures complexes','allemand-c1-m02-l08','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 2/12 â€” Structures complexes
LEÃ‡ON 8/8 â€” Mission rÃ©elle

MISSION RÃ‰ELLE â€” Structures complexes

SCÃ‰NARIO
Vous devez maÃ®triser la syntaxe dense sans perdre la clartÃ©. Vous nâ€™avez droit quâ€™Ã  lâ€™allemand.

LIVRABLES
1. Un texte de 180 Ã  350 mots.
2. Un enregistrement oral de 3 Ã  6 minutes.
3. Un dialogue de 10 rÃ©pliques.
4. Une liste de 15 mots ou expressions rÃ©ellement utiles.
5. Une auto-correction : trois erreurs repÃ©rÃ©es et expliquÃ©es.

CRITÃˆRES
ClartÃ©, correction, vocabulaire adaptÃ©, fluiditÃ© et capacitÃ© Ã  accomplir la tÃ¢che.

EXPRESSIONS Ã€ RÃ‰UTILISER
â€¢ Ungeachtet dessen, dass â€¦
â€¢ Vorausgesetzt, dass â€¦
â€¢ Je nachdem, inwiefern â€¦
â€¢ Nicht zuletzt deshalb â€¦

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Structures complexes','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Structures complexes');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'C1 Â· Module 3 â€” Argumentation acadÃ©mique','Niveau C1 : dÃ©velopper une thÃ¨se solide. Grammaire : style acadÃ©mique; concession. 8 leÃ§ons avec thÃ©orie, audio, exercices, quiz et mission rÃ©elle.',51) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre â€” Argumentation acadÃ©mique','allemand-c1-m03-l01','text','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 3/12 â€” Argumentation acadÃ©mique
LEÃ‡ON 1/8 â€” Comprendre

OBJECTIF
DÃ©velopper une thÃ¨se solide.

EXPLICATION EN FRANÃ‡AIS
Ã€ ce niveau, vous devez apprendre Ã  communiquer avec prÃ©cision, registre, implicite, langue acadÃ©mique et professionnelle avancÃ©e. Le thÃ¨me Â« Argumentation acadÃ©mique Â» sert de contexte rÃ©el. Commencez par comprendre lâ€™intention, puis repÃ©rez le verbe, les informations importantes et enfin les dÃ©tails.

MÃ‰THODE
1. Lisez les phrases sans traduire mot Ã  mot.
2. Soulignez le verbe conjuguÃ©.
3. RepÃ©rez qui parle, Ã  qui et dans quel but.
4. RÃ©pÃ©tez chaque phrase Ã  voix haute trois fois.
5. Changez un Ã©lÃ©ment pour crÃ©er votre propre exemple.

EXEMPLES ALLEMANDS
â€¢ Die These beruht auf der Annahme, dass â€¦
â€¢ Dagegen spricht allerdings â€¦
â€¢ Bei genauerer Betrachtung â€¦
â€¢ Daraus ergibt sich die Schlussfolgerung â€¦

Ã€ RETENIR
Grammaire centrale : style acadÃ©mique; concession.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Argumentation acadÃ©mique','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Argumentation acadÃ©mique');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif â€” Argumentation acadÃ©mique','allemand-c1-m03-l02','text','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 3/12 â€” Argumentation acadÃ©mique
LEÃ‡ON 2/8 â€” Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur Â« Argumentation acadÃ©mique Â».

VOCABULAIRE Ã€ ACTIVER
Annahme, Betrachtung, Dagegen, Daraus, Schlussfolgerung, These, allerdings, beruht, dass, ergibt, genauerer, sich, spricht

TECHNIQUE 4 Ã‰TAPES
1. Ã‰coutez le mot avec le bouton audio.
2. RÃ©pÃ©tez-le dans une phrase complÃ¨te.
3. CrÃ©ez une phrase vraie sur votre vie.
4. RÃ©utilisez-le 24 heures plus tard.

MODÃˆLES
â€¢ Die These beruht auf der Annahme, dass â€¦
â€¢ Dagegen spricht allerdings â€¦
â€¢ Bei genauerer Betrachtung â€¦
â€¢ Daraus ergibt sich die Schlussfolgerung â€¦

EXERCICES
1. Choisissez 10 mots et Ã©crivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez lâ€™allemand et traduisez vos phrases du franÃ§ais vers lâ€™allemand.
4. Enregistrez oralement un rÃ©sumÃ© de 60 secondes.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Argumentation acadÃ©mique','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Argumentation acadÃ©mique');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation â€” Argumentation acadÃ©mique','allemand-c1-m03-l03','audio','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 3/12 â€” Argumentation acadÃ©mique
LEÃ‡ON 3/8 â€” Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÃˆLE
A: Die These beruht auf der Annahme, dass â€¦
B: Dagegen spricht allerdings â€¦
A: Bei genauerer Betrachtung â€¦
B: Daraus ergibt sich die Schlussfolgerung â€¦

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Argumentation acadÃ©mique','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Argumentation acadÃ©mique');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur â€” Argumentation acadÃ©mique','allemand-c1-m03-l04','text','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 3/12 â€” Argumentation acadÃ©mique
LEÃ‡ON 4/8 â€” Grammaire en profondeur

POINT DE GRAMMAIRE
style acadÃ©mique; concession.

EXPLICATION
La grammaire nâ€™est pas une liste de rÃ¨gles Ã  mÃ©moriser sÃ©parÃ©ment : elle sert Ã  exprimer une intention. Observez dâ€™abord la place du verbe, puis les complÃ©ments, et enfin les Ã©lÃ©ments de temps, cause ou opinion.

EXEMPLES
â€¢ Die These beruht auf der Annahme, dass â€¦
â€¢ Dagegen spricht allerdings â€¦
â€¢ Bei genauerer Betrachtung â€¦
â€¢ Daraus ergibt sich die Schlussfolgerung â€¦

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Argumentation acadÃ©mique','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Argumentation acadÃ©mique');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'ComprÃ©hension et production â€” Argumentation acadÃ©mique','allemand-c1-m03-l05','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 3/12 â€” Argumentation acadÃ©mique
LEÃ‡ON 5/8 â€” ComprÃ©hension et production

TEXTE / SITUATION
Imaginez une situation rÃ©elle autour de Â« Argumentation acadÃ©mique Â». Les personnes utilisent les expressions suivantes :
â€¢ Die These beruht auf der Annahme, dass â€¦
â€¢ Dagegen spricht allerdings â€¦
â€¢ Bei genauerer Betrachtung â€¦
â€¢ Daraus ergibt sich die Schlussfolgerung â€¦

COMPRÃ‰HENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou Ã©motion peut-on dÃ©duire ?
4. Reformulez le contenu en franÃ§ais, puis en allemand simple.

PRODUCTION Ã‰CRITE
RÃ©digez un texte adaptÃ© au niveau C1. Utilisez au moins 8 Ã©lÃ©ments du module et 3 structures liÃ©es Ã  : style acadÃ©mique; concession.

PRODUCTION ORALE
Parlez pendant 2 Ã  4 minutes sans lire. Recommencez en amÃ©liorant la fluiditÃ©.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Argumentation acadÃ©mique','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Argumentation acadÃ©mique');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif â€” Argumentation acadÃ©mique','allemand-c1-m03-l06','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 3/12 â€” Argumentation acadÃ©mique
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
â€¢ Die These beruht auf der Annahme, dass â€¦
â€¢ Dagegen spricht allerdings â€¦
â€¢ Bei genauerer Betrachtung â€¦
â€¢ Daraus ergibt sich die Schlussfolgerung â€¦

GRAMMAIRE Ã€ RÃ‰UTILISER
style acadÃ©mique; concession.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Argumentation acadÃ©mique','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Argumentation acadÃ©mique');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module â€” Argumentation acadÃ©mique','allemand-c1-m03-l07','quiz','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 3/12 â€” Argumentation acadÃ©mique
LEÃ‡ON 7/8 â€” Quiz de module

QUIZ DE VALIDATION â€” Argumentation acadÃ©mique

Avant de valider, vous devez pouvoir :
â€¢ comprendre les quatre expressions du module ;
â€¢ expliquer le point de grammaire Â« style acadÃ©mique; concession Â» ;
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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Argumentation acadÃ©mique','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Argumentation acadÃ©mique');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission rÃ©elle â€” Argumentation acadÃ©mique','allemand-c1-m03-l08','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 3/12 â€” Argumentation acadÃ©mique
LEÃ‡ON 8/8 â€” Mission rÃ©elle

MISSION RÃ‰ELLE â€” Argumentation acadÃ©mique

SCÃ‰NARIO
Vous devez dÃ©velopper une thÃ¨se solide. Vous nâ€™avez droit quâ€™Ã  lâ€™allemand.

LIVRABLES
1. Un texte de 180 Ã  350 mots.
2. Un enregistrement oral de 3 Ã  6 minutes.
3. Un dialogue de 10 rÃ©pliques.
4. Une liste de 15 mots ou expressions rÃ©ellement utiles.
5. Une auto-correction : trois erreurs repÃ©rÃ©es et expliquÃ©es.

CRITÃˆRES
ClartÃ©, correction, vocabulaire adaptÃ©, fluiditÃ© et capacitÃ© Ã  accomplir la tÃ¢che.

EXPRESSIONS Ã€ RÃ‰UTILISER
â€¢ Die These beruht auf der Annahme, dass â€¦
â€¢ Dagegen spricht allerdings â€¦
â€¢ Bei genauerer Betrachtung â€¦
â€¢ Daraus ergibt sich die Schlussfolgerung â€¦

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” Argumentation acadÃ©mique','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” Argumentation acadÃ©mique');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'C1 Â· Module 4 â€” SynthÃ¨se de sources','Niveau C1 : combiner plusieurs documents sans les copier. Grammaire : paraphrase; rÃ©fÃ©rences. 8 leÃ§ons avec thÃ©orie, audio, exercices, quiz et mission rÃ©elle.',52) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre â€” SynthÃ¨se de sources','allemand-c1-m04-l01','text','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 4/12 â€” SynthÃ¨se de sources
LEÃ‡ON 1/8 â€” Comprendre

OBJECTIF
Combiner plusieurs documents sans les copier.

EXPLICATION EN FRANÃ‡AIS
Ã€ ce niveau, vous devez apprendre Ã  communiquer avec prÃ©cision, registre, implicite, langue acadÃ©mique et professionnelle avancÃ©e. Le thÃ¨me Â« SynthÃ¨se de sources Â» sert de contexte rÃ©el. Commencez par comprendre lâ€™intention, puis repÃ©rez le verbe, les informations importantes et enfin les dÃ©tails.

MÃ‰THODE
1. Lisez les phrases sans traduire mot Ã  mot.
2. Soulignez le verbe conjuguÃ©.
3. RepÃ©rez qui parle, Ã  qui et dans quel but.
4. RÃ©pÃ©tez chaque phrase Ã  voix haute trois fois.
5. Changez un Ã©lÃ©ment pour crÃ©er votre propre exemple.

EXEMPLES ALLEMANDS
â€¢ Quelle A legt nahe, dass â€¦
â€¢ Quelle B setzt einen anderen Schwerpunkt.
â€¢ Gemeinsam ist beiden â€¦
â€¢ Die Unterschiede lassen sich dadurch erklÃ¤ren â€¦

Ã€ RETENIR
Grammaire centrale : paraphrase; rÃ©fÃ©rences.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” SynthÃ¨se de sources','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” SynthÃ¨se de sources');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif â€” SynthÃ¨se de sources','allemand-c1-m04-l02','text','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 4/12 â€” SynthÃ¨se de sources
LEÃ‡ON 2/8 â€” Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur Â« SynthÃ¨se de sources Â».

VOCABULAIRE Ã€ ACTIVER
Gemeinsam, Quelle, Schwerpunkt, Unterschiede, anderen, beiden, dadurch, dass, einen, erklÃ¤ren, lassen, legt, nahe, setzt, sich

TECHNIQUE 4 Ã‰TAPES
1. Ã‰coutez le mot avec le bouton audio.
2. RÃ©pÃ©tez-le dans une phrase complÃ¨te.
3. CrÃ©ez une phrase vraie sur votre vie.
4. RÃ©utilisez-le 24 heures plus tard.

MODÃˆLES
â€¢ Quelle A legt nahe, dass â€¦
â€¢ Quelle B setzt einen anderen Schwerpunkt.
â€¢ Gemeinsam ist beiden â€¦
â€¢ Die Unterschiede lassen sich dadurch erklÃ¤ren â€¦

EXERCICES
1. Choisissez 10 mots et Ã©crivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez lâ€™allemand et traduisez vos phrases du franÃ§ais vers lâ€™allemand.
4. Enregistrez oralement un rÃ©sumÃ© de 60 secondes.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” SynthÃ¨se de sources','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” SynthÃ¨se de sources');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation â€” SynthÃ¨se de sources','allemand-c1-m04-l03','audio','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 4/12 â€” SynthÃ¨se de sources
LEÃ‡ON 3/8 â€” Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÃˆLE
A: Quelle A legt nahe, dass â€¦
B: Quelle B setzt einen anderen Schwerpunkt.
A: Gemeinsam ist beiden â€¦
B: Die Unterschiede lassen sich dadurch erklÃ¤ren â€¦

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” SynthÃ¨se de sources','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” SynthÃ¨se de sources');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur â€” SynthÃ¨se de sources','allemand-c1-m04-l04','text','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 4/12 â€” SynthÃ¨se de sources
LEÃ‡ON 4/8 â€” Grammaire en profondeur

POINT DE GRAMMAIRE
paraphrase; rÃ©fÃ©rences.

EXPLICATION
La grammaire nâ€™est pas une liste de rÃ¨gles Ã  mÃ©moriser sÃ©parÃ©ment : elle sert Ã  exprimer une intention. Observez dâ€™abord la place du verbe, puis les complÃ©ments, et enfin les Ã©lÃ©ments de temps, cause ou opinion.

EXEMPLES
â€¢ Quelle A legt nahe, dass â€¦
â€¢ Quelle B setzt einen anderen Schwerpunkt.
â€¢ Gemeinsam ist beiden â€¦
â€¢ Die Unterschiede lassen sich dadurch erklÃ¤ren â€¦

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” SynthÃ¨se de sources','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” SynthÃ¨se de sources');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'ComprÃ©hension et production â€” SynthÃ¨se de sources','allemand-c1-m04-l05','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 4/12 â€” SynthÃ¨se de sources
LEÃ‡ON 5/8 â€” ComprÃ©hension et production

TEXTE / SITUATION
Imaginez une situation rÃ©elle autour de Â« SynthÃ¨se de sources Â». Les personnes utilisent les expressions suivantes :
â€¢ Quelle A legt nahe, dass â€¦
â€¢ Quelle B setzt einen anderen Schwerpunkt.
â€¢ Gemeinsam ist beiden â€¦
â€¢ Die Unterschiede lassen sich dadurch erklÃ¤ren â€¦

COMPRÃ‰HENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou Ã©motion peut-on dÃ©duire ?
4. Reformulez le contenu en franÃ§ais, puis en allemand simple.

PRODUCTION Ã‰CRITE
RÃ©digez un texte adaptÃ© au niveau C1. Utilisez au moins 8 Ã©lÃ©ments du module et 3 structures liÃ©es Ã  : paraphrase; rÃ©fÃ©rences.

PRODUCTION ORALE
Parlez pendant 2 Ã  4 minutes sans lire. Recommencez en amÃ©liorant la fluiditÃ©.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” SynthÃ¨se de sources','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” SynthÃ¨se de sources');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif â€” SynthÃ¨se de sources','allemand-c1-m04-l06','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 4/12 â€” SynthÃ¨se de sources
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
â€¢ Quelle A legt nahe, dass â€¦
â€¢ Quelle B setzt einen anderen Schwerpunkt.
â€¢ Gemeinsam ist beiden â€¦
â€¢ Die Unterschiede lassen sich dadurch erklÃ¤ren â€¦

GRAMMAIRE Ã€ RÃ‰UTILISER
paraphrase; rÃ©fÃ©rences.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” SynthÃ¨se de sources','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” SynthÃ¨se de sources');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module â€” SynthÃ¨se de sources','allemand-c1-m04-l07','quiz','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 4/12 â€” SynthÃ¨se de sources
LEÃ‡ON 7/8 â€” Quiz de module

QUIZ DE VALIDATION â€” SynthÃ¨se de sources

Avant de valider, vous devez pouvoir :
â€¢ comprendre les quatre expressions du module ;
â€¢ expliquer le point de grammaire Â« paraphrase; rÃ©fÃ©rences Â» ;
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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” SynthÃ¨se de sources','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” SynthÃ¨se de sources');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission rÃ©elle â€” SynthÃ¨se de sources','allemand-c1-m04-l08','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 4/12 â€” SynthÃ¨se de sources
LEÃ‡ON 8/8 â€” Mission rÃ©elle

MISSION RÃ‰ELLE â€” SynthÃ¨se de sources

SCÃ‰NARIO
Vous devez combiner plusieurs documents sans les copier. Vous nâ€™avez droit quâ€™Ã  lâ€™allemand.

LIVRABLES
1. Un texte de 180 Ã  350 mots.
2. Un enregistrement oral de 3 Ã  6 minutes.
3. Un dialogue de 10 rÃ©pliques.
4. Une liste de 15 mots ou expressions rÃ©ellement utiles.
5. Une auto-correction : trois erreurs repÃ©rÃ©es et expliquÃ©es.

CRITÃˆRES
ClartÃ©, correction, vocabulaire adaptÃ©, fluiditÃ© et capacitÃ© Ã  accomplir la tÃ¢che.

EXPRESSIONS Ã€ RÃ‰UTILISER
â€¢ Quelle A legt nahe, dass â€¦
â€¢ Quelle B setzt einen anderen Schwerpunkt.
â€¢ Gemeinsam ist beiden â€¦
â€¢ Die Unterschiede lassen sich dadurch erklÃ¤ren â€¦

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” SynthÃ¨se de sources','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” SynthÃ¨se de sources');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'C1 Â· Module 5 â€” PrÃ©sentations expertes','Niveau C1 : parler longtemps avec structure et impact. Grammaire : marqueurs de discours avancÃ©s. 8 leÃ§ons avec thÃ©orie, audio, exercices, quiz et mission rÃ©elle.',53) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre â€” PrÃ©sentations expertes','allemand-c1-m05-l01','text','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 5/12 â€” PrÃ©sentations expertes
LEÃ‡ON 1/8 â€” Comprendre

OBJECTIF
Parler longtemps avec structure et impact.

EXPLICATION EN FRANÃ‡AIS
Ã€ ce niveau, vous devez apprendre Ã  communiquer avec prÃ©cision, registre, implicite, langue acadÃ©mique et professionnelle avancÃ©e. Le thÃ¨me Â« PrÃ©sentations expertes Â» sert de contexte rÃ©el. Commencez par comprendre lâ€™intention, puis repÃ©rez le verbe, les informations importantes et enfin les dÃ©tails.

MÃ‰THODE
1. Lisez les phrases sans traduire mot Ã  mot.
2. Soulignez le verbe conjuguÃ©.
3. RepÃ©rez qui parle, Ã  qui et dans quel but.
4. RÃ©pÃ©tez chaque phrase Ã  voix haute trois fois.
5. Changez un Ã©lÃ©ment pour crÃ©er votre propre exemple.

EXEMPLES ALLEMANDS
â€¢ Ich werde zunÃ¤chst den Rahmen abstecken.
â€¢ AnschlieÃŸend gehe ich auf â€¦ ein.
â€¢ Diese Beobachtung ist insofern relevant, als â€¦
â€¢ Damit komme ich zum Fazit.

Ã€ RETENIR
Grammaire centrale : marqueurs de discours avancÃ©s.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” PrÃ©sentations expertes','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” PrÃ©sentations expertes');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif â€” PrÃ©sentations expertes','allemand-c1-m05-l02','text','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 5/12 â€” PrÃ©sentations expertes
LEÃ‡ON 2/8 â€” Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur Â« PrÃ©sentations expertes Â».

VOCABULAIRE Ã€ ACTIVER
AnschlieÃŸend, Beobachtung, Damit, Diese, Fazit, Rahmen, abstecken, gehe, insofern, komme, relevant, werde, zunÃ¤chst

TECHNIQUE 4 Ã‰TAPES
1. Ã‰coutez le mot avec le bouton audio.
2. RÃ©pÃ©tez-le dans une phrase complÃ¨te.
3. CrÃ©ez une phrase vraie sur votre vie.
4. RÃ©utilisez-le 24 heures plus tard.

MODÃˆLES
â€¢ Ich werde zunÃ¤chst den Rahmen abstecken.
â€¢ AnschlieÃŸend gehe ich auf â€¦ ein.
â€¢ Diese Beobachtung ist insofern relevant, als â€¦
â€¢ Damit komme ich zum Fazit.

EXERCICES
1. Choisissez 10 mots et Ã©crivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez lâ€™allemand et traduisez vos phrases du franÃ§ais vers lâ€™allemand.
4. Enregistrez oralement un rÃ©sumÃ© de 60 secondes.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” PrÃ©sentations expertes','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” PrÃ©sentations expertes');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation â€” PrÃ©sentations expertes','allemand-c1-m05-l03','audio','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 5/12 â€” PrÃ©sentations expertes
LEÃ‡ON 3/8 â€” Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÃˆLE
A: Ich werde zunÃ¤chst den Rahmen abstecken.
B: AnschlieÃŸend gehe ich auf â€¦ ein.
A: Diese Beobachtung ist insofern relevant, als â€¦
B: Damit komme ich zum Fazit.

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” PrÃ©sentations expertes','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” PrÃ©sentations expertes');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur â€” PrÃ©sentations expertes','allemand-c1-m05-l04','text','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 5/12 â€” PrÃ©sentations expertes
LEÃ‡ON 4/8 â€” Grammaire en profondeur

POINT DE GRAMMAIRE
marqueurs de discours avancÃ©s.

EXPLICATION
La grammaire nâ€™est pas une liste de rÃ¨gles Ã  mÃ©moriser sÃ©parÃ©ment : elle sert Ã  exprimer une intention. Observez dâ€™abord la place du verbe, puis les complÃ©ments, et enfin les Ã©lÃ©ments de temps, cause ou opinion.

EXEMPLES
â€¢ Ich werde zunÃ¤chst den Rahmen abstecken.
â€¢ AnschlieÃŸend gehe ich auf â€¦ ein.
â€¢ Diese Beobachtung ist insofern relevant, als â€¦
â€¢ Damit komme ich zum Fazit.

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” PrÃ©sentations expertes','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” PrÃ©sentations expertes');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'ComprÃ©hension et production â€” PrÃ©sentations expertes','allemand-c1-m05-l05','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 5/12 â€” PrÃ©sentations expertes
LEÃ‡ON 5/8 â€” ComprÃ©hension et production

TEXTE / SITUATION
Imaginez une situation rÃ©elle autour de Â« PrÃ©sentations expertes Â». Les personnes utilisent les expressions suivantes :
â€¢ Ich werde zunÃ¤chst den Rahmen abstecken.
â€¢ AnschlieÃŸend gehe ich auf â€¦ ein.
â€¢ Diese Beobachtung ist insofern relevant, als â€¦
â€¢ Damit komme ich zum Fazit.

COMPRÃ‰HENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou Ã©motion peut-on dÃ©duire ?
4. Reformulez le contenu en franÃ§ais, puis en allemand simple.

PRODUCTION Ã‰CRITE
RÃ©digez un texte adaptÃ© au niveau C1. Utilisez au moins 8 Ã©lÃ©ments du module et 3 structures liÃ©es Ã  : marqueurs de discours avancÃ©s.

PRODUCTION ORALE
Parlez pendant 2 Ã  4 minutes sans lire. Recommencez en amÃ©liorant la fluiditÃ©.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” PrÃ©sentations expertes','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” PrÃ©sentations expertes');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif â€” PrÃ©sentations expertes','allemand-c1-m05-l06','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 5/12 â€” PrÃ©sentations expertes
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
â€¢ Ich werde zunÃ¤chst den Rahmen abstecken.
â€¢ AnschlieÃŸend gehe ich auf â€¦ ein.
â€¢ Diese Beobachtung ist insofern relevant, als â€¦
â€¢ Damit komme ich zum Fazit.

GRAMMAIRE Ã€ RÃ‰UTILISER
marqueurs de discours avancÃ©s.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” PrÃ©sentations expertes','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” PrÃ©sentations expertes');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module â€” PrÃ©sentations expertes','allemand-c1-m05-l07','quiz','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 5/12 â€” PrÃ©sentations expertes
LEÃ‡ON 7/8 â€” Quiz de module

QUIZ DE VALIDATION â€” PrÃ©sentations expertes

Avant de valider, vous devez pouvoir :
â€¢ comprendre les quatre expressions du module ;
â€¢ expliquer le point de grammaire Â« marqueurs de discours avancÃ©s Â» ;
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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” PrÃ©sentations expertes','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” PrÃ©sentations expertes');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission rÃ©elle â€” PrÃ©sentations expertes','allemand-c1-m05-l08','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 5/12 â€” PrÃ©sentations expertes
LEÃ‡ON 8/8 â€” Mission rÃ©elle

MISSION RÃ‰ELLE â€” PrÃ©sentations expertes

SCÃ‰NARIO
Vous devez parler longtemps avec structure et impact. Vous nâ€™avez droit quâ€™Ã  lâ€™allemand.

LIVRABLES
1. Un texte de 180 Ã  350 mots.
2. Un enregistrement oral de 3 Ã  6 minutes.
3. Un dialogue de 10 rÃ©pliques.
4. Une liste de 15 mots ou expressions rÃ©ellement utiles.
5. Une auto-correction : trois erreurs repÃ©rÃ©es et expliquÃ©es.

CRITÃˆRES
ClartÃ©, correction, vocabulaire adaptÃ©, fluiditÃ© et capacitÃ© Ã  accomplir la tÃ¢che.

EXPRESSIONS Ã€ RÃ‰UTILISER
â€¢ Ich werde zunÃ¤chst den Rahmen abstecken.
â€¢ AnschlieÃŸend gehe ich auf â€¦ ein.
â€¢ Diese Beobachtung ist insofern relevant, als â€¦
â€¢ Damit komme ich zum Fazit.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” PrÃ©sentations expertes','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” PrÃ©sentations expertes');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'C1 Â· Module 6 â€” NÃ©gociation et leadership','Niveau C1 : gÃ©rer dÃ©saccords, risques et dÃ©cisions. Grammaire : langue de nÃ©gociation. 8 leÃ§ons avec thÃ©orie, audio, exercices, quiz et mission rÃ©elle.',54) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre â€” NÃ©gociation et leadership','allemand-c1-m06-l01','text','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 6/12 â€” NÃ©gociation et leadership
LEÃ‡ON 1/8 â€” Comprendre

OBJECTIF
GÃ©rer dÃ©saccords, risques et dÃ©cisions.

EXPLICATION EN FRANÃ‡AIS
Ã€ ce niveau, vous devez apprendre Ã  communiquer avec prÃ©cision, registre, implicite, langue acadÃ©mique et professionnelle avancÃ©e. Le thÃ¨me Â« NÃ©gociation et leadership Â» sert de contexte rÃ©el. Commencez par comprendre lâ€™intention, puis repÃ©rez le verbe, les informations importantes et enfin les dÃ©tails.

MÃ‰THODE
1. Lisez les phrases sans traduire mot Ã  mot.
2. Soulignez le verbe conjuguÃ©.
3. RepÃ©rez qui parle, Ã  qui et dans quel but.
4. RÃ©pÃ©tez chaque phrase Ã  voix haute trois fois.
5. Changez un Ã©lÃ©ment pour crÃ©er votre propre exemple.

EXEMPLES ALLEMANDS
â€¢ Lassen Sie uns die Interessen getrennt von den Positionen betrachten.
â€¢ Welche Konsequenzen hÃ¤tte diese Option?
â€¢ Ich sehe hier einen Zielkonflikt.
â€¢ KÃ¶nnen wir einen tragfÃ¤higen Kompromiss formulieren?

Ã€ RETENIR
Grammaire centrale : langue de nÃ©gociation.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” NÃ©gociation et leadership','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” NÃ©gociation et leadership');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif â€” NÃ©gociation et leadership','allemand-c1-m06-l02','text','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 6/12 â€” NÃ©gociation et leadership
LEÃ‡ON 2/8 â€” Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur Â« NÃ©gociation et leadership Â».

VOCABULAIRE Ã€ ACTIVER
Interessen, Kompromiss, Konsequenzen, KÃ¶nnen, Lassen, Option, Positionen, Welche, Zielkonflikt, betrachten, diese, einen, formulieren, getrennt, hier, hÃ¤tte, sehe, tragfÃ¤higen

TECHNIQUE 4 Ã‰TAPES
1. Ã‰coutez le mot avec le bouton audio.
2. RÃ©pÃ©tez-le dans une phrase complÃ¨te.
3. CrÃ©ez une phrase vraie sur votre vie.
4. RÃ©utilisez-le 24 heures plus tard.

MODÃˆLES
â€¢ Lassen Sie uns die Interessen getrennt von den Positionen betrachten.
â€¢ Welche Konsequenzen hÃ¤tte diese Option?
â€¢ Ich sehe hier einen Zielkonflikt.
â€¢ KÃ¶nnen wir einen tragfÃ¤higen Kompromiss formulieren?

EXERCICES
1. Choisissez 10 mots et Ã©crivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez lâ€™allemand et traduisez vos phrases du franÃ§ais vers lâ€™allemand.
4. Enregistrez oralement un rÃ©sumÃ© de 60 secondes.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” NÃ©gociation et leadership','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” NÃ©gociation et leadership');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation â€” NÃ©gociation et leadership','allemand-c1-m06-l03','audio','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 6/12 â€” NÃ©gociation et leadership
LEÃ‡ON 3/8 â€” Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÃˆLE
A: Lassen Sie uns die Interessen getrennt von den Positionen betrachten.
B: Welche Konsequenzen hÃ¤tte diese Option?
A: Ich sehe hier einen Zielkonflikt.
B: KÃ¶nnen wir einen tragfÃ¤higen Kompromiss formulieren?

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” NÃ©gociation et leadership','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” NÃ©gociation et leadership');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur â€” NÃ©gociation et leadership','allemand-c1-m06-l04','text','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 6/12 â€” NÃ©gociation et leadership
LEÃ‡ON 4/8 â€” Grammaire en profondeur

POINT DE GRAMMAIRE
langue de nÃ©gociation.

EXPLICATION
La grammaire nâ€™est pas une liste de rÃ¨gles Ã  mÃ©moriser sÃ©parÃ©ment : elle sert Ã  exprimer une intention. Observez dâ€™abord la place du verbe, puis les complÃ©ments, et enfin les Ã©lÃ©ments de temps, cause ou opinion.

EXEMPLES
â€¢ Lassen Sie uns die Interessen getrennt von den Positionen betrachten.
â€¢ Welche Konsequenzen hÃ¤tte diese Option?
â€¢ Ich sehe hier einen Zielkonflikt.
â€¢ KÃ¶nnen wir einen tragfÃ¤higen Kompromiss formulieren?

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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” NÃ©gociation et leadership','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” NÃ©gociation et leadership');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'ComprÃ©hension et production â€” NÃ©gociation et leadership','allemand-c1-m06-l05','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 6/12 â€” NÃ©gociation et leadership
LEÃ‡ON 5/8 â€” ComprÃ©hension et production

TEXTE / SITUATION
Imaginez une situation rÃ©elle autour de Â« NÃ©gociation et leadership Â». Les personnes utilisent les expressions suivantes :
â€¢ Lassen Sie uns die Interessen getrennt von den Positionen betrachten.
â€¢ Welche Konsequenzen hÃ¤tte diese Option?
â€¢ Ich sehe hier einen Zielkonflikt.
â€¢ KÃ¶nnen wir einen tragfÃ¤higen Kompromiss formulieren?

COMPRÃ‰HENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou Ã©motion peut-on dÃ©duire ?
4. Reformulez le contenu en franÃ§ais, puis en allemand simple.

PRODUCTION Ã‰CRITE
RÃ©digez un texte adaptÃ© au niveau C1. Utilisez au moins 8 Ã©lÃ©ments du module et 3 structures liÃ©es Ã  : langue de nÃ©gociation.

PRODUCTION ORALE
Parlez pendant 2 Ã  4 minutes sans lire. Recommencez en amÃ©liorant la fluiditÃ©.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” NÃ©gociation et leadership','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” NÃ©gociation et leadership');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif â€” NÃ©gociation et leadership','allemand-c1-m06-l06','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 6/12 â€” NÃ©gociation et leadership
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
â€¢ Lassen Sie uns die Interessen getrennt von den Positionen betrachten.
â€¢ Welche Konsequenzen hÃ¤tte diese Option?
â€¢ Ich sehe hier einen Zielkonflikt.
â€¢ KÃ¶nnen wir einen tragfÃ¤higen Kompromiss formulieren?

GRAMMAIRE Ã€ RÃ‰UTILISER
langue de nÃ©gociation.

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” NÃ©gociation et leadership','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” NÃ©gociation et leadership');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module â€” NÃ©gociation et leadership','allemand-c1-m06-l07','quiz','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 6/12 â€” NÃ©gociation et leadership
LEÃ‡ON 7/8 â€” Quiz de module

QUIZ DE VALIDATION â€” NÃ©gociation et leadership

Avant de valider, vous devez pouvoir :
â€¢ comprendre les quatre expressions du module ;
â€¢ expliquer le point de grammaire Â« langue de nÃ©gociation Â» ;
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
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” NÃ©gociation et leadership','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” NÃ©gociation et leadership');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission rÃ©elle â€” NÃ©gociation et leadership','allemand-c1-m06-l08','exercise','ALLEMAND FONCTIONNEL â€” NIVEAU C1
MODULE 6/12 â€” NÃ©gociation et leadership
LEÃ‡ON 8/8 â€” Mission rÃ©elle

MISSION RÃ‰ELLE â€” NÃ©gociation et leadership

SCÃ‰NARIO
Vous devez gÃ©rer dÃ©saccords, risques et dÃ©cisions. Vous nâ€™avez droit quâ€™Ã  lâ€™allemand.

LIVRABLES
1. Un texte de 180 Ã  350 mots.
2. Un enregistrement oral de 3 Ã  6 minutes.
3. Un dialogue de 10 rÃ©pliques.
4. Une liste de 15 mots ou expressions rÃ©ellement utiles.
5. Une auto-correction : trois erreurs repÃ©rÃ©es et expliquÃ©es.

CRITÃˆRES
ClartÃ©, correction, vocabulaire adaptÃ©, fluiditÃ© et capacitÃ© Ã  accomplir la tÃ¢che.

EXPRESSIONS Ã€ RÃ‰UTILISER
â€¢ Lassen Sie uns die Interessen getrennt von den Positionen betrachten.
â€¢ Welche Konsequenzen hÃ¤tte diese Option?
â€¢ Ich sehe hier einen Zielkonflikt.
â€¢ KÃ¶nnen wir einen tragfÃ¤higen Kompromiss formulieren?

RITUEL AUDIO
Utilisez Â« Ã‰couter lâ€™allemand Â» : 1re Ã©coute Ã  vitesse 0,8 ; 2e Ã©coute Ã  vitesse normale ; 3e Ã©coute en rÃ©pÃ©tant Ã  voix haute.

RÃ‰VISION ESPACÃ‰E
Revenez sur cette leÃ§on aprÃ¨s 1 jour, 7 jours et 30 jours.',3000,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable â€” NÃ©gociation et leadership','link','/lessons/' || v_lesson::text || '?course=allemand-complet-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable â€” NÃ©gociation et leadership');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German â€” vidÃ©os et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German â€” vidÃ©os et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut â€” apprendre lâ€™allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut â€” apprendre lâ€™allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg â€” parcours vidÃ©o','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg â€” parcours vidÃ©o');
END $$;

SELECT 'Partie 9/10 installÃ©e : modules 49 Ã  54' AS resultat;


