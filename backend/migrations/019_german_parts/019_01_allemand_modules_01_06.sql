-- StudyLink 019 - Allemand fonctionnel complet A1 a C1
-- 60 modules, 480 lecons, exercices, quiz, audio navigateur, documents et ressources video.
DO $$
DECLARE v_author UUID; v_cat INTEGER; v_course UUID; v_module UUID; v_lesson UUID;
BEGIN
  SELECT id INTO v_author FROM public.users ORDER BY CASE WHEN role='admin' THEN 0 ELSE 1 END, created_at LIMIT 1;
  IF v_author IS NULL THEN RAISE EXCEPTION 'Aucun utilisateur existe. Creez d abord un compte StudyLink.'; END IF;
  INSERT INTO public.learning_categories(name,slug,description) SELECT 'Langues','langues','Langues vivantes, communication et preparation aux certifications' WHERE NOT EXISTS (SELECT 1 FROM public.learning_categories WHERE name='Langues');
  SELECT id INTO v_cat FROM public.learning_categories WHERE name='Langues' ORDER BY id LIMIT 1;
  INSERT INTO public.courses(author_id,category_id,title,slug,short_description,description,cover_url,level,language,estimated_minutes,price,is_free,status,content_type,objectives,prerequisites,published_at)
  VALUES(v_author,v_cat,'Allemand fonctionnel complet — A1 à C1','allemand-fonctionnel-a1-c1','Parcours complet pour parler, comprendre, écrire et travailler en allemand du niveau A1 au C1.','Un cursus progressif et intensif de 60 modules et 480 leçons : grammaire expliquée en français, vocabulaire actif, dialogues, prononciation, audio, compréhension, expression orale et écrite, ateliers, quiz, missions réelles, fiches téléchargeables et ressources vidéo.','https://images.unsplash.com/photo-1467269204594-9661b134dd2b?auto=format&fit=crop&w=1200&q=80','all','de',36000,0,true,'published','course',ARRAY['Passer progressivement du niveau A1 au niveau C1','Comprendre l allemand quotidien, professionnel et académique','Parler avec fluidité et précision','Écrire des messages, courriels, rapports et textes argumentés','Préparer des examens Goethe, telc et tâches du CECRL'],ARRAY['Aucun prérequis pour commencer au niveau A1','Un casque ou des haut-parleurs pour les activités audio','Pratique régulière recommandée'],now())
  ON CONFLICT(slug) DO UPDATE SET category_id=EXCLUDED.category_id,title=EXCLUDED.title,short_description=EXCLUDED.short_description,description=EXCLUDED.description,cover_url=EXCLUDED.cover_url,level='all',language='de',estimated_minutes=EXCLUDED.estimated_minutes,status='published',objectives=EXCLUDED.objectives,prerequisites=EXCLUDED.prerequisites,published_at=COALESCE(courses.published_at,now()),updated_at=now() RETURNING id INTO v_course;
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'A1 · Module 1 — Premiers contacts','Niveau A1 : saluer, se présenter et épeler. Grammaire : sein, heißen, kommen; pronoms personnels. 8 leçons avec théorie, audio, exercices, quiz et mission réelle.',1) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre — Premiers contacts','allemand-a1-m01-l01','text','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 1/12 — Premiers contacts
LEÇON 1/8 — Comprendre

OBJECTIF
Saluer, se présenter et épeler.

EXPLICATION EN FRANÇAIS
À ce niveau, vous devez apprendre à communiquer avec phrases très simples, débit lent et situations quotidiennes. Le thème « Premiers contacts » sert de contexte réel. Commencez par comprendre l’intention, puis repérez le verbe, les informations importantes et enfin les détails.

MÉTHODE
1. Lisez les phrases sans traduire mot à mot.
2. Soulignez le verbe conjugué.
3. Repérez qui parle, à qui et dans quel but.
4. Répétez chaque phrase à voix haute trois fois.
5. Changez un élément pour créer votre propre exemple.

EXEMPLES ALLEMANDS
• Hallo! Ich heiße …
• Wie heißt du?
• Ich komme aus …
• Wie geht es dir?

À RETENIR
Grammaire centrale : sein, heißen, kommen; pronoms personnels.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,1,true) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Premiers contacts','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Premiers contacts');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif — Premiers contacts','allemand-a1-m01-l02','text','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 1/12 — Premiers contacts
LEÇON 2/8 — Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur « Premiers contacts ».

VOCABULAIRE À ACTIVER
Hallo, geht, heiße, heißt, komme

TECHNIQUE 4 ÉTAPES
1. Écoutez le mot avec le bouton audio.
2. Répétez-le dans une phrase complète.
3. Créez une phrase vraie sur votre vie.
4. Réutilisez-le 24 heures plus tard.

MODÈLES
• Hallo! Ich heiße …
• Wie heißt du?
• Ich komme aus …
• Wie geht es dir?

