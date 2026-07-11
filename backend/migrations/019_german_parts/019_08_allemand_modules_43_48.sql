-- StudyLink 019 - Allemand A1-C1 - Partie 8/10
-- Modules 43 à 48
DO $$
DECLARE v_course UUID; v_module UUID; v_lesson UUID;
BEGIN
  SELECT id INTO v_course FROM public.courses WHERE slug='allemand-fonctionnel-a1-c1' ORDER BY created_at DESC NULLS LAST LIMIT 1;
  IF v_course IS NULL THEN RAISE EXCEPTION 'Le cours allemand n existe pas encore. Executez d abord la partie 01.'; END IF;
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B2 · Module 7 — Psychologie et communication','Niveau B2 : analyser comportements et malentendus. Grammaire : nicht nur…sondern auch; dadurch dass. 8 leçons avec théorie, audio, exercices, quiz et mission réelle.',43) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre — Psychologie et communication','allemand-b2-m07-l01','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 7/12 — Psychologie et communication
LEÇON 1/8 — Comprendre

OBJECTIF
Analyser comportements et malentendus.

EXPLICATION EN FRANÇAIS
À ce niveau, vous devez apprendre à communiquer avec argumentation nuancée, compréhension authentique et langue professionnelle. Le thème « Psychologie et communication » sert de contexte réel. Commencez par comprendre l’intention, puis repérez le verbe, les informations importantes et enfin les détails.

MÉTHODE
1. Lisez les phrases sans traduire mot à mot.
2. Soulignez le verbe conjugué.
3. Repérez qui parle, à qui et dans quel but.
4. Répétez chaque phrase à voix haute trois fois.
5. Changez un élément pour créer votre propre exemple.

EXEMPLES ALLEMANDS
• Missverständnisse entstehen häufig dadurch, dass …
• Entscheidend ist nicht nur …, sondern auch …
• Je nach Kontext …
• Es wäre sinnvoll, …

À RETENIR
Grammaire centrale : nicht nur…sondern auch; dadurch dass.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Psychologie et communication','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Psychologie et communication');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif — Psychologie et communication','allemand-b2-m07-l02','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 7/12 — Psychologie et communication
LEÇON 2/8 — Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur « Psychologie et communication ».

VOCABULAIRE À ACTIVER
Entscheidend, Kontext, Missverständnisse, auch, dadurch, dass, entstehen, häufig, nach, nicht, sinnvoll, sondern, wäre

TECHNIQUE 4 ÉTAPES
1. Écoutez le mot avec le bouton audio.
2. Répétez-le dans une phrase complète.
3. Créez une phrase vraie sur votre vie.
4. Réutilisez-le 24 heures plus tard.

MODÈLES
• Missverständnisse entstehen häufig dadurch, dass …
• Entscheidend ist nicht nur …, sondern auch …
• Je nach Kontext …
• Es wäre sinnvoll, …

EXERCICES
1. Choisissez 10 mots et écrivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez l’allemand et traduisez vos phrases du français vers l’allemand.
4. Enregistrez oralement un résumé de 60 secondes.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Psychologie et communication','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Psychologie et communication');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation — Psychologie et communication','allemand-b2-m07-l03','audio','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 7/12 — Psychologie et communication
LEÇON 3/8 — Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÈLE
A: Missverständnisse entstehen häufig dadurch, dass …
B: Entscheidend ist nicht nur …, sondern auch …
A: Je nach Kontext …
B: Es wäre sinnvoll, …

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Psychologie et communication','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Psychologie et communication');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur — Psychologie et communication','allemand-b2-m07-l04','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 7/12 — Psychologie et communication
LEÇON 4/8 — Grammaire en profondeur

POINT DE GRAMMAIRE
nicht nur…sondern auch; dadurch dass.

EXPLICATION
La grammaire n’est pas une liste de règles à mémoriser séparément : elle sert à exprimer une intention. Observez d’abord la place du verbe, puis les compléments, et enfin les éléments de temps, cause ou opinion.

EXEMPLES
• Missverständnisse entstehen häufig dadurch, dass …
• Entscheidend ist nicht nur …, sondern auch …
• Je nach Kontext …
• Es wäre sinnvoll, …

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Psychologie et communication','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Psychologie et communication');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Compréhension et production — Psychologie et communication','allemand-b2-m07-l05','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 7/12 — Psychologie et communication
LEÇON 5/8 — Compréhension et production

TEXTE / SITUATION
Imaginez une situation réelle autour de « Psychologie et communication ». Les personnes utilisent les expressions suivantes :
• Missverständnisse entstehen häufig dadurch, dass …
• Entscheidend ist nicht nur …, sondern auch …
• Je nach Kontext …
• Es wäre sinnvoll, …

COMPRÉHENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou émotion peut-on déduire ?
4. Reformulez le contenu en français, puis en allemand simple.

