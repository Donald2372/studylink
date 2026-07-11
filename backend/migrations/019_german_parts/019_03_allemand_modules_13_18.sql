-- StudyLink 019 - Allemand A1-C1 - Partie 3/10
-- Modules 13 à 18
DO $$
DECLARE v_course UUID; v_module UUID; v_lesson UUID;
BEGIN
  SELECT id INTO v_course FROM public.courses WHERE slug='allemand-fonctionnel-a1-c1' ORDER BY created_at DESC NULLS LAST LIMIT 1;
  IF v_course IS NULL THEN RAISE EXCEPTION 'Le cours allemand n existe pas encore. Executez d abord la partie 01.'; END IF;
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'A2 · Module 1 — Passé et expériences','Niveau A2 : raconter ce que l’on a fait. Grammaire : Perfekt avec haben/sein. 8 leçons avec théorie, audio, exercices, quiz et mission réelle.',13) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre — Passé et expériences','allemand-a2-m01-l01','text','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 1/12 — Passé et expériences
LEÇON 1/8 — Comprendre

OBJECTIF
Raconter ce que l’on a fait.

EXPLICATION EN FRANÇAIS
À ce niveau, vous devez apprendre à communiquer avec échanges courants, passé, démarches et autonomie quotidienne. Le thème « Passé et expériences » sert de contexte réel. Commencez par comprendre l’intention, puis repérez le verbe, les informations importantes et enfin les détails.

MÉTHODE
1. Lisez les phrases sans traduire mot à mot.
2. Soulignez le verbe conjugué.
3. Repérez qui parle, à qui et dans quel but.
4. Répétez chaque phrase à voix haute trois fois.
5. Changez un élément pour créer votre propre exemple.

EXEMPLES ALLEMANDS
• Ich habe gestern gearbeitet.
• Wir sind nach Hamburg gefahren.
• Hast du das schon gemacht?
• Noch nie!

À RETENIR
Grammaire centrale : Perfekt avec haben/sein.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Passé et expériences','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Passé et expériences');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif — Passé et expériences','allemand-a2-m01-l02','text','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 1/12 — Passé et expériences
LEÇON 2/8 — Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur « Passé et expériences ».

VOCABULAIRE À ACTIVER
Hamburg, Hast, Noch, gearbeitet, gefahren, gemacht, gestern, habe, nach, schon, sind

TECHNIQUE 4 ÉTAPES
1. Écoutez le mot avec le bouton audio.
2. Répétez-le dans une phrase complète.
3. Créez une phrase vraie sur votre vie.
4. Réutilisez-le 24 heures plus tard.

MODÈLES
• Ich habe gestern gearbeitet.
• Wir sind nach Hamburg gefahren.
• Hast du das schon gemacht?
• Noch nie!

EXERCICES
1. Choisissez 10 mots et écrivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez l’allemand et traduisez vos phrases du français vers l’allemand.
4. Enregistrez oralement un résumé de 60 secondes.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Passé et expériences','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Passé et expériences');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation — Passé et expériences','allemand-a2-m01-l03','audio','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 1/12 — Passé et expériences
LEÇON 3/8 — Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÈLE
A: Ich habe gestern gearbeitet.
B: Wir sind nach Hamburg gefahren.
A: Hast du das schon gemacht?
B: Noch nie!

PRONONCIATION
• Écoutez d’abord sans lire.
• Réécoutez en suivant le texte.
• Faites du shadowing : répétez presque en même temps que la voix.
• Jouez ensuite les deux rôles sans regarder.

MISSION ORALE
Créez un nouveau dialogue de 8 à 12 répliques sur le même thème. Utilisez au moins 6 expressions du module. Enregistrez-vous deux fois : une première version lente, puis une version naturelle.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Passé et expériences','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Passé et expériences');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur — Passé et expériences','allemand-a2-m01-l04','text','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 1/12 — Passé et expériences
LEÇON 4/8 — Grammaire en profondeur

POINT DE GRAMMAIRE
Perfekt avec haben/sein.

EXPLICATION
La grammaire n’est pas une liste de règles à mémoriser séparément : elle sert à exprimer une intention. Observez d’abord la place du verbe, puis les compléments, et enfin les éléments de temps, cause ou opinion.

EXEMPLES
• Ich habe gestern gearbeitet.
• Wir sind nach Hamburg gefahren.
• Hast du das schon gemacht?
• Noch nie!

TRANSFORMATION GUIDÉE
1. Mettez chaque phrase à la forme négative.
2. Transformez-la en question.
3. Changez la personne grammaticale.
4. Changez le temps si votre niveau le permet.
5. Combinez deux phrases avec un connecteur adapté.

ERREUR FRÉQUENTE
Ne traduisez pas directement l’ordre des mots du français. Vérifiez toujours la position du verbe dans la proposition principale et la subordonnée.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Passé et expériences','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Passé et expériences');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Compréhension et production — Passé et expériences','allemand-a2-m01-l05','exercise','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 1/12 — Passé et expériences
LEÇON 5/8 — Compréhension et production

TEXTE / SITUATION
Imaginez une situation réelle autour de « Passé et expériences ». Les personnes utilisent les expressions suivantes :
• Ich habe gestern gearbeitet.
• Wir sind nach Hamburg gefahren.
• Hast du das schon gemacht?
• Noch nie!

COMPRÉHENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou émotion peut-on déduire ?
4. Reformulez le contenu en français, puis en allemand simple.

PRODUCTION ÉCRITE
Rédigez un texte adapté au niveau A2. Utilisez au moins 8 éléments du module et 3 structures liées à : Perfekt avec haben/sein.

PRODUCTION ORALE
Parlez pendant 1 minute sans lire. Recommencez en améliorant la fluidité.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Passé et expériences','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Passé et expériences');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif — Passé et expériences','allemand-a2-m01-l06','exercise','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 1/12 — Passé et expériences
LEÇON 6/8 — Atelier intensif