EXERCICES
1. Choisissez 10 mots et écrivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez l’allemand et traduisez vos phrases du français vers l’allemand.
4. Enregistrez oralement un résumé de 60 secondes.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,2,true) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Premiers contacts','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Premiers contacts');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation — Premiers contacts','allemand-a1-m01-l03','audio','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 1/12 — Premiers contacts
LEÇON 3/8 — Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÈLE
A: Hallo! Ich heiße …
B: Wie heißt du?
A: Ich komme aus …
B: Wie geht es dir?

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,3,true) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Premiers contacts','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Premiers contacts');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur — Premiers contacts','allemand-a1-m01-l04','text','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 1/12 — Premiers contacts
LEÇON 4/8 — Grammaire en profondeur

POINT DE GRAMMAIRE
sein, heißen, kommen; pronoms personnels.

EXPLICATION
La grammaire n’est pas une liste de règles à mémoriser séparément : elle sert à exprimer une intention. Observez d’abord la place du verbe, puis les compléments, et enfin les éléments de temps, cause ou opinion.

EXEMPLES
• Hallo! Ich heiße …
• Wie heißt du?
• Ich komme aus …
• Wie geht es dir?

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Premiers contacts','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Premiers contacts');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Compréhension et production — Premiers contacts','allemand-a1-m01-l05','exercise','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 1/12 — Premiers contacts
LEÇON 5/8 — Compréhension et production

TEXTE / SITUATION
Imaginez une situation réelle autour de « Premiers contacts ». Les personnes utilisent les expressions suivantes :
• Hallo! Ich heiße …
• Wie heißt du?
• Ich komme aus …
• Wie geht es dir?

COMPRÉHENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou émotion peut-on déduire ?
4. Reformulez le contenu en français, puis en allemand simple.

PRODUCTION ÉCRITE
Rédigez un texte adapté au niveau A1. Utilisez au moins 8 éléments du module et 3 structures liées à : sein, heißen, kommen; pronoms personnels.

PRODUCTION ORALE
Parlez pendant 1 minute sans lire. Recommencez en améliorant la fluidité.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Premiers contacts','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Premiers contacts');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif — Premiers contacts','allemand-a1-m01-l06','exercise','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 1/12 — Premiers contacts
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
• Hallo! Ich heiße …
• Wie heißt du?
• Ich komme aus …
• Wie geht es dir?

GRAMMAIRE À RÉUTILISER
sein, heißen, kommen; pronoms personnels.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Premiers contacts','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Premiers contacts');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module — Premiers contacts','allemand-a1-m01-l07','quiz','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 1/12 — Premiers contacts
LEÇON 7/8 — Quiz de module

QUIZ DE VALIDATION — Premiers contacts

Avant de valider, vous devez pouvoir :
• comprendre les quatre expressions du module ;
• expliquer le point de grammaire « sein, heißen, kommen; pronoms personnels » ;
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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Premiers contacts','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Premiers contacts');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission réelle — Premiers contacts','allemand-a1-m01-l08','exercise','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 1/12 — Premiers contacts
LEÇON 8/8 — Mission réelle

MISSION RÉELLE — Premiers contacts

SCÉNARIO
Vous devez saluer, se présenter et épeler. Vous n’avez droit qu’à l’allemand.

LIVRABLES
1. Un texte de 80 à 120 mots.
2. Un enregistrement oral de 1 à 2 minutes.
3. Un dialogue de 10 répliques.
4. Une liste de 15 mots ou expressions réellement utiles.
5. Une auto-correction : trois erreurs repérées et expliquées.

CRITÈRES
Clarté, correction, vocabulaire adapté, fluidité et capacité à accomplir la tâche.

EXPRESSIONS À RÉUTILISER
• Hallo! Ich heiße …
• Wie heißt du?
• Ich komme aus …
• Wie geht es dir?

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Premiers contacts','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Premiers contacts');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'A1 · Module 2 — Nombres, heure et dates','Niveau A1 : compter, dire l’heure et fixer une date. Grammaire : nombres; am, um; ordre des mots. 8 leçons avec théorie, audio, exercices, quiz et mission réelle.',2) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre — Nombres, heure et dates','allemand-a1-m02-l01','text','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 2/12 — Nombres, heure et dates
LEÇON 1/8 — Comprendre

OBJECTIF
Compter, dire l’heure et fixer une date.

EXPLICATION EN FRANÇAIS
À ce niveau, vous devez apprendre à communiquer avec phrases très simples, débit lent et situations quotidiennes. Le thème « Nombres, heure et dates » sert de contexte réel. Commencez par comprendre l’intention, puis repérez le verbe, les informations importantes et enfin les détails.

MÉTHODE
1. Lisez les phrases sans traduire mot à mot.
2. Soulignez le verbe conjugué.
3. Repérez qui parle, à qui et dans quel but.
4. Répétez chaque phrase à voix haute trois fois.
5. Changez un élément pour créer votre propre exemple.

EXEMPLES ALLEMANDS
• Wie spät ist es?
• Es ist halb acht.
• Heute ist der dritte Mai.
• Um wie viel Uhr?

À RETENIR
Grammaire centrale : nombres; am, um; ordre des mots.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Nombres, heure et dates','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Nombres, heure et dates');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif — Nombres, heure et dates','allemand-a1-m02-l02','text','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 2/12 — Nombres, heure et dates
LEÇON 2/8 — Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur « Nombres, heure et dates ».

