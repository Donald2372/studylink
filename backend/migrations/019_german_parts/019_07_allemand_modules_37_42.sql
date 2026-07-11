-- StudyLink 019 - Allemand A1-C1 - Partie 7/10
-- Modules 37 à 42
DO $$
DECLARE v_course UUID; v_module UUID; v_lesson UUID;
BEGIN
  SELECT id INTO v_course FROM public.courses WHERE slug='allemand-fonctionnel-a1-c1' ORDER BY created_at DESC NULLS LAST LIMIT 1;
  IF v_course IS NULL THEN RAISE EXCEPTION 'Le cours allemand n existe pas encore. Executez d abord la partie 01.'; END IF;
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B2 · Module 1 — Argumentation nuancée','Niveau B2 : défendre une position avec nuances. Grammaire : connecteurs complexes; concessions. 8 leçons avec théorie, audio, exercices, quiz et mission réelle.',37) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre — Argumentation nuancée','allemand-b2-m01-l01','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 1/12 — Argumentation nuancée
LEÇON 1/8 — Comprendre

OBJECTIF
Défendre une position avec nuances.

EXPLICATION EN FRANÇAIS
À ce niveau, vous devez apprendre à communiquer avec argumentation nuancée, compréhension authentique et langue professionnelle. Le thème « Argumentation nuancée » sert de contexte réel. Commencez par comprendre l’intention, puis repérez le verbe, les informations importantes et enfin les détails.

MÉTHODE
1. Lisez les phrases sans traduire mot à mot.
2. Soulignez le verbe conjugué.
3. Repérez qui parle, à qui et dans quel but.
4. Répétez chaque phrase à voix haute trois fois.
5. Changez un élément pour créer votre propre exemple.

EXEMPLES ALLEMANDS
• Es lässt sich kaum bestreiten, dass …
• Zwar …, jedoch …
• Dem könnte man entgegenhalten, dass …
• Unter diesen Umständen …

À RETENIR
Grammaire centrale : connecteurs complexes; concessions.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Argumentation nuancée','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Argumentation nuancée');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif — Argumentation nuancée','allemand-b2-m01-l02','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 1/12 — Argumentation nuancée
LEÇON 2/8 — Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur « Argumentation nuancée ».

VOCABULAIRE À ACTIVER
Umständen, Unter, Zwar, bestreiten, dass, diesen, entgegenhalten, jedoch, kaum, könnte, lässt, sich

TECHNIQUE 4 ÉTAPES
1. Écoutez le mot avec le bouton audio.
2. Répétez-le dans une phrase complète.
3. Créez une phrase vraie sur votre vie.
4. Réutilisez-le 24 heures plus tard.

MODÈLES
• Es lässt sich kaum bestreiten, dass …
• Zwar …, jedoch …
• Dem könnte man entgegenhalten, dass …
• Unter diesen Umständen …

EXERCICES
1. Choisissez 10 mots et écrivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez l’allemand et traduisez vos phrases du français vers l’allemand.
4. Enregistrez oralement un résumé de 60 secondes.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Argumentation nuancée','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Argumentation nuancée');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation — Argumentation nuancée','allemand-b2-m01-l03','audio','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 1/12 — Argumentation nuancée
LEÇON 3/8 — Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÈLE
A: Es lässt sich kaum bestreiten, dass …
B: Zwar …, jedoch …
A: Dem könnte man entgegenhalten, dass …
B: Unter diesen Umständen …

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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Argumentation nuancée','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Argumentation nuancée');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur — Argumentation nuancée','allemand-b2-m01-l04','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 1/12 — Argumentation nuancée
LEÇON 4/8 — Grammaire en profondeur

POINT DE GRAMMAIRE
connecteurs complexes; concessions.

EXPLICATION
La grammaire n’est pas une liste de règles à mémoriser séparément : elle sert à exprimer une intention. Observez d’abord la place du verbe, puis les compléments, et enfin les éléments de temps, cause ou opinion.

EXEMPLES
• Es lässt sich kaum bestreiten, dass …
• Zwar …, jedoch …
• Dem könnte man entgegenhalten, dass …
• Unter diesen Umständen …

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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Argumentation nuancée','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Argumentation nuancée');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Compréhension et production — Argumentation nuancée','allemand-b2-m01-l05','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 1/12 — Argumentation nuancée
LEÇON 5/8 — Compréhension et production

TEXTE / SITUATION
Imaginez une situation réelle autour de « Argumentation nuancée ». Les personnes utilisent les expressions suivantes :
• Es lässt sich kaum bestreiten, dass …
• Zwar …, jedoch …
• Dem könnte man entgegenhalten, dass …
• Unter diesen Umständen …

COMPRÉHENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou émotion peut-on déduire ?
4. Reformulez le contenu en français, puis en allemand simple.

