-- StudyLink 019 - Allemand A1-C1 - Partie 5/10
-- Modules 25 à 30
DO $$
DECLARE v_course UUID; v_module UUID; v_lesson UUID;
BEGIN
  SELECT id INTO v_course FROM public.courses WHERE slug='allemand-fonctionnel-a1-c1' ORDER BY created_at DESC NULLS LAST LIMIT 1;
  IF v_course IS NULL THEN RAISE EXCEPTION 'Le cours allemand n existe pas encore. Executez d abord la partie 01.'; END IF;
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B1 · Module 1 — Récits détaillés','Niveau B1 : raconter clairement un événement. Grammaire : Präteritum fréquent; als; obwohl. 8 leçons avec théorie, audio, exercices, quiz et mission réelle.',25) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre — Récits détaillés','allemand-b1-m01-l01','text','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 1/12 — Récits détaillés
LEÇON 1/8 — Comprendre

OBJECTIF
Raconter clairement un événement.

EXPLICATION EN FRANÇAIS
À ce niveau, vous devez apprendre à communiquer avec discours suivi, justification, récit et communication professionnelle simple. Le thème « Récits détaillés » sert de contexte réel. Commencez par comprendre l’intention, puis repérez le verbe, les informations importantes et enfin les détails.

MÉTHODE
1. Lisez les phrases sans traduire mot à mot.
2. Soulignez le verbe conjugué.
3. Repérez qui parle, à qui et dans quel but.
4. Répétez chaque phrase à voix haute trois fois.
5. Changez un élément pour créer votre propre exemple.

EXEMPLES ALLEMANDS
• Als ich klein war, …
• Plötzlich passierte etwas.
• Obwohl ich müde war, …
• Am Ende war ich erleichtert.

À RETENIR
Grammaire centrale : Präteritum fréquent; als; obwohl.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Récits détaillés','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Récits détaillés');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif — Récits détaillés','allemand-b1-m01-l02','text','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 1/12 — Récits détaillés
LEÇON 2/8 — Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur « Récits détaillés ».

VOCABULAIRE À ACTIVER
Ende, Obwohl, Plötzlich, erleichtert, etwas, klein, müde, passierte

TECHNIQUE 4 ÉTAPES
1. Écoutez le mot avec le bouton audio.
2. Répétez-le dans une phrase complète.
3. Créez une phrase vraie sur votre vie.
4. Réutilisez-le 24 heures plus tard.

MODÈLES
• Als ich klein war, …
• Plötzlich passierte etwas.
• Obwohl ich müde war, …
• Am Ende war ich erleichtert.

EXERCICES
1. Choisissez 10 mots et écrivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez l’allemand et traduisez vos phrases du français vers l’allemand.
4. Enregistrez oralement un résumé de 60 secondes.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Récits détaillés','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Récits détaillés');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation — Récits détaillés','allemand-b1-m01-l03','audio','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 1/12 — Récits détaillés
LEÇON 3/8 — Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÈLE
A: Als ich klein war, …
B: Plötzlich passierte etwas.
A: Obwohl ich müde war, …
B: Am Ende war ich erleichtert.

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Récits détaillés','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Récits détaillés');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur — Récits détaillés','allemand-b1-m01-l04','text','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 1/12 — Récits détaillés
LEÇON 4/8 — Grammaire en profondeur

POINT DE GRAMMAIRE
Präteritum fréquent; als; obwohl.

EXPLICATION
La grammaire n’est pas une liste de règles à mémoriser séparément : elle sert à exprimer une intention. Observez d’abord la place du verbe, puis les compléments, et enfin les éléments de temps, cause ou opinion.

EXEMPLES
• Als ich klein war, …
• Plötzlich passierte etwas.
• Obwohl ich müde war, …
• Am Ende war ich erleichtert.

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Récits détaillés','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Récits détaillés');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Compréhension et production — Récits détaillés','allemand-b1-m01-l05','exercise','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 1/12 — Récits détaillés
LEÇON 5/8 — Compréhension et production

TEXTE / SITUATION
Imaginez une situation réelle autour de « Récits détaillés ». Les personnes utilisent les expressions suivantes :
• Als ich klein war, …
• Plötzlich passierte etwas.
• Obwohl ich müde war, …
• Am Ende war ich erleichtert.

COMPRÉHENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou émotion peut-on déduire ?
4. Reformulez le contenu en français, puis en allemand simple.

PRODUCTION ÉCRITE
Rédigez un texte adapté au niveau B1. Utilisez au moins 8 éléments du module et 3 structures liées à : Präteritum fréquent; als; obwohl.