ATELIER — 12 EXERCICES
1. Traduisez 5 phrases du français vers l’allemand.
2. Transformez 5 affirmations en questions.
3. Corrigez 5 phrases contenant une erreur.
4. Complétez un mini-dialogue de 10 lignes.
5. Remplacez les mots simples par des expressions du module.
6. Faites une dictée avec le bouton audio.
7. Résumez le dialogue en 5 phrases.
8. Parlez 90 secondes sans notes.
9. Écrivez un message réel adapté au thème.
10. Reformulez votre texte dans un registre plus poli.
11. Créez 10 cartes mémoire.
12. Refaites l’exercice le plus difficile après 24 heures.

BANQUE DE PHRASES
• Ich habe gestern gearbeitet.
• Wir sind nach Hamburg gefahren.
• Hast du das schon gemacht?
• Noch nie!

GRAMMAIRE À RÉUTILISER
Perfekt avec haben/sein.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Passé et expériences','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Passé et expériences');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module — Passé et expériences','allemand-a2-m01-l07','quiz','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 1/12 — Passé et expériences
LEÇON 7/8 — Quiz de module

QUIZ DE VALIDATION — Passé et expériences

Avant de valider, vous devez pouvoir :
• comprendre les quatre expressions du module ;
• expliquer le point de grammaire « Perfekt avec haben/sein » ;
• créer vos propres exemples ;
• parler spontanément sur le thème ;
• corriger une erreur typique.

AUTO-TEST
1. Dites les quatre exemples sans lire.
2. Créez cinq nouvelles phrases.
3. Expliquez la règle à quelqu’un en français.
4. Répondez à une question imprévue pendant 60 secondes.
5. Écrivez un mini-texte et corrigez-le vous-même.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Passé et expériences','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Passé et expériences');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission réelle — Passé et expériences','allemand-a2-m01-l08','exercise','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 1/12 — Passé et expériences
LEÇON 8/8 — Mission réelle

MISSION RÉELLE — Passé et expériences

SCÉNARIO
Vous devez raconter ce que l’on a fait. Vous n’avez droit qu’à l’allemand.

LIVRABLES
1. Un texte de 80 à 120 mots.
2. Un enregistrement oral de 1 à 2 minutes.
3. Un dialogue de 10 répliques.
4. Une liste de 15 mots ou expressions réellement utiles.
5. Une auto-correction : trois erreurs repérées et expliquées.

CRITÈRES
Clarté, correction, vocabulaire adapté, fluidité et capacité à accomplir la tâche.

EXPRESSIONS À RÉUTILISER
• Ich habe gestern gearbeitet.
• Wir sind nach Hamburg gefahren.
• Hast du das schon gemacht?
• Noch nie!

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Passé et expériences','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Passé et expériences');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'A2 · Module 2 — Voyages et réservations','Niveau A2 : organiser un voyage et résoudre un problème. Grammaire : modalités; datif; questions polies. 8 leçons avec théorie, audio, exercices, quiz et mission réelle.',14) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre — Voyages et réservations','allemand-a2-m02-l01','text','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 2/12 — Voyages et réservations
LEÇON 1/8 — Comprendre

OBJECTIF
Organiser un voyage et résoudre un problème.

EXPLICATION EN FRANÇAIS
À ce niveau, vous devez apprendre à communiquer avec échanges courants, passé, démarches et autonomie quotidienne. Le thème « Voyages et réservations » sert de contexte réel. Commencez par comprendre l’intention, puis repérez le verbe, les informations importantes et enfin les détails.

MÉTHODE
1. Lisez les phrases sans traduire mot à mot.
2. Soulignez le verbe conjugué.
3. Repérez qui parle, à qui et dans quel but.
4. Répétez chaque phrase à voix haute trois fois.
5. Changez un élément pour créer votre propre exemple.

EXEMPLES ALLEMANDS
• Ich möchte ein Zimmer buchen.
• Ist Frühstück inklusive?
• Mein Zug hat Verspätung.
• Können Sie mir helfen?

À RETENIR
Grammaire centrale : modalités; datif; questions polies.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Voyages et réservations','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Voyages et réservations');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif — Voyages et réservations','allemand-a2-m02-l02','text','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 2/12 — Voyages et réservations
LEÇON 2/8 — Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur « Voyages et réservations ».

VOCABULAIRE À ACTIVER
Frühstück, Können, Mein, Verspätung, Zimmer, buchen, helfen, inklusive, möchte

TECHNIQUE 4 ÉTAPES
1. Écoutez le mot avec le bouton audio.
2. Répétez-le dans une phrase complète.
3. Créez une phrase vraie sur votre vie.
4. Réutilisez-le 24 heures plus tard.

MODÈLES
• Ich möchte ein Zimmer buchen.
• Ist Frühstück inklusive?
• Mein Zug hat Verspätung.
• Können Sie mir helfen?

EXERCICES
1. Choisissez 10 mots et écrivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez l’allemand et traduisez vos phrases du français vers l’allemand.
4. Enregistrez oralement un résumé de 60 secondes.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Voyages et réservations','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Voyages et réservations');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation — Voyages et réservations','allemand-a2-m02-l03','audio','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 2/12 — Voyages et réservations
LEÇON 3/8 — Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÈLE
A: Ich möchte ein Zimmer buchen.
B: Ist Frühstück inklusive?
A: Mein Zug hat Verspätung.
B: Können Sie mir helfen?

PRONONCIATION
• Écoutez d’abord sans lire.
• Réécoutez en suivant le texte.
• Faites du shadowing : répétez presque en même temps que la voix.
• Jouez ensuite les deux rôles sans regarder.

MISSION ORALE
Créez un nouveau dialogue de 8 à 12 répliques sur le même thème. Utilisez au moins 6 expressions du module. Enregistrez-vous deux fois : une première version lente, puis une version naturelle.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Voyages et réservations','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Voyages et réservations');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur — Voyages et réservations','allemand-a2-m02-l04','text','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 2/12 — Voyages et réservations
LEÇON 4/8 — Grammaire en profondeur

POINT DE GRAMMAIRE
modalités; datif; questions polies.

EXPLICATION
La grammaire n’est pas une liste de règles à mémoriser séparément : elle sert à exprimer une intention. Observez d’abord la place du verbe, puis les compléments, et enfin les éléments de temps, cause ou opinion.