PRODUCTION ÉCRITE
Rédigez un texte adapté au niveau B2. Utilisez au moins 8 éléments du module et 3 structures liées à : connecteurs complexes; concessions.

PRODUCTION ORALE
Parlez pendant 2 à 4 minutes sans lire. Recommencez en améliorant la fluidité.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Argumentation nuancée','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Argumentation nuancée');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif — Argumentation nuancée','allemand-b2-m01-l06','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 1/12 — Argumentation nuancée
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
• Es lässt sich kaum bestreiten, dass …
• Zwar …, jedoch …
• Dem könnte man entgegenhalten, dass …
• Unter diesen Umständen …

GRAMMAIRE À RÉUTILISER
connecteurs complexes; concessions.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Argumentation nuancée','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Argumentation nuancée');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module — Argumentation nuancée','allemand-b2-m01-l07','quiz','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 1/12 — Argumentation nuancée
LEÇON 7/8 — Quiz de module

QUIZ DE VALIDATION — Argumentation nuancée

Avant de valider, vous devez pouvoir :
• comprendre les quatre expressions du module ;
• expliquer le point de grammaire « connecteurs complexes; concessions » ;
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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Argumentation nuancée','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Argumentation nuancée');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission réelle — Argumentation nuancée','allemand-b2-m01-l08','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 1/12 — Argumentation nuancée
LEÇON 8/8 — Mission réelle

MISSION RÉELLE — Argumentation nuancée

SCÉNARIO
Vous devez défendre une position avec nuances. Vous n’avez droit qu’à l’allemand.

LIVRABLES
1. Un texte de 180 à 350 mots.
2. Un enregistrement oral de 3 à 6 minutes.
3. Un dialogue de 10 répliques.
4. Une liste de 15 mots ou expressions réellement utiles.
5. Une auto-correction : trois erreurs repérées et expliquées.

CRITÈRES
Clarté, correction, vocabulaire adapté, fluidité et capacité à accomplir la tâche.

EXPRESSIONS À RÉUTILISER
• Es lässt sich kaum bestreiten, dass …
• Zwar …, jedoch …
• Dem könnte man entgegenhalten, dass …
• Unter diesen Umständen …

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Argumentation nuancée','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Argumentation nuancée');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B2 · Module 2 — Langue professionnelle','Niveau B2 : participer à des réunions et négocier. Grammaire : registre professionnel; propositions. 8 leçons avec théorie, audio, exercices, quiz et mission réelle.',38) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre — Langue professionnelle','allemand-b2-m02-l01','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 2/12 — Langue professionnelle
LEÇON 1/8 — Comprendre

OBJECTIF
Participer à des réunions et négocier.

EXPLICATION EN FRANÇAIS
À ce niveau, vous devez apprendre à communiquer avec argumentation nuancée, compréhension authentique et langue professionnelle. Le thème « Langue professionnelle » sert de contexte réel. Commencez par comprendre l’intention, puis repérez le verbe, les informations importantes et enfin les détails.

MÉTHODE
1. Lisez les phrases sans traduire mot à mot.
2. Soulignez le verbe conjugué.
3. Repérez qui parle, à qui et dans quel but.
4. Répétez chaque phrase à voix haute trois fois.
5. Changez un élément pour créer votre propre exemple.

EXEMPLES ALLEMANDS
• Darf ich kurz ergänzen?
• Ich schlage vor, dass …
• Könnten wir uns darauf einigen?
• Wer übernimmt die Verantwortung dafür?

À RETENIR
Grammaire centrale : registre professionnel; propositions.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Langue professionnelle','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Langue professionnelle');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif — Langue professionnelle','allemand-b2-m02-l02','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 2/12 — Langue professionnelle
LEÇON 2/8 — Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur « Langue professionnelle ».

VOCABULAIRE À ACTIVER
Darf, Könnten, Verantwortung, dafür, darauf, dass, einigen, ergänzen, kurz, schlage, übernimmt

TECHNIQUE 4 ÉTAPES
1. Écoutez le mot avec le bouton audio.
2. Répétez-le dans une phrase complète.
3. Créez une phrase vraie sur votre vie.
4. Réutilisez-le 24 heures plus tard.

MODÈLES
• Darf ich kurz ergänzen?
• Ich schlage vor, dass …
• Könnten wir uns darauf einigen?
• Wer übernimmt die Verantwortung dafür?

EXERCICES
1. Choisissez 10 mots et écrivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez l’allemand et traduisez vos phrases du français vers l’allemand.
4. Enregistrez oralement un résumé de 60 secondes.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Langue professionnelle','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Langue professionnelle');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation — Langue professionnelle','allemand-b2-m02-l03','audio','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 2/12 — Langue professionnelle
LEÇON 3/8 — Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÈLE
A: Darf ich kurz ergänzen?
B: Ich schlage vor, dass …
A: Könnten wir uns darauf einigen?
B: Wer übernimmt die Verantwortung dafür?

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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Langue professionnelle','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Langue professionnelle');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur — Langue professionnelle','allemand-b2-m02-l04','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 2/12 — Langue professionnelle
LEÇON 4/8 — Grammaire en profondeur