PRODUCTION ORALE
Parlez pendant 2 à 4 minutes sans lire. Recommencez en améliorant la fluidité.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Récits détaillés','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Récits détaillés');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif — Récits détaillés','allemand-b1-m01-l06','exercise','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 1/12 — Récits détaillés
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
• Als ich klein war, …
• Plötzlich passierte etwas.
• Obwohl ich müde war, …
• Am Ende war ich erleichtert.

GRAMMAIRE À RÉUTILISER
Präteritum fréquent; als; obwohl.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Récits détaillés','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Récits détaillés');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module — Récits détaillés','allemand-b1-m01-l07','quiz','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 1/12 — Récits détaillés
LEÇON 7/8 — Quiz de module

QUIZ DE VALIDATION — Récits détaillés

Avant de valider, vous devez pouvoir :
• comprendre les quatre expressions du module ;
• expliquer le point de grammaire « Präteritum fréquent; als; obwohl » ;
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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Récits détaillés','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Récits détaillés');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission réelle — Récits détaillés','allemand-b1-m01-l08','exercise','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 1/12 — Récits détaillés
LEÇON 8/8 — Mission réelle

MISSION RÉELLE — Récits détaillés

SCÉNARIO
Vous devez raconter clairement un événement. Vous n’avez droit qu’à l’allemand.

LIVRABLES
1. Un texte de 180 à 350 mots.
2. Un enregistrement oral de 3 à 6 minutes.
3. Un dialogue de 10 répliques.
4. Une liste de 15 mots ou expressions réellement utiles.
5. Une auto-correction : trois erreurs repérées et expliquées.

CRITÈRES
Clarté, correction, vocabulaire adapté, fluidité et capacité à accomplir la tâche.

EXPRESSIONS À RÉUTILISER
• Als ich klein war, …
• Plötzlich passierte etwas.
• Obwohl ich müde war, …
• Am Ende war ich erleichtert.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Récits détaillés','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Récits détaillés');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B1 · Module 2 — Argumentation du quotidien','Niveau B1 : développer une opinion avec arguments. Grammaire : connecteurs; dass/obwohl. 8 leçons avec théorie, audio, exercices, quiz et mission réelle.',26) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre — Argumentation du quotidien','allemand-b1-m02-l01','text','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 2/12 — Argumentation du quotidien
LEÇON 1/8 — Comprendre

OBJECTIF
Développer une opinion avec arguments.

EXPLICATION EN FRANÇAIS
À ce niveau, vous devez apprendre à communiquer avec discours suivi, justification, récit et communication professionnelle simple. Le thème « Argumentation du quotidien » sert de contexte réel. Commencez par comprendre l’intention, puis repérez le verbe, les informations importantes et enfin les détails.

MÉTHODE
1. Lisez les phrases sans traduire mot à mot.
2. Soulignez le verbe conjugué.
3. Repérez qui parle, à qui et dans quel but.
4. Répétez chaque phrase à voix haute trois fois.
5. Changez un élément pour créer votre propre exemple.

EXEMPLES ALLEMANDS
• Ich vertrete die Ansicht, dass …
• Ein Vorteil ist …
• Andererseits …
• Zusammenfassend …

À RETENIR
Grammaire centrale : connecteurs; dass/obwohl.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Argumentation du quotidien','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Argumentation du quotidien');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif — Argumentation du quotidien','allemand-b1-m02-l02','text','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 2/12 — Argumentation du quotidien
LEÇON 2/8 — Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur « Argumentation du quotidien ».

VOCABULAIRE À ACTIVER
Andererseits, Ansicht, Vorteil, Zusammenfassend, dass, vertrete

TECHNIQUE 4 ÉTAPES
1. Écoutez le mot avec le bouton audio.
2. Répétez-le dans une phrase complète.
3. Créez une phrase vraie sur votre vie.
4. Réutilisez-le 24 heures plus tard.

MODÈLES
• Ich vertrete die Ansicht, dass …
• Ein Vorteil ist …
• Andererseits …
• Zusammenfassend …

EXERCICES
1. Choisissez 10 mots et écrivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez l’allemand et traduisez vos phrases du français vers l’allemand.
4. Enregistrez oralement un résumé de 60 secondes.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Argumentation du quotidien','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Argumentation du quotidien');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation — Argumentation du quotidien','allemand-b1-m02-l03','audio','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 2/12 — Argumentation du quotidien
LEÇON 3/8 — Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÈLE
A: Ich vertrete die Ansicht, dass …
B: Ein Vorteil ist …
A: Andererseits …
B: Zusammenfassend …

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Argumentation du quotidien','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Argumentation du quotidien');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur — Argumentation du quotidien','allemand-b1-m02-l04','text','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 2/12 — Argumentation du quotidien
LEÇON 4/8 — Grammaire en profondeur