VOCABULAIRE À ACTIVER
Heute, acht, dritte, halb, spät, viel

TECHNIQUE 4 ÉTAPES
1. Écoutez le mot avec le bouton audio.
2. Répétez-le dans une phrase complète.
3. Créez une phrase vraie sur votre vie.
4. Réutilisez-le 24 heures plus tard.

MODÈLES
• Wie spät ist es?
• Es ist halb acht.
• Heute ist der dritte Mai.
• Um wie viel Uhr?

EXERCICES
1. Choisissez 10 mots et écrivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez l’allemand et traduisez vos phrases du français vers l’allemand.
4. Enregistrez oralement un résumé de 60 secondes.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Nombres, heure et dates','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Nombres, heure et dates');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation — Nombres, heure et dates','allemand-a1-m02-l03','audio','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 2/12 — Nombres, heure et dates
LEÇON 3/8 — Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÈLE
A: Wie spät ist es?
B: Es ist halb acht.
A: Heute ist der dritte Mai.
B: Um wie viel Uhr?

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Nombres, heure et dates','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Nombres, heure et dates');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur — Nombres, heure et dates','allemand-a1-m02-l04','text','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 2/12 — Nombres, heure et dates
LEÇON 4/8 — Grammaire en profondeur

POINT DE GRAMMAIRE
nombres; am, um; ordre des mots.

EXPLICATION
La grammaire n’est pas une liste de règles à mémoriser séparément : elle sert à exprimer une intention. Observez d’abord la place du verbe, puis les compléments, et enfin les éléments de temps, cause ou opinion.

EXEMPLES
• Wie spät ist es?
• Es ist halb acht.
• Heute ist der dritte Mai.
• Um wie viel Uhr?

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Nombres, heure et dates','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Nombres, heure et dates');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Compréhension et production — Nombres, heure et dates','allemand-a1-m02-l05','exercise','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 2/12 — Nombres, heure et dates
LEÇON 5/8 — Compréhension et production

TEXTE / SITUATION
Imaginez une situation réelle autour de « Nombres, heure et dates ». Les personnes utilisent les expressions suivantes :
• Wie spät ist es?
• Es ist halb acht.
• Heute ist der dritte Mai.
• Um wie viel Uhr?

COMPRÉHENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou émotion peut-on déduire ?
4. Reformulez le contenu en français, puis en allemand simple.

PRODUCTION ÉCRITE
Rédigez un texte adapté au niveau A1. Utilisez au moins 8 éléments du module et 3 structures liées à : nombres; am, um; ordre des mots.

PRODUCTION ORALE
Parlez pendant 1 minute sans lire. Recommencez en améliorant la fluidité.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Nombres, heure et dates','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Nombres, heure et dates');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif — Nombres, heure et dates','allemand-a1-m02-l06','exercise','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 2/12 — Nombres, heure et dates
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
• Wie spät ist es?
• Es ist halb acht.
• Heute ist der dritte Mai.
• Um wie viel Uhr?

GRAMMAIRE À RÉUTILISER
nombres; am, um; ordre des mots.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Nombres, heure et dates','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Nombres, heure et dates');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module — Nombres, heure et dates','allemand-a1-m02-l07','quiz','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 2/12 — Nombres, heure et dates
LEÇON 7/8 — Quiz de module

QUIZ DE VALIDATION — Nombres, heure et dates

Avant de valider, vous devez pouvoir :
• comprendre les quatre expressions du module ;
• expliquer le point de grammaire « nombres; am, um; ordre des mots » ;
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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Nombres, heure et dates','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Nombres, heure et dates');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission réelle — Nombres, heure et dates','allemand-a1-m02-l08','exercise','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 2/12 — Nombres, heure et dates
LEÇON 8/8 — Mission réelle

MISSION RÉELLE — Nombres, heure et dates

SCÉNARIO
Vous devez compter, dire l’heure et fixer une date. Vous n’avez droit qu’à l’allemand.

LIVRABLES
1. Un texte de 80 à 120 mots.
2. Un enregistrement oral de 1 à 2 minutes.
3. Un dialogue de 10 répliques.
4. Une liste de 15 mots ou expressions réellement utiles.
5. Une auto-correction : trois erreurs repérées et expliquées.

CRITÈRES
Clarté, correction, vocabulaire adapté, fluidité et capacité à accomplir la tâche.

EXPRESSIONS À RÉUTILISER
• Wie spät ist es?
• Es ist halb acht.
• Heute ist der dritte Mai.
• Um wie viel Uhr?

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Nombres, heure et dates','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Nombres, heure et dates');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'A1 · Module 3 — Famille et personnes','Niveau A1 : présenter sa famille et décrire une personne. Grammaire : haben; possessifs mein/dein; articles. 8 leçons avec théorie, audio, exercices, quiz et mission réelle.',3) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre — Famille et personnes','allemand-a1-m03-l01','text','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 3/12 — Famille et personnes
LEÇON 1/8 — Comprendre