EXEMPLES
• Ich möchte ein Zimmer buchen.
• Ist Frühstück inklusive?
• Mein Zug hat Verspätung.
• Können Sie mir helfen?

TRANSFORMATION GUIDÉE
1. Mettez chaque phrase à la forme négative.
2. Transformez-la en question.
3. Changez la personne grammaticale.
4. Changez le temps si votre niveau le permet.
5. Combinez deux phrases avec un connecteur adapté.

ERREUR FRÉQUENTE
Ne traduisez pas directement l’ordre des mots du français. Vérifiez toujours la position du verbe dans la proposition principale et la subordonnée.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Voyages et réservations','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Voyages et réservations');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Compréhension et production — Voyages et réservations','allemand-a2-m02-l05','exercise','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 2/12 — Voyages et réservations
LEÇON 5/8 — Compréhension et production

TEXTE / SITUATION
Imaginez une situation réelle autour de « Voyages et réservations ». Les personnes utilisent les expressions suivantes :
• Ich möchte ein Zimmer buchen.
• Ist Frühstück inklusive?
• Mein Zug hat Verspätung.
• Können Sie mir helfen?

COMPRÉHENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou émotion peut-on déduire ?
4. Reformulez le contenu en français, puis en allemand simple.

PRODUCTION ÉCRITE
Rédigez un texte adapté au niveau A2. Utilisez au moins 8 éléments du module et 3 structures liées à : modalités; datif; questions polies.

PRODUCTION ORALE
Parlez pendant 1 minute sans lire. Recommencez en améliorant la fluidité.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Voyages et réservations','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Voyages et réservations');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif — Voyages et réservations','allemand-a2-m02-l06','exercise','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 2/12 — Voyages et réservations
LEÇON 6/8 — Atelier intensif

ATELIER — 12 EXERCICES
1. Traduisez 5 phrases du français vers l’allemand.
2. Transformez 5 affirmations en questions.
3. Corrigez 5 phrases contenant une erreur.
4. Complétez un mini-dialogue de 10 lignes.
5. Remplacez les mots simples par des expressions du module.
6. Faites une dictée avec le bouton audio.
7. Résumez le dialogue en 5 phrases.
8. Parlez 90 secondes sans notes.
9. Écrivez un message réel adapté au thème.
10. Reformulez votre texte dans un registre plus poli.
11. Créez 10 cartes mémoire.
12. Refaites l’exercice le plus difficile après 24 heures.

BANQUE DE PHRASES
• Ich möchte ein Zimmer buchen.
• Ist Frühstück inklusive?
• Mein Zug hat Verspätung.
• Können Sie mir helfen?

GRAMMAIRE À RÉUTILISER
modalités; datif; questions polies.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Voyages et réservations','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Voyages et réservations');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module — Voyages et réservations','allemand-a2-m02-l07','quiz','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 2/12 — Voyages et réservations
LEÇON 7/8 — Quiz de module

QUIZ DE VALIDATION — Voyages et réservations

Avant de valider, vous devez pouvoir :
• comprendre les quatre expressions du module ;
• expliquer le point de grammaire « modalités; datif; questions polies » ;
• créer vos propres exemples ;
• parler spontanément sur le thème ;
• corriger une erreur typique.

AUTO-TEST
1. Dites les quatre exemples sans lire.
2. Créez cinq nouvelles phrases.
3. Expliquez la règle à quelqu’un en français.
4. Répondez à une question imprévue pendant 60 secondes.
5. Écrivez un mini-texte et corrigez-le vous-même.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Voyages et réservations','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Voyages et réservations');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission réelle — Voyages et réservations','allemand-a2-m02-l08','exercise','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 2/12 — Voyages et réservations
LEÇON 8/8 — Mission réelle

MISSION RÉELLE — Voyages et réservations

SCÉNARIO
Vous devez organiser un voyage et résoudre un problème. Vous n’avez droit qu’à l’allemand.

LIVRABLES
1. Un texte de 80 à 120 mots.
2. Un enregistrement oral de 1 à 2 minutes.
3. Un dialogue de 10 répliques.
4. Une liste de 15 mots ou expressions réellement utiles.
5. Une auto-correction : trois erreurs repérées et expliquées.

CRITÈRES
Clarté, correction, vocabulaire adapté, fluidité et capacité à accomplir la tâche.

EXPRESSIONS À RÉUTILISER
• Ich möchte ein Zimmer buchen.
• Ist Frühstück inklusive?
• Mein Zug hat Verspätung.
• Können Sie mir helfen?

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Voyages et réservations','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Voyages et réservations');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'A2 · Module 3 — Travail et candidature simple','Niveau A2 : parler de compétences et de tâches. Grammaire : können; infinitif avec zu introduction. 8 leçons avec théorie, audio, exercices, quiz et mission réelle.',15) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre — Travail et candidature simple','allemand-a2-m03-l01','text','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 3/12 — Travail et candidature simple
LEÇON 1/8 — Comprendre

OBJECTIF
Parler de compétences et de tâches.

EXPLICATION EN FRANÇAIS
À ce niveau, vous devez apprendre à communiquer avec échanges courants, passé, démarches et autonomie quotidienne. Le thème « Travail et candidature simple » sert de contexte réel. Commencez par comprendre l’intention, puis repérez le verbe, les informations importantes et enfin les détails.

MÉTHODE
1. Lisez les phrases sans traduire mot à mot.
2. Soulignez le verbe conjugué.
3. Repérez qui parle, à qui et dans quel but.
4. Répétez chaque phrase à voix haute trois fois.
5. Changez un élément pour créer votre propre exemple.

EXEMPLES ALLEMANDS
• Ich kann gut organisieren.
• Ich habe Erfahrung mit Kunden.
• Meine Aufgabe ist …
• Wann kann ich anfangen?

À RETENIR
Grammaire centrale : können; infinitif avec zu introduction.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Travail et candidature simple','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Travail et candidature simple');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif — Travail et candidature simple','allemand-a2-m03-l02','text','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 3/12 — Travail et candidature simple
LEÇON 2/8 — Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur « Travail et candidature simple ».