POINT DE GRAMMAIRE
connecteurs; dass/obwohl.

EXPLICATION
La grammaire n’est pas une liste de règles à mémoriser séparément : elle sert à exprimer une intention. Observez d’abord la place du verbe, puis les compléments, et enfin les éléments de temps, cause ou opinion.

EXEMPLES
• Ich vertrete die Ansicht, dass …
• Ein Vorteil ist …
• Andererseits …
• Zusammenfassend …

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Argumentation du quotidien','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Argumentation du quotidien');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Compréhension et production — Argumentation du quotidien','allemand-b1-m02-l05','exercise','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 2/12 — Argumentation du quotidien
LEÇON 5/8 — Compréhension et production

TEXTE / SITUATION
Imaginez une situation réelle autour de « Argumentation du quotidien ». Les personnes utilisent les expressions suivantes :
• Ich vertrete die Ansicht, dass …
• Ein Vorteil ist …
• Andererseits …
• Zusammenfassend …

COMPRÉHENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou émotion peut-on déduire ?
4. Reformulez le contenu en français, puis en allemand simple.

PRODUCTION ÉCRITE
Rédigez un texte adapté au niveau B1. Utilisez au moins 8 éléments du module et 3 structures liées à : connecteurs; dass/obwohl.

PRODUCTION ORALE
Parlez pendant 2 à 4 minutes sans lire. Recommencez en améliorant la fluidité.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Argumentation du quotidien','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Argumentation du quotidien');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif — Argumentation du quotidien','allemand-b1-m02-l06','exercise','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 2/12 — Argumentation du quotidien
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
• Ich vertrete die Ansicht, dass …
• Ein Vorteil ist …
• Andererseits …
• Zusammenfassend …

GRAMMAIRE À RÉUTILISER
connecteurs; dass/obwohl.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Argumentation du quotidien','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Argumentation du quotidien');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module — Argumentation du quotidien','allemand-b1-m02-l07','quiz','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 2/12 — Argumentation du quotidien
LEÇON 7/8 — Quiz de module

QUIZ DE VALIDATION — Argumentation du quotidien

Avant de valider, vous devez pouvoir :
• comprendre les quatre expressions du module ;
• expliquer le point de grammaire « connecteurs; dass/obwohl » ;
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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Argumentation du quotidien','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Argumentation du quotidien');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission réelle — Argumentation du quotidien','allemand-b1-m02-l08','exercise','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 2/12 — Argumentation du quotidien
LEÇON 8/8 — Mission réelle

MISSION RÉELLE — Argumentation du quotidien

SCÉNARIO
Vous devez développer une opinion avec arguments. Vous n’avez droit qu’à l’allemand.

LIVRABLES
1. Un texte de 180 à 350 mots.
2. Un enregistrement oral de 3 à 6 minutes.
3. Un dialogue de 10 répliques.
4. Une liste de 15 mots ou expressions réellement utiles.
5. Une auto-correction : trois erreurs repérées et expliquées.

CRITÈRES
Clarté, correction, vocabulaire adapté, fluidité et capacité à accomplir la tâche.

EXPRESSIONS À RÉUTILISER
• Ich vertrete die Ansicht, dass …
• Ein Vorteil ist …
• Andererseits …
• Zusammenfassend …

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Argumentation du quotidien','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Argumentation du quotidien');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B1 · Module 3 — Travail et entretien','Niveau B1 : répondre à un entretien professionnel. Grammaire : Konjunktiv II poli; infinitif zu. 8 leçons avec théorie, audio, exercices, quiz et mission réelle.',27) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre — Travail et entretien','allemand-b1-m03-l01','text','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 3/12 — Travail et entretien
LEÇON 1/8 — Comprendre

OBJECTIF
Répondre à un entretien professionnel.

EXPLICATION EN FRANÇAIS
À ce niveau, vous devez apprendre à communiquer avec discours suivi, justification, récit et communication professionnelle simple. Le thème « Travail et entretien » sert de contexte réel. Commencez par comprendre l’intention, puis repérez le verbe, les informations importantes et enfin les détails.

MÉTHODE
1. Lisez les phrases sans traduire mot à mot.
2. Soulignez le verbe conjugué.
3. Repérez qui parle, à qui et dans quel but.
4. Répétez chaque phrase à voix haute trois fois.
5. Changez un élément pour créer votre propre exemple.

EXEMPLES ALLEMANDS
• Ich interessiere mich für diese Stelle.
• Zu meinen Stärken gehören …
• Ich habe gelernt, …
• Könnten Sie die Aufgabe genauer beschreiben?