PRODUCTION ÉCRITE
Rédigez un texte adapté au niveau B2. Utilisez au moins 8 éléments du module et 3 structures liées à : nicht nur…sondern auch; dadurch dass.

PRODUCTION ORALE
Parlez pendant 2 à 4 minutes sans lire. Recommencez en améliorant la fluidité.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Psychologie et communication','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Psychologie et communication');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif — Psychologie et communication','allemand-b2-m07-l06','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 7/12 — Psychologie et communication
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
• Missverständnisse entstehen häufig dadurch, dass …
• Entscheidend ist nicht nur …, sondern auch …
• Je nach Kontext …
• Es wäre sinnvoll, …

GRAMMAIRE À RÉUTILISER
nicht nur…sondern auch; dadurch dass.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Psychologie et communication','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Psychologie et communication');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module — Psychologie et communication','allemand-b2-m07-l07','quiz','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 7/12 — Psychologie et communication
LEÇON 7/8 — Quiz de module

QUIZ DE VALIDATION — Psychologie et communication

Avant de valider, vous devez pouvoir :
• comprendre les quatre expressions du module ;
• expliquer le point de grammaire « nicht nur…sondern auch; dadurch dass » ;
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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Psychologie et communication','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Psychologie et communication');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission réelle — Psychologie et communication','allemand-b2-m07-l08','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 7/12 — Psychologie et communication
LEÇON 8/8 — Mission réelle

MISSION RÉELLE — Psychologie et communication

SCÉNARIO
Vous devez analyser comportements et malentendus. Vous n’avez droit qu’à l’allemand.

LIVRABLES
1. Un texte de 180 à 350 mots.
2. Un enregistrement oral de 3 à 6 minutes.
3. Un dialogue de 10 répliques.
4. Une liste de 15 mots ou expressions réellement utiles.
5. Une auto-correction : trois erreurs repérées et expliquées.

CRITÈRES
Clarté, correction, vocabulaire adapté, fluidité et capacité à accomplir la tâche.

EXPRESSIONS À RÉUTILISER
• Missverständnisse entstehen häufig dadurch, dass …
• Entscheidend ist nicht nur …, sondern auch …
• Je nach Kontext …
• Es wäre sinnvoll, …

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Psychologie et communication','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Psychologie et communication');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B2 · Module 8 — Culture, littérature et film','Niveau B2 : analyser une œuvre et son effet. Grammaire : langage analytique; adjectifs participiaux. 8 leçons avec théorie, audio, exercices, quiz et mission réelle.',44) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre — Culture, littérature et film','allemand-b2-m08-l01','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 8/12 — Culture, littérature et film
LEÇON 1/8 — Comprendre

OBJECTIF
Analyser une œuvre et son effet.

EXPLICATION EN FRANÇAIS
À ce niveau, vous devez apprendre à communiquer avec argumentation nuancée, compréhension authentique et langue professionnelle. Le thème « Culture, littérature et film » sert de contexte réel. Commencez par comprendre l’intention, puis repérez le verbe, les informations importantes et enfin les détails.

MÉTHODE
1. Lisez les phrases sans traduire mot à mot.
2. Soulignez le verbe conjugué.
3. Repérez qui parle, à qui et dans quel but.
4. Répétez chaque phrase à voix haute trois fois.
5. Changez un élément pour créer votre propre exemple.

EXEMPLES ALLEMANDS
• Das Werk thematisiert …
• Die Figur verkörpert …
• Besonders auffällig ist …
• Die Wirkung entsteht durch …

À RETENIR
Grammaire centrale : langage analytique; adjectifs participiaux.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Culture, littérature et film','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Culture, littérature et film');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif — Culture, littérature et film','allemand-b2-m08-l02','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 8/12 — Culture, littérature et film
LEÇON 2/8 — Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur « Culture, littérature et film ».

VOCABULAIRE À ACTIVER
Besonders, Figur, Werk, Wirkung, auffällig, durch, entsteht, thematisiert, verkörpert

TECHNIQUE 4 ÉTAPES
1. Écoutez le mot avec le bouton audio.
2. Répétez-le dans une phrase complète.
3. Créez une phrase vraie sur votre vie.
4. Réutilisez-le 24 heures plus tard.

MODÈLES
• Das Werk thematisiert …
• Die Figur verkörpert …
• Besonders auffällig ist …
• Die Wirkung entsteht durch …

EXERCICES
1. Choisissez 10 mots et écrivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez l’allemand et traduisez vos phrases du français vers l’allemand.
4. Enregistrez oralement un résumé de 60 secondes.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Culture, littérature et film','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Culture, littérature et film');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation — Culture, littérature et film','allemand-b2-m08-l03','audio','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 8/12 — Culture, littérature et film
LEÇON 3/8 — Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÈLE
A: Das Werk thematisiert …
B: Die Figur verkörpert …
A: Besonders auffällig ist …
B: Die Wirkung entsteht durch …

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Culture, littérature et film','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Culture, littérature et film');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur — Culture, littérature et film','allemand-b2-m08-l04','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 8/12 — Culture, littérature et film
LEÇON 4/8 — Grammaire en profondeur