POINT DE GRAMMAIRE
registre professionnel; propositions.

EXPLICATION
La grammaire n’est pas une liste de règles à mémoriser séparément : elle sert à exprimer une intention. Observez d’abord la place du verbe, puis les compléments, et enfin les éléments de temps, cause ou opinion.

EXEMPLES
• Darf ich kurz ergänzen?
• Ich schlage vor, dass …
• Könnten wir uns darauf einigen?
• Wer übernimmt die Verantwortung dafür?

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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Langue professionnelle','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Langue professionnelle');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Compréhension et production — Langue professionnelle','allemand-b2-m02-l05','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 2/12 — Langue professionnelle
LEÇON 5/8 — Compréhension et production

TEXTE / SITUATION
Imaginez une situation réelle autour de « Langue professionnelle ». Les personnes utilisent les expressions suivantes :
• Darf ich kurz ergänzen?
• Ich schlage vor, dass …
• Könnten wir uns darauf einigen?
• Wer übernimmt die Verantwortung dafür?

COMPRÉHENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou émotion peut-on déduire ?
4. Reformulez le contenu en français, puis en allemand simple.

PRODUCTION ÉCRITE
Rédigez un texte adapté au niveau B2. Utilisez au moins 8 éléments du module et 3 structures liées à : registre professionnel; propositions.

PRODUCTION ORALE
Parlez pendant 2 à 4 minutes sans lire. Recommencez en améliorant la fluidité.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Langue professionnelle','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Langue professionnelle');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif — Langue professionnelle','allemand-b2-m02-l06','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 2/12 — Langue professionnelle
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
• Darf ich kurz ergänzen?
• Ich schlage vor, dass …
• Könnten wir uns darauf einigen?
• Wer übernimmt die Verantwortung dafür?

GRAMMAIRE À RÉUTILISER
registre professionnel; propositions.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Langue professionnelle','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Langue professionnelle');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module — Langue professionnelle','allemand-b2-m02-l07','quiz','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 2/12 — Langue professionnelle
LEÇON 7/8 — Quiz de module

QUIZ DE VALIDATION — Langue professionnelle

Avant de valider, vous devez pouvoir :
• comprendre les quatre expressions du module ;
• expliquer le point de grammaire « registre professionnel; propositions » ;
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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Langue professionnelle','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Langue professionnelle');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission réelle — Langue professionnelle','allemand-b2-m02-l08','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 2/12 — Langue professionnelle
LEÇON 8/8 — Mission réelle

MISSION RÉELLE — Langue professionnelle

SCÉNARIO
Vous devez participer à des réunions et négocier. Vous n’avez droit qu’à l’allemand.

LIVRABLES
1. Un texte de 180 à 350 mots.
2. Un enregistrement oral de 3 à 6 minutes.
3. Un dialogue de 10 répliques.
4. Une liste de 15 mots ou expressions réellement utiles.
5. Une auto-correction : trois erreurs repérées et expliquées.

CRITÈRES
Clarté, correction, vocabulaire adapté, fluidité et capacité à accomplir la tâche.

EXPRESSIONS À RÉUTILISER
• Darf ich kurz ergänzen?
• Ich schlage vor, dass …
• Könnten wir uns darauf einigen?
• Wer übernimmt die Verantwortung dafür?

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Langue professionnelle','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Langue professionnelle');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B2 · Module 3 — Rapports et synthèses','Niveau B2 : résumer plusieurs informations. Grammaire : passif; nominalisations. 8 leçons avec théorie, audio, exercices, quiz et mission réelle.',39) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre — Rapports et synthèses','allemand-b2-m03-l01','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 3/12 — Rapports et synthèses
LEÇON 1/8 — Comprendre

OBJECTIF
Résumer plusieurs informations.

EXPLICATION EN FRANÇAIS
À ce niveau, vous devez apprendre à communiquer avec argumentation nuancée, compréhension authentique et langue professionnelle. Le thème « Rapports et synthèses » sert de contexte réel. Commencez par comprendre l’intention, puis repérez le verbe, les informations importantes et enfin les détails.

MÉTHODE
1. Lisez les phrases sans traduire mot à mot.
2. Soulignez le verbe conjugué.
3. Repérez qui parle, à qui et dans quel but.
4. Répétez chaque phrase à voix haute trois fois.
5. Changez un élément pour créer votre propre exemple.