VOCABULAIRE À ACTIVER
Aufgabe, Erfahrung, Kunden, Meine, Wann, anfangen, habe, kann, organisieren

TECHNIQUE 4 ÉTAPES
1. Écoutez le mot avec le bouton audio.
2. Répétez-le dans une phrase complète.
3. Créez une phrase vraie sur votre vie.
4. Réutilisez-le 24 heures plus tard.

MODÈLES
• Ich kann gut organisieren.
• Ich habe Erfahrung mit Kunden.
• Meine Aufgabe ist …
• Wann kann ich anfangen?

EXERCICES
1. Choisissez 10 mots et écrivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez l’allemand et traduisez vos phrases du français vers l’allemand.
4. Enregistrez oralement un résumé de 60 secondes.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Travail et candidature simple','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Travail et candidature simple');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation — Travail et candidature simple','allemand-a2-m03-l03','audio','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 3/12 — Travail et candidature simple
LEÇON 3/8 — Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÈLE
A: Ich kann gut organisieren.
B: Ich habe Erfahrung mit Kunden.
A: Meine Aufgabe ist …
B: Wann kann ich anfangen?

PRONONCIATION
• Écoutez d’abord sans lire.
• Réécoutez en suivant le texte.
• Faites du shadowing : répétez presque en même temps que la voix.
• Jouez ensuite les deux rôles sans regarder.

MISSION ORALE
Créez un nouveau dialogue de 8 à 12 répliques sur le même thème. Utilisez au moins 6 expressions du module. Enregistrez-vous deux fois : une première version lente, puis une version naturelle.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Travail et candidature simple','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Travail et candidature simple');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur — Travail et candidature simple','allemand-a2-m03-l04','text','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 3/12 — Travail et candidature simple
LEÇON 4/8 — Grammaire en profondeur

POINT DE GRAMMAIRE
können; infinitif avec zu introduction.

EXPLICATION
La grammaire n’est pas une liste de règles à mémoriser séparément : elle sert à exprimer une intention. Observez d’abord la place du verbe, puis les compléments, et enfin les éléments de temps, cause ou opinion.

EXEMPLES
• Ich kann gut organisieren.
• Ich habe Erfahrung mit Kunden.
• Meine Aufgabe ist …
• Wann kann ich anfangen?

TRANSFORMATION GUIDÉE
1. Mettez chaque phrase à la forme négative.
2. Transformez-la en question.
3. Changez la personne grammaticale.
4. Changez le temps si votre niveau le permet.
5. Combinez deux phrases avec un connecteur adapté.

ERREUR FRÉQUENTE
Ne traduisez pas directement l’ordre des mots du français. Vérifiez toujours la position du verbe dans la proposition principale et la subordonnée.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Travail et candidature simple','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Travail et candidature simple');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Compréhension et production — Travail et candidature simple','allemand-a2-m03-l05','exercise','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 3/12 — Travail et candidature simple
LEÇON 5/8 — Compréhension et production

TEXTE / SITUATION
Imaginez une situation réelle autour de « Travail et candidature simple ». Les personnes utilisent les expressions suivantes :
• Ich kann gut organisieren.
• Ich habe Erfahrung mit Kunden.
• Meine Aufgabe ist …
• Wann kann ich anfangen?

COMPRÉHENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou émotion peut-on déduire ?
4. Reformulez le contenu en français, puis en allemand simple.

PRODUCTION ÉCRITE
Rédigez un texte adapté au niveau A2. Utilisez au moins 8 éléments du module et 3 structures liées à : können; infinitif avec zu introduction.

PRODUCTION ORALE
Parlez pendant 1 minute sans lire. Recommencez en améliorant la fluidité.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Travail et candidature simple','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Travail et candidature simple');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif — Travail et candidature simple','allemand-a2-m03-l06','exercise','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 3/12 — Travail et candidature simple
LEÇON 6/8 — Atelier intensif

ATELIER — 12 EXERCICES
1. Traduisez 5 phrases du français vers l’allemand.
2. Transformez 5 affirmations en questions.
3. Corrigez 5 phrases contenant une erreur.
4. Complétez un mini-dialogue de 10 lignes.
5. Remplacez les mots simples par des expressions du module.
6. Faites une dictée avec le bouton audio.
7. Résumez le dialogue en 5 phrases.
8. Parlez 90 secondes sans notes.
9. Écrivez un message réel adapté au thème.
10. Reformulez votre texte dans un registre plus poli.
11. Créez 10 cartes mémoire.
12. Refaites l’exercice le plus difficile après 24 heures.

BANQUE DE PHRASES
• Ich kann gut organisieren.
• Ich habe Erfahrung mit Kunden.
• Meine Aufgabe ist …
• Wann kann ich anfangen?

GRAMMAIRE À RÉUTILISER
können; infinitif avec zu introduction.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Travail et candidature simple','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Travail et candidature simple');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module — Travail et candidature simple','allemand-a2-m03-l07','quiz','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 3/12 — Travail et candidature simple
LEÇON 7/8 — Quiz de module

QUIZ DE VALIDATION — Travail et candidature simple

Avant de valider, vous devez pouvoir :
• comprendre les quatre expressions du module ;
• expliquer le point de grammaire « können; infinitif avec zu introduction » ;
• créer vos propres exemples ;
• parler spontanément sur le thème ;
• corriger une erreur typique.

AUTO-TEST
1. Dites les quatre exemples sans lire.
2. Créez cinq nouvelles phrases.
3. Expliquez la règle à quelqu’un en français.
4. Répondez à une question imprévue pendant 60 secondes.
5. Écrivez un mini-texte et corrigez-le vous-même.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Travail et candidature simple','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Travail et candidature simple');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission réelle — Travail et candidature simple','allemand-a2-m03-l08','exercise','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 3/12 — Travail et candidature simple
LEÇON 8/8 — Mission réelle

MISSION RÉELLE — Travail et candidature simple

SCÉNARIO
Vous devez parler de compétences et de tâches. Vous n’avez droit qu’à l’allemand.

LIVRABLES
1. Un texte de 80 à 120 mots.
2. Un enregistrement oral de 1 à 2 minutes.
3. Un dialogue de 10 répliques.
4. Une liste de 15 mots ou expressions réellement utiles.
5. Une auto-correction : trois erreurs repérées et expliquées.