POINT DE GRAMMAIRE
langage analytique; adjectifs participiaux.

EXPLICATION
La grammaire n’est pas une liste de règles à mémoriser séparément : elle sert à exprimer une intention. Observez d’abord la place du verbe, puis les compléments, et enfin les éléments de temps, cause ou opinion.

EXEMPLES
• Das Werk thematisiert …
• Die Figur verkörpert …
• Besonders auffällig ist …
• Die Wirkung entsteht durch …

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Culture, littérature et film','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Culture, littérature et film');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Compréhension et production — Culture, littérature et film','allemand-b2-m08-l05','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 8/12 — Culture, littérature et film
LEÇON 5/8 — Compréhension et production

TEXTE / SITUATION
Imaginez une situation réelle autour de « Culture, littérature et film ». Les personnes utilisent les expressions suivantes :
• Das Werk thematisiert …
• Die Figur verkörpert …
• Besonders auffällig ist …
• Die Wirkung entsteht durch …

COMPRÉHENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou émotion peut-on déduire ?
4. Reformulez le contenu en français, puis en allemand simple.

PRODUCTION ÉCRITE
Rédigez un texte adapté au niveau B2. Utilisez au moins 8 éléments du module et 3 structures liées à : langage analytique; adjectifs participiaux.

PRODUCTION ORALE
Parlez pendant 2 à 4 minutes sans lire. Recommencez en améliorant la fluidité.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Culture, littérature et film','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Culture, littérature et film');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif — Culture, littérature et film','allemand-b2-m08-l06','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 8/12 — Culture, littérature et film
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
• Das Werk thematisiert …
• Die Figur verkörpert …
• Besonders auffällig ist …
• Die Wirkung entsteht durch …

GRAMMAIRE À RÉUTILISER
langage analytique; adjectifs participiaux.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Culture, littérature et film','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Culture, littérature et film');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module — Culture, littérature et film','allemand-b2-m08-l07','quiz','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 8/12 — Culture, littérature et film
LEÇON 7/8 — Quiz de module

QUIZ DE VALIDATION — Culture, littérature et film

Avant de valider, vous devez pouvoir :
• comprendre les quatre expressions du module ;
• expliquer le point de grammaire « langage analytique; adjectifs participiaux » ;
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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Culture, littérature et film','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Culture, littérature et film');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission réelle — Culture, littérature et film','allemand-b2-m08-l08','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 8/12 — Culture, littérature et film
LEÇON 8/8 — Mission réelle

MISSION RÉELLE — Culture, littérature et film

SCÉNARIO
Vous devez analyser une œuvre et son effet. Vous n’avez droit qu’à l’allemand.

LIVRABLES
1. Un texte de 180 à 350 mots.
2. Un enregistrement oral de 3 à 6 minutes.
3. Un dialogue de 10 répliques.
4. Une liste de 15 mots ou expressions réellement utiles.
5. Une auto-correction : trois erreurs repérées et expliquées.

CRITÈRES
Clarté, correction, vocabulaire adapté, fluidité et capacité à accomplir la tâche.

EXPRESSIONS À RÉUTILISER
• Das Werk thematisiert …
• Die Figur verkörpert …
• Besonders auffällig ist …
• Die Wirkung entsteht durch …

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Culture, littérature et film','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Culture, littérature et film');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B2 · Module 9 — Débats et prise de parole','Niveau B2 : réagir spontanément et structurer. Grammaire : cohésion orale; reformulation. 8 leçons avec théorie, audio, exercices, quiz et mission réelle.',45) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre — Débats et prise de parole','allemand-b2-m09-l01','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 9/12 — Débats et prise de parole
LEÇON 1/8 — Comprendre

OBJECTIF
Réagir spontanément et structurer.

EXPLICATION EN FRANÇAIS
À ce niveau, vous devez apprendre à communiquer avec argumentation nuancée, compréhension authentique et langue professionnelle. Le thème « Débats et prise de parole » sert de contexte réel. Commencez par comprendre l’intention, puis repérez le verbe, les informations importantes et enfin les détails.

MÉTHODE
1. Lisez les phrases sans traduire mot à mot.
2. Soulignez le verbe conjugué.
3. Repérez qui parle, à qui et dans quel but.
4. Répétez chaque phrase à voix haute trois fois.
5. Changez un élément pour créer votre propre exemple.

EXEMPLES ALLEMANDS
• Ich würde die Frage gern anders formulieren.
• Daran anschließend …
• Ich möchte zwischen zwei Ebenen unterscheiden.
• Lassen Sie mich ein Beispiel nennen.