EXEMPLES ALLEMANDS
• Aus den vorliegenden Daten geht hervor, dass …
• Im Gegensatz dazu …
• Die Ergebnisse deuten darauf hin …
• Daraus lässt sich schließen …

À RETENIR
Grammaire centrale : passif; nominalisations.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Rapports et synthèses','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Rapports et synthèses');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif — Rapports et synthèses','allemand-b2-m03-l02','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 3/12 — Rapports et synthèses
LEÇON 2/8 — Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur « Rapports et synthèses ».

VOCABULAIRE À ACTIVER
Daraus, Daten, Ergebnisse, Gegensatz, darauf, dass, dazu, deuten, geht, hervor, lässt, schließen, sich, vorliegenden

TECHNIQUE 4 ÉTAPES
1. Écoutez le mot avec le bouton audio.
2. Répétez-le dans une phrase complète.
3. Créez une phrase vraie sur votre vie.
4. Réutilisez-le 24 heures plus tard.

MODÈLES
• Aus den vorliegenden Daten geht hervor, dass …
• Im Gegensatz dazu …
• Die Ergebnisse deuten darauf hin …
• Daraus lässt sich schließen …

EXERCICES
1. Choisissez 10 mots et écrivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez l’allemand et traduisez vos phrases du français vers l’allemand.
4. Enregistrez oralement un résumé de 60 secondes.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Rapports et synthèses','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Rapports et synthèses');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation — Rapports et synthèses','allemand-b2-m03-l03','audio','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 3/12 — Rapports et synthèses
LEÇON 3/8 — Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÈLE
A: Aus den vorliegenden Daten geht hervor, dass …
B: Im Gegensatz dazu …
A: Die Ergebnisse deuten darauf hin …
B: Daraus lässt sich schließen …

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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Rapports et synthèses','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Rapports et synthèses');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur — Rapports et synthèses','allemand-b2-m03-l04','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 3/12 — Rapports et synthèses
LEÇON 4/8 — Grammaire en profondeur

POINT DE GRAMMAIRE
passif; nominalisations.

EXPLICATION
La grammaire n’est pas une liste de règles à mémoriser séparément : elle sert à exprimer une intention. Observez d’abord la place du verbe, puis les compléments, et enfin les éléments de temps, cause ou opinion.

EXEMPLES
• Aus den vorliegenden Daten geht hervor, dass …
• Im Gegensatz dazu …
• Die Ergebnisse deuten darauf hin …
• Daraus lässt sich schließen …

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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Rapports et synthèses','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Rapports et synthèses');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Compréhension et production — Rapports et synthèses','allemand-b2-m03-l05','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 3/12 — Rapports et synthèses
LEÇON 5/8 — Compréhension et production

TEXTE / SITUATION
Imaginez une situation réelle autour de « Rapports et synthèses ». Les personnes utilisent les expressions suivantes :
• Aus den vorliegenden Daten geht hervor, dass …
• Im Gegensatz dazu …
• Die Ergebnisse deuten darauf hin …
• Daraus lässt sich schließen …

COMPRÉHENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou émotion peut-on déduire ?
4. Reformulez le contenu en français, puis en allemand simple.

PRODUCTION ÉCRITE
Rédigez un texte adapté au niveau B2. Utilisez au moins 8 éléments du module et 3 structures liées à : passif; nominalisations.

PRODUCTION ORALE
Parlez pendant 2 à 4 minutes sans lire. Recommencez en améliorant la fluidité.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Rapports et synthèses','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Rapports et synthèses');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif — Rapports et synthèses','allemand-b2-m03-l06','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 3/12 — Rapports et synthèses
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
• Aus den vorliegenden Daten geht hervor, dass …
• Im Gegensatz dazu …
• Die Ergebnisse deuten darauf hin …
• Daraus lässt sich schließen …

GRAMMAIRE À RÉUTILISER
passif; nominalisations.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Rapports et synthèses','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Rapports et synthèses');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module — Rapports et synthèses','allemand-b2-m03-l07','quiz','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 3/12 — Rapports et synthèses
LEÇON 7/8 — Quiz de module

QUIZ DE VALIDATION — Rapports et synthèses

Avant de valider, vous devez pouvoir :
• comprendre les quatre expressions du module ;
• expliquer le point de grammaire « passif; nominalisations » ;
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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Rapports et synthèses','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Rapports et synthèses');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission réelle — Rapports et synthèses','allemand-b2-m03-l08','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 3/12 — Rapports et synthèses
LEÇON 8/8 — Mission réelle

MISSION RÉELLE — Rapports et synthèses

SCÉNARIO
Vous devez résumer plusieurs informations. Vous n’avez droit qu’à l’allemand.