OBJECTIF
Présenter sa famille et décrire une personne.

EXPLICATION EN FRANÇAIS
À ce niveau, vous devez apprendre à communiquer avec phrases très simples, débit lent et situations quotidiennes. Le thème « Famille et personnes » sert de contexte réel. Commencez par comprendre l’intention, puis repérez le verbe, les informations importantes et enfin les détails.

MÉTHODE
1. Lisez les phrases sans traduire mot à mot.
2. Soulignez le verbe conjugué.
3. Repérez qui parle, à qui et dans quel but.
4. Répétez chaque phrase à voix haute trois fois.
5. Changez un élément pour créer votre propre exemple.

EXEMPLES ALLEMANDS
• Das ist meine Schwester.
• Ich habe zwei Brüder.
• Er ist freundlich.
• Sie wohnt in Berlin.

À RETENIR
Grammaire centrale : haben; possessifs mein/dein; articles.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Famille et personnes','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Famille et personnes');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif — Famille et personnes','allemand-a1-m03-l02','text','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 3/12 — Famille et personnes
LEÇON 2/8 — Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur « Famille et personnes ».

VOCABULAIRE À ACTIVER
Berlin, Brüder, Schwester, freundlich, habe, meine, wohnt, zwei

TECHNIQUE 4 ÉTAPES
1. Écoutez le mot avec le bouton audio.
2. Répétez-le dans une phrase complète.
3. Créez une phrase vraie sur votre vie.
4. Réutilisez-le 24 heures plus tard.

MODÈLES
• Das ist meine Schwester.
• Ich habe zwei Brüder.
• Er ist freundlich.
• Sie wohnt in Berlin.

EXERCICES
1. Choisissez 10 mots et écrivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez l’allemand et traduisez vos phrases du français vers l’allemand.
4. Enregistrez oralement un résumé de 60 secondes.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Famille et personnes','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Famille et personnes');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation — Famille et personnes','allemand-a1-m03-l03','audio','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 3/12 — Famille et personnes
LEÇON 3/8 — Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÈLE
A: Das ist meine Schwester.
B: Ich habe zwei Brüder.
A: Er ist freundlich.
B: Sie wohnt in Berlin.

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Famille et personnes','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Famille et personnes');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur — Famille et personnes','allemand-a1-m03-l04','text','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 3/12 — Famille et personnes
LEÇON 4/8 — Grammaire en profondeur

POINT DE GRAMMAIRE
haben; possessifs mein/dein; articles.

EXPLICATION
La grammaire n’est pas une liste de règles à mémoriser séparément : elle sert à exprimer une intention. Observez d’abord la place du verbe, puis les compléments, et enfin les éléments de temps, cause ou opinion.

EXEMPLES
• Das ist meine Schwester.
• Ich habe zwei Brüder.
• Er ist freundlich.
• Sie wohnt in Berlin.

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Famille et personnes','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Famille et personnes');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Compréhension et production — Famille et personnes','allemand-a1-m03-l05','exercise','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 3/12 — Famille et personnes
LEÇON 5/8 — Compréhension et production

TEXTE / SITUATION
Imaginez une situation réelle autour de « Famille et personnes ». Les personnes utilisent les expressions suivantes :
• Das ist meine Schwester.
• Ich habe zwei Brüder.
• Er ist freundlich.
• Sie wohnt in Berlin.

COMPRÉHENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou émotion peut-on déduire ?
4. Reformulez le contenu en français, puis en allemand simple.

PRODUCTION ÉCRITE
Rédigez un texte adapté au niveau A1. Utilisez au moins 8 éléments du module et 3 structures liées à : haben; possessifs mein/dein; articles.

PRODUCTION ORALE
Parlez pendant 1 minute sans lire. Recommencez en améliorant la fluidité.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Famille et personnes','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Famille et personnes');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif — Famille et personnes','allemand-a1-m03-l06','exercise','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 3/12 — Famille et personnes
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
• Das ist meine Schwester.
• Ich habe zwei Brüder.
• Er ist freundlich.
• Sie wohnt in Berlin.

GRAMMAIRE À RÉUTILISER
haben; possessifs mein/dein; articles.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Famille et personnes','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Famille et personnes');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module — Famille et personnes','allemand-a1-m03-l07','quiz','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 3/12 — Famille et personnes
LEÇON 7/8 — Quiz de module

QUIZ DE VALIDATION — Famille et personnes

Avant de valider, vous devez pouvoir :
• comprendre les quatre expressions du module ;
• expliquer le point de grammaire « haben; possessifs mein/dein; articles » ;
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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Famille et personnes','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Famille et personnes');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission réelle — Famille et personnes','allemand-a1-m03-l08','exercise','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 3/12 — Famille et personnes
LEÇON 8/8 — Mission réelle

MISSION RÉELLE — Famille et personnes

SCÉNARIO
Vous devez présenter sa famille et décrire une personne. Vous n’avez droit qu’à l’allemand.