À RETENIR
Grammaire centrale : cohésion orale; reformulation.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Débats et prise de parole','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Débats et prise de parole');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif — Débats et prise de parole','allemand-b2-m09-l02','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 9/12 — Débats et prise de parole
LEÇON 2/8 — Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur « Débats et prise de parole ».

VOCABULAIRE À ACTIVER
Beispiel, Daran, Ebenen, Frage, Lassen, anders, anschließend, formulieren, gern, mich, möchte, nennen, unterscheiden, würde, zwei, zwischen

TECHNIQUE 4 ÉTAPES
1. Écoutez le mot avec le bouton audio.
2. Répétez-le dans une phrase complète.
3. Créez une phrase vraie sur votre vie.
4. Réutilisez-le 24 heures plus tard.

MODÈLES
• Ich würde die Frage gern anders formulieren.
• Daran anschließend …
• Ich möchte zwischen zwei Ebenen unterscheiden.
• Lassen Sie mich ein Beispiel nennen.

EXERCICES
1. Choisissez 10 mots et écrivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez l’allemand et traduisez vos phrases du français vers l’allemand.
4. Enregistrez oralement un résumé de 60 secondes.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Débats et prise de parole','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Débats et prise de parole');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation — Débats et prise de parole','allemand-b2-m09-l03','audio','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 9/12 — Débats et prise de parole
LEÇON 3/8 — Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÈLE
A: Ich würde die Frage gern anders formulieren.
B: Daran anschließend …
A: Ich möchte zwischen zwei Ebenen unterscheiden.
B: Lassen Sie mich ein Beispiel nennen.

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Débats et prise de parole','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Débats et prise de parole');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur — Débats et prise de parole','allemand-b2-m09-l04','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 9/12 — Débats et prise de parole
LEÇON 4/8 — Grammaire en profondeur

POINT DE GRAMMAIRE
cohésion orale; reformulation.

EXPLICATION
La grammaire n’est pas une liste de règles à mémoriser séparément : elle sert à exprimer une intention. Observez d’abord la place du verbe, puis les compléments, et enfin les éléments de temps, cause ou opinion.

EXEMPLES
• Ich würde die Frage gern anders formulieren.
• Daran anschließend …
• Ich möchte zwischen zwei Ebenen unterscheiden.
• Lassen Sie mich ein Beispiel nennen.

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Débats et prise de parole','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Débats et prise de parole');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Compréhension et production — Débats et prise de parole','allemand-b2-m09-l05','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 9/12 — Débats et prise de parole
LEÇON 5/8 — Compréhension et production

TEXTE / SITUATION
Imaginez une situation réelle autour de « Débats et prise de parole ». Les personnes utilisent les expressions suivantes :
• Ich würde die Frage gern anders formulieren.
• Daran anschließend …
• Ich möchte zwischen zwei Ebenen unterscheiden.
• Lassen Sie mich ein Beispiel nennen.

COMPRÉHENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou émotion peut-on déduire ?
4. Reformulez le contenu en français, puis en allemand simple.

PRODUCTION ÉCRITE
Rédigez un texte adapté au niveau B2. Utilisez au moins 8 éléments du module et 3 structures liées à : cohésion orale; reformulation.

PRODUCTION ORALE
Parlez pendant 2 à 4 minutes sans lire. Recommencez en améliorant la fluidité.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Débats et prise de parole','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Débats et prise de parole');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif — Débats et prise de parole','allemand-b2-m09-l06','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 9/12 — Débats et prise de parole
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
• Ich würde die Frage gern anders formulieren.
• Daran anschließend …
• Ich möchte zwischen zwei Ebenen unterscheiden.
• Lassen Sie mich ein Beispiel nennen.

GRAMMAIRE À RÉUTILISER
cohésion orale; reformulation.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Débats et prise de parole','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Débats et prise de parole');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module — Débats et prise de parole','allemand-b2-m09-l07','quiz','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 9/12 — Débats et prise de parole
LEÇON 7/8 — Quiz de module

QUIZ DE VALIDATION — Débats et prise de parole

Avant de valider, vous devez pouvoir :
• comprendre les quatre expressions du module ;
• expliquer le point de grammaire « cohésion orale; reformulation » ;
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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Débats et prise de parole','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Débats et prise de parole');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission réelle — Débats et prise de parole','allemand-b2-m09-l08','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 9/12 — Débats et prise de parole
LEÇON 8/8 — Mission réelle

MISSION RÉELLE — Débats et prise de parole

SCÉNARIO
Vous devez réagir spontanément et structurer. Vous n’avez droit qu’à l’allemand.

LIVRABLES
1. Un texte de 180 à 350 mots.
2. Un enregistrement oral de 3 à 6 minutes.
3. Un dialogue de 10 répliques.
4. Une liste de 15 mots ou expressions réellement utiles.
5. Une auto-correction : trois erreurs repérées et expliquées.