LIVRABLES
1. Un texte de 180 à 350 mots.
2. Un enregistrement oral de 3 à 6 minutes.
3. Un dialogue de 10 répliques.
4. Une liste de 15 mots ou expressions réellement utiles.
5. Une auto-correction : trois erreurs repérées et expliquées.

CRITÈRES
Clarté, correction, vocabulaire adapté, fluidité et capacité à accomplir la tâche.

EXPRESSIONS À RÉUTILISER
• Aus den vorliegenden Daten geht hervor, dass …
• Im Gegensatz dazu …
• Die Ergebnisse deuten darauf hin …
• Daraus lässt sich schließen …

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Rapports et synthèses','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Rapports et synthèses');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B2 · Module 4 — Science et technologie','Niveau B2 : expliquer un concept complexe clairement. Grammaire : relations logiques; participe. 8 leçons avec théorie, audio, exercices, quiz et mission réelle.',40) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre — Science et technologie','allemand-b2-m04-l01','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 4/12 — Science et technologie
LEÇON 1/8 — Comprendre

OBJECTIF
Expliquer un concept complexe clairement.

EXPLICATION EN FRANÇAIS
À ce niveau, vous devez apprendre à communiquer avec argumentation nuancée, compréhension authentique et langue professionnelle. Le thème « Science et technologie » sert de contexte réel. Commencez par comprendre l’intention, puis repérez le verbe, les informations importantes et enfin les détails.

MÉTHODE
1. Lisez les phrases sans traduire mot à mot.
2. Soulignez le verbe conjugué.
3. Repérez qui parle, à qui et dans quel but.
4. Répétez chaque phrase à voix haute trois fois.
5. Changez un élément pour créer votre propre exemple.

EXEMPLES ALLEMANDS
• Unter diesem Begriff versteht man …
• Der Prozess besteht aus …
• Entscheidend ist dabei …
• Dies führt wiederum dazu, dass …

À RETENIR
Grammaire centrale : relations logiques; participe.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Science et technologie','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Science et technologie');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif — Science et technologie','allemand-b2-m04-l02','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 4/12 — Science et technologie
LEÇON 2/8 — Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur « Science et technologie ».

VOCABULAIRE À ACTIVER
Begriff, Dies, Entscheidend, Prozess, Unter, besteht, dabei, dass, dazu, diesem, führt, versteht, wiederum

TECHNIQUE 4 ÉTAPES
1. Écoutez le mot avec le bouton audio.
2. Répétez-le dans une phrase complète.
3. Créez une phrase vraie sur votre vie.
4. Réutilisez-le 24 heures plus tard.

MODÈLES
• Unter diesem Begriff versteht man …
• Der Prozess besteht aus …
• Entscheidend ist dabei …
• Dies führt wiederum dazu, dass …

EXERCICES
1. Choisissez 10 mots et écrivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez l’allemand et traduisez vos phrases du français vers l’allemand.
4. Enregistrez oralement un résumé de 60 secondes.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Science et technologie','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Science et technologie');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation — Science et technologie','allemand-b2-m04-l03','audio','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 4/12 — Science et technologie
LEÇON 3/8 — Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÈLE
A: Unter diesem Begriff versteht man …
B: Der Prozess besteht aus …
A: Entscheidend ist dabei …
B: Dies führt wiederum dazu, dass …

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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Science et technologie','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Science et technologie');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur — Science et technologie','allemand-b2-m04-l04','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 4/12 — Science et technologie
LEÇON 4/8 — Grammaire en profondeur

POINT DE GRAMMAIRE
relations logiques; participe.

EXPLICATION
La grammaire n’est pas une liste de règles à mémoriser séparément : elle sert à exprimer une intention. Observez d’abord la place du verbe, puis les compléments, et enfin les éléments de temps, cause ou opinion.

EXEMPLES
• Unter diesem Begriff versteht man …
• Der Prozess besteht aus …
• Entscheidend ist dabei …
• Dies führt wiederum dazu, dass …

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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Science et technologie','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Science et technologie');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Compréhension et production — Science et technologie','allemand-b2-m04-l05','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 4/12 — Science et technologie
LEÇON 5/8 — Compréhension et production

TEXTE / SITUATION
Imaginez une situation réelle autour de « Science et technologie ». Les personnes utilisent les expressions suivantes :
• Unter diesem Begriff versteht man …
• Der Prozess besteht aus …
• Entscheidend ist dabei …
• Dies führt wiederum dazu, dass …

COMPRÉHENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou émotion peut-on déduire ?
4. Reformulez le contenu en français, puis en allemand simple.

PRODUCTION ÉCRITE
Rédigez un texte adapté au niveau B2. Utilisez au moins 8 éléments du module et 3 structures liées à : relations logiques; participe.