CRITÈRES
Clarté, correction, vocabulaire adapté, fluidité et capacité à accomplir la tâche.

EXPRESSIONS À RÉUTILISER
• Ich kann gut organisieren.
• Ich habe Erfahrung mit Kunden.
• Meine Aufgabe ist …
• Wann kann ich anfangen?

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Travail et candidature simple','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Travail et candidature simple');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'A2 · Module 4 — École et apprentissage','Niveau A2 : expliquer comment on apprend. Grammaire : comparatif; weil. 8 leçons avec théorie, audio, exercices, quiz et mission réelle.',16) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre — École et apprentissage','allemand-a2-m04-l01','text','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 4/12 — École et apprentissage
LEÇON 1/8 — Comprendre

OBJECTIF
Expliquer comment on apprend.

EXPLICATION EN FRANÇAIS
À ce niveau, vous devez apprendre à communiquer avec échanges courants, passé, démarches et autonomie quotidienne. Le thème « École et apprentissage » sert de contexte réel. Commencez par comprendre l’intention, puis repérez le verbe, les informations importantes et enfin les détails.

MÉTHODE
1. Lisez les phrases sans traduire mot à mot.
2. Soulignez le verbe conjugué.
3. Repérez qui parle, à qui et dans quel but.
4. Répétez chaque phrase à voix haute trois fois.
5. Changez un élément pour créer votre propre exemple.

EXEMPLES ALLEMANDS
• Ich lerne am besten mit Beispielen.
• Diese Aufgabe ist schwierig.
• Kannst du das erklären?
• Ich muss mehr üben.

À RETENIR
Grammaire centrale : comparatif; weil.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — École et apprentissage','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — École et apprentissage');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif — École et apprentissage','allemand-a2-m04-l02','text','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 4/12 — École et apprentissage
LEÇON 2/8 — Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur « École et apprentissage ».

VOCABULAIRE À ACTIVER
Aufgabe, Beispielen, Diese, Kannst, besten, erklären, lerne, mehr, muss, schwierig, üben

TECHNIQUE 4 ÉTAPES
1. Écoutez le mot avec le bouton audio.
2. Répétez-le dans une phrase complète.
3. Créez une phrase vraie sur votre vie.
4. Réutilisez-le 24 heures plus tard.

MODÈLES
• Ich lerne am besten mit Beispielen.
• Diese Aufgabe ist schwierig.
• Kannst du das erklären?
• Ich muss mehr üben.

EXERCICES
1. Choisissez 10 mots et écrivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez l’allemand et traduisez vos phrases du français vers l’allemand.
4. Enregistrez oralement un résumé de 60 secondes.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — École et apprentissage','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — École et apprentissage');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation — École et apprentissage','allemand-a2-m04-l03','audio','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 4/12 — École et apprentissage
LEÇON 3/8 — Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÈLE
A: Ich lerne am besten mit Beispielen.
B: Diese Aufgabe ist schwierig.
A: Kannst du das erklären?
B: Ich muss mehr üben.

PRONONCIATION
• Écoutez d’abord sans lire.
• Réécoutez en suivant le texte.
• Faites du shadowing : répétez presque en même temps que la voix.
• Jouez ensuite les deux rôles sans regarder.

MISSION ORALE
Créez un nouveau dialogue de 8 à 12 répliques sur le même thème. Utilisez au moins 6 expressions du module. Enregistrez-vous deux fois : une première version lente, puis une version naturelle.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — École et apprentissage','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — École et apprentissage');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur — École et apprentissage','allemand-a2-m04-l04','text','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 4/12 — École et apprentissage
LEÇON 4/8 — Grammaire en profondeur

POINT DE GRAMMAIRE
comparatif; weil.

EXPLICATION
La grammaire n’est pas une liste de règles à mémoriser séparément : elle sert à exprimer une intention. Observez d’abord la place du verbe, puis les compléments, et enfin les éléments de temps, cause ou opinion.

EXEMPLES
• Ich lerne am besten mit Beispielen.
• Diese Aufgabe ist schwierig.
• Kannst du das erklären?
• Ich muss mehr üben.

TRANSFORMATION GUIDÉE
1. Mettez chaque phrase à la forme négative.
2. Transformez-la en question.
3. Changez la personne grammaticale.
4. Changez le temps si votre niveau le permet.
5. Combinez deux phrases avec un connecteur adapté.

ERREUR FRÉQUENTE
Ne traduisez pas directement l’ordre des mots du français. Vérifiez toujours la position du verbe dans la proposition principale et la subordonnée.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — École et apprentissage','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — École et apprentissage');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Compréhension et production — École et apprentissage','allemand-a2-m04-l05','exercise','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 4/12 — École et apprentissage
LEÇON 5/8 — Compréhension et production

TEXTE / SITUATION
Imaginez une situation réelle autour de « École et apprentissage ». Les personnes utilisent les expressions suivantes :
• Ich lerne am besten mit Beispielen.
• Diese Aufgabe ist schwierig.
• Kannst du das erklären?
• Ich muss mehr üben.

COMPRÉHENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou émotion peut-on déduire ?
4. Reformulez le contenu en français, puis en allemand simple.

PRODUCTION ÉCRITE
Rédigez un texte adapté au niveau A2. Utilisez au moins 8 éléments du module et 3 structures liées à : comparatif; weil.

PRODUCTION ORALE
Parlez pendant 1 minute sans lire. Recommencez en améliorant la fluidité.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — École et apprentissage','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — École et apprentissage');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif — École et apprentissage','allemand-a2-m04-l06','exercise','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 4/12 — École et apprentissage
LEÇON 6/8 — Atelier intensif

ATELIER — 12 EXERCICES
1. Traduisez 5 phrases du français vers l’allemand.
2. Transformez 5 affirmations en questions.
3. Corrigez 5 phrases contenant une erreur.
4. Complétez un mini-dialogue de 10 lignes.
5. Remplacez les mots simples par des expressions du module.
6. Faites une dictée avec le bouton audio.
7. Résumez le dialogue en 5 phrases.
8. Parlez 90 secondes sans notes.
9. Écrivez un message réel adapté au thème.
10. Reformulez votre texte dans un registre plus poli.
11. Créez 10 cartes mémoire.
12. Refaites l’exercice le plus difficile après 24 heures.