LIVRABLES
1. Un texte de 80 à 120 mots.
2. Un enregistrement oral de 1 à 2 minutes.
3. Un dialogue de 10 répliques.
4. Une liste de 15 mots ou expressions réellement utiles.
5. Une auto-correction : trois erreurs repérées et expliquées.

CRITÈRES
Clarté, correction, vocabulaire adapté, fluidité et capacité à accomplir la tâche.

EXPRESSIONS À RÉUTILISER
• Das ist meine Schwester.
• Ich habe zwei Brüder.
• Er ist freundlich.
• Sie wohnt in Berlin.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Famille et personnes','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Famille et personnes');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'A1 · Module 4 — Maison et logement','Niveau A1 : décrire son logement et localiser des objets. Grammaire : articles; es gibt; prépositions locales. 8 leçons avec théorie, audio, exercices, quiz et mission réelle.',4) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre — Maison et logement','allemand-a1-m04-l01','text','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 4/12 — Maison et logement
LEÇON 1/8 — Comprendre

OBJECTIF
Décrire son logement et localiser des objets.

EXPLICATION EN FRANÇAIS
À ce niveau, vous devez apprendre à communiquer avec phrases très simples, débit lent et situations quotidiennes. Le thème « Maison et logement » sert de contexte réel. Commencez par comprendre l’intention, puis repérez le verbe, les informations importantes et enfin les détails.

MÉTHODE
1. Lisez les phrases sans traduire mot à mot.
2. Soulignez le verbe conjugué.
3. Repérez qui parle, à qui et dans quel but.
4. Répétez chaque phrase à voix haute trois fois.
5. Changez un élément pour créer votre propre exemple.

EXEMPLES ALLEMANDS
• Die Küche ist klein.
• Der Tisch steht im Wohnzimmer.
• Wo ist der Schlüssel?
• Er liegt auf dem Regal.

À RETENIR
Grammaire centrale : articles; es gibt; prépositions locales.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Maison et logement','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Maison et logement');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif — Maison et logement','allemand-a1-m04-l02','text','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 4/12 — Maison et logement
LEÇON 2/8 — Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur « Maison et logement ».

VOCABULAIRE À ACTIVER
Küche, Regal, Schlüssel, Tisch, Wohnzimmer, klein, liegt, steht

TECHNIQUE 4 ÉTAPES
1. Écoutez le mot avec le bouton audio.
2. Répétez-le dans une phrase complète.
3. Créez une phrase vraie sur votre vie.
4. Réutilisez-le 24 heures plus tard.

MODÈLES
• Die Küche ist klein.
• Der Tisch steht im Wohnzimmer.
• Wo ist der Schlüssel?
• Er liegt auf dem Regal.

EXERCICES
1. Choisissez 10 mots et écrivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez l’allemand et traduisez vos phrases du français vers l’allemand.
4. Enregistrez oralement un résumé de 60 secondes.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Maison et logement','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Maison et logement');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation — Maison et logement','allemand-a1-m04-l03','audio','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 4/12 — Maison et logement
LEÇON 3/8 — Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÈLE
A: Die Küche ist klein.
B: Der Tisch steht im Wohnzimmer.
A: Wo ist der Schlüssel?
B: Er liegt auf dem Regal.

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Maison et logement','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Maison et logement');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur — Maison et logement','allemand-a1-m04-l04','text','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 4/12 — Maison et logement
LEÇON 4/8 — Grammaire en profondeur

POINT DE GRAMMAIRE
articles; es gibt; prépositions locales.

EXPLICATION
La grammaire n’est pas une liste de règles à mémoriser séparément : elle sert à exprimer une intention. Observez d’abord la place du verbe, puis les compléments, et enfin les éléments de temps, cause ou opinion.

EXEMPLES
• Die Küche ist klein.
• Der Tisch steht im Wohnzimmer.
• Wo ist der Schlüssel?
• Er liegt auf dem Regal.

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Maison et logement','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Maison et logement');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Compréhension et production — Maison et logement','allemand-a1-m04-l05','exercise','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 4/12 — Maison et logement
LEÇON 5/8 — Compréhension et production

TEXTE / SITUATION
Imaginez une situation réelle autour de « Maison et logement ». Les personnes utilisent les expressions suivantes :
• Die Küche ist klein.
• Der Tisch steht im Wohnzimmer.
• Wo ist der Schlüssel?
• Er liegt auf dem Regal.

COMPRÉHENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou émotion peut-on déduire ?
4. Reformulez le contenu en français, puis en allemand simple.

PRODUCTION ÉCRITE
Rédigez un texte adapté au niveau A1. Utilisez au moins 8 éléments du module et 3 structures liées à : articles; es gibt; prépositions locales.

PRODUCTION ORALE
Parlez pendant 1 minute sans lire. Recommencez en améliorant la fluidité.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Maison et logement','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Maison et logement');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif — Maison et logement','allemand-a1-m04-l06','exercise','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 4/12 — Maison et logement
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
• Die Küche ist klein.
• Der Tisch steht im Wohnzimmer.
• Wo ist der Schlüssel?
• Er liegt auf dem Regal.