PRODUCTION ORALE
Parlez pendant 2 à 4 minutes sans lire. Recommencez en améliorant la fluidité.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Science et technologie','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Science et technologie');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif — Science et technologie','allemand-b2-m04-l06','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 4/12 — Science et technologie
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
• Unter diesem Begriff versteht man …
• Der Prozess besteht aus …
• Entscheidend ist dabei …
• Dies führt wiederum dazu, dass …

GRAMMAIRE À RÉUTILISER
relations logiques; participe.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Science et technologie','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Science et technologie');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module — Science et technologie','allemand-b2-m04-l07','quiz','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 4/12 — Science et technologie
LEÇON 7/8 — Quiz de module

QUIZ DE VALIDATION — Science et technologie

Avant de valider, vous devez pouvoir :
• comprendre les quatre expressions du module ;
• expliquer le point de grammaire « relations logiques; participe » ;
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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Science et technologie','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Science et technologie');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission réelle — Science et technologie','allemand-b2-m04-l08','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 4/12 — Science et technologie
LEÇON 8/8 — Mission réelle

MISSION RÉELLE — Science et technologie

SCÉNARIO
Vous devez expliquer un concept complexe clairement. Vous n’avez droit qu’à l’allemand.

LIVRABLES
1. Un texte de 180 à 350 mots.
2. Un enregistrement oral de 3 à 6 minutes.
3. Un dialogue de 10 répliques.
4. Une liste de 15 mots ou expressions réellement utiles.
5. Une auto-correction : trois erreurs repérées et expliquées.

CRITÈRES
Clarté, correction, vocabulaire adapté, fluidité et capacité à accomplir la tâche.

EXPRESSIONS À RÉUTILISER
• Unter diesem Begriff versteht man …
• Der Prozess besteht aus …
• Entscheidend ist dabei …
• Dies führt wiederum dazu, dass …

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Science et technologie','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Science et technologie');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B2 · Module 5 — Économie et travail','Niveau B2 : analyser tendances et conséquences. Grammaire : causalité formelle; Konjunktiv II. 8 leçons avec théorie, audio, exercices, quiz et mission réelle.',41) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre — Économie et travail','allemand-b2-m05-l01','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 5/12 — Économie et travail
LEÇON 1/8 — Comprendre

OBJECTIF
Analyser tendances et conséquences.

EXPLICATION EN FRANÇAIS
À ce niveau, vous devez apprendre à communiquer avec argumentation nuancée, compréhension authentique et langue professionnelle. Le thème « Économie et travail » sert de contexte réel. Commencez par comprendre l’intention, puis repérez le verbe, les informations importantes et enfin les détails.

MÉTHODE
1. Lisez les phrases sans traduire mot à mot.
2. Soulignez le verbe conjugué.
3. Repérez qui parle, à qui et dans quel but.
4. Répétez chaque phrase à voix haute trois fois.
5. Changez un élément pour créer votre propre exemple.

EXEMPLES ALLEMANDS
• Die Nachfrage ist gestiegen.
• Dies ist auf mehrere Faktoren zurückzuführen.
• Langfristig könnte sich …
• Unternehmen stehen vor der Herausforderung …

À RETENIR
Grammaire centrale : causalité formelle; Konjunktiv II.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Économie et travail','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Économie et travail');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif — Économie et travail','allemand-b2-m05-l02','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 5/12 — Économie et travail
LEÇON 2/8 — Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur « Économie et travail ».

VOCABULAIRE À ACTIVER
Dies, Faktoren, Herausforderung, Langfristig, Nachfrage, Unternehmen, gestiegen, könnte, mehrere, sich, stehen, zurückzuführen

TECHNIQUE 4 ÉTAPES
1. Écoutez le mot avec le bouton audio.
2. Répétez-le dans une phrase complète.
3. Créez une phrase vraie sur votre vie.
4. Réutilisez-le 24 heures plus tard.

MODÈLES
• Die Nachfrage ist gestiegen.
• Dies ist auf mehrere Faktoren zurückzuführen.
• Langfristig könnte sich …
• Unternehmen stehen vor der Herausforderung …

EXERCICES
1. Choisissez 10 mots et écrivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez l’allemand et traduisez vos phrases du français vers l’allemand.
4. Enregistrez oralement un résumé de 60 secondes.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Économie et travail','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Économie et travail');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation — Économie et travail','allemand-b2-m05-l03','audio','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 5/12 — Économie et travail
LEÇON 3/8 — Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÈLE
A: Die Nachfrage ist gestiegen.
B: Dies ist auf mehrere Faktoren zurückzuführen.
A: Langfristig könnte sich …
B: Unternehmen stehen vor der Herausforderung …

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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Économie et travail','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Économie et travail');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur — Économie et travail','allemand-b2-m05-l04','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 5/12 — Économie et travail
LEÇON 4/8 — Grammaire en profondeur

POINT DE GRAMMAIRE
causalité formelle; Konjunktiv II.