À RETENIR
Grammaire centrale : Konjunktiv II poli; infinitif zu.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Travail et entretien','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Travail et entretien');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif — Travail et entretien','allemand-b1-m03-l02','text','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 3/12 — Travail et entretien
LEÇON 2/8 — Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur « Travail et entretien ».

VOCABULAIRE À ACTIVER
Aufgabe, Könnten, Stelle, Stärken, beschreiben, diese, gehören, gelernt, genauer, habe, interessiere, meinen, mich

TECHNIQUE 4 ÉTAPES
1. Écoutez le mot avec le bouton audio.
2. Répétez-le dans une phrase complète.
3. Créez une phrase vraie sur votre vie.
4. Réutilisez-le 24 heures plus tard.

MODÈLES
• Ich interessiere mich für diese Stelle.
• Zu meinen Stärken gehören …
• Ich habe gelernt, …
• Könnten Sie die Aufgabe genauer beschreiben?

EXERCICES
1. Choisissez 10 mots et écrivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez l’allemand et traduisez vos phrases du français vers l’allemand.
4. Enregistrez oralement un résumé de 60 secondes.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Travail et entretien','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Travail et entretien');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation — Travail et entretien','allemand-b1-m03-l03','audio','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 3/12 — Travail et entretien
LEÇON 3/8 — Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÈLE
A: Ich interessiere mich für diese Stelle.
B: Zu meinen Stärken gehören …
A: Ich habe gelernt, …
B: Könnten Sie die Aufgabe genauer beschreiben?

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Travail et entretien','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Travail et entretien');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur — Travail et entretien','allemand-b1-m03-l04','text','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 3/12 — Travail et entretien
LEÇON 4/8 — Grammaire en profondeur

POINT DE GRAMMAIRE
Konjunktiv II poli; infinitif zu.

EXPLICATION
La grammaire n’est pas une liste de règles à mémoriser séparément : elle sert à exprimer une intention. Observez d’abord la place du verbe, puis les compléments, et enfin les éléments de temps, cause ou opinion.

EXEMPLES
• Ich interessiere mich für diese Stelle.
• Zu meinen Stärken gehören …
• Ich habe gelernt, …
• Könnten Sie die Aufgabe genauer beschreiben?

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Travail et entretien','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Travail et entretien');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Compréhension et production — Travail et entretien','allemand-b1-m03-l05','exercise','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 3/12 — Travail et entretien
LEÇON 5/8 — Compréhension et production

TEXTE / SITUATION
Imaginez une situation réelle autour de « Travail et entretien ». Les personnes utilisent les expressions suivantes :
• Ich interessiere mich für diese Stelle.
• Zu meinen Stärken gehören …
• Ich habe gelernt, …
• Könnten Sie die Aufgabe genauer beschreiben?

COMPRÉHENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou émotion peut-on déduire ?
4. Reformulez le contenu en français, puis en allemand simple.

PRODUCTION ÉCRITE
Rédigez un texte adapté au niveau B1. Utilisez au moins 8 éléments du module et 3 structures liées à : Konjunktiv II poli; infinitif zu.

PRODUCTION ORALE
Parlez pendant 2 à 4 minutes sans lire. Recommencez en améliorant la fluidité.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Travail et entretien','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Travail et entretien');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif — Travail et entretien','allemand-b1-m03-l06','exercise','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 3/12 — Travail et entretien
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
• Ich interessiere mich für diese Stelle.
• Zu meinen Stärken gehören …
• Ich habe gelernt, …
• Könnten Sie die Aufgabe genauer beschreiben?

GRAMMAIRE À RÉUTILISER
Konjunktiv II poli; infinitif zu.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Travail et entretien','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Travail et entretien');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module — Travail et entretien','allemand-b1-m03-l07','quiz','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 3/12 — Travail et entretien
LEÇON 7/8 — Quiz de module

QUIZ DE VALIDATION — Travail et entretien

Avant de valider, vous devez pouvoir :
• comprendre les quatre expressions du module ;
• expliquer le point de grammaire « Konjunktiv II poli; infinitif zu » ;
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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Travail et entretien','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Travail et entretien');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission réelle — Travail et entretien','allemand-b1-m03-l08','exercise','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 3/12 — Travail et entretien
LEÇON 8/8 — Mission réelle

MISSION RÉELLE — Travail et entretien

SCÉNARIO
Vous devez répondre à un entretien professionnel. Vous n’avez droit qu’à l’allemand.

LIVRABLES
1. Un texte de 180 à 350 mots.
2. Un enregistrement oral de 3 à 6 minutes.
3. Un dialogue de 10 répliques.
4. Une liste de 15 mots ou expressions réellement utiles.
5. Une auto-correction : trois erreurs repérées et expliquées.

CRITÈRES
Clarté, correction, vocabulaire adapté, fluidité et capacité à accomplir la tâche.