GRAMMAIRE À RÉUTILISER
articles; es gibt; prépositions locales.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Maison et logement','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Maison et logement');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module — Maison et logement','allemand-a1-m04-l07','quiz','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 4/12 — Maison et logement
LEÇON 7/8 — Quiz de module

QUIZ DE VALIDATION — Maison et logement

Avant de valider, vous devez pouvoir :
• comprendre les quatre expressions du module ;
• expliquer le point de grammaire « articles; es gibt; prépositions locales » ;
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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Maison et logement','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Maison et logement');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission réelle — Maison et logement','allemand-a1-m04-l08','exercise','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 4/12 — Maison et logement
LEÇON 8/8 — Mission réelle

MISSION RÉELLE — Maison et logement

SCÉNARIO
Vous devez décrire son logement et localiser des objets. Vous n’avez droit qu’à l’allemand.

LIVRABLES
1. Un texte de 80 à 120 mots.
2. Un enregistrement oral de 1 à 2 minutes.
3. Un dialogue de 10 répliques.
4. Une liste de 15 mots ou expressions réellement utiles.
5. Une auto-correction : trois erreurs repérées et expliquées.

CRITÈRES
Clarté, correction, vocabulaire adapté, fluidité et capacité à accomplir la tâche.

EXPRESSIONS À RÉUTILISER
• Die Küche ist klein.
• Der Tisch steht im Wohnzimmer.
• Wo ist der Schlüssel?
• Er liegt auf dem Regal.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Maison et logement','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Maison et logement');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'A1 · Module 5 — Manger et boire','Niveau A1 : commander et parler de ses goûts. Grammaire : möchten; accusatif; gern/nicht gern. 8 leçons avec théorie, audio, exercices, quiz et mission réelle.',5) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre — Manger et boire','allemand-a1-m05-l01','text','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 5/12 — Manger et boire
LEÇON 1/8 — Comprendre

OBJECTIF
Commander et parler de ses goûts.

EXPLICATION EN FRANÇAIS
À ce niveau, vous devez apprendre à communiquer avec phrases très simples, débit lent et situations quotidiennes. Le thème « Manger et boire » sert de contexte réel. Commencez par comprendre l’intention, puis repérez le verbe, les informations importantes et enfin les détails.

MÉTHODE
1. Lisez les phrases sans traduire mot à mot.
2. Soulignez le verbe conjugué.
3. Repérez qui parle, à qui et dans quel but.
4. Répétez chaque phrase à voix haute trois fois.
5. Changez un élément pour créer votre propre exemple.

EXEMPLES ALLEMANDS
• Ich möchte einen Kaffee.
• Was möchtest du essen?
• Ich esse gern Reis.
• Die Rechnung, bitte.

À RETENIR
Grammaire centrale : möchten; accusatif; gern/nicht gern.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Manger et boire','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Manger et boire');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif — Manger et boire','allemand-a1-m05-l02','text','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 5/12 — Manger et boire
LEÇON 2/8 — Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur « Manger et boire ».

VOCABULAIRE À ACTIVER
Kaffee, Rechnung, Reis, bitte, einen, esse, essen, gern, möchte, möchtest

TECHNIQUE 4 ÉTAPES
1. Écoutez le mot avec le bouton audio.
2. Répétez-le dans une phrase complète.
3. Créez une phrase vraie sur votre vie.
4. Réutilisez-le 24 heures plus tard.

MODÈLES
• Ich möchte einen Kaffee.
• Was möchtest du essen?
• Ich esse gern Reis.
• Die Rechnung, bitte.

EXERCICES
1. Choisissez 10 mots et écrivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez l’allemand et traduisez vos phrases du français vers l’allemand.
4. Enregistrez oralement un résumé de 60 secondes.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Manger et boire','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Manger et boire');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation — Manger et boire','allemand-a1-m05-l03','audio','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 5/12 — Manger et boire
LEÇON 3/8 — Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÈLE
A: Ich möchte einen Kaffee.
B: Was möchtest du essen?
A: Ich esse gern Reis.
B: Die Rechnung, bitte.

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Manger et boire','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Manger et boire');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur — Manger et boire','allemand-a1-m05-l04','text','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 5/12 — Manger et boire
LEÇON 4/8 — Grammaire en profondeur

POINT DE GRAMMAIRE
möchten; accusatif; gern/nicht gern.

EXPLICATION
La grammaire n’est pas une liste de règles à mémoriser séparément : elle sert à exprimer une intention. Observez d’abord la place du verbe, puis les compléments, et enfin les éléments de temps, cause ou opinion.

EXEMPLES
• Ich möchte einen Kaffee.
• Was möchtest du essen?
• Ich esse gern Reis.
• Die Rechnung, bitte.

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Manger et boire','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Manger et boire');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Compréhension et production — Manger et boire','allemand-a1-m05-l05','exercise','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 5/12 — Manger et boire
LEÇON 5/8 — Compréhension et production

TEXTE / SITUATION
Imaginez une situation réelle autour de « Manger et boire ». Les personnes utilisent les expressions suivantes :
• Ich möchte einen Kaffee.
• Was möchtest du essen?
• Ich esse gern Reis.
• Die Rechnung, bitte.

COMPRÉHENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou émotion peut-on déduire ?
4. Reformulez le contenu en français, puis en allemand simple.

PRODUCTION ÉCRITE
Rédigez un texte adapté au niveau A1. Utilisez au moins 8 éléments du module et 3 structures liées à : möchten; accusatif; gern/nicht gern.

PRODUCTION ORALE
Parlez pendant 1 minute sans lire. Recommencez en améliorant la fluidité.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Manger et boire','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Manger et boire');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif — Manger et boire','allemand-a1-m05-l06','exercise','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 5/12 — Manger et boire
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
• Ich möchte einen Kaffee.
• Was möchtest du essen?
• Ich esse gern Reis.
• Die Rechnung, bitte.

GRAMMAIRE À RÉUTILISER
möchten; accusatif; gern/nicht gern.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Manger et boire','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Manger et boire');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module — Manger et boire','allemand-a1-m05-l07','quiz','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 5/12 — Manger et boire
LEÇON 7/8 — Quiz de module

QUIZ DE VALIDATION — Manger et boire

Avant de valider, vous devez pouvoir :
• comprendre les quatre expressions du module ;
• expliquer le point de grammaire « möchten; accusatif; gern/nicht gern » ;
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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Manger et boire','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Manger et boire');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission réelle — Manger et boire','allemand-a1-m05-l08','exercise','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 5/12 — Manger et boire
LEÇON 8/8 — Mission réelle

MISSION RÉELLE — Manger et boire

SCÉNARIO
Vous devez commander et parler de ses goûts. Vous n’avez droit qu’à l’allemand.

LIVRABLES
1. Un texte de 80 à 120 mots.
2. Un enregistrement oral de 1 à 2 minutes.
3. Un dialogue de 10 répliques.
4. Une liste de 15 mots ou expressions réellement utiles.
5. Une auto-correction : trois erreurs repérées et expliquées.

CRITÈRES
Clarté, correction, vocabulaire adapté, fluidité et capacité à accomplir la tâche.

EXPRESSIONS À RÉUTILISER
• Ich möchte einen Kaffee.
• Was möchtest du essen?
• Ich esse gern Reis.
• Die Rechnung, bitte.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Manger et boire','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Manger et boire');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'A1 · Module 6 — Routine quotidienne','Niveau A1 : raconter une journée simple. Grammaire : verbes séparables; présent; adverbes de temps. 8 leçons avec théorie, audio, exercices, quiz et mission réelle.',6) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre — Routine quotidienne','allemand-a1-m06-l01','text','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 6/12 — Routine quotidienne
LEÇON 1/8 — Comprendre

OBJECTIF
Raconter une journée simple.

EXPLICATION EN FRANÇAIS
À ce niveau, vous devez apprendre à communiquer avec phrases très simples, débit lent et situations quotidiennes. Le thème « Routine quotidienne » sert de contexte réel. Commencez par comprendre l’intention, puis repérez le verbe, les informations importantes et enfin les détails.

MÉTHODE
1. Lisez les phrases sans traduire mot à mot.
2. Soulignez le verbe conjugué.
3. Repérez qui parle, à qui et dans quel but.
4. Répétez chaque phrase à voix haute trois fois.
5. Changez un élément pour créer votre propre exemple.

EXEMPLES ALLEMANDS
• Ich stehe um sieben Uhr auf.
• Dann frühstücke ich.
• Am Abend lerne ich Deutsch.
• Wann gehst du schlafen?

À RETENIR
Grammaire centrale : verbes séparables; présent; adverbes de temps.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Routine quotidienne','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Routine quotidienne');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Vocabulaire actif — Routine quotidienne','allemand-a1-m06-l02','text','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 6/12 — Routine quotidienne
LEÇON 2/8 — Vocabulaire actif

OBJECTIF
Construire un vocabulaire actif sur « Routine quotidienne ».

VOCABULAIRE À ACTIVER
Abend, Dann, Deutsch, Wann, frühstücke, gehst, lerne, schlafen, sieben, stehe

TECHNIQUE 4 ÉTAPES
1. Écoutez le mot avec le bouton audio.
2. Répétez-le dans une phrase complète.
3. Créez une phrase vraie sur votre vie.
4. Réutilisez-le 24 heures plus tard.

MODÈLES
• Ich stehe um sieben Uhr auf.
• Dann frühstücke ich.
• Am Abend lerne ich Deutsch.
• Wann gehst du schlafen?

EXERCICES
1. Choisissez 10 mots et écrivez une phrase personnelle pour chacun.
2. Classez-les en noms, verbes, adjectifs et expressions.
3. Cachez l’allemand et traduisez vos phrases du français vers l’allemand.
4. Enregistrez oralement un résumé de 60 secondes.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Routine quotidienne','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Routine quotidienne');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dialogue et prononciation — Routine quotidienne','allemand-a1-m06-l03','audio','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 6/12 — Routine quotidienne
LEÇON 3/8 — Dialogue et prononciation