EXPLICATION
La grammaire n’est pas une liste de règles à mémoriser séparément : elle sert à exprimer une intention. Observez d’abord la place du verbe, puis les compléments, et enfin les éléments de temps, cause ou opinion.

EXEMPLES
• Die Nachfrage ist gestiegen.
• Dies ist auf mehrere Faktoren zurückzuführen.
• Langfristig könnte sich …
• Unternehmen stehen vor der Herausforderung …

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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Économie et travail','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Économie et travail');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Compréhension et production — Économie et travail','allemand-b2-m05-l05','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 5/12 — Économie et travail
LEÇON 5/8 — Compréhension et production

TEXTE / SITUATION
Imaginez une situation réelle autour de « Économie et travail ». Les personnes utilisent les expressions suivantes :
• Die Nachfrage ist gestiegen.
• Dies ist auf mehrere Faktoren zurückzuführen.
• Langfristig könnte sich …
• Unternehmen stehen vor der Herausforderung …

COMPRÉHENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou émotion peut-on déduire ?
4. Reformulez le contenu en français, puis en allemand simple.

PRODUCTION ÉCRITE
Rédigez un texte adapté au niveau B2. Utilisez au moins 8 éléments du module et 3 structures liées à : causalité formelle; Konjunktiv II.

PRODUCTION ORALE
Parlez pendant 2 à 4 minutes sans lire. Recommencez en améliorant la fluidité.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Économie et travail','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Économie et travail');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif — Économie et travail','allemand-b2-m05-l06','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 5/12 — Économie et travail
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
• Die Nachfrage ist gestiegen.
• Dies ist auf mehrere Faktoren zurückzuführen.
• Langfristig könnte sich …
• Unternehmen stehen vor der Herausforderung …

GRAMMAIRE À RÉUTILISER
causalité formelle; Konjunktiv II.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Économie et travail','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Économie et travail');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module — Économie et travail','allemand-b2-m05-l07','quiz','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 5/12 — Économie et travail
LEÇON 7/8 — Quiz de module

QUIZ DE VALIDATION — Économie et travail

Avant de valider, vous devez pouvoir :
• comprendre les quatre expressions du module ;
• expliquer le point de grammaire « causalité formelle; Konjunktiv II » ;
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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Économie et travail','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Économie et travail');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission réelle — Économie et travail','allemand-b2-m05-l08','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 5/12 — Économie et travail
LEÇON 8/8 — Mission réelle

MISSION RÉELLE — Économie et travail

SCÉNARIO
Vous devez analyser tendances et conséquences. Vous n’avez droit qu’à l’allemand.

LIVRABLES
1. Un texte de 180 à 350 mots.
2. Un enregistrement oral de 3 à 6 minutes.
3. Un dialogue de 10 répliques.
4. Une liste de 15 mots ou expressions réellement utiles.
5. Une auto-correction : trois erreurs repérées et expliquées.

CRITÈRES
Clarté, correction, vocabulaire adapté, fluidité et capacité à accomplir la tâche.

EXPRESSIONS À RÉUTILISER
• Die Nachfrage ist gestiegen.
• Dies ist auf mehrere Faktoren zurückzuführen.
• Langfristig könnte sich …
• Unternehmen stehen vor der Herausforderung …

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Économie et travail','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Économie et travail');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'B2 · Module 6 — Politique et société','Niveau B2 : discuter des enjeux sociaux avec neutralité. Grammaire : discours rapporté; neutralité. 8 leçons avec théorie, audio, exercices, quiz et mission réelle.',42) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre — Politique et société','allemand-b2-m06-l01','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 6/12 — Politique et société
LEÇON 1/8 — Comprendre

OBJECTIF
Discuter des enjeux sociaux avec neutralité.

EXPLICATION EN FRANÇAIS
À ce niveau, vous devez apprendre à communiquer avec argumentation nuancée, compréhension authentique et langue professionnelle. Le thème « Politique et société » sert de contexte réel. Commencez par comprendre l’intention, puis repérez le verbe, les informations importantes et enfin les détails.

MÉTHODE
1. Lisez les phrases sans traduire mot à mot.
2. Soulignez le verbe conjugué.
3. Repérez qui parle, à qui et dans quel but.
4. Répétez chaque phrase à voix haute trois fois.
5. Changez un élément pour créer votre propre exemple.

EXEMPLES ALLEMANDS
• Befürworter argumentieren, dass …
• Kritiker weisen darauf hin …
• Die Debatte dreht sich um …
• Eine abschließende Bewertung ist schwierig.

À RETENIR
Grammaire centrale : discours rapporté; neutralité.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Politique et société','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Politique et société');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif — Politique et société','allemand-b2-m06-l02','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 6/12 — Politique et société
LEÇON 2/8 — Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur « Politique et société ».