EXPRESSIONS À RÉUTILISER
• Ich interessiere mich für diese Stelle.
• Zu meinen Stärken gehören …
• Ich habe gelernt, …
• Könnten Sie die Aufgabe genauer beschreiben?

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Travail et entretien','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Travail et entretien');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B1 · Module 4 — Études et présentations','Niveau B1 : faire une présentation structurée. Grammaire : structure du discours; passif introduction. 8 leçons avec théorie, audio, exercices, quiz et mission réelle.',28) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre — Études et présentations','allemand-b1-m04-l01','text','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 4/12 — Études et présentations
LEÇON 1/8 — Comprendre

OBJECTIF
Faire une présentation structurée.

EXPLICATION EN FRANÇAIS
À ce niveau, vous devez apprendre à communiquer avec discours suivi, justification, récit et communication professionnelle simple. Le thème « Études et présentations » sert de contexte réel. Commencez par comprendre l’intention, puis repérez le verbe, les informations importantes et enfin les détails.

MÉTHODE
1. Lisez les phrases sans traduire mot à mot.
2. Soulignez le verbe conjugué.
3. Repérez qui parle, à qui et dans quel but.
4. Répétez chaque phrase à voix haute trois fois.
5. Changez un élément pour créer votre propre exemple.

EXEMPLES ALLEMANDS
• Heute spreche ich über …
• Zunächst möchte ich …
• Wie die Grafik zeigt …
• Vielen Dank für Ihre Aufmerksamkeit.

À RETENIR
Grammaire centrale : structure du discours; passif introduction.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Études et présentations','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Études et présentations');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif — Études et présentations','allemand-b1-m04-l02','text','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 4/12 — Études et présentations
LEÇON 2/8 — Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur « Études et présentations ».

VOCABULAIRE À ACTIVER
Aufmerksamkeit, Dank, Grafik, Heute, Ihre, Vielen, Zunächst, möchte, spreche, zeigt, über

TECHNIQUE 4 ÉTAPES
1. Écoutez le mot avec le bouton audio.
2. Répétez-le dans une phrase complète.
3. Créez une phrase vraie sur votre vie.
4. Réutilisez-le 24 heures plus tard.

MODÈLES
• Heute spreche ich über …
• Zunächst möchte ich …
• Wie die Grafik zeigt …
• Vielen Dank für Ihre Aufmerksamkeit.

EXERCICES
1. Choisissez 10 mots et écrivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez l’allemand et traduisez vos phrases du français vers l’allemand.
4. Enregistrez oralement un résumé de 60 secondes.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Études et présentations','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Études et présentations');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation — Études et présentations','allemand-b1-m04-l03','audio','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 4/12 — Études et présentations
LEÇON 3/8 — Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÈLE
A: Heute spreche ich über …
B: Zunächst möchte ich …
A: Wie die Grafik zeigt …
B: Vielen Dank für Ihre Aufmerksamkeit.

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Études et présentations','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Études et présentations');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur — Études et présentations','allemand-b1-m04-l04','text','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 4/12 — Études et présentations
LEÇON 4/8 — Grammaire en profondeur

POINT DE GRAMMAIRE
structure du discours; passif introduction.

EXPLICATION
La grammaire n’est pas une liste de règles à mémoriser séparément : elle sert à exprimer une intention. Observez d’abord la place du verbe, puis les compléments, et enfin les éléments de temps, cause ou opinion.

EXEMPLES
• Heute spreche ich über …
• Zunächst möchte ich …
• Wie die Grafik zeigt …
• Vielen Dank für Ihre Aufmerksamkeit.

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Études et présentations','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Études et présentations');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Compréhension et production — Études et présentations','allemand-b1-m04-l05','exercise','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 4/12 — Études et présentations
LEÇON 5/8 — Compréhension et production

TEXTE / SITUATION
Imaginez une situation réelle autour de « Études et présentations ». Les personnes utilisent les expressions suivantes :
• Heute spreche ich über …
• Zunächst möchte ich …
• Wie die Grafik zeigt …
• Vielen Dank für Ihre Aufmerksamkeit.

COMPRÉHENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou émotion peut-on déduire ?
4. Reformulez le contenu en français, puis en allemand simple.

PRODUCTION ÉCRITE
Rédigez un texte adapté au niveau B1. Utilisez au moins 8 éléments du module et 3 structures liées à : structure du discours; passif introduction.

PRODUCTION ORALE
Parlez pendant 2 à 4 minutes sans lire. Recommencez en améliorant la fluidité.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Études et présentations','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Études et présentations');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif — Études et présentations','allemand-b1-m04-l06','exercise','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 4/12 — Études et présentations
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
• Heute spreche ich über …
• Zunächst möchte ich …
• Wie die Grafik zeigt …
• Vielen Dank für Ihre Aufmerksamkeit.