BANQUE DE PHRASES
• Ich lerne am besten mit Beispielen.
• Diese Aufgabe ist schwierig.
• Kannst du das erklären?
• Ich muss mehr üben.

GRAMMAIRE À RÉUTILISER
comparatif; weil.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — École et apprentissage','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — École et apprentissage');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module — École et apprentissage','allemand-a2-m04-l07','quiz','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 4/12 — École et apprentissage
LEÇON 7/8 — Quiz de module

QUIZ DE VALIDATION — École et apprentissage

Avant de valider, vous devez pouvoir :
• comprendre les quatre expressions du module ;
• expliquer le point de grammaire « comparatif; weil » ;
• créer vos propres exemples ;
• parler spontanément sur le thème ;
• corriger une erreur typique.

AUTO-TEST
1. Dites les quatre exemples sans lire.
2. Créez cinq nouvelles phrases.
3. Expliquez la règle à quelqu’un en français.
4. Répondez à une question imprévue pendant 60 secondes.
5. Écrivez un mini-texte et corrigez-le vous-même.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — École et apprentissage','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — École et apprentissage');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission réelle — École et apprentissage','allemand-a2-m04-l08','exercise','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 4/12 — École et apprentissage
LEÇON 8/8 — Mission réelle

MISSION RÉELLE — École et apprentissage

SCÉNARIO
Vous devez expliquer comment on apprend. Vous n’avez droit qu’à l’allemand.

LIVRABLES
1. Un texte de 80 à 120 mots.
2. Un enregistrement oral de 1 à 2 minutes.
3. Un dialogue de 10 répliques.
4. Une liste de 15 mots ou expressions réellement utiles.
5. Une auto-correction : trois erreurs repérées et expliquées.

CRITÈRES
Clarté, correction, vocabulaire adapté, fluidité et capacité à accomplir la tâche.

EXPRESSIONS À RÉUTILISER
• Ich lerne am besten mit Beispielen.
• Diese Aufgabe ist schwierig.
• Kannst du das erklären?
• Ich muss mehr üben.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — École et apprentissage','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — École et apprentissage');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'A2 · Module 5 — Médias et technologie','Niveau A2 : utiliser et expliquer des outils quotidiens. Grammaire : impératif; datif/accusatif. 8 leçons avec théorie, audio, exercices, quiz et mission réelle.',17) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre — Médias et technologie','allemand-a2-m05-l01','text','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 5/12 — Médias et technologie
LEÇON 1/8 — Comprendre

OBJECTIF
Utiliser et expliquer des outils quotidiens.

EXPLICATION EN FRANÇAIS
À ce niveau, vous devez apprendre à communiquer avec échanges courants, passé, démarches et autonomie quotidienne. Le thème « Médias et technologie » sert de contexte réel. Commencez par comprendre l’intention, puis repérez le verbe, les informations importantes et enfin les détails.

MÉTHODE
1. Lisez les phrases sans traduire mot à mot.
2. Soulignez le verbe conjugué.
3. Repérez qui parle, à qui et dans quel but.
4. Répétez chaque phrase à voix haute trois fois.
5. Changez un élément pour créer votre propre exemple.

EXEMPLES ALLEMANDS
• Mein Handy funktioniert nicht.
• Ich habe die App installiert.
• Schick mir bitte den Link.
• Das WLAN ist langsam.

À RETENIR
Grammaire centrale : impératif; datif/accusatif.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Médias et technologie','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Médias et technologie');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif — Médias et technologie','allemand-a2-m05-l02','text','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 5/12 — Médias et technologie
LEÇON 2/8 — Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur « Médias et technologie ».

VOCABULAIRE À ACTIVER
Handy, Link, Mein, Schick, WLAN, bitte, funktioniert, habe, installiert, langsam, nicht

TECHNIQUE 4 ÉTAPES
1. Écoutez le mot avec le bouton audio.
2. Répétez-le dans une phrase complète.
3. Créez une phrase vraie sur votre vie.
4. Réutilisez-le 24 heures plus tard.

MODÈLES
• Mein Handy funktioniert nicht.
• Ich habe die App installiert.
• Schick mir bitte den Link.
• Das WLAN ist langsam.

EXERCICES
1. Choisissez 10 mots et écrivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez l’allemand et traduisez vos phrases du français vers l’allemand.
4. Enregistrez oralement un résumé de 60 secondes.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Médias et technologie','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Médias et technologie');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation — Médias et technologie','allemand-a2-m05-l03','audio','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 5/12 — Médias et technologie
LEÇON 3/8 — Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÈLE
A: Mein Handy funktioniert nicht.
B: Ich habe die App installiert.
A: Schick mir bitte den Link.
B: Das WLAN ist langsam.

PRONONCIATION
• Écoutez d’abord sans lire.
• Réécoutez en suivant le texte.
• Faites du shadowing : répétez presque en même temps que la voix.
• Jouez ensuite les deux rôles sans regarder.

MISSION ORALE
Créez un nouveau dialogue de 8 à 12 répliques sur le même thème. Utilisez au moins 6 expressions du module. Enregistrez-vous deux fois : une première version lente, puis une version naturelle.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Médias et technologie','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Médias et technologie');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur — Médias et technologie','allemand-a2-m05-l04','text','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 5/12 — Médias et technologie
LEÇON 4/8 — Grammaire en profondeur

POINT DE GRAMMAIRE
impératif; datif/accusatif.

EXPLICATION
La grammaire n’est pas une liste de règles à mémoriser séparément : elle sert à exprimer une intention. Observez d’abord la place du verbe, puis les compléments, et enfin les éléments de temps, cause ou opinion.

EXEMPLES
• Mein Handy funktioniert nicht.
• Ich habe die App installiert.
• Schick mir bitte den Link.
• Das WLAN ist langsam.