VOCABULAIRE À ACTIVER
Befürworter, Bewertung, Debatte, Eine, Kritiker, abschließende, argumentieren, darauf, dass, dreht, schwierig, sich, weisen

TECHNIQUE 4 ÉTAPES
1. Écoutez le mot avec le bouton audio.
2. Répétez-le dans une phrase complète.
3. Créez une phrase vraie sur votre vie.
4. Réutilisez-le 24 heures plus tard.

MODÈLES
• Befürworter argumentieren, dass …
• Kritiker weisen darauf hin …
• Die Debatte dreht sich um …
• Eine abschließende Bewertung ist schwierig.

EXERCICES
1. Choisissez 10 mots et écrivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez l’allemand et traduisez vos phrases du français vers l’allemand.
4. Enregistrez oralement un résumé de 60 secondes.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Politique et société','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Politique et société');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation — Politique et société','allemand-b2-m06-l03','audio','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 6/12 — Politique et société
LEÇON 3/8 — Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÈLE
A: Befürworter argumentieren, dass …
B: Kritiker weisen darauf hin …
A: Die Debatte dreht sich um …
B: Eine abschließende Bewertung ist schwierig.

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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Politique et société','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Politique et société');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur — Politique et société','allemand-b2-m06-l04','text','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 6/12 — Politique et société
LEÇON 4/8 — Grammaire en profondeur

POINT DE GRAMMAIRE
discours rapporté; neutralité.

EXPLICATION
La grammaire n’est pas une liste de règles à mémoriser séparément : elle sert à exprimer une intention. Observez d’abord la place du verbe, puis les compléments, et enfin les éléments de temps, cause ou opinion.

EXEMPLES
• Befürworter argumentieren, dass …
• Kritiker weisen darauf hin …
• Die Debatte dreht sich um …
• Eine abschließende Bewertung ist schwierig.

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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Politique et société','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Politique et société');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Compréhension et production — Politique et société','allemand-b2-m06-l05','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 6/12 — Politique et société
LEÇON 5/8 — Compréhension et production

TEXTE / SITUATION
Imaginez une situation réelle autour de « Politique et société ». Les personnes utilisent les expressions suivantes :
• Befürworter argumentieren, dass …
• Kritiker weisen darauf hin …
• Die Debatte dreht sich um …
• Eine abschließende Bewertung ist schwierig.

COMPRÉHENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou émotion peut-on déduire ?
4. Reformulez le contenu en français, puis en allemand simple.

PRODUCTION ÉCRITE
Rédigez un texte adapté au niveau B2. Utilisez au moins 8 éléments du module et 3 structures liées à : discours rapporté; neutralité.

PRODUCTION ORALE
Parlez pendant 2 à 4 minutes sans lire. Recommencez en améliorant la fluidité.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Politique et société','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Politique et société');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif — Politique et société','allemand-b2-m06-l06','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 6/12 — Politique et société
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
• Befürworter argumentieren, dass …
• Kritiker weisen darauf hin …
• Die Debatte dreht sich um …
• Eine abschließende Bewertung ist schwierig.

GRAMMAIRE À RÉUTILISER
discours rapporté; neutralité.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Politique et société','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Politique et société');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module — Politique et société','allemand-b2-m06-l07','quiz','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 6/12 — Politique et société
LEÇON 7/8 — Quiz de module

QUIZ DE VALIDATION — Politique et société

Avant de valider, vous devez pouvoir :
• comprendre les quatre expressions du module ;
• expliquer le point de grammaire « discours rapporté; neutralité » ;
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
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Politique et société','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Politique et société');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission réelle — Politique et société','allemand-b2-m06-l08','exercise','ALLEMAND FONCTIONNEL — NIVEAU B2
MODULE 6/12 — Politique et société
LEÇON 8/8 — Mission réelle

MISSION RÉELLE — Politique et société

SCÉNARIO
Vous devez discuter des enjeux sociaux avec neutralité. Vous n’avez droit qu’à l’allemand.

LIVRABLES
1. Un texte de 180 à 350 mots.
2. Un enregistrement oral de 3 à 6 minutes.
3. Un dialogue de 10 répliques.
4. Une liste de 15 mots ou expressions réellement utiles.
5. Une auto-correction : trois erreurs repérées et expliquées.

CRITÈRES
Clarté, correction, vocabulaire adapté, fluidité et capacité à accomplir la tâche.

EXPRESSIONS À RÉUTILISER
• Befürworter argumentieren, dass …
• Kritiker weisen darauf hin …
• Die Debatte dreht sich um …
• Eine abschließende Bewertung ist schwierig.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Politique et société','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Politique et société');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
END $$;

SELECT 'Partie 7/10 installée : modules 37 à 42' AS resultat;