GRAMMAIRE À RÉUTILISER
structure du discours; passif introduction.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Études et présentations','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Études et présentations');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module — Études et présentations','allemand-b1-m04-l07','quiz','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 4/12 — Études et présentations
LEÇON 7/8 — Quiz de module

QUIZ DE VALIDATION — Études et présentations

Avant de valider, vous devez pouvoir :
• comprendre les quatre expressions du module ;
• expliquer le point de grammaire « structure du discours; passif introduction » ;
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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Études et présentations','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Études et présentations');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission réelle — Études et présentations','allemand-b1-m04-l08','exercise','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 4/12 — Études et présentations
LEÇON 8/8 — Mission réelle

MISSION RÉELLE — Études et présentations

SCÉNARIO
Vous devez faire une présentation structurée. Vous n’avez droit qu’à l’allemand.

LIVRABLES
1. Un texte de 180 à 350 mots.
2. Un enregistrement oral de 3 à 6 minutes.
3. Un dialogue de 10 répliques.
4. Une liste de 15 mots ou expressions réellement utiles.
5. Une auto-correction : trois erreurs repérées et expliquées.

CRITÈRES
Clarté, correction, vocabulaire adapté, fluidité et capacité à accomplir la tâche.

EXPRESSIONS À RÉUTILISER
• Heute spreche ich über …
• Zunächst möchte ich …
• Wie die Grafik zeigt …
• Vielen Dank für Ihre Aufmerksamkeit.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Études et présentations','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Études et présentations');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B1 · Module 5 — Santé et mode de vie','Niveau B1 : discuter habitudes et recommandations. Grammaire : sollte; würde; sich vornehmen. 8 leçons avec théorie, audio, exercices, quiz et mission réelle.',29) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre — Santé et mode de vie','allemand-b1-m05-l01','text','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 5/12 — Santé et mode de vie
LEÇON 1/8 — Comprendre

OBJECTIF
Discuter habitudes et recommandations.

EXPLICATION EN FRANÇAIS
À ce niveau, vous devez apprendre à communiquer avec discours suivi, justification, récit et communication professionnelle simple. Le thème « Santé et mode de vie » sert de contexte réel. Commencez par comprendre l’intention, puis repérez le verbe, les informations importantes et enfin les détails.

MÉTHODE
1. Lisez les phrases sans traduire mot à mot.
2. Soulignez le verbe conjugué.
3. Repérez qui parle, à qui et dans quel but.
4. Répétez chaque phrase à voix haute trois fois.
5. Changez un élément pour créer votre propre exemple.

EXEMPLES ALLEMANDS
• Man sollte regelmäßig schlafen.
• Wenn man Stress hat, …
• Es wäre besser, …
• Ich habe mir vorgenommen, …

À RETENIR
Grammaire centrale : sollte; würde; sich vornehmen.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Santé et mode de vie','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Santé et mode de vie');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif — Santé et mode de vie','allemand-b1-m05-l02','text','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 5/12 — Santé et mode de vie
LEÇON 2/8 — Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur « Santé et mode de vie ».

VOCABULAIRE À ACTIVER
Stress, Wenn, besser, habe, regelmäßig, schlafen, sollte, vorgenommen, wäre

TECHNIQUE 4 ÉTAPES
1. Écoutez le mot avec le bouton audio.
2. Répétez-le dans une phrase complète.
3. Créez une phrase vraie sur votre vie.
4. Réutilisez-le 24 heures plus tard.

MODÈLES
• Man sollte regelmäßig schlafen.
• Wenn man Stress hat, …
• Es wäre besser, …
• Ich habe mir vorgenommen, …

EXERCICES
1. Choisissez 10 mots et écrivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez l’allemand et traduisez vos phrases du français vers l’allemand.
4. Enregistrez oralement un résumé de 60 secondes.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Santé et mode de vie','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Santé et mode de vie');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation — Santé et mode de vie','allemand-b1-m05-l03','audio','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 5/12 — Santé et mode de vie
LEÇON 3/8 — Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÈLE
A: Man sollte regelmäßig schlafen.
B: Wenn man Stress hat, …
A: Es wäre besser, …
B: Ich habe mir vorgenommen, …

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Santé et mode de vie','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Santé et mode de vie');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur — Santé et mode de vie','allemand-b1-m05-l04','text','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 5/12 — Santé et mode de vie
LEÇON 4/8 — Grammaire en profondeur

POINT DE GRAMMAIRE
sollte; würde; sich vornehmen.