CRITÈRES
Clarté, correction, vocabulaire adapté, fluidité et capacité à accomplir la tâche.

EXPRESSIONS À RÉUTILISER
• Ich würde die Frage gern anders formulieren.
• Daran anschließend …
• Ich möchte zwischen zwei Ebenen unterscheiden.
• Lassen Sie mich ein Beispiel nennen.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Débats et prise de parole','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Débats et prise de parole');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B2 · Module 10 — Écrits formels avancés','Niveau B2 : rédiger rapports, avis et courriels complexes. Grammaire : style nominal; passif. 8 leçons avec théorie, audio, exercices, quiz et mission réelle.',46) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre — Écrits formels avancés','allemand-b2-m10-l01','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 10/12 — Écrits formels avancés
LEÇON 1/8 — Comprendre

OBJECTIF
Rédiger rapports, avis et courriels complexes.

EXPLICATION EN FRANÇAIS
À ce niveau, vous devez apprendre à communiquer avec argumentation nuancée, compréhension authentique et langue professionnelle. Le thème « Écrits formels avancés » sert de contexte réel. Commencez par comprendre l’intention, puis repérez le verbe, les informations importantes et enfin les détails.

MÉTHODE
1. Lisez les phrases sans traduire mot à mot.
2. Soulignez le verbe conjugué.
3. Repérez qui parle, à qui et dans quel but.
4. Répétez chaque phrase à voix haute trois fois.
5. Changez un élément pour créer votre propre exemple.

EXEMPLES ALLEMANDS
• Bezugnehmend auf …
• Im Folgenden werden …
• Es empfiehlt sich, …
• Für Rückfragen stehe ich gern zur Verfügung.

À RETENIR
Grammaire centrale : style nominal; passif.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Écrits formels avancés','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Écrits formels avancés');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif — Écrits formels avancés','allemand-b2-m10-l02','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 10/12 — Écrits formels avancés
LEÇON 2/8 — Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur « Écrits formels avancés ».

VOCABULAIRE À ACTIVER
Bezugnehmend, Folgenden, Rückfragen, Verfügung, empfiehlt, gern, sich, stehe, werden

TECHNIQUE 4 ÉTAPES
1. Écoutez le mot avec le bouton audio.
2. Répétez-le dans une phrase complète.
3. Créez une phrase vraie sur votre vie.
4. Réutilisez-le 24 heures plus tard.

MODÈLES
• Bezugnehmend auf …
• Im Folgenden werden …
• Es empfiehlt sich, …
• Für Rückfragen stehe ich gern zur Verfügung.

EXERCICES
1. Choisissez 10 mots et écrivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez l’allemand et traduisez vos phrases du français vers l’allemand.
4. Enregistrez oralement un résumé de 60 secondes.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Écrits formels avancés','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Écrits formels avancés');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation — Écrits formels avancés','allemand-b2-m10-l03','audio','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 10/12 — Écrits formels avancés
LEÇON 3/8 — Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÈLE
A: Bezugnehmend auf …
B: Im Folgenden werden …
A: Es empfiehlt sich, …
B: Für Rückfragen stehe ich gern zur Verfügung.

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Écrits formels avancés','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Écrits formels avancés');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur — Écrits formels avancés','allemand-b2-m10-l04','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 10/12 — Écrits formels avancés
LEÇON 4/8 — Grammaire en profondeur

POINT DE GRAMMAIRE
style nominal; passif.

EXPLICATION
La grammaire n’est pas une liste de règles à mémoriser séparément : elle sert à exprimer une intention. Observez d’abord la place du verbe, puis les compléments, et enfin les éléments de temps, cause ou opinion.

EXEMPLES
• Bezugnehmend auf …
• Im Folgenden werden …
• Es empfiehlt sich, …
• Für Rückfragen stehe ich gern zur Verfügung.

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Écrits formels avancés','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Écrits formels avancés');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Compréhension et production — Écrits formels avancés','allemand-b2-m10-l05','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 10/12 — Écrits formels avancés
LEÇON 5/8 — Compréhension et production

TEXTE / SITUATION
Imaginez une situation réelle autour de « Écrits formels avancés ». Les personnes utilisent les expressions suivantes :
• Bezugnehmend auf …
• Im Folgenden werden …
• Es empfiehlt sich, …
• Für Rückfragen stehe ich gern zur Verfügung.

COMPRÉHENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou émotion peut-on déduire ?
4. Reformulez le contenu en français, puis en allemand simple.

PRODUCTION ÉCRITE
Rédigez un texte adapté au niveau B2. Utilisez au moins 8 éléments du module et 3 structures liées à : style nominal; passif.