OBJECTIF
Comprendre, imiter et jouer un dialogue naturel.

DIALOGUE MODÈLE
A: Ich stehe um sieben Uhr auf.
B: Dann frühstücke ich.
A: Am Abend lerne ich Deutsch.
B: Wann gehst du schlafen?

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Routine quotidienne','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Routine quotidienne');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Grammaire en profondeur — Routine quotidienne','allemand-a1-m06-l04','text','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 6/12 — Routine quotidienne
LEÇON 4/8 — Grammaire en profondeur

POINT DE GRAMMAIRE
verbes séparables; présent; adverbes de temps.

EXPLICATION
La grammaire n’est pas une liste de règles à mémoriser séparément : elle sert à exprimer une intention. Observez d’abord la place du verbe, puis les compléments, et enfin les éléments de temps, cause ou opinion.

EXEMPLES
• Ich stehe um sieben Uhr auf.
• Dann frühstücke ich.
• Am Abend lerne ich Deutsch.
• Wann gehst du schlafen?

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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Routine quotidienne','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Routine quotidienne');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Compréhension et production — Routine quotidienne','allemand-a1-m06-l05','exercise','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 6/12 — Routine quotidienne
LEÇON 5/8 — Compréhension et production

TEXTE / SITUATION
Imaginez une situation réelle autour de « Routine quotidienne ». Les personnes utilisent les expressions suivantes :
• Ich stehe um sieben Uhr auf.
• Dann frühstücke ich.
• Am Abend lerne ich Deutsch.
• Wann gehst du schlafen?

COMPRÉHENSION
1. Quel est le but principal de la conversation ou du texte ?
2. Quelles sont les quatre informations essentielles ?
3. Quelle attitude ou émotion peut-on déduire ?
4. Reformulez le contenu en français, puis en allemand simple.

PRODUCTION ÉCRITE
Rédigez un texte adapté au niveau A1. Utilisez au moins 8 éléments du module et 3 structures liées à : verbes séparables; présent; adverbes de temps.

PRODUCTION ORALE
Parlez pendant 1 minute sans lire. Recommencez en améliorant la fluidité.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Routine quotidienne','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Routine quotidienne');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Atelier intensif — Routine quotidienne','allemand-a1-m06-l06','exercise','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 6/12 — Routine quotidienne
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
• Ich stehe um sieben Uhr auf.
• Dann frühstücke ich.
• Am Abend lerne ich Deutsch.
• Wann gehst du schlafen?

GRAMMAIRE À RÉUTILISER
verbes séparables; présent; adverbes de temps.

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Routine quotidienne','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Routine quotidienne');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz de module — Routine quotidienne','allemand-a1-m06-l07','quiz','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 6/12 — Routine quotidienne
LEÇON 7/8 — Quiz de module

QUIZ DE VALIDATION — Routine quotidienne

Avant de valider, vous devez pouvoir :
• comprendre les quatre expressions du module ;
• expliquer le point de grammaire « verbes séparables; présent; adverbes de temps » ;
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
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Routine quotidienne','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Routine quotidienne');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mission réelle — Routine quotidienne','allemand-a1-m06-l08','exercise','ALLEMAND FONCTIONNEL — NIVEAU A1
MODULE 6/12 — Routine quotidienne
LEÇON 8/8 — Mission réelle

MISSION RÉELLE — Routine quotidienne

SCÉNARIO
Vous devez raconter une journée simple. Vous n’avez droit qu’à l’allemand.

LIVRABLES
1. Un texte de 80 à 120 mots.
2. Un enregistrement oral de 1 à 2 minutes.
3. Un dialogue de 10 répliques.
4. Une liste de 15 mots ou expressions réellement utiles.
5. Une auto-correction : trois erreurs repérées et expliquées.

CRITÈRES
Clarté, correction, vocabulaire adapté, fluidité et capacité à accomplir la tâche.

EXPRESSIONS À RÉUTILISER
• Ich stehe um sieben Uhr auf.
• Dann frühstücke ich.
• Am Abend lerne ich Deutsch.
• Wann gehst du schlafen?

RITUEL AUDIO
Utilisez « Écouter l’allemand » : 1re écoute à vitesse 0,8 ; 2e écoute à vitesse normale ; 3e écoute en répétant à voix haute.

RÉVISION ESPACÉE
Revenez sur cette leçon après 1 jour, 7 jours et 30 jours.',1800,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche imprimable — Routine quotidienne','link','/lessons/' || v_lesson::text || '?course=allemand-fonctionnel-a1-c1' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche imprimable — Routine quotidienne');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'DW Learn German — vidéos et cours','link','https://www.youtube.com/@dwlearngerman' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='DW Learn German — vidéos et cours');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Goethe-Institut — apprendre l’allemand','link','https://www.youtube.com/@goetheinstitut' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Goethe-Institut — apprendre l’allemand');
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Nicos Weg — parcours vidéo','link','https://learngerman.dw.com/de/nicos-weg/c-36519687' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Nicos Weg — parcours vidéo');
END $$;

SELECT 'Partie 1/10 installée : modules 1 à 6' AS resultat;