EXPLICATION
La grammaire n’est pas une liste de règles à mémoriser séparément : elle sert à exprimer une intention. Observez d’abord la place du verbe, puis les compléments, et enfin les éléments de temps, cause ou opinion.

EXEMPLES
• Man sollte regelmäßig schlafen.
• Wenn man Stress hat, …
• Es wäre besser, …
• Ich habe mir vorgenommen, …

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Santé et mode de vie','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Santé et mode de vie');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Compréhension et production — Santé et mode de vie','allemand-b1-m05-l05','exercise','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 5/12 — Santé et mode de vie
LEÇON 5/8 — Compréhension et production

TEXTE / SITUATION
Imaginez une situation réelle autour de « Santé et mode de vie ». Les personnes utilisent les expressions suivantes :
• Man sollte regelmäßig schlafen.
• Wenn man Stress hat, …
• Es wäre besser, …
• Ich habe mir vorgenommen, …

COMPRÉHENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou émotion peut-on déduire ?
4. Reformulez le contenu en français, puis en allemand simple.

PRODUCTION ÉCRITE
Rédigez un texte adapté au niveau B1. Utilisez au moins 8 éléments du module et 3 structures liées à : sollte; würde; sich vornehmen.

PRODUCTION ORALE
Parlez pendant 2 à 4 minutes sans lire. Recommencez en améliorant la fluidité.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Santé et mode de vie','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Santé et mode de vie');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif — Santé et mode de vie','allemand-b1-m05-l06','exercise','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 5/12 — Santé et mode de vie
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
• Man sollte regelmäßig schlafen.
• Wenn man Stress hat, …
• Es wäre besser, …
• Ich habe mir vorgenommen, …

GRAMMAIRE À RÉUTILISER
sollte; würde; sich vornehmen.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Santé et mode de vie','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Santé et mode de vie');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module — Santé et mode de vie','allemand-b1-m05-l07','quiz','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 5/12 — Santé et mode de vie
LEÇON 7/8 — Quiz de module

QUIZ DE VALIDATION — Santé et mode de vie

Avant de valider, vous devez pouvoir :
• comprendre les quatre expressions du module ;
• expliquer le point de grammaire « sollte; würde; sich vornehmen » ;
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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Santé et mode de vie','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Santé et mode de vie');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission réelle — Santé et mode de vie','allemand-b1-m05-l08','exercise','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 5/12 — Santé et mode de vie
LEÇON 8/8 — Mission réelle

MISSION RÉELLE — Santé et mode de vie

SCÉNARIO
Vous devez discuter habitudes et recommandations. Vous n’avez droit qu’à l’allemand.

LIVRABLES
1. Un texte de 180 à 350 mots.
2. Un enregistrement oral de 3 à 6 minutes.
3. Un dialogue de 10 répliques.
4. Une liste de 15 mots ou expressions réellement utiles.
5. Une auto-correction : trois erreurs repérées et expliquées.

CRITÈRES
Clarté, correction, vocabulaire adapté, fluidité et capacité à accomplir la tâche.

EXPRESSIONS À RÉUTILISER
• Man sollte regelmäßig schlafen.
• Wenn man Stress hat, …
• Es wäre besser, …
• Ich habe mir vorgenommen, …

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Santé et mode de vie','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Santé et mode de vie');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B1 · Module 6 — Actualité et médias','Niveau B1 : résumer une information et distinguer les sources. Grammaire : discours indirect introductif; passif. 8 leçons avec théorie, audio, exercices, quiz et mission réelle.',30) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre — Actualité et médias','allemand-b1-m06-l01','text','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 6/12 — Actualité et médias
LEÇON 1/8 — Comprendre

OBJECTIF
Résumer une information et distinguer les sources.

EXPLICATION EN FRANÇAIS
À ce niveau, vous devez apprendre à communiquer avec discours suivi, justification, récit et communication professionnelle simple. Le thème « Actualité et médias » sert de contexte réel. Commencez par comprendre l’intention, puis repérez le verbe, les informations importantes et enfin les détails.

MÉTHODE
1. Lisez les phrases sans traduire mot à mot.
2. Soulignez le verbe conjugué.
3. Repérez qui parle, à qui et dans quel but.
4. Répétez chaque phrase à voix haute trois fois.
5. Changez un élément pour créer votre propre exemple.

EXEMPLES ALLEMANDS
• Der Bericht handelt von …
• Laut der Quelle …
• Es wird behauptet, dass …
• Ich halte die Information für glaubwürdig.

À RETENIR
Grammaire centrale : discours indirect introductif; passif.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Actualité et médias','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Actualité et médias');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif — Actualité et médias','allemand-b1-m06-l02','text','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 6/12 — Actualité et médias
LEÇON 2/8 — Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur « Actualité et médias ».