PRODUCTION ORALE
Parlez pendant 2 à 4 minutes sans lire. Recommencez en améliorant la fluidité.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Écrits formels avancés','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Écrits formels avancés');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif — Écrits formels avancés','allemand-b2-m10-l06','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 10/12 — Écrits formels avancés
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
• Bezugnehmend auf …
• Im Folgenden werden …
• Es empfiehlt sich, …
• Für Rückfragen stehe ich gern zur Verfügung.

GRAMMAIRE À RÉUTILISER
style nominal; passif.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Écrits formels avancés','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Écrits formels avancés');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module — Écrits formels avancés','allemand-b2-m10-l07','quiz','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 10/12 — Écrits formels avancés
LEÇON 7/8 — Quiz de module

QUIZ DE VALIDATION — Écrits formels avancés

Avant de valider, vous devez pouvoir :
• comprendre les quatre expressions du module ;
• expliquer le point de grammaire « style nominal; passif » ;
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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Écrits formels avancés','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Écrits formels avancés');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission réelle — Écrits formels avancés','allemand-b2-m10-l08','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 10/12 — Écrits formels avancés
LEÇON 8/8 — Mission réelle

MISSION RÉELLE — Écrits formels avancés

SCÉNARIO
Vous devez rédiger rapports, avis et courriels complexes. Vous n’avez droit qu’à l’allemand.

LIVRABLES
1. Un texte de 180 à 350 mots.
2. Un enregistrement oral de 3 à 6 minutes.
3. Un dialogue de 10 répliques.
4. Une liste de 15 mots ou expressions réellement utiles.
5. Une auto-correction : trois erreurs repérées et expliquées.

CRITÈRES
Clarté, correction, vocabulaire adapté, fluidité et capacité à accomplir la tâche.

EXPRESSIONS À RÉUTILISER
• Bezugnehmend auf …
• Im Folgenden werden …
• Es empfiehlt sich, …
• Für Rückfragen stehe ich gern zur Verfügung.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Écrits formels avancés','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Écrits formels avancés');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B2 · Module 11 — Compréhension authentique','Niveau B2 : travailler avec un allemand rapide et implicite. Grammaire : inférence; reformulation. 8 leçons avec théorie, audio, exercices, quiz et mission réelle.',47) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre — Compréhension authentique','allemand-b2-m11-l01','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 11/12 — Compréhension authentique
LEÇON 1/8 — Comprendre

OBJECTIF
Travailler avec un allemand rapide et implicite.

EXPLICATION EN FRANÇAIS
À ce niveau, vous devez apprendre à communiquer avec argumentation nuancée, compréhension authentique et langue professionnelle. Le thème « Compréhension authentique » sert de contexte réel. Commencez par comprendre l’intention, puis repérez le verbe, les informations importantes et enfin les détails.

MÉTHODE
1. Lisez les phrases sans traduire mot à mot.
2. Soulignez le verbe conjugué.
3. Repérez qui parle, à qui et dans quel but.
4. Répétez chaque phrase à voix haute trois fois.
5. Changez un élément pour créer votre propre exemple.

EXEMPLES ALLEMANDS
• Wenn ich es richtig verstanden habe …
• Zwischen den Zeilen wird deutlich …
• Der Sprecher deutet an, dass …
• Die Kernaussage lautet …

À RETENIR
Grammaire centrale : inférence; reformulation.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Compréhension authentique','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Compréhension authentique');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif — Compréhension authentique','allemand-b2-m11-l02','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 11/12 — Compréhension authentique
LEÇON 2/8 — Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur « Compréhension authentique ».

VOCABULAIRE À ACTIVER
Kernaussage, Sprecher, Wenn, Zeilen, Zwischen, dass, deutet, deutlich, habe, lautet, richtig, verstanden, wird

TECHNIQUE 4 ÉTAPES
1. Écoutez le mot avec le bouton audio.
2. Répétez-le dans une phrase complète.
3. Créez une phrase vraie sur votre vie.
4. Réutilisez-le 24 heures plus tard.

MODÈLES
• Wenn ich es richtig verstanden habe …
• Zwischen den Zeilen wird deutlich …
• Der Sprecher deutet an, dass …
• Die Kernaussage lautet …

EXERCICES
1. Choisissez 10 mots et écrivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez l’allemand et traduisez vos phrases du français vers l’allemand.
4. Enregistrez oralement un résumé de 60 secondes.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Compréhension authentique','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Compréhension authentique');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation — Compréhension authentique','allemand-b2-m11-l03','audio','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 11/12 — Compréhension authentique
LEÇON 3/8 — Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÈLE
A: Wenn ich es richtig verstanden habe …
B: Zwischen den Zeilen wird deutlich …
A: Der Sprecher deutet an, dass …
B: Die Kernaussage lautet …

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Compréhension authentique','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Compréhension authentique');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur — Compréhension authentique','allemand-b2-m11-l04','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 11/12 — Compréhension authentique
LEÇON 4/8 — Grammaire en profondeur