TRANSFORMATION GUIDÉE
1. Mettez chaque phrase à la forme négative.
2. Transformez-la en question.
3. Changez la personne grammaticale.
4. Changez le temps si votre niveau le permet.
5. Combinez deux phrases avec un connecteur adapté.

ERREUR FRÉQUENTE
Ne traduisez pas directement l’ordre des mots du français. Vérifiez toujours la position du verbe dans la proposition principale et la subordonnée.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Médias et technologie','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Médias et technologie');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Compréhension et production — Médias et technologie','allemand-a2-m05-l05','exercise','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 5/12 — Médias et technologie
LEÇON 5/8 — Compréhension et production

TEXTE / SITUATION
Imaginez une situation réelle autour de « Médias et technologie ». Les personnes utilisent les expressions suivantes :
• Mein Handy funktioniert nicht.
• Ich habe die App installiert.
• Schick mir bitte den Link.
• Das WLAN ist langsam.

COMPRÉHENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou émotion peut-on déduire ?
4. Reformulez le contenu en français, puis en allemand simple.

PRODUCTION ÉCRITE
Rédigez un texte adapté au niveau A2. Utilisez au moins 8 éléments du module et 3 structures liées à : impératif; datif/accusatif.

PRODUCTION ORALE
Parlez pendant 1 minute sans lire. Recommencez en améliorant la fluidité.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Médias et technologie','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Médias et technologie');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif — Médias et technologie','allemand-a2-m05-l06','exercise','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 5/12 — Médias et technologie
LEÇON 6/8 — Atelier intensif

ATELIER — 12 EXERCICES
1. Traduisez 5 phrases du français vers l’allemand.
2. Transformez 5 affirmations en questions.
3. Corrigez 5 phrases contenant une erreur.
4. Complétez un mini-dialogue de 10 lignes.
5. Remplacez les mots simples par des expressions du module.
6. Faites une dictée avec le bouton audio.
7. Résumez le dialogue en 5 phrases.
8. Parlez 90 secondes sans notes.
9. Écrivez un message réel adapté au thème.
10. Reformulez votre texte dans un registre plus poli.
11. Créez 10 cartes mémoire.
12. Refaites l’exercice le plus difficile après 24 heures.

BANQUE DE PHRASES
• Mein Handy funktioniert nicht.
• Ich habe die App installiert.
• Schick mir bitte den Link.
• Das WLAN ist langsam.

GRAMMAIRE À RÉUTILISER
impératif; datif/accusatif.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Médias et technologie','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Médias et technologie');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module — Médias et technologie','allemand-a2-m05-l07','quiz','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 5/12 — Médias et technologie
LEÇON 7/8 — Quiz de module

QUIZ DE VALIDATION — Médias et technologie

Avant de valider, vous devez pouvoir :
• comprendre les quatre expressions du module ;
• expliquer le point de grammaire « impératif; datif/accusatif » ;
• créer vos propres exemples ;
• parler spontanément sur le thème ;
• corriger une erreur typique.

AUTO-TEST
1. Dites les quatre exemples sans lire.
2. Créez cinq nouvelles phrases.
3. Expliquez la règle à quelqu’un en français.
4. Répondez à une question imprévue pendant 60 secondes.
5. Écrivez un mini-texte et corrigez-le vous-même.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Médias et technologie','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Médias et technologie');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission réelle — Médias et technologie','allemand-a2-m05-l08','exercise','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 5/12 — Médias et technologie
LEÇON 8/8 — Mission réelle

MISSION RÉELLE — Médias et technologie

SCÉNARIO
Vous devez utiliser et expliquer des outils quotidiens. Vous n’avez droit qu’à l’allemand.

LIVRABLES
1. Un texte de 80 à 120 mots.
2. Un enregistrement oral de 1 à 2 minutes.
3. Un dialogue de 10 répliques.
4. Une liste de 15 mots ou expressions réellement utiles.
5. Une auto-correction : trois erreurs repérées et expliquées.

CRITÈRES
Clarté, correction, vocabulaire adapté, fluidité et capacité à accomplir la tâche.

EXPRESSIONS À RÉUTILISER
• Mein Handy funktioniert nicht.
• Ich habe die App installiert.
• Schick mir bitte den Link.
• Das WLAN ist langsam.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Médias et technologie','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Médias et technologie');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'A2 · Module 6 — Relations et émotions','Niveau A2 : exprimer sentiments et opinions simples. Grammaire : weil/dass; adjectifs émotionnels. 8 leçons avec théorie, audio, exercices, quiz et mission réelle.',18) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre — Relations et émotions','allemand-a2-m06-l01','text','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 6/12 — Relations et émotions
LEÇON 1/8 — Comprendre

OBJECTIF
Exprimer sentiments et opinions simples.

EXPLICATION EN FRANÇAIS
À ce niveau, vous devez apprendre à communiquer avec échanges courants, passé, démarches et autonomie quotidienne. Le thème « Relations et émotions » sert de contexte réel. Commencez par comprendre l’intention, puis repérez le verbe, les informations importantes et enfin les détails.

MÉTHODE
1. Lisez les phrases sans traduire mot à mot.
2. Soulignez le verbe conjugué.
3. Repérez qui parle, à qui et dans quel but.
4. Répétez chaque phrase à voix haute trois fois.
5. Changez un élément pour créer votre propre exemple.

EXEMPLES ALLEMANDS
• Ich freue mich.
• Das macht mich traurig.
• Ich finde das wichtig.
• Meiner Meinung nach …

À RETENIR
Grammaire centrale : weil/dass; adjectifs émotionnels.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Relations et émotions','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Relations et émotions');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif — Relations et émotions','allemand-a2-m06-l02','text','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 6/12 — Relations et émotions
LEÇON 2/8 — Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur « Relations et émotions ».

VOCABULAIRE À ACTIVER
Meiner, Meinung, finde, freue, macht, mich, nach, traurig, wichtig

TECHNIQUE 4 ÉTAPES
1. Écoutez le mot avec le bouton audio.
2. Répétez-le dans une phrase complète.
3. Créez une phrase vraie sur votre vie.
4. Réutilisez-le 24 heures plus tard.