VOCABULAIRE À ACTIVER
Bericht, Information, Laut, Quelle, behauptet, dass, glaubwürdig, halte, handelt, wird

TECHNIQUE 4 ÉTAPES
1. Écoutez le mot avec le bouton audio.
2. Répétez-le dans une phrase complète.
3. Créez une phrase vraie sur votre vie.
4. Réutilisez-le 24 heures plus tard.

MODÈLES
• Der Bericht handelt von …
• Laut der Quelle …
• Es wird behauptet, dass …
• Ich halte die Information für glaubwürdig.

EXERCICES
1. Choisissez 10 mots et écrivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez l’allemand et traduisez vos phrases du français vers l’allemand.
4. Enregistrez oralement un résumé de 60 secondes.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Actualité et médias','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Actualité et médias');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation — Actualité et médias','allemand-b1-m06-l03','audio','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 6/12 — Actualité et médias
LEÇON 3/8 — Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÈLE
A: Der Bericht handelt von …
B: Laut der Quelle …
A: Es wird behauptet, dass …
B: Ich halte die Information für glaubwürdig.

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Actualité et médias','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Actualité et médias');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur — Actualité et médias','allemand-b1-m06-l04','text','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 6/12 — Actualité et médias
LEÇON 4/8 — Grammaire en profondeur

POINT DE GRAMMAIRE
discours indirect introductif; passif.

EXPLICATION
La grammaire n’est pas une liste de règles à mémoriser séparément : elle sert à exprimer une intention. Observez d’abord la place du verbe, puis les compléments, et enfin les éléments de temps, cause ou opinion.

EXEMPLES
• Der Bericht handelt von …
• Laut der Quelle …
• Es wird behauptet, dass …
• Ich halte die Information für glaubwürdig.

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Actualité et médias','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Actualité et médias');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Compréhension et production — Actualité et médias','allemand-b1-m06-l05','exercise','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 6/12 — Actualité et médias
LEÇON 5/8 — Compréhension et production

TEXTE / SITUATION
Imaginez une situation réelle autour de « Actualité et médias ». Les personnes utilisent les expressions suivantes :
• Der Bericht handelt von …
• Laut der Quelle …
• Es wird behauptet, dass …
• Ich halte die Information für glaubwürdig.

COMPRÉHENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou émotion peut-on déduire ?
4. Reformulez le contenu en français, puis en allemand simple.

PRODUCTION ÉCRITE
Rédigez un texte adapté au niveau B1. Utilisez au moins 8 éléments du module et 3 structures liées à : discours indirect introductif; passif.

PRODUCTION ORALE
Parlez pendant 2 à 4 minutes sans lire. Recommencez en améliorant la fluidité.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Actualité et médias','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Actualité et médias');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif — Actualité et médias','allemand-b1-m06-l06','exercise','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 6/12 — Actualité et médias
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
• Der Bericht handelt von …
• Laut der Quelle …
• Es wird behauptet, dass …
• Ich halte die Information für glaubwürdig.

GRAMMAIRE À RÉUTILISER
discours indirect introductif; passif.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Actualité et médias','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Actualité et médias');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module — Actualité et médias','allemand-b1-m06-l07','quiz','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 6/12 — Actualité et médias
LEÇON 7/8 — Quiz de module

QUIZ DE VALIDATION — Actualité et médias

Avant de valider, vous devez pouvoir :
• comprendre les quatre expressions du module ;
• expliquer le point de grammaire « discours indirect introductif; passif » ;
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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Actualité et médias','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Actualité et médias');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission réelle — Actualité et médias','allemand-b1-m06-l08','exercise','ALLEMAND FONCTIONNEL — NIVEAU B1
MODULE 6/12 — Actualité et médias
LEÇON 8/8 — Mission réelle

MISSION RÉELLE — Actualité et médias

SCÉNARIO
Vous devez résumer une information et distinguer les sources. Vous n’avez droit qu’à l’allemand.

LIVRABLES
1. Un texte de 180 à 350 mots.
2. Un enregistrement oral de 3 à 6 minutes.
3. Un dialogue de 10 répliques.
4. Une liste de 15 mots ou expressions réellement utiles.
5. Une auto-correction : trois erreurs repérées et expliquées.

CRITÈRES
Clarté, correction, vocabulaire adapté, fluidité et capacité à accomplir la tâche.

EXPRESSIONS À RÉUTILISER
• Der Bericht handelt von …
• Laut der Quelle …
• Es wird behauptet, dass …
• Ich halte die Information für glaubwürdig.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2400,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Actualité et médias','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Actualité et médias');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
END $$;

SELECT 'Partie 5/10 installée : modules 25 à 30' AS resultat;