POINT DE GRAMMAIRE
inférence; reformulation.

EXPLICATION
La grammaire n’est pas une liste de règles à mémoriser séparément : elle sert à exprimer une intention. Observez d’abord la place du verbe, puis les compléments, et enfin les éléments de temps, cause ou opinion.

EXEMPLES
• Wenn ich es richtig verstanden habe …
• Zwischen den Zeilen wird deutlich …
• Der Sprecher deutet an, dass …
• Die Kernaussage lautet …

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Compréhension authentique','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Compréhension authentique');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Compréhension et production — Compréhension authentique','allemand-b2-m11-l05','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 11/12 — Compréhension authentique
LEÇON 5/8 — Compréhension et production

TEXTE / SITUATION
Imaginez une situation réelle autour de « Compréhension authentique ». Les personnes utilisent les expressions suivantes :
• Wenn ich es richtig verstanden habe …
• Zwischen den Zeilen wird deutlich …
• Der Sprecher deutet an, dass …
• Die Kernaussage lautet …

COMPRÉHENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou émotion peut-on déduire ?
4. Reformulez le contenu en français, puis en allemand simple.

PRODUCTION ÉCRITE
Rédigez un texte adapté au niveau B2. Utilisez au moins 8 éléments du module et 3 structures liées à : inférence; reformulation.

PRODUCTION ORALE
Parlez pendant 2 à 4 minutes sans lire. Recommencez en améliorant la fluidité.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Compréhension authentique','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Compréhension authentique');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif — Compréhension authentique','allemand-b2-m11-l06','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 11/12 — Compréhension authentique
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
• Wenn ich es richtig verstanden habe …
• Zwischen den Zeilen wird deutlich …
• Der Sprecher deutet an, dass …
• Die Kernaussage lautet …

GRAMMAIRE À RÉUTILISER
inférence; reformulation.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Compréhension authentique','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Compréhension authentique');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module — Compréhension authentique','allemand-b2-m11-l07','quiz','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 11/12 — Compréhension authentique
LEÇON 7/8 — Quiz de module

QUIZ DE VALIDATION — Compréhension authentique

Avant de valider, vous devez pouvoir :
• comprendre les quatre expressions du module ;
• expliquer le point de grammaire « inférence; reformulation » ;
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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Compréhension authentique','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Compréhension authentique');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission réelle — Compréhension authentique','allemand-b2-m11-l08','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 11/12 — Compréhension authentique
LEÇON 8/8 — Mission réelle

MISSION RÉELLE — Compréhension authentique

SCÉNARIO
Vous devez travailler avec un allemand rapide et implicite. Vous n’avez droit qu’à l’allemand.

LIVRABLES
1. Un texte de 180 à 350 mots.
2. Un enregistrement oral de 3 à 6 minutes.
3. Un dialogue de 10 répliques.
4. Une liste de 15 mots ou expressions réellement utiles.
5. Une auto-correction : trois erreurs repérées et expliquées.

CRITÈRES
Clarté, correction, vocabulaire adapté, fluidité et capacité à accomplir la tâche.

EXPRESSIONS À RÉUTILISER
• Wenn ich es richtig verstanden habe …
• Zwischen den Zeilen wird deutlich …
• Der Sprecher deutet an, dass …
• Die Kernaussage lautet …

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Compréhension authentique','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Compréhension authentique');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B2 · Module 12 — Révision B2 et examen','Niveau B2 : maîtriser les formats B2. Grammaire : révision globale B2. 8 leçons avec théorie, audio, exercices, quiz et mission réelle.',48) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre — Révision B2 et examen','allemand-b2-m12-l01','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 12/12 — Révision B2 et examen
LEÇON 1/8 — Comprendre

OBJECTIF
Maîtriser les formats b2.

EXPLICATION EN FRANÇAIS
À ce niveau, vous devez apprendre à communiquer avec argumentation nuancée, compréhension authentique et langue professionnelle. Le thème « Révision B2 et examen » sert de contexte réel. Commencez par comprendre l’intention, puis repérez le verbe, les informations importantes et enfin les détails.

MÉTHODE
1. Lisez les phrases sans traduire mot à mot.
2. Soulignez le verbe conjugué.
3. Repérez qui parle, à qui et dans quel but.
4. Répétez chaque phrase à voix haute trois fois.
5. Changez un élément pour créer votre propre exemple.

EXEMPLES ALLEMANDS
• Die vorliegende Aufgabe befasst sich mit …
• Im ersten Teil …
• Darüber hinaus …
• Insgesamt überwiegen …

À RETENIR
Grammaire centrale : révision globale B2.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Révision B2 et examen','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Révision B2 et examen');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif — Révision B2 et examen','allemand-b2-m12-l02','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 12/12 — Révision B2 et examen
LEÇON 2/8 — Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur « Révision B2 et examen ».