MODÈLES
• Ich freue mich.
• Das macht mich traurig.
• Ich finde das wichtig.
• Meiner Meinung nach …

EXERCICES
1. Choisissez 10 mots et écrivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez l’allemand et traduisez vos phrases du français vers l’allemand.
4. Enregistrez oralement un résumé de 60 secondes.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Relations et émotions','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Relations et émotions');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation — Relations et émotions','allemand-a2-m06-l03','audio','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 6/12 — Relations et émotions
LEÇON 3/8 — Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÈLE
A: Ich freue mich.
B: Das macht mich traurig.
A: Ich finde das wichtig.
B: Meiner Meinung nach …

PRONONCIATION
• Écoutez d’abord sans lire.
• Réécoutez en suivant le texte.
• Faites du shadowing : répétez presque en même temps que la voix.
• Jouez ensuite les deux rôles sans regarder.

MISSION ORALE
Créez un nouveau dialogue de 8 à 12 répliques sur le même thème. Utilisez au moins 6 expressions du module. Enregistrez-vous deux fois : une première version lente, puis une version naturelle.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Relations et émotions','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Relations et émotions');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur — Relations et émotions','allemand-a2-m06-l04','text','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 6/12 — Relations et émotions
LEÇON 4/8 — Grammaire en profondeur

POINT DE GRAMMAIRE
weil/dass; adjectifs émotionnels.

EXPLICATION
La grammaire n’est pas une liste de règles à mémoriser séparément : elle sert à exprimer une intention. Observez d’abord la place du verbe, puis les compléments, et enfin les éléments de temps, cause ou opinion.

EXEMPLES
• Ich freue mich.
• Das macht mich traurig.
• Ich finde das wichtig.
• Meiner Meinung nach …

TRANSFORMATION GUIDÉE
1. Mettez chaque phrase à la forme négative.
2. Transformez-la en question.
3. Changez la personne grammaticale.
4. Changez le temps si votre niveau le permet.
5. Combinez deux phrases avec un connecteur adapté.

ERREUR FRÉQUENTE
Ne traduisez pas directement l’ordre des mots du français. Vérifiez toujours la position du verbe dans la proposition principale et la subordonnée.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Relations et émotions','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Relations et émotions');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Compréhension et production — Relations et émotions','allemand-a2-m06-l05','exercise','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 6/12 — Relations et émotions
LEÇON 5/8 — Compréhension et production

TEXTE / SITUATION
Imaginez une situation réelle autour de « Relations et émotions ». Les personnes utilisent les expressions suivantes :
• Ich freue mich.
• Das macht mich traurig.
• Ich finde das wichtig.
• Meiner Meinung nach …

COMPRÉHENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou émotion peut-on déduire ?
4. Reformulez le contenu en français, puis en allemand simple.

PRODUCTION ÉCRITE
Rédigez un texte adapté au niveau A2. Utilisez au moins 8 éléments du module et 3 structures liées à : weil/dass; adjectifs émotionnels.

PRODUCTION ORALE
Parlez pendant 1 minute sans lire. Recommencez en améliorant la fluidité.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Relations et émotions','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Relations et émotions');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif — Relations et émotions','allemand-a2-m06-l06','exercise','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 6/12 — Relations et émotions
LEÇON 6/8 — Atelier intensif

ATELIER — 12 EXERCICES
1. Traduisez 5 phrases du français vers l’allemand.
2. Transformez 5 affirmations en questions.
3. Corrigez 5 phrases contenant une erreur.
4. Complétez un mini-dialogue de 10 lignes.
5. Remplacez les mots simples par des expressions du module.
6. Faites une dictée avec le bouton audio.
7. Résumez le dialogue en 5 phrases.
8. Parlez 90 secondes sans notes.
9. Écrivez un message réel adapté au thème.
10. Reformulez votre texte dans un registre plus poli.
11. Créez 10 cartes mémoire.
12. Refaites l’exercice le plus difficile après 24 heures.

BANQUE DE PHRASES
• Ich freue mich.
• Das macht mich traurig.
• Ich finde das wichtig.
• Meiner Meinung nach …

GRAMMAIRE À RÉUTILISER
weil/dass; adjectifs émotionnels.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Relations et émotions','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Relations et émotions');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module — Relations et émotions','allemand-a2-m06-l07','quiz','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 6/12 — Relations et émotions
LEÇON 7/8 — Quiz de module

QUIZ DE VALIDATION — Relations et émotions

Avant de valider, vous devez pouvoir :
• comprendre les quatre expressions du module ;
• expliquer le point de grammaire « weil/dass; adjectifs émotionnels » ;
• créer vos propres exemples ;
• parler spontanément sur le thème ;
• corriger une erreur typique.

AUTO-TEST
1. Dites les quatre exemples sans lire.
2. Créez cinq nouvelles phrases.
3. Expliquez la règle à quelqu’un en français.
4. Répondez à une question imprévue pendant 60 secondes.
5. Écrivez un mini-texte et corrigez-le vous-même.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Relations et émotions','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Relations et émotions');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission réelle — Relations et émotions','allemand-a2-m06-l08','exercise','ALLEMAND FONCTIONNEL — NIVEAU A2
MODULE 6/12 — Relations et émotions
LEÇON 8/8 — Mission réelle

MISSION RÉELLE — Relations et émotions

SCÉNARIO
Vous devez exprimer sentiments et opinions simples. Vous n’avez droit qu’à l’allemand.

LIVRABLES
1. Un texte de 80 à 120 mots.
2. Un enregistrement oral de 1 à 2 minutes.
3. Un dialogue de 10 répliques.
4. Une liste de 15 mots ou expressions réellement utiles.
5. Une auto-correction : trois erreurs repérées et expliquées.

CRITÈRES
Clarté, correction, vocabulaire adapté, fluidité et capacité à accomplir la tâche.

EXPRESSIONS À RÉUTILISER
• Ich freue mich.
• Das macht mich traurig.
• Ich finde das wichtig.
• Meiner Meinung nach …

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2100,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Relations et émotions','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Relations et émotions');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
END $$;

SELECT 'Partie 3/10 installée : modules 13 à 18' AS resultat;