VOCABULAIRE À ACTIVER
Aufgabe, Darüber, Insgesamt, Teil, befasst, ersten, hinaus, sich, vorliegende, überwiegen

TECHNIQUE 4 ÉTAPES
1. Écoutez le mot avec le bouton audio.
2. Répétez-le dans une phrase complète.
3. Créez une phrase vraie sur votre vie.
4. Réutilisez-le 24 heures plus tard.

MODÈLES
• Die vorliegende Aufgabe befasst sich mit …
• Im ersten Teil …
• Darüber hinaus …
• Insgesamt überwiegen …

EXERCICES
1. Choisissez 10 mots et écrivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez l’allemand et traduisez vos phrases du français vers l’allemand.
4. Enregistrez oralement un résumé de 60 secondes.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Révision B2 et examen','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Révision B2 et examen');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation — Révision B2 et examen','allemand-b2-m12-l03','audio','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 12/12 — Révision B2 et examen
LEÇON 3/8 — Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÈLE
A: Die vorliegende Aufgabe befasst sich mit …
B: Im ersten Teil …
A: Darüber hinaus …
B: Insgesamt überwiegen …

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Révision B2 et examen','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Révision B2 et examen');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur — Révision B2 et examen','allemand-b2-m12-l04','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 12/12 — Révision B2 et examen
LEÇON 4/8 — Grammaire en profondeur

POINT DE GRAMMAIRE
révision globale B2.

EXPLICATION
La grammaire n’est pas une liste de règles à mémoriser séparément : elle sert à exprimer une intention. Observez d’abord la place du verbe, puis les compléments, et enfin les éléments de temps, cause ou opinion.

EXEMPLES
• Die vorliegende Aufgabe befasst sich mit …
• Im ersten Teil …
• Darüber hinaus …
• Insgesamt überwiegen …

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Révision B2 et examen','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Révision B2 et examen');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Compréhension et production — Révision B2 et examen','allemand-b2-m12-l05','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 12/12 — Révision B2 et examen
LEÇON 5/8 — Compréhension et production

TEXTE / SITUATION
Imaginez une situation réelle autour de « Révision B2 et examen ». Les personnes utilisent les expressions suivantes :
• Die vorliegende Aufgabe befasst sich mit …
• Im ersten Teil …
• Darüber hinaus …
• Insgesamt überwiegen …

COMPRÉHENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou émotion peut-on déduire ?
4. Reformulez le contenu en français, puis en allemand simple.

PRODUCTION ÉCRITE
Rédigez un texte adapté au niveau B2. Utilisez au moins 8 éléments du module et 3 structures liées à : révision globale B2.

PRODUCTION ORALE
Parlez pendant 2 à 4 minutes sans lire. Recommencez en améliorant la fluidité.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Révision B2 et examen','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Révision B2 et examen');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif — Révision B2 et examen','allemand-b2-m12-l06','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 12/12 — Révision B2 et examen
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
• Die vorliegende Aufgabe befasst sich mit …
• Im ersten Teil …
• Darüber hinaus …
• Insgesamt überwiegen …

GRAMMAIRE À RÉUTILISER
révision globale B2.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Révision B2 et examen','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Révision B2 et examen');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module — Révision B2 et examen','allemand-b2-m12-l07','quiz','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 12/12 — Révision B2 et examen
LEÇON 7/8 — Quiz de module

QUIZ DE VALIDATION — Révision B2 et examen

Avant de valider, vous devez pouvoir :
• comprendre les quatre expressions du module ;
• expliquer le point de grammaire « révision globale B2 » ;
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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Révision B2 et examen','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Révision B2 et examen');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission réelle — Révision B2 et examen','allemand-b2-m12-l08','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 12/12 — Révision B2 et examen
LEÇON 8/8 — Mission réelle

MISSION RÉELLE — Révision B2 et examen

SCÉNARIO
Vous devez maîtriser les formats B2. Vous n’avez droit qu’à l’allemand.

LIVRABLES
1. Un texte de 180 à 350 mots.
2. Un enregistrement oral de 3 à 6 minutes.
3. Un dialogue de 10 répliques.
4. Une liste de 15 mots ou expressions réellement utiles.
5. Une auto-correction : trois erreurs repérées et expliquées.

CRITÈRES
Clarté, correction, vocabulaire adapté, fluidité et capacité à accomplir la tâche.

EXPRESSIONS À RÉUTILISER
• Die vorliegende Aufgabe befasst sich mit …
• Im ersten Teil …
• Darüber hinaus …
• Insgesamt überwiegen …

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Révision B2 et examen','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Révision B2 et examen');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
END $$;

SELECT 'Partie 8/10 installée : modules 43 à 48' AS resultat;
