-- StudyLink 018 - Java de A a Z : debutant a expert
-- Parcours complet, idempotent : 18 modules, 144 lecons, exercices, challenges, mini-projets et quiz.
DO $$
DECLARE v_author UUID; v_cat INTEGER; v_course UUID; v_module UUID; v_lesson UUID; v_quiz UUID; v_question UUID;
BEGIN
  SELECT id INTO v_author FROM public.users ORDER BY CASE WHEN role='admin' THEN 0 ELSE 1 END, created_at LIMIT 1;
  IF v_author IS NULL THEN RAISE EXCEPTION 'Aucun utilisateur existe. Creez d abord un compte StudyLink.'; END IF;
  INSERT INTO public.learning_categories(name,slug,description) SELECT 'Informatique','informatique','Programmation, logiciel et technologies' WHERE NOT EXISTS (SELECT 1 FROM public.learning_categories WHERE name='Informatique');
  SELECT id INTO v_cat FROM public.learning_categories WHERE name='Informatique' ORDER BY id LIMIT 1;
  INSERT INTO public.courses(author_id,category_id,title,slug,short_description,description,cover_url,level,language,estimated_minutes,price,is_free,status,content_type,objectives,prerequisites,published_at)
  VALUES(v_author,v_cat,'Java de A à Z — Débutant à Expert','java-spring-boot','Apprenez Java depuis zéro jusqu’au niveau expert, avec Spring Boot, SQL, tests, sécurité et projet final.','Un parcours massif et progressif : syntaxe, algorithmique, POO, collections, streams, fichiers, concurrence, tests, JDBC, HTTP, architecture, JVM, Spring Boot, sécurité, Docker et projet final professionnel. Chaque module contient théorie, code, exercices guidés, challenges, débogage, mini-projets et quiz.','https://images.unsplash.com/photo-1516321318423-f06f85e504b3?auto=format&fit=crop&w=1200&q=80','all','fr',9000,0,true,'published','course',ARRAY['Programmer en Java de façon autonome','Maîtriser la POO, les collections, les streams et la concurrence','Tester et structurer des applications maintenables','Créer des API REST avec Spring Boot et PostgreSQL','Sécuriser, dockeriser et concevoir une application professionnelle'],ARRAY['Aucun prérequis en programmation','Un ordinateur capable d’exécuter un JDK','Régularité et volonté de pratiquer'],now())
  ON CONFLICT(slug) DO UPDATE SET category_id=EXCLUDED.category_id,title=EXCLUDED.title,short_description=EXCLUDED.short_description,description=EXCLUDED.description,cover_url=EXCLUDED.cover_url,level='all',estimated_minutes=EXCLUDED.estimated_minutes,status='published',objectives=EXCLUDED.objectives,prerequisites=EXCLUDED.prerequisites,published_at=COALESCE(courses.published_at,now()),updated_at=now() RETURNING id INTO v_course;
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'Module 1 — Démarrage : JDK, JVM et premier programme', 'Installer l’environnement Java et comprendre comment un programme est compilé puis exécuté.',1) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Comprendre Java, le JDK, la JVM et le bytecode','java-a-z-m01-l01','text','JAVA DE A À Z — MODULE 1/18

LEÇON 1/8 : Comprendre Java, le JDK, la JVM et le bytecode

OBJECTIF
Expliquez le rôle du JDK, de la JVM, du compilateur javac et du bytecode. Comparez le cycle de vie d’un programme Java avec un script interprété.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Expliquez le rôle du JDK, de la JVM, du compilateur javac et du bytecode. Comparez le cycle de vie d’un programme Java avec un script interprété.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,1,true) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Comprendre Java, le JDK, la JVM et le bytecode','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Comprendre Java, le JDK, la JVM et le bytecode');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Installer Java et configurer IntelliJ IDEA ou VS Code','java-a-z-m01-l02','text','JAVA DE A À Z — MODULE 1/18

LEÇON 2/8 : Installer Java et configurer IntelliJ IDEA ou VS Code

OBJECTIF
Installez un JDK LTS, vérifiez java -version et javac -version, créez un projet et repérez src, packages et terminal.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Installez un JDK LTS, vérifiez java -version et javac -version, créez un projet et repérez src, packages et terminal.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,2,true) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Installer Java et configurer IntelliJ IDEA ou VS Code','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Installer Java et configurer IntelliJ IDEA ou VS Code');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Écrire, compiler et exécuter HelloWorld','java-a-z-m01-l03','text','JAVA DE A À Z — MODULE 1/18

LEÇON 3/8 : Écrire, compiler et exécuter HelloWorld

OBJECTIF
Créez une classe HelloWorld avec main, compilez-la en ligne de commande et exécutez le fichier .class.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Créez une classe HelloWorld avec main, compilez-la en ligne de commande et exécutez le fichier .class.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Écrire, compiler et exécuter HelloWorld','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Écrire, compiler et exécuter HelloWorld');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Lire les erreurs de compilation','java-a-z-m01-l04','exercise','JAVA DE A À Z — MODULE 1/18

LEÇON 4/8 : Lire les erreurs de compilation

OBJECTIF
Corrigez des erreurs de point-virgule, accolades, nom de classe et signature de main.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Corrigez des erreurs de point-virgule, accolades, nom de classe et signature de main.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Lire les erreurs de compilation','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Lire les erreurs de compilation');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Exercice guidé : carte de visite console','java-a-z-m01-l05','exercise','JAVA DE A À Z — MODULE 1/18

LEÇON 5/8 : Exercice guidé : carte de visite console

OBJECTIF
Demandez un nom, un métier et une ville puis affichez une carte de visite propre.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Demandez un nom, un métier et une ville puis affichez une carte de visite propre.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Exercice guidé : carte de visite console','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Exercice guidé : carte de visite console');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Challenge : convertisseur Celsius/Fahrenheit','java-a-z-m01-l06','exercise','JAVA DE A À Z — MODULE 1/18

LEÇON 6/8 : Challenge : convertisseur Celsius/Fahrenheit

OBJECTIF
Lisez une température, convertissez-la dans les deux sens et formatez le résultat.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Lisez une température, convertissez-la dans les deux sens et formatez le résultat.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Challenge : convertisseur Celsius/Fahrenheit','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Challenge : convertisseur Celsius/Fahrenheit');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz : environnement Java','java-a-z-m01-l07','quiz','JAVA DE A À Z — MODULE 1/18

LEÇON 7/8 : Quiz : environnement Java

OBJECTIF
Validez JDK, JVM, bytecode, compilation et point d’entrée main.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Validez JDK, JVM, bytecode, compilation et point d’entrée main.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',1500,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Quiz : environnement Java','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Quiz : environnement Java');
  INSERT INTO public.quizzes(lesson_id,title,pass_score,max_attempts) VALUES(v_lesson,'Quiz — Démarrage : JDK, JVM et premier programme',70,NULL) ON CONFLICT(lesson_id) DO UPDATE SET title=EXCLUDED.title,pass_score=70 RETURNING id INTO v_quiz;
  DELETE FROM public.quiz_questions WHERE quiz_id=v_quiz;
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel est le meilleur résumé de l’objectif principal du module 1 ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,1) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Comprendre et pratiquer : Validez JDK, JVM, bytecode, compilation et point d’entrée main.',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Mémoriser uniquement la syntaxe',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter tous les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Copier une solution sans l’exécuter',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quelle méthode de travail est la plus fiable ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,2) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Écrire une version simple, tester, puis améliorer',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Optimiser avant de compiler',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ignorer les erreurs',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Changer plusieurs choses à la fois sans tester',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Que faut-il faire lorsqu’un programme échoue ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,3) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Lire l’erreur, isoler la cause et reproduire le problème',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Réécrire tout le projet',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Cacher l’exception',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel critère indique une vraie compréhension ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,4) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Pouvoir expliquer et appliquer sur un exemple différent',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir lu la leçon une seule fois',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Connaître le titre par cœur',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir copié le code',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Après un exercice réussi, quelle étape est la plus utile ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,5) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Tester un cas limite et une variante',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ne plus toucher au code',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les commentaires',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter toute refactorisation',false,4);
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Bilan et mini-projet : calculateur de bienvenue','java-a-z-m01-l08','exercise','JAVA DE A À Z — MODULE 1/18

LEÇON 8/8 : Bilan et mini-projet : calculateur de bienvenue

OBJECTIF
Créez une petite application console combinant saisie, calcul simple, affichage formaté et gestion d’une entrée invalide.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Créez une petite application console combinant saisie, calcul simple, affichage formaté et gestion d’une entrée invalide.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Bilan et mini-projet : calculateur de bienvenue','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Bilan et mini-projet : calculateur de bienvenue');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'Module 2 — Syntaxe, variables, types et opérateurs', 'Maîtriser les briques élémentaires de Java et raisonner correctement sur les types.',2) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Variables, constantes et conventions de nommage','java-a-z-m02-l01','text','JAVA DE A À Z — MODULE 2/18

LEÇON 1/8 : Variables, constantes et conventions de nommage

OBJECTIF
Travaillez int, long, double, float, boolean, char, String, final et les conventions camelCase/PascalCase.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Travaillez int, long, double, float, boolean, char, String, final et les conventions camelCase/PascalCase.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Variables, constantes et conventions de nommage','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Variables, constantes et conventions de nommage');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Conversions implicites, cast et précision numérique','java-a-z-m02-l02','text','JAVA DE A À Z — MODULE 2/18

LEÇON 2/8 : Conversions implicites, cast et précision numérique

OBJECTIF
Testez widening, narrowing, division entière et pertes de précision.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Testez widening, narrowing, division entière et pertes de précision.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Conversions implicites, cast et précision numérique','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Conversions implicites, cast et précision numérique');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Opérateurs arithmétiques, logiques et comparaisons','java-a-z-m02-l03','text','JAVA DE A À Z — MODULE 2/18

LEÇON 3/8 : Opérateurs arithmétiques, logiques et comparaisons

OBJECTIF
Utilisez + - * / %, &&, ||, !, ==, !=, <, >, <=, >= et expliquez la priorité des opérateurs.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Utilisez + - * / %, &&, ||, !, ==, !=, <, >, <=, >= et expliquez la priorité des opérateurs.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Opérateurs arithmétiques, logiques et comparaisons','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Opérateurs arithmétiques, logiques et comparaisons');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Strings : concaténation, formatage et méthodes utiles','java-a-z-m02-l04','text','JAVA DE A À Z — MODULE 2/18

LEÇON 4/8 : Strings : concaténation, formatage et méthodes utiles

OBJECTIF
Manipulez length, substring, contains, equals, equalsIgnoreCase, trim, replace et String.format.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Manipulez length, substring, contains, equals, equalsIgnoreCase, trim, replace et String.format.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Strings : concaténation, formatage et méthodes utiles','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Strings : concaténation, formatage et méthodes utiles');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Exercice : calculatrice de budget mensuel','java-a-z-m02-l05','exercise','JAVA DE A À Z — MODULE 2/18

LEÇON 5/8 : Exercice : calculatrice de budget mensuel

OBJECTIF
Calculez revenu, charges, reste à vivre et pourcentage d’épargne.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Calculez revenu, charges, reste à vivre et pourcentage d’épargne.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Exercice : calculatrice de budget mensuel','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Exercice : calculatrice de budget mensuel');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Débogage : overflow, division entière et comparaison de String','java-a-z-m02-l06','exercise','JAVA DE A À Z — MODULE 2/18

LEÇON 6/8 : Débogage : overflow, division entière et comparaison de String

OBJECTIF
Corrigez trois bugs classiques liés aux types et à == sur les chaînes.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Corrigez trois bugs classiques liés aux types et à == sur les chaînes.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Débogage : overflow, division entière et comparaison de String','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Débogage : overflow, division entière et comparaison de String');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz : types et opérateurs','java-a-z-m02-l07','quiz','JAVA DE A À Z — MODULE 2/18

LEÇON 7/8 : Quiz : types et opérateurs

OBJECTIF
Vérifiez votre compréhension des types primitifs, références, casts et expressions.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Vérifiez votre compréhension des types primitifs, références, casts et expressions.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',1500,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Quiz : types et opérateurs','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Quiz : types et opérateurs');
  INSERT INTO public.quizzes(lesson_id,title,pass_score,max_attempts) VALUES(v_lesson,'Quiz — Syntaxe, variables, types et opérateurs',70,NULL) ON CONFLICT(lesson_id) DO UPDATE SET title=EXCLUDED.title,pass_score=70 RETURNING id INTO v_quiz;
  DELETE FROM public.quiz_questions WHERE quiz_id=v_quiz;
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel est le meilleur résumé de l’objectif principal du module 2 ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,1) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Comprendre et pratiquer : Vérifiez votre compréhension des types primitifs, références, casts et expressions.',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Mémoriser uniquement la syntaxe',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter tous les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Copier une solution sans l’exécuter',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quelle méthode de travail est la plus fiable ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,2) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Écrire une version simple, tester, puis améliorer',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Optimiser avant de compiler',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ignorer les erreurs',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Changer plusieurs choses à la fois sans tester',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Que faut-il faire lorsqu’un programme échoue ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,3) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Lire l’erreur, isoler la cause et reproduire le problème',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Réécrire tout le projet',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Cacher l’exception',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel critère indique une vraie compréhension ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,4) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Pouvoir expliquer et appliquer sur un exemple différent',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir lu la leçon une seule fois',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Connaître le titre par cœur',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir copié le code',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Après un exercice réussi, quelle étape est la plus utile ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,5) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Tester un cas limite et une variante',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ne plus toucher au code',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les commentaires',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter toute refactorisation',false,4);
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mini-projet : facture avec TVA et remise','java-a-z-m02-l08','exercise','JAVA DE A À Z — MODULE 2/18

LEÇON 8/8 : Mini-projet : facture avec TVA et remise

OBJECTIF
Construisez une facture console avec quantité, prix unitaire, TVA, remise conditionnelle et total formaté.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Construisez une facture console avec quantité, prix unitaire, TVA, remise conditionnelle et total formaté.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Mini-projet : facture avec TVA et remise','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Mini-projet : facture avec TVA et remise');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'Module 3 — Conditions et boucles', 'Contrôler le flux d’exécution avec des décisions et répétitions robustes.',3) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'if, else if, else et expressions booléennes','java-a-z-m03-l01','text','JAVA DE A À Z — MODULE 3/18

LEÇON 1/8 : if, else if, else et expressions booléennes

OBJECTIF
Construisez des conditions lisibles et évitez les expressions inutilement complexes.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Construisez des conditions lisibles et évitez les expressions inutilement complexes.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — if, else if, else et expressions booléennes','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — if, else if, else et expressions booléennes');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'switch classique et switch expression','java-a-z-m03-l02','text','JAVA DE A À Z — MODULE 3/18

LEÇON 2/8 : switch classique et switch expression

OBJECTIF
Comparez switch traditionnel et syntaxe moderne avec flèches et yield.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Comparez switch traditionnel et syntaxe moderne avec flèches et yield.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — switch classique et switch expression','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — switch classique et switch expression');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'for, while et do-while','java-a-z-m03-l03','text','JAVA DE A À Z — MODULE 3/18

LEÇON 3/8 : for, while et do-while

OBJECTIF
Choisissez la bonne boucle selon le problème et gérez correctement les bornes.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Choisissez la bonne boucle selon le problème et gérez correctement les bornes.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — for, while et do-while','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — for, while et do-while');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'break, continue et boucles imbriquées','java-a-z-m03-l04','text','JAVA DE A À Z — MODULE 3/18

LEÇON 4/8 : break, continue et boucles imbriquées

OBJECTIF
Parcourez des grilles et contrôlez la sortie d’une boucle.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Parcourez des grilles et contrôlez la sortie d’une boucle.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — break, continue et boucles imbriquées','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — break, continue et boucles imbriquées');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Exercice : table de multiplication et statistiques','java-a-z-m03-l05','exercise','JAVA DE A À Z — MODULE 3/18

LEÇON 5/8 : Exercice : table de multiplication et statistiques

OBJECTIF
Affichez une table, puis calculez somme, moyenne, minimum et maximum d’une série.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Affichez une table, puis calculez somme, moyenne, minimum et maximum d’une série.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Exercice : table de multiplication et statistiques','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Exercice : table de multiplication et statistiques');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Challenge : jeu du nombre mystère','java-a-z-m03-l06','exercise','JAVA DE A À Z — MODULE 3/18

LEÇON 6/8 : Challenge : jeu du nombre mystère

OBJECTIF
Générez un nombre aléatoire, limitez les tentatives et donnez des indices.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Générez un nombre aléatoire, limitez les tentatives et donnez des indices.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Challenge : jeu du nombre mystère','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Challenge : jeu du nombre mystère');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz : contrôle de flux','java-a-z-m03-l07','quiz','JAVA DE A À Z — MODULE 3/18

LEÇON 7/8 : Quiz : contrôle de flux

OBJECTIF
Testez conditions, switch, portée et terminaison des boucles.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Testez conditions, switch, portée et terminaison des boucles.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',1500,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Quiz : contrôle de flux','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Quiz : contrôle de flux');
  INSERT INTO public.quizzes(lesson_id,title,pass_score,max_attempts) VALUES(v_lesson,'Quiz — Conditions et boucles',70,NULL) ON CONFLICT(lesson_id) DO UPDATE SET title=EXCLUDED.title,pass_score=70 RETURNING id INTO v_quiz;
  DELETE FROM public.quiz_questions WHERE quiz_id=v_quiz;
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel est le meilleur résumé de l’objectif principal du module 3 ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,1) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Comprendre et pratiquer : Testez conditions, switch, portée et terminaison des boucles.',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Mémoriser uniquement la syntaxe',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter tous les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Copier une solution sans l’exécuter',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quelle méthode de travail est la plus fiable ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,2) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Écrire une version simple, tester, puis améliorer',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Optimiser avant de compiler',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ignorer les erreurs',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Changer plusieurs choses à la fois sans tester',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Que faut-il faire lorsqu’un programme échoue ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,3) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Lire l’erreur, isoler la cause et reproduire le problème',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Réécrire tout le projet',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Cacher l’exception',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel critère indique une vraie compréhension ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,4) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Pouvoir expliquer et appliquer sur un exemple différent',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir lu la leçon une seule fois',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Connaître le titre par cœur',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir copié le code',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Après un exercice réussi, quelle étape est la plus utile ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,5) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Tester un cas limite et une variante',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ne plus toucher au code',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les commentaires',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter toute refactorisation',false,4);
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mini-projet : menu bancaire console','java-a-z-m03-l08','exercise','JAVA DE A À Z — MODULE 3/18

LEÇON 8/8 : Mini-projet : menu bancaire console

OBJECTIF
Implémentez consulter solde, déposer, retirer, historique simple et quitter.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Implémentez consulter solde, déposer, retirer, historique simple et quitter.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Mini-projet : menu bancaire console','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Mini-projet : menu bancaire console');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'Module 4 — Méthodes, tableaux et chaînes de caractères', 'Découper un programme en fonctions réutilisables et manipuler des collections simples.',4) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Déclarer et appeler une méthode','java-a-z-m04-l01','text','JAVA DE A À Z — MODULE 4/18

LEÇON 1/8 : Déclarer et appeler une méthode

OBJECTIF
Comprenez paramètres, valeur de retour, void, portée locale et pile d’appels.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Comprenez paramètres, valeur de retour, void, portée locale et pile d’appels.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Déclarer et appeler une méthode','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Déclarer et appeler une méthode');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Surcharge, varargs et passage de paramètres','java-a-z-m04-l02','text','JAVA DE A À Z — MODULE 4/18

LEÇON 2/8 : Surcharge, varargs et passage de paramètres

OBJECTIF
Créez plusieurs versions d’une méthode et observez le passage par valeur.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Créez plusieurs versions d’une méthode et observez le passage par valeur.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Surcharge, varargs et passage de paramètres','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Surcharge, varargs et passage de paramètres');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Tableaux 1D : création, parcours et algorithmes','java-a-z-m04-l03','text','JAVA DE A À Z — MODULE 4/18

LEÇON 3/8 : Tableaux 1D : création, parcours et algorithmes

OBJECTIF
Calculez moyenne, min, max, recherche et inversion d’un tableau.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Calculez moyenne, min, max, recherche et inversion d’un tableau.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Tableaux 1D : création, parcours et algorithmes','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Tableaux 1D : création, parcours et algorithmes');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Tableaux 2D et matrices','java-a-z-m04-l04','text','JAVA DE A À Z — MODULE 4/18

LEÇON 4/8 : Tableaux 2D et matrices

OBJECTIF
Parcourez lignes/colonnes, calculez une diagonale et transposez une matrice.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Parcourez lignes/colonnes, calculez une diagonale et transposez une matrice.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Tableaux 2D et matrices','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Tableaux 2D et matrices');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Exercice : analyser les notes d’une classe','java-a-z-m04-l05','exercise','JAVA DE A À Z — MODULE 4/18

LEÇON 5/8 : Exercice : analyser les notes d’une classe

OBJECTIF
Calculez statistiques, nombre d’admis et meilleure note à partir d’un tableau.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Calculez statistiques, nombre d’admis et meilleure note à partir d’un tableau.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Exercice : analyser les notes d’une classe','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Exercice : analyser les notes d’une classe');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Challenge : rotation et recherche dans un tableau','java-a-z-m04-l06','exercise','JAVA DE A À Z — MODULE 4/18

LEÇON 6/8 : Challenge : rotation et recherche dans un tableau

OBJECTIF
Effectuez une rotation de k positions et implémentez recherche linéaire puis binaire.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Effectuez une rotation de k positions et implémentez recherche linéaire puis binaire.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Challenge : rotation et recherche dans un tableau','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Challenge : rotation et recherche dans un tableau');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz : méthodes et tableaux','java-a-z-m04-l07','quiz','JAVA DE A À Z — MODULE 4/18

LEÇON 7/8 : Quiz : méthodes et tableaux

OBJECTIF
Validez signatures, surcharge, index, références et complexité élémentaire.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Validez signatures, surcharge, index, références et complexité élémentaire.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',1500,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Quiz : méthodes et tableaux','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Quiz : méthodes et tableaux');
  INSERT INTO public.quizzes(lesson_id,title,pass_score,max_attempts) VALUES(v_lesson,'Quiz — Méthodes, tableaux et chaînes de caractères',70,NULL) ON CONFLICT(lesson_id) DO UPDATE SET title=EXCLUDED.title,pass_score=70 RETURNING id INTO v_quiz;
  DELETE FROM public.quiz_questions WHERE quiz_id=v_quiz;
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel est le meilleur résumé de l’objectif principal du module 4 ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,1) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Comprendre et pratiquer : Validez signatures, surcharge, index, références et complexité élémentaire.',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Mémoriser uniquement la syntaxe',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter tous les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Copier une solution sans l’exécuter',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quelle méthode de travail est la plus fiable ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,2) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Écrire une version simple, tester, puis améliorer',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Optimiser avant de compiler',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ignorer les erreurs',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Changer plusieurs choses à la fois sans tester',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Que faut-il faire lorsqu’un programme échoue ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,3) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Lire l’erreur, isoler la cause et reproduire le problème',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Réécrire tout le projet',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Cacher l’exception',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel critère indique une vraie compréhension ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,4) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Pouvoir expliquer et appliquer sur un exemple différent',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir lu la leçon une seule fois',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Connaître le titre par cœur',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir copié le code',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Après un exercice réussi, quelle étape est la plus utile ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,5) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Tester un cas limite et une variante',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ne plus toucher au code',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les commentaires',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter toute refactorisation',false,4);
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mini-projet : gestionnaire de contacts en mémoire','java-a-z-m04-l08','exercise','JAVA DE A À Z — MODULE 4/18

LEÇON 8/8 : Mini-projet : gestionnaire de contacts en mémoire

OBJECTIF
Ajoutez, recherchez, modifiez et affichez des contacts stockés dans des tableaux.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Ajoutez, recherchez, modifiez et affichez des contacts stockés dans des tableaux.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Mini-projet : gestionnaire de contacts en mémoire','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Mini-projet : gestionnaire de contacts en mémoire');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'Module 5 — Programmation orientée objet : classes et objets', 'Passer d’un code procédural à une modélisation orientée objet claire.',5) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Classes, objets, attributs et méthodes','java-a-z-m05-l01','text','JAVA DE A À Z — MODULE 5/18

LEÇON 1/8 : Classes, objets, attributs et méthodes

OBJECTIF
Modélisez une entité et distinguez état, comportement, instance et classe.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Modélisez une entité et distinguez état, comportement, instance et classe.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Classes, objets, attributs et méthodes','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Classes, objets, attributs et méthodes');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Constructeurs, this et surcharge','java-a-z-m05-l02','text','JAVA DE A À Z — MODULE 5/18

LEÇON 2/8 : Constructeurs, this et surcharge

OBJECTIF
Créez plusieurs constructeurs cohérents et chaînez-les avec this().

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Créez plusieurs constructeurs cohérents et chaînez-les avec this().

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Constructeurs, this et surcharge','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Constructeurs, this et surcharge');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Encapsulation, getters, setters et invariants','java-a-z-m05-l03','text','JAVA DE A À Z — MODULE 5/18

LEÇON 3/8 : Encapsulation, getters, setters et invariants

OBJECTIF
Protégez les données et refusez les états invalides.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Protégez les données et refusez les états invalides.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Encapsulation, getters, setters et invariants','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Encapsulation, getters, setters et invariants');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'static, final et membres de classe','java-a-z-m05-l04','text','JAVA DE A À Z — MODULE 5/18

LEÇON 4/8 : static, final et membres de classe

OBJECTIF
Créez compteur d’instances, constantes et méthodes utilitaires.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Créez compteur d’instances, constantes et méthodes utilitaires.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — static, final et membres de classe','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — static, final et membres de classe');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Exercice : classe CompteBancaire','java-a-z-m05-l05','exercise','JAVA DE A À Z — MODULE 5/18

LEÇON 5/8 : Exercice : classe CompteBancaire

OBJECTIF
Implémentez dépôt, retrait sécurisé, solde privé et historique succinct.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Implémentez dépôt, retrait sécurisé, solde privé et historique succinct.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Exercice : classe CompteBancaire','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Exercice : classe CompteBancaire');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Challenge : panier e-commerce','java-a-z-m05-l06','exercise','JAVA DE A À Z — MODULE 5/18

LEÇON 6/8 : Challenge : panier e-commerce

OBJECTIF
Modélisez Produit, LignePanier et Panier avec total et remise.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Modélisez Produit, LignePanier et Panier avec total et remise.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Challenge : panier e-commerce','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Challenge : panier e-commerce');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz : bases de la POO','java-a-z-m05-l07','quiz','JAVA DE A À Z — MODULE 5/18

LEÇON 7/8 : Quiz : bases de la POO

OBJECTIF
Testez encapsulation, constructeur, référence, identité et static.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Testez encapsulation, constructeur, référence, identité et static.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',1500,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Quiz : bases de la POO','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Quiz : bases de la POO');
  INSERT INTO public.quizzes(lesson_id,title,pass_score,max_attempts) VALUES(v_lesson,'Quiz — Programmation orientée objet : classes et objets',70,NULL) ON CONFLICT(lesson_id) DO UPDATE SET title=EXCLUDED.title,pass_score=70 RETURNING id INTO v_quiz;
  DELETE FROM public.quiz_questions WHERE quiz_id=v_quiz;
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel est le meilleur résumé de l’objectif principal du module 5 ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,1) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Comprendre et pratiquer : Testez encapsulation, constructeur, référence, identité et static.',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Mémoriser uniquement la syntaxe',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter tous les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Copier une solution sans l’exécuter',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quelle méthode de travail est la plus fiable ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,2) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Écrire une version simple, tester, puis améliorer',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Optimiser avant de compiler',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ignorer les erreurs',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Changer plusieurs choses à la fois sans tester',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Que faut-il faire lorsqu’un programme échoue ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,3) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Lire l’erreur, isoler la cause et reproduire le problème',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Réécrire tout le projet',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Cacher l’exception',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel critère indique une vraie compréhension ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,4) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Pouvoir expliquer et appliquer sur un exemple différent',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir lu la leçon une seule fois',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Connaître le titre par cœur',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir copié le code',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Après un exercice réussi, quelle étape est la plus utile ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,5) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Tester un cas limite et une variante',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ne plus toucher au code',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les commentaires',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter toute refactorisation',false,4);
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mini-projet : bibliothèque orientée objet','java-a-z-m05-l08','exercise','JAVA DE A À Z — MODULE 5/18

LEÇON 8/8 : Mini-projet : bibliothèque orientée objet

OBJECTIF
Modélisez Livre, Membre et Bibliotheque avec emprunt, retour et recherche.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Modélisez Livre, Membre et Bibliotheque avec emprunt, retour et recherche.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Mini-projet : bibliothèque orientée objet','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Mini-projet : bibliothèque orientée objet');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'Module 6 — Héritage, interfaces et polymorphisme', 'Concevoir des hiérarchies flexibles sans dupliquer le code.',6) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Héritage, super et redéfinition','java-a-z-m06-l01','text','JAVA DE A À Z — MODULE 6/18

LEÇON 1/8 : Héritage, super et redéfinition

OBJECTIF
Utilisez extends, super et @Override sans casser les responsabilités.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Utilisez extends, super et @Override sans casser les responsabilités.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Héritage, super et redéfinition','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Héritage, super et redéfinition');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Classes abstraites','java-a-z-m06-l02','text','JAVA DE A À Z — MODULE 6/18

LEÇON 2/8 : Classes abstraites

OBJECTIF
Créez une base abstraite et imposez des comportements aux sous-classes.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Créez une base abstraite et imposez des comportements aux sous-classes.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Classes abstraites','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Classes abstraites');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Interfaces et implémentations multiples','java-a-z-m06-l03','text','JAVA DE A À Z — MODULE 6/18

LEÇON 3/8 : Interfaces et implémentations multiples

OBJECTIF
Définissez des contrats et composez plusieurs capacités.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Définissez des contrats et composez plusieurs capacités.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Interfaces et implémentations multiples','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Interfaces et implémentations multiples');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Polymorphisme et liaison dynamique','java-a-z-m06-l04','text','JAVA DE A À Z — MODULE 6/18

LEÇON 4/8 : Polymorphisme et liaison dynamique

OBJECTIF
Manipulez plusieurs objets via un même type parent et observez la méthode réellement appelée.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Manipulez plusieurs objets via un même type parent et observez la méthode réellement appelée.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Polymorphisme et liaison dynamique','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Polymorphisme et liaison dynamique');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Exercice : système de paiement','java-a-z-m06-l05','exercise','JAVA DE A À Z — MODULE 6/18

LEÇON 5/8 : Exercice : système de paiement

OBJECTIF
Implémentez Carte, PayPal et Virement derrière une interface PaymentMethod.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Implémentez Carte, PayPal et Virement derrière une interface PaymentMethod.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Exercice : système de paiement','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Exercice : système de paiement');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Challenge : moteur de formes géométriques','java-a-z-m06-l06','exercise','JAVA DE A À Z — MODULE 6/18

LEÇON 6/8 : Challenge : moteur de formes géométriques

OBJECTIF
Calculez aire et périmètre via une collection polymorphe de formes.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Calculez aire et périmètre via une collection polymorphe de formes.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Challenge : moteur de formes géométriques','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Challenge : moteur de formes géométriques');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz : héritage et polymorphisme','java-a-z-m06-l07','quiz','JAVA DE A À Z — MODULE 6/18

LEÇON 7/8 : Quiz : héritage et polymorphisme

OBJECTIF
Validez is-a, contrat d’interface, override, cast et instanceof.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Validez is-a, contrat d’interface, override, cast et instanceof.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',1500,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Quiz : héritage et polymorphisme','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Quiz : héritage et polymorphisme');
  INSERT INTO public.quizzes(lesson_id,title,pass_score,max_attempts) VALUES(v_lesson,'Quiz — Héritage, interfaces et polymorphisme',70,NULL) ON CONFLICT(lesson_id) DO UPDATE SET title=EXCLUDED.title,pass_score=70 RETURNING id INTO v_quiz;
  DELETE FROM public.quiz_questions WHERE quiz_id=v_quiz;
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel est le meilleur résumé de l’objectif principal du module 6 ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,1) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Comprendre et pratiquer : Validez is-a, contrat d’interface, override, cast et instanceof.',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Mémoriser uniquement la syntaxe',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter tous les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Copier une solution sans l’exécuter',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quelle méthode de travail est la plus fiable ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,2) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Écrire une version simple, tester, puis améliorer',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Optimiser avant de compiler',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ignorer les erreurs',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Changer plusieurs choses à la fois sans tester',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Que faut-il faire lorsqu’un programme échoue ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,3) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Lire l’erreur, isoler la cause et reproduire le problème',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Réécrire tout le projet',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Cacher l’exception',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel critère indique une vraie compréhension ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,4) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Pouvoir expliquer et appliquer sur un exemple différent',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir lu la leçon une seule fois',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Connaître le titre par cœur',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir copié le code',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Après un exercice réussi, quelle étape est la plus utile ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,5) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Tester un cas limite et une variante',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ne plus toucher au code',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les commentaires',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter toute refactorisation',false,4);
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mini-projet : gestion d’employés','java-a-z-m06-l08','exercise','JAVA DE A À Z — MODULE 6/18

LEÇON 8/8 : Mini-projet : gestion d’employés

OBJECTIF
Modélisez plusieurs types d’employés, calcul de salaire et rapport polymorphe.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Modélisez plusieurs types d’employés, calcul de salaire et rapport polymorphe.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Mini-projet : gestion d’employés','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Mini-projet : gestion d’employés');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'Module 7 — Exceptions, validation et débogage', 'Rendre les applications robustes face aux erreurs attendues et inattendues.',7) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Exception hierarchy : checked et unchecked','java-a-z-m07-l01','text','JAVA DE A À Z — MODULE 7/18

LEÇON 1/8 : Exception hierarchy : checked et unchecked

OBJECTIF
Comprenez Throwable, Error, Exception, RuntimeException et les cas d’usage.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Comprenez Throwable, Error, Exception, RuntimeException et les cas d’usage.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Exception hierarchy : checked et unchecked','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Exception hierarchy : checked et unchecked');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'try, catch, finally et multi-catch','java-a-z-m07-l02','text','JAVA DE A À Z — MODULE 7/18

LEÇON 2/8 : try, catch, finally et multi-catch

OBJECTIF
Capturez précisément les erreurs et garantissez le nettoyage.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Capturez précisément les erreurs et garantissez le nettoyage.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — try, catch, finally et multi-catch','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — try, catch, finally et multi-catch');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'throw, throws et exceptions personnalisées','java-a-z-m07-l03','text','JAVA DE A À Z — MODULE 7/18

LEÇON 3/8 : throw, throws et exceptions personnalisées

OBJECTIF
Créez une exception métier et définissez une stratégie cohérente.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Créez une exception métier et définissez une stratégie cohérente.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — throw, throws et exceptions personnalisées','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — throw, throws et exceptions personnalisées');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Debugger : breakpoints, step over, watches et stack trace','java-a-z-m07-l04','exercise','JAVA DE A À Z — MODULE 7/18

LEÇON 4/8 : Debugger : breakpoints, step over, watches et stack trace

OBJECTIF
Diagnostiquez un bug sans ajouter des println partout.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Diagnostiquez un bug sans ajouter des println partout.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Debugger : breakpoints, step over, watches et stack trace','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Debugger : breakpoints, step over, watches et stack trace');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Exercice : validation d’inscription','java-a-z-m07-l05','exercise','JAVA DE A À Z — MODULE 7/18

LEÇON 5/8 : Exercice : validation d’inscription

OBJECTIF
Validez email, âge et mot de passe avec messages d’erreur propres.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Validez email, âge et mot de passe avec messages d’erreur propres.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Exercice : validation d’inscription','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Exercice : validation d’inscription');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Challenge : parseur de commandes robuste','java-a-z-m07-l06','exercise','JAVA DE A À Z — MODULE 7/18

LEÇON 6/8 : Challenge : parseur de commandes robuste

OBJECTIF
Analysez des commandes utilisateur et gérez erreurs de format et commandes inconnues.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Analysez des commandes utilisateur et gérez erreurs de format et commandes inconnues.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Challenge : parseur de commandes robuste','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Challenge : parseur de commandes robuste');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz : exceptions et debug','java-a-z-m07-l07','quiz','JAVA DE A À Z — MODULE 7/18

LEÇON 7/8 : Quiz : exceptions et debug

OBJECTIF
Testez propagation, ordre des catch, finally et exceptions métier.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Testez propagation, ordre des catch, finally et exceptions métier.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',1500,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Quiz : exceptions et debug','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Quiz : exceptions et debug');
  INSERT INTO public.quizzes(lesson_id,title,pass_score,max_attempts) VALUES(v_lesson,'Quiz — Exceptions, validation et débogage',70,NULL) ON CONFLICT(lesson_id) DO UPDATE SET title=EXCLUDED.title,pass_score=70 RETURNING id INTO v_quiz;
  DELETE FROM public.quiz_questions WHERE quiz_id=v_quiz;
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel est le meilleur résumé de l’objectif principal du module 7 ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,1) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Comprendre et pratiquer : Testez propagation, ordre des catch, finally et exceptions métier.',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Mémoriser uniquement la syntaxe',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter tous les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Copier une solution sans l’exécuter',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quelle méthode de travail est la plus fiable ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,2) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Écrire une version simple, tester, puis améliorer',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Optimiser avant de compiler',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ignorer les erreurs',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Changer plusieurs choses à la fois sans tester',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Que faut-il faire lorsqu’un programme échoue ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,3) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Lire l’erreur, isoler la cause et reproduire le problème',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Réécrire tout le projet',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Cacher l’exception',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel critère indique une vraie compréhension ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,4) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Pouvoir expliquer et appliquer sur un exemple différent',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir lu la leçon une seule fois',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Connaître le titre par cœur',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir copié le code',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Après un exercice réussi, quelle étape est la plus utile ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,5) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Tester un cas limite et une variante',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ne plus toucher au code',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les commentaires',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter toute refactorisation',false,4);
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mini-projet : importateur CSV tolérant aux erreurs','java-a-z-m07-l08','exercise','JAVA DE A À Z — MODULE 7/18

LEÇON 8/8 : Mini-projet : importateur CSV tolérant aux erreurs

OBJECTIF
Traitez un fichier ligne par ligne, isolez les erreurs et produisez un rapport.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Traitez un fichier ligne par ligne, isolez les erreurs et produisez un rapport.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Mini-projet : importateur CSV tolérant aux erreurs','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Mini-projet : importateur CSV tolérant aux erreurs');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'Module 8 — Collections Framework et génériques', 'Choisir les bonnes structures de données et écrire du code générique sûr.',8) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'List, ArrayList et LinkedList','java-a-z-m08-l01','text','JAVA DE A À Z — MODULE 8/18

LEÇON 1/8 : List, ArrayList et LinkedList

OBJECTIF
Comparez accès, insertion et cas d’usage.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Comparez accès, insertion et cas d’usage.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — List, ArrayList et LinkedList','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — List, ArrayList et LinkedList');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Set, HashSet et TreeSet','java-a-z-m08-l02','text','JAVA DE A À Z — MODULE 8/18

LEÇON 2/8 : Set, HashSet et TreeSet

OBJECTIF
Éliminez les doublons et exploitez l’ordre naturel.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Éliminez les doublons et exploitez l’ordre naturel.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Set, HashSet et TreeSet','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Set, HashSet et TreeSet');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Map, HashMap et TreeMap','java-a-z-m08-l03','text','JAVA DE A À Z — MODULE 8/18

LEÇON 3/8 : Map, HashMap et TreeMap

OBJECTIF
Stockez des associations clé-valeur et agrégez des fréquences.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Stockez des associations clé-valeur et agrégez des fréquences.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Map, HashMap et TreeMap','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Map, HashMap et TreeMap');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Génériques, bornes et wildcards','java-a-z-m08-l04','text','JAVA DE A À Z — MODULE 8/18

LEÇON 4/8 : Génériques, bornes et wildcards

OBJECTIF
Écrivez classes et méthodes génériques avec extends et super.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Écrivez classes et méthodes génériques avec extends et super.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Génériques, bornes et wildcards','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Génériques, bornes et wildcards');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Exercice : analyse de fréquence de mots','java-a-z-m08-l05','exercise','JAVA DE A À Z — MODULE 8/18

LEÇON 5/8 : Exercice : analyse de fréquence de mots

OBJECTIF
Comptez les mots d’un texte et affichez le top 10.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Comptez les mots d’un texte et affichez le top 10.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Exercice : analyse de fréquence de mots','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Exercice : analyse de fréquence de mots');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Challenge : index inversé de documents','java-a-z-m08-l06','exercise','JAVA DE A À Z — MODULE 8/18

LEÇON 6/8 : Challenge : index inversé de documents

OBJECTIF
Associez chaque mot aux documents qui le contiennent.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Associez chaque mot aux documents qui le contiennent.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Challenge : index inversé de documents','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Challenge : index inversé de documents');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz : collections et génériques','java-a-z-m08-l07','quiz','JAVA DE A À Z — MODULE 8/18

LEÇON 7/8 : Quiz : collections et génériques

OBJECTIF
Validez égalité, hashCode, ordre, complexité et variance.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Validez égalité, hashCode, ordre, complexité et variance.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',1500,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Quiz : collections et génériques','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Quiz : collections et génériques');
  INSERT INTO public.quizzes(lesson_id,title,pass_score,max_attempts) VALUES(v_lesson,'Quiz — Collections Framework et génériques',70,NULL) ON CONFLICT(lesson_id) DO UPDATE SET title=EXCLUDED.title,pass_score=70 RETURNING id INTO v_quiz;
  DELETE FROM public.quiz_questions WHERE quiz_id=v_quiz;
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel est le meilleur résumé de l’objectif principal du module 8 ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,1) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Comprendre et pratiquer : Validez égalité, hashCode, ordre, complexité et variance.',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Mémoriser uniquement la syntaxe',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter tous les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Copier une solution sans l’exécuter',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quelle méthode de travail est la plus fiable ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,2) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Écrire une version simple, tester, puis améliorer',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Optimiser avant de compiler',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ignorer les erreurs',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Changer plusieurs choses à la fois sans tester',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Que faut-il faire lorsqu’un programme échoue ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,3) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Lire l’erreur, isoler la cause et reproduire le problème',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Réécrire tout le projet',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Cacher l’exception',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel critère indique une vraie compréhension ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,4) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Pouvoir expliquer et appliquer sur un exemple différent',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir lu la leçon une seule fois',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Connaître le titre par cœur',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir copié le code',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Après un exercice réussi, quelle étape est la plus utile ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,5) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Tester un cas limite et une variante',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ne plus toucher au code',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les commentaires',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter toute refactorisation',false,4);
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mini-projet : gestion d’inventaire','java-a-z-m08-l08','exercise','JAVA DE A À Z — MODULE 8/18

LEÇON 8/8 : Mini-projet : gestion d’inventaire

OBJECTIF
Gérez produits, catégories, stock et recherche avec Map et List.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Gérez produits, catégories, stock et recherche avec Map et List.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Mini-projet : gestion d’inventaire','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Mini-projet : gestion d’inventaire');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'Module 9 — Lambdas, API Stream et programmation fonctionnelle', 'Traiter les données de façon expressive avec les outils modernes de Java.',9) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Interfaces fonctionnelles et lambdas','java-a-z-m09-l01','text','JAVA DE A À Z — MODULE 9/18

LEÇON 1/8 : Interfaces fonctionnelles et lambdas

OBJECTIF
Utilisez Predicate, Function, Consumer et Supplier.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Utilisez Predicate, Function, Consumer et Supplier.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Interfaces fonctionnelles et lambdas','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Interfaces fonctionnelles et lambdas');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Références de méthodes et Optional','java-a-z-m09-l02','text','JAVA DE A À Z — MODULE 9/18

LEÇON 2/8 : Références de méthodes et Optional

OBJECTIF
Simplifiez des lambdas et évitez certains null checks.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Simplifiez des lambdas et évitez certains null checks.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Références de méthodes et Optional','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Références de méthodes et Optional');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Streams : filter, map, flatMap et collect','java-a-z-m09-l03','text','JAVA DE A À Z — MODULE 9/18

LEÇON 3/8 : Streams : filter, map, flatMap et collect

OBJECTIF
Construisez des pipelines lisibles et sans effets de bord inutiles.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Construisez des pipelines lisibles et sans effets de bord inutiles.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Streams : filter, map, flatMap et collect','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Streams : filter, map, flatMap et collect');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'reduce, groupingBy, partitioningBy et statistiques','java-a-z-m09-l04','text','JAVA DE A À Z — MODULE 9/18

LEÇON 4/8 : reduce, groupingBy, partitioningBy et statistiques

OBJECTIF
Agrégerez des données complexes avec Collectors.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Agrégerez des données complexes avec Collectors.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — reduce, groupingBy, partitioningBy et statistiques','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — reduce, groupingBy, partitioningBy et statistiques');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Exercice : analyser des commandes clients','java-a-z-m09-l05','exercise','JAVA DE A À Z — MODULE 9/18

LEÇON 5/8 : Exercice : analyser des commandes clients

OBJECTIF
Filtrez, groupez et calculez chiffre d’affaires et panier moyen.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Filtrez, groupez et calculez chiffre d’affaires et panier moyen.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Exercice : analyser des commandes clients','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Exercice : analyser des commandes clients');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Challenge : pipeline de données','java-a-z-m09-l06','exercise','JAVA DE A À Z — MODULE 9/18

LEÇON 6/8 : Challenge : pipeline de données

OBJECTIF
Nettoyez, transformez et agrégerez un jeu de données en plusieurs étapes.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Nettoyez, transformez et agrégerez un jeu de données en plusieurs étapes.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Challenge : pipeline de données','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Challenge : pipeline de données');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz : lambdas et streams','java-a-z-m09-l07','quiz','JAVA DE A À Z — MODULE 9/18

LEÇON 7/8 : Quiz : lambdas et streams

OBJECTIF
Validez lazy evaluation, terminal operations, Optional et collectors.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Validez lazy evaluation, terminal operations, Optional et collectors.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',1500,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Quiz : lambdas et streams','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Quiz : lambdas et streams');
  INSERT INTO public.quizzes(lesson_id,title,pass_score,max_attempts) VALUES(v_lesson,'Quiz — Lambdas, API Stream et programmation fonctionnelle',70,NULL) ON CONFLICT(lesson_id) DO UPDATE SET title=EXCLUDED.title,pass_score=70 RETURNING id INTO v_quiz;
  DELETE FROM public.quiz_questions WHERE quiz_id=v_quiz;
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel est le meilleur résumé de l’objectif principal du module 9 ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,1) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Comprendre et pratiquer : Validez lazy evaluation, terminal operations, Optional et collectors.',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Mémoriser uniquement la syntaxe',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter tous les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Copier une solution sans l’exécuter',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quelle méthode de travail est la plus fiable ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,2) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Écrire une version simple, tester, puis améliorer',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Optimiser avant de compiler',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ignorer les erreurs',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Changer plusieurs choses à la fois sans tester',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Que faut-il faire lorsqu’un programme échoue ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,3) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Lire l’erreur, isoler la cause et reproduire le problème',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Réécrire tout le projet',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Cacher l’exception',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel critère indique une vraie compréhension ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,4) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Pouvoir expliquer et appliquer sur un exemple différent',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir lu la leçon une seule fois',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Connaître le titre par cœur',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir copié le code',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Après un exercice réussi, quelle étape est la plus utile ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,5) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Tester un cas limite et une variante',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ne plus toucher au code',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les commentaires',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter toute refactorisation',false,4);
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mini-projet : tableau de bord commercial','java-a-z-m09-l08','exercise','JAVA DE A À Z — MODULE 9/18

LEÇON 8/8 : Mini-projet : tableau de bord commercial

OBJECTIF
Produisez plusieurs indicateurs à partir d’objets métier avec Stream API.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Produisez plusieurs indicateurs à partir d’objets métier avec Stream API.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Mini-projet : tableau de bord commercial','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Mini-projet : tableau de bord commercial');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'Module 10 — Fichiers, NIO, sérialisation et API de date', 'Lire, écrire et organiser des données persistantes localement.',10) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Path, Files et NIO.2','java-a-z-m10-l01','text','JAVA DE A À Z — MODULE 10/18

LEÇON 1/8 : Path, Files et NIO.2

OBJECTIF
Créez, lisez, copiez, déplacez et parcourez des fichiers.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Créez, lisez, copiez, déplacez et parcourez des fichiers.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Path, Files et NIO.2','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Path, Files et NIO.2');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'BufferedReader, BufferedWriter et try-with-resources','java-a-z-m10-l02','text','JAVA DE A À Z — MODULE 10/18

LEÇON 2/8 : BufferedReader, BufferedWriter et try-with-resources

OBJECTIF
Lisez de gros fichiers sans fuite de ressources.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Lisez de gros fichiers sans fuite de ressources.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — BufferedReader, BufferedWriter et try-with-resources','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — BufferedReader, BufferedWriter et try-with-resources');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'CSV, propriétés et formats simples','java-a-z-m10-l03','text','JAVA DE A À Z — MODULE 10/18

LEÇON 3/8 : CSV, propriétés et formats simples

OBJECTIF
Parsez et générez des données structurées avec validation.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Parsez et générez des données structurées avec validation.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — CSV, propriétés et formats simples','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — CSV, propriétés et formats simples');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'LocalDate, LocalDateTime, Duration et formatage','java-a-z-m10-l04','text','JAVA DE A À Z — MODULE 10/18

LEÇON 4/8 : LocalDate, LocalDateTime, Duration et formatage

OBJECTIF
Manipulez dates, heures, fuseaux et périodes.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Manipulez dates, heures, fuseaux et périodes.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — LocalDate, LocalDateTime, Duration et formatage','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — LocalDate, LocalDateTime, Duration et formatage');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Exercice : journal de dépenses dans un fichier','java-a-z-m10-l05','exercise','JAVA DE A À Z — MODULE 10/18

LEÇON 5/8 : Exercice : journal de dépenses dans un fichier

OBJECTIF
Ajoutez des dépenses et rechargez-les au démarrage.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Ajoutez des dépenses et rechargez-les au démarrage.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Exercice : journal de dépenses dans un fichier','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Exercice : journal de dépenses dans un fichier');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Challenge : analyseur de logs','java-a-z-m10-l06','exercise','JAVA DE A À Z — MODULE 10/18

LEÇON 6/8 : Challenge : analyseur de logs

OBJECTIF
Comptez niveaux d’erreur, plages horaires et messages fréquents.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Comptez niveaux d’erreur, plages horaires et messages fréquents.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Challenge : analyseur de logs','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Challenge : analyseur de logs');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz : IO et dates','java-a-z-m10-l07','quiz','JAVA DE A À Z — MODULE 10/18

LEÇON 7/8 : Quiz : IO et dates

OBJECTIF
Validez chemins, encodage, fermeture de ressources et immutabilité des dates.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Validez chemins, encodage, fermeture de ressources et immutabilité des dates.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',1500,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Quiz : IO et dates','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Quiz : IO et dates');
  INSERT INTO public.quizzes(lesson_id,title,pass_score,max_attempts) VALUES(v_lesson,'Quiz — Fichiers, NIO, sérialisation et API de date',70,NULL) ON CONFLICT(lesson_id) DO UPDATE SET title=EXCLUDED.title,pass_score=70 RETURNING id INTO v_quiz;
  DELETE FROM public.quiz_questions WHERE quiz_id=v_quiz;
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel est le meilleur résumé de l’objectif principal du module 10 ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,1) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Comprendre et pratiquer : Validez chemins, encodage, fermeture de ressources et immutabilité des dates.',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Mémoriser uniquement la syntaxe',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter tous les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Copier une solution sans l’exécuter',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quelle méthode de travail est la plus fiable ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,2) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Écrire une version simple, tester, puis améliorer',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Optimiser avant de compiler',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ignorer les erreurs',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Changer plusieurs choses à la fois sans tester',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Que faut-il faire lorsqu’un programme échoue ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,3) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Lire l’erreur, isoler la cause et reproduire le problème',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Réécrire tout le projet',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Cacher l’exception',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel critère indique une vraie compréhension ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,4) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Pouvoir expliquer et appliquer sur un exemple différent',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir lu la leçon une seule fois',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Connaître le titre par cœur',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir copié le code',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Après un exercice réussi, quelle étape est la plus utile ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,5) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Tester un cas limite et une variante',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ne plus toucher au code',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les commentaires',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter toute refactorisation',false,4);
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mini-projet : gestionnaire de tâches persistant','java-a-z-m10-l08','exercise','JAVA DE A À Z — MODULE 10/18

LEÇON 8/8 : Mini-projet : gestionnaire de tâches persistant

OBJECTIF
Sauvegardez, rechargez, filtrez et archivez des tâches dans des fichiers.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Sauvegardez, rechargez, filtrez et archivez des tâches dans des fichiers.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Mini-projet : gestionnaire de tâches persistant','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Mini-projet : gestionnaire de tâches persistant');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'Module 11 — Concurrence et multithreading', 'Comprendre les threads, synchroniser correctement et éviter les pièges classiques.',11) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Thread, Runnable et cycle de vie','java-a-z-m11-l01','text','JAVA DE A À Z — MODULE 11/18

LEÇON 1/8 : Thread, Runnable et cycle de vie

OBJECTIF
Créez des tâches concurrentes et observez l’ordonnancement.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Créez des tâches concurrentes et observez l’ordonnancement.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Thread, Runnable et cycle de vie','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Thread, Runnable et cycle de vie');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'ExecutorService et pools de threads','java-a-z-m11-l02','text','JAVA DE A À Z — MODULE 11/18

LEÇON 2/8 : ExecutorService et pools de threads

OBJECTIF
Déléguez les tâches à un pool et arrêtez-le proprement.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Déléguez les tâches à un pool et arrêtez-le proprement.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — ExecutorService et pools de threads','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — ExecutorService et pools de threads');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Race conditions, synchronized et verrous','java-a-z-m11-l03','exercise','JAVA DE A À Z — MODULE 11/18

LEÇON 3/8 : Race conditions, synchronized et verrous

OBJECTIF
Reproduisez puis corrigez une condition de course.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Reproduisez puis corrigez une condition de course.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Race conditions, synchronized et verrous','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Race conditions, synchronized et verrous');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'CompletableFuture et programmation asynchrone','java-a-z-m11-l04','text','JAVA DE A À Z — MODULE 11/18

LEÇON 4/8 : CompletableFuture et programmation asynchrone

OBJECTIF
Chaînez des tâches, combinez des résultats et gérez les erreurs.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Chaînez des tâches, combinez des résultats et gérez les erreurs.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — CompletableFuture et programmation asynchrone','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — CompletableFuture et programmation asynchrone');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Exercice : téléchargement simulé en parallèle','java-a-z-m11-l05','exercise','JAVA DE A À Z — MODULE 11/18

LEÇON 5/8 : Exercice : téléchargement simulé en parallèle

OBJECTIF
Lancez plusieurs tâches et affichez la progression globale.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Lancez plusieurs tâches et affichez la progression globale.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Exercice : téléchargement simulé en parallèle','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Exercice : téléchargement simulé en parallèle');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Challenge : producteur-consommateur','java-a-z-m11-l06','exercise','JAVA DE A À Z — MODULE 11/18

LEÇON 6/8 : Challenge : producteur-consommateur

OBJECTIF
Implémentez une file de travail thread-safe.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Implémentez une file de travail thread-safe.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Challenge : producteur-consommateur','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Challenge : producteur-consommateur');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz : concurrence','java-a-z-m11-l07','quiz','JAVA DE A À Z — MODULE 11/18

LEÇON 7/8 : Quiz : concurrence

OBJECTIF
Validez visibilité, atomicité, deadlock, pool et future.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Validez visibilité, atomicité, deadlock, pool et future.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',1500,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Quiz : concurrence','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Quiz : concurrence');
  INSERT INTO public.quizzes(lesson_id,title,pass_score,max_attempts) VALUES(v_lesson,'Quiz — Concurrence et multithreading',70,NULL) ON CONFLICT(lesson_id) DO UPDATE SET title=EXCLUDED.title,pass_score=70 RETURNING id INTO v_quiz;
  DELETE FROM public.quiz_questions WHERE quiz_id=v_quiz;
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel est le meilleur résumé de l’objectif principal du module 11 ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,1) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Comprendre et pratiquer : Validez visibilité, atomicité, deadlock, pool et future.',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Mémoriser uniquement la syntaxe',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter tous les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Copier une solution sans l’exécuter',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quelle méthode de travail est la plus fiable ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,2) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Écrire une version simple, tester, puis améliorer',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Optimiser avant de compiler',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ignorer les erreurs',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Changer plusieurs choses à la fois sans tester',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Que faut-il faire lorsqu’un programme échoue ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,3) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Lire l’erreur, isoler la cause et reproduire le problème',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Réécrire tout le projet',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Cacher l’exception',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel critère indique une vraie compréhension ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,4) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Pouvoir expliquer et appliquer sur un exemple différent',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir lu la leçon une seule fois',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Connaître le titre par cœur',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir copié le code',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Après un exercice réussi, quelle étape est la plus utile ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,5) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Tester un cas limite et une variante',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ne plus toucher au code',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les commentaires',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter toute refactorisation',false,4);
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mini-projet : moteur de traitement parallèle','java-a-z-m11-l08','exercise','JAVA DE A À Z — MODULE 11/18

LEÇON 8/8 : Mini-projet : moteur de traitement parallèle

OBJECTIF
Traitez un lot de fichiers avec limite de concurrence et rapport d’erreurs.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Traitez un lot de fichiers avec limite de concurrence et rapport d’erreurs.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Mini-projet : moteur de traitement parallèle','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Mini-projet : moteur de traitement parallèle');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'Module 12 — Tests, Maven, Gradle et qualité de code', 'Industrialiser un projet avec build reproductible, tests automatisés et bonnes pratiques.',12) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Structure Maven et cycle de build','java-a-z-m12-l01','text','JAVA DE A À Z — MODULE 12/18

LEÇON 1/8 : Structure Maven et cycle de build

OBJECTIF
Comprenez pom.xml, dépendances, phases et plugins.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Comprenez pom.xml, dépendances, phases et plugins.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Structure Maven et cycle de build','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Structure Maven et cycle de build');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Gradle : concepts essentiels','java-a-z-m12-l02','text','JAVA DE A À Z — MODULE 12/18

LEÇON 2/8 : Gradle : concepts essentiels

OBJECTIF
Comparez Gradle à Maven et créez une tâche simple.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Comparez Gradle à Maven et créez une tâche simple.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Gradle : concepts essentiels','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Gradle : concepts essentiels');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'JUnit 5 : assertions et organisation des tests','java-a-z-m12-l03','text','JAVA DE A À Z — MODULE 12/18

LEÇON 3/8 : JUnit 5 : assertions et organisation des tests

OBJECTIF
Écrivez des tests unitaires lisibles et indépendants.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Écrivez des tests unitaires lisibles et indépendants.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — JUnit 5 : assertions et organisation des tests','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — JUnit 5 : assertions et organisation des tests');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mockito et doubles de test','java-a-z-m12-l04','text','JAVA DE A À Z — MODULE 12/18

LEÇON 4/8 : Mockito et doubles de test

OBJECTIF
Isolez une classe de ses dépendances et vérifiez les interactions.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Isolez une classe de ses dépendances et vérifiez les interactions.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Mockito et doubles de test','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Mockito et doubles de test');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Exercice : tester un service de panier','java-a-z-m12-l05','exercise','JAVA DE A À Z — MODULE 12/18

LEÇON 5/8 : Exercice : tester un service de panier

OBJECTIF
Couvrez cas normaux, limites et erreurs.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Couvrez cas normaux, limites et erreurs.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Exercice : tester un service de panier','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Exercice : tester un service de panier');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Challenge : refactoring piloté par les tests','java-a-z-m12-l06','exercise','JAVA DE A À Z — MODULE 12/18

LEÇON 6/8 : Challenge : refactoring piloté par les tests

OBJECTIF
Sécurisez un code legacy avec tests puis améliorez sa structure.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Sécurisez un code legacy avec tests puis améliorez sa structure.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Challenge : refactoring piloté par les tests','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Challenge : refactoring piloté par les tests');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz : build et tests','java-a-z-m12-l07','quiz','JAVA DE A À Z — MODULE 12/18

LEÇON 7/8 : Quiz : build et tests

OBJECTIF
Validez portée des dépendances, cycle de test, mocks et couverture.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Validez portée des dépendances, cycle de test, mocks et couverture.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',1500,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Quiz : build et tests','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Quiz : build et tests');
  INSERT INTO public.quizzes(lesson_id,title,pass_score,max_attempts) VALUES(v_lesson,'Quiz — Tests, Maven, Gradle et qualité de code',70,NULL) ON CONFLICT(lesson_id) DO UPDATE SET title=EXCLUDED.title,pass_score=70 RETURNING id INTO v_quiz;
  DELETE FROM public.quiz_questions WHERE quiz_id=v_quiz;
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel est le meilleur résumé de l’objectif principal du module 12 ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,1) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Comprendre et pratiquer : Validez portée des dépendances, cycle de test, mocks et couverture.',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Mémoriser uniquement la syntaxe',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter tous les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Copier une solution sans l’exécuter',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quelle méthode de travail est la plus fiable ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,2) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Écrire une version simple, tester, puis améliorer',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Optimiser avant de compiler',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ignorer les erreurs',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Changer plusieurs choses à la fois sans tester',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Que faut-il faire lorsqu’un programme échoue ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,3) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Lire l’erreur, isoler la cause et reproduire le problème',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Réécrire tout le projet',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Cacher l’exception',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel critère indique une vraie compréhension ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,4) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Pouvoir expliquer et appliquer sur un exemple différent',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir lu la leçon une seule fois',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Connaître le titre par cœur',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir copié le code',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Après un exercice réussi, quelle étape est la plus utile ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,5) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Tester un cas limite et une variante',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ne plus toucher au code',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les commentaires',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter toute refactorisation',false,4);
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mini-projet : pipeline qualité local','java-a-z-m12-l08','exercise','JAVA DE A À Z — MODULE 12/18

LEÇON 8/8 : Mini-projet : pipeline qualité local

OBJECTIF
Configurez compilation, tests, rapport et vérifications avant livraison.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Configurez compilation, tests, rapport et vérifications avant livraison.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Mini-projet : pipeline qualité local','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Mini-projet : pipeline qualité local');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'Module 13 — SQL et JDBC', 'Connecter Java à une base relationnelle en évitant les erreurs et failles classiques.',13) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Rappels SQL utiles pour Java','java-a-z-m13-l01','text','JAVA DE A À Z — MODULE 13/18

LEÇON 1/8 : Rappels SQL utiles pour Java

OBJECTIF
Revoyez SELECT, INSERT, UPDATE, DELETE, JOIN et transactions.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Revoyez SELECT, INSERT, UPDATE, DELETE, JOIN et transactions.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Rappels SQL utiles pour Java','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Rappels SQL utiles pour Java');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Connexion JDBC et DriverManager','java-a-z-m13-l02','text','JAVA DE A À Z — MODULE 13/18

LEÇON 2/8 : Connexion JDBC et DriverManager

OBJECTIF
Ouvrez et fermez proprement une connexion.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Ouvrez et fermez proprement une connexion.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Connexion JDBC et DriverManager','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Connexion JDBC et DriverManager');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'PreparedStatement et protection contre l’injection SQL','java-a-z-m13-l03','text','JAVA DE A À Z — MODULE 13/18

LEÇON 3/8 : PreparedStatement et protection contre l’injection SQL

OBJECTIF
Paramétrez les requêtes et mappez les résultats.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Paramétrez les requêtes et mappez les résultats.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — PreparedStatement et protection contre l’injection SQL','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — PreparedStatement et protection contre l’injection SQL');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Transactions, commit et rollback','java-a-z-m13-l04','text','JAVA DE A À Z — MODULE 13/18

LEÇON 4/8 : Transactions, commit et rollback

OBJECTIF
Garantissez l’intégrité d’une opération multi-étapes.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Garantissez l’intégrité d’une opération multi-étapes.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Transactions, commit et rollback','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Transactions, commit et rollback');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Exercice : CRUD d’utilisateurs','java-a-z-m13-l05','exercise','JAVA DE A À Z — MODULE 13/18

LEÇON 5/8 : Exercice : CRUD d’utilisateurs

OBJECTIF
Créez repository avec create, find, update et delete.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Créez repository avec create, find, update et delete.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Exercice : CRUD d’utilisateurs','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Exercice : CRUD d’utilisateurs');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Challenge : recherche paginée et filtrée','java-a-z-m13-l06','exercise','JAVA DE A À Z — MODULE 13/18

LEÇON 6/8 : Challenge : recherche paginée et filtrée

OBJECTIF
Ajoutez pagination, tri et filtres dynamiques sûrs.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Ajoutez pagination, tri et filtres dynamiques sûrs.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Challenge : recherche paginée et filtrée','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Challenge : recherche paginée et filtrée');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz : JDBC et SQL','java-a-z-m13-l07','quiz','JAVA DE A À Z — MODULE 13/18

LEÇON 7/8 : Quiz : JDBC et SQL

OBJECTIF
Validez ressources, transactions, injection SQL et mapping.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Validez ressources, transactions, injection SQL et mapping.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',1500,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Quiz : JDBC et SQL','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Quiz : JDBC et SQL');
  INSERT INTO public.quizzes(lesson_id,title,pass_score,max_attempts) VALUES(v_lesson,'Quiz — SQL et JDBC',70,NULL) ON CONFLICT(lesson_id) DO UPDATE SET title=EXCLUDED.title,pass_score=70 RETURNING id INTO v_quiz;
  DELETE FROM public.quiz_questions WHERE quiz_id=v_quiz;
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel est le meilleur résumé de l’objectif principal du module 13 ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,1) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Comprendre et pratiquer : Validez ressources, transactions, injection SQL et mapping.',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Mémoriser uniquement la syntaxe',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter tous les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Copier une solution sans l’exécuter',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quelle méthode de travail est la plus fiable ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,2) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Écrire une version simple, tester, puis améliorer',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Optimiser avant de compiler',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ignorer les erreurs',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Changer plusieurs choses à la fois sans tester',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Que faut-il faire lorsqu’un programme échoue ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,3) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Lire l’erreur, isoler la cause et reproduire le problème',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Réécrire tout le projet',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Cacher l’exception',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel critère indique une vraie compréhension ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,4) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Pouvoir expliquer et appliquer sur un exemple différent',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir lu la leçon une seule fois',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Connaître le titre par cœur',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir copié le code',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Après un exercice réussi, quelle étape est la plus utile ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,5) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Tester un cas limite et une variante',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ne plus toucher au code',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les commentaires',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter toute refactorisation',false,4);
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mini-projet : application de gestion de stock JDBC','java-a-z-m13-l08','exercise','JAVA DE A À Z — MODULE 13/18

LEÇON 8/8 : Mini-projet : application de gestion de stock JDBC

OBJECTIF
Reliez service métier, repository et base PostgreSQL.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Reliez service métier, repository et base PostgreSQL.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Mini-projet : application de gestion de stock JDBC','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Mini-projet : application de gestion de stock JDBC');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'Module 14 — Réseau, HTTP, JSON et API externes', 'Faire communiquer une application Java avec le monde extérieur.',14) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'HTTP : requête, réponse, méthodes et statuts','java-a-z-m14-l01','text','JAVA DE A À Z — MODULE 14/18

LEÇON 1/8 : HTTP : requête, réponse, méthodes et statuts

OBJECTIF
Comprenez URL, headers, body, GET, POST, PUT, DELETE et codes 2xx/4xx/5xx.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Comprenez URL, headers, body, GET, POST, PUT, DELETE et codes 2xx/4xx/5xx.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — HTTP : requête, réponse, méthodes et statuts','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — HTTP : requête, réponse, méthodes et statuts');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Java HttpClient','java-a-z-m14-l02','text','JAVA DE A À Z — MODULE 14/18

LEÇON 2/8 : Java HttpClient

OBJECTIF
Envoyez une requête synchrone puis asynchrone.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Envoyez une requête synchrone puis asynchrone.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Java HttpClient','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Java HttpClient');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'JSON avec Jackson','java-a-z-m14-l03','text','JAVA DE A À Z — MODULE 14/18

LEÇON 3/8 : JSON avec Jackson

OBJECTIF
Sérialisez et désérialisez des objets Java.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Sérialisez et désérialisez des objets Java.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — JSON avec Jackson','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — JSON avec Jackson');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Timeouts, retries et gestion d’erreurs réseau','java-a-z-m14-l04','exercise','JAVA DE A À Z — MODULE 14/18

LEÇON 4/8 : Timeouts, retries et gestion d’erreurs réseau

OBJECTIF
Rendez un client externe plus robuste.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Rendez un client externe plus robuste.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Timeouts, retries et gestion d’erreurs réseau','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Timeouts, retries et gestion d’erreurs réseau');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Exercice : client météo','java-a-z-m14-l05','exercise','JAVA DE A À Z — MODULE 14/18

LEÇON 5/8 : Exercice : client météo

OBJECTIF
Appelez une API, parsez le JSON et affichez un résumé.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Appelez une API, parsez le JSON et affichez un résumé.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Exercice : client météo','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Exercice : client météo');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Challenge : agrégateur de plusieurs API','java-a-z-m14-l06','exercise','JAVA DE A À Z — MODULE 14/18

LEÇON 6/8 : Challenge : agrégateur de plusieurs API

OBJECTIF
Combinez plusieurs sources avec CompletableFuture.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Combinez plusieurs sources avec CompletableFuture.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Challenge : agrégateur de plusieurs API','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Challenge : agrégateur de plusieurs API');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz : HTTP et JSON','java-a-z-m14-l07','quiz','JAVA DE A À Z — MODULE 14/18

LEÇON 7/8 : Quiz : HTTP et JSON

OBJECTIF
Validez verbes, idempotence, statuts, sérialisation et résilience.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Validez verbes, idempotence, statuts, sérialisation et résilience.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',1500,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Quiz : HTTP et JSON','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Quiz : HTTP et JSON');
  INSERT INTO public.quizzes(lesson_id,title,pass_score,max_attempts) VALUES(v_lesson,'Quiz — Réseau, HTTP, JSON et API externes',70,NULL) ON CONFLICT(lesson_id) DO UPDATE SET title=EXCLUDED.title,pass_score=70 RETURNING id INTO v_quiz;
  DELETE FROM public.quiz_questions WHERE quiz_id=v_quiz;
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel est le meilleur résumé de l’objectif principal du module 14 ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,1) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Comprendre et pratiquer : Validez verbes, idempotence, statuts, sérialisation et résilience.',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Mémoriser uniquement la syntaxe',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter tous les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Copier une solution sans l’exécuter',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quelle méthode de travail est la plus fiable ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,2) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Écrire une version simple, tester, puis améliorer',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Optimiser avant de compiler',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ignorer les erreurs',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Changer plusieurs choses à la fois sans tester',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Que faut-il faire lorsqu’un programme échoue ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,3) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Lire l’erreur, isoler la cause et reproduire le problème',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Réécrire tout le projet',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Cacher l’exception',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel critère indique une vraie compréhension ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,4) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Pouvoir expliquer et appliquer sur un exemple différent',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir lu la leçon une seule fois',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Connaître le titre par cœur',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir copié le code',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Après un exercice réussi, quelle étape est la plus utile ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,5) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Tester un cas limite et une variante',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ne plus toucher au code',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les commentaires',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter toute refactorisation',false,4);
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mini-projet : client REST complet','java-a-z-m14-l08','exercise','JAVA DE A À Z — MODULE 14/18

LEÇON 8/8 : Mini-projet : client REST complet

OBJECTIF
Construisez un client CRUD avec configuration, logs et erreurs métier.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Construisez un client CRUD avec configuration, logs et erreurs métier.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Mini-projet : client REST complet','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Mini-projet : client REST complet');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'Module 15 — SOLID, Clean Code et design patterns', 'Structurer du code maintenable, testable et évolutif.',15) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Responsabilité unique et découpage des classes','java-a-z-m15-l01','text','JAVA DE A À Z — MODULE 15/18

LEÇON 1/8 : Responsabilité unique et découpage des classes

OBJECTIF
Repérez les classes qui font trop de choses et découpez-les.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Repérez les classes qui font trop de choses et découpez-les.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Responsabilité unique et découpage des classes','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Responsabilité unique et découpage des classes');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Open/Closed, Liskov, Interface Segregation, Dependency Inversion','java-a-z-m15-l02','text','JAVA DE A À Z — MODULE 15/18

LEÇON 2/8 : Open/Closed, Liskov, Interface Segregation, Dependency Inversion

OBJECTIF
Appliquez les principes SOLID sur des exemples concrets.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Appliquez les principes SOLID sur des exemples concrets.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Open/Closed, Liskov, Interface Segregation, Dependency Inversion','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Open/Closed, Liskov, Interface Segregation, Dependency Inversion');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Patterns Strategy et Factory','java-a-z-m15-l03','text','JAVA DE A À Z — MODULE 15/18

LEÇON 3/8 : Patterns Strategy et Factory

OBJECTIF
Remplacez des if/switch rigides par des objets interchangeables.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Remplacez des if/switch rigides par des objets interchangeables.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Patterns Strategy et Factory','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Patterns Strategy et Factory');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Patterns Builder, Observer et Decorator','java-a-z-m15-l04','text','JAVA DE A À Z — MODULE 15/18

LEÇON 4/8 : Patterns Builder, Observer et Decorator

OBJECTIF
Choisissez un pattern selon le problème plutôt que par habitude.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Choisissez un pattern selon le problème plutôt que par habitude.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Patterns Builder, Observer et Decorator','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Patterns Builder, Observer et Decorator');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Exercice : refactorer un système de remise','java-a-z-m15-l05','exercise','JAVA DE A À Z — MODULE 15/18

LEÇON 5/8 : Exercice : refactorer un système de remise

OBJECTIF
Transformez un gros bloc conditionnel en stratégies testables.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Transformez un gros bloc conditionnel en stratégies testables.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Exercice : refactorer un système de remise','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Exercice : refactorer un système de remise');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Challenge : moteur de notifications extensible','java-a-z-m15-l06','exercise','JAVA DE A À Z — MODULE 15/18

LEÇON 6/8 : Challenge : moteur de notifications extensible

OBJECTIF
Ajoutez Email, SMS et Push sans modifier le cœur métier.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Ajoutez Email, SMS et Push sans modifier le cœur métier.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Challenge : moteur de notifications extensible','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Challenge : moteur de notifications extensible');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz : architecture et patterns','java-a-z-m15-l07','quiz','JAVA DE A À Z — MODULE 15/18

LEÇON 7/8 : Quiz : architecture et patterns

OBJECTIF
Validez couplage, cohésion, abstraction et choix de pattern.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Validez couplage, cohésion, abstraction et choix de pattern.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',1500,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Quiz : architecture et patterns','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Quiz : architecture et patterns');
  INSERT INTO public.quizzes(lesson_id,title,pass_score,max_attempts) VALUES(v_lesson,'Quiz — SOLID, Clean Code et design patterns',70,NULL) ON CONFLICT(lesson_id) DO UPDATE SET title=EXCLUDED.title,pass_score=70 RETURNING id INTO v_quiz;
  DELETE FROM public.quiz_questions WHERE quiz_id=v_quiz;
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel est le meilleur résumé de l’objectif principal du module 15 ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,1) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Comprendre et pratiquer : Validez couplage, cohésion, abstraction et choix de pattern.',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Mémoriser uniquement la syntaxe',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter tous les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Copier une solution sans l’exécuter',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quelle méthode de travail est la plus fiable ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,2) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Écrire une version simple, tester, puis améliorer',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Optimiser avant de compiler',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ignorer les erreurs',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Changer plusieurs choses à la fois sans tester',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Que faut-il faire lorsqu’un programme échoue ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,3) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Lire l’erreur, isoler la cause et reproduire le problème',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Réécrire tout le projet',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Cacher l’exception',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel critère indique une vraie compréhension ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,4) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Pouvoir expliquer et appliquer sur un exemple différent',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir lu la leçon une seule fois',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Connaître le titre par cœur',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir copié le code',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Après un exercice réussi, quelle étape est la plus utile ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,5) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Tester un cas limite et une variante',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ne plus toucher au code',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les commentaires',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter toute refactorisation',false,4);
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mini-projet : architecture en couches','java-a-z-m15-l08','exercise','JAVA DE A À Z — MODULE 15/18

LEÇON 8/8 : Mini-projet : architecture en couches

OBJECTIF
Organisez domaine, application, infrastructure et présentation sur un cas complet.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Organisez domaine, application, infrastructure et présentation sur un cas complet.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Mini-projet : architecture en couches','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Mini-projet : architecture en couches');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'Module 16 — JVM avancée, mémoire et performance', 'Comprendre ce qui se passe sous le capot et diagnostiquer les problèmes de performance.',16) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Stack, heap, metaspace et références','java-a-z-m16-l01','text','JAVA DE A À Z — MODULE 16/18

LEÇON 1/8 : Stack, heap, metaspace et références

OBJECTIF
Suivez la mémoire d’objets et variables pendant l’exécution.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Suivez la mémoire d’objets et variables pendant l’exécution.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Stack, heap, metaspace et références','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Stack, heap, metaspace et références');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Garbage Collector et pauses','java-a-z-m16-l02','text','JAVA DE A À Z — MODULE 16/18

LEÇON 2/8 : Garbage Collector et pauses

OBJECTIF
Comprenez le principe du GC sans micro-optimiser aveuglément.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Comprenez le principe du GC sans micro-optimiser aveuglément.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Garbage Collector et pauses','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Garbage Collector et pauses');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Profilage CPU et mémoire','java-a-z-m16-l03','text','JAVA DE A À Z — MODULE 16/18

LEÇON 3/8 : Profilage CPU et mémoire

OBJECTIF
Repérez un hotspot et une fuite logique avec un profiler.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Repérez un hotspot et une fuite logique avec un profiler.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Profilage CPU et mémoire','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Profilage CPU et mémoire');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Immutabilité, records et sealed classes','java-a-z-m16-l04','text','JAVA DE A À Z — MODULE 16/18

LEÇON 4/8 : Immutabilité, records et sealed classes

OBJECTIF
Utilisez les fonctionnalités modernes pour modéliser plus sûrement.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Utilisez les fonctionnalités modernes pour modéliser plus sûrement.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Immutabilité, records et sealed classes','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Immutabilité, records et sealed classes');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Exercice : optimiser un traitement lent','java-a-z-m16-l05','exercise','JAVA DE A À Z — MODULE 16/18

LEÇON 5/8 : Exercice : optimiser un traitement lent

OBJECTIF
Mesurez avant/après et éliminez les allocations inutiles.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Mesurez avant/après et éliminez les allocations inutiles.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Exercice : optimiser un traitement lent','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Exercice : optimiser un traitement lent');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Challenge : cache thread-safe','java-a-z-m16-l06','exercise','JAVA DE A À Z — MODULE 16/18

LEÇON 6/8 : Challenge : cache thread-safe

OBJECTIF
Concevez un cache avec expiration et concurrence.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Concevez un cache avec expiration et concurrence.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Challenge : cache thread-safe','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Challenge : cache thread-safe');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz : JVM et performance','java-a-z-m16-l07','quiz','JAVA DE A À Z — MODULE 16/18

LEÇON 7/8 : Quiz : JVM et performance

OBJECTIF
Validez allocation, GC, profiling, records et mesure.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Validez allocation, GC, profiling, records et mesure.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',1500,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Quiz : JVM et performance','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Quiz : JVM et performance');
  INSERT INTO public.quizzes(lesson_id,title,pass_score,max_attempts) VALUES(v_lesson,'Quiz — JVM avancée, mémoire et performance',70,NULL) ON CONFLICT(lesson_id) DO UPDATE SET title=EXCLUDED.title,pass_score=70 RETURNING id INTO v_quiz;
  DELETE FROM public.quiz_questions WHERE quiz_id=v_quiz;
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel est le meilleur résumé de l’objectif principal du module 16 ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,1) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Comprendre et pratiquer : Validez allocation, GC, profiling, records et mesure.',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Mémoriser uniquement la syntaxe',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter tous les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Copier une solution sans l’exécuter',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quelle méthode de travail est la plus fiable ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,2) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Écrire une version simple, tester, puis améliorer',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Optimiser avant de compiler',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ignorer les erreurs',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Changer plusieurs choses à la fois sans tester',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Que faut-il faire lorsqu’un programme échoue ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,3) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Lire l’erreur, isoler la cause et reproduire le problème',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Réécrire tout le projet',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Cacher l’exception',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel critère indique une vraie compréhension ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,4) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Pouvoir expliquer et appliquer sur un exemple différent',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir lu la leçon une seule fois',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Connaître le titre par cœur',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir copié le code',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Après un exercice réussi, quelle étape est la plus utile ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,5) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Tester un cas limite et une variante',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ne plus toucher au code',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les commentaires',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter toute refactorisation',false,4);
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mini-projet : diagnostic d’une application lente','java-a-z-m16-l08','exercise','JAVA DE A À Z — MODULE 16/18

LEÇON 8/8 : Mini-projet : diagnostic d’une application lente

OBJECTIF
Analysez métriques, hypothèses, profilage et plan d’amélioration.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Analysez métriques, hypothèses, profilage et plan d’amélioration.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Mini-projet : diagnostic d’une application lente','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Mini-projet : diagnostic d’une application lente');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'Module 17 — Spring Boot : API REST professionnelle', 'Construire une application backend moderne avec Spring Boot.',17) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Créer un projet Spring Boot et comprendre l’injection de dépendances','java-a-z-m17-l01','text','JAVA DE A À Z — MODULE 17/18

LEÇON 1/8 : Créer un projet Spring Boot et comprendre l’injection de dépendances

OBJECTIF
Repérez configuration, composants, beans et démarrage.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Repérez configuration, composants, beans et démarrage.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Créer un projet Spring Boot et comprendre l’injection de dépendances','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Créer un projet Spring Boot et comprendre l’injection de dépendances');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Controllers, DTO et validation','java-a-z-m17-l02','text','JAVA DE A À Z — MODULE 17/18

LEÇON 2/8 : Controllers, DTO et validation

OBJECTIF
Exposez des endpoints propres et validez les entrées.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Exposez des endpoints propres et validez les entrées.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Controllers, DTO et validation','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Controllers, DTO et validation');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Services, repositories et Spring Data JPA','java-a-z-m17-l03','text','JAVA DE A À Z — MODULE 17/18

LEÇON 3/8 : Services, repositories et Spring Data JPA

OBJECTIF
Séparez métier et persistance.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Séparez métier et persistance.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Services, repositories et Spring Data JPA','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Services, repositories et Spring Data JPA');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Gestion globale des erreurs et logs','java-a-z-m17-l04','text','JAVA DE A À Z — MODULE 17/18

LEÇON 4/8 : Gestion globale des erreurs et logs

OBJECTIF
Retournez des réponses d’erreur cohérentes.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Retournez des réponses d’erreur cohérentes.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Gestion globale des erreurs et logs','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Gestion globale des erreurs et logs');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Exercice : API CRUD de tâches','java-a-z-m17-l05','exercise','JAVA DE A À Z — MODULE 17/18

LEÇON 5/8 : Exercice : API CRUD de tâches

OBJECTIF
Créez endpoints, validation, service et repository.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Créez endpoints, validation, service et repository.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Exercice : API CRUD de tâches','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Exercice : API CRUD de tâches');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Challenge : pagination, recherche et tri','java-a-z-m17-l06','exercise','JAVA DE A À Z — MODULE 17/18

LEÇON 6/8 : Challenge : pagination, recherche et tri

OBJECTIF
Ajoutez filtres et pagination sans casser l’API.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Ajoutez filtres et pagination sans casser l’API.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Challenge : pagination, recherche et tri','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Challenge : pagination, recherche et tri');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz : Spring Boot REST','java-a-z-m17-l07','quiz','JAVA DE A À Z — MODULE 17/18

LEÇON 7/8 : Quiz : Spring Boot REST

OBJECTIF
Validez annotations, injection, couches, DTO et statuts HTTP.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Validez annotations, injection, couches, DTO et statuts HTTP.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',1500,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Quiz : Spring Boot REST','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Quiz : Spring Boot REST');
  INSERT INTO public.quizzes(lesson_id,title,pass_score,max_attempts) VALUES(v_lesson,'Quiz — Spring Boot : API REST professionnelle',70,NULL) ON CONFLICT(lesson_id) DO UPDATE SET title=EXCLUDED.title,pass_score=70 RETURNING id INTO v_quiz;
  DELETE FROM public.quiz_questions WHERE quiz_id=v_quiz;
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel est le meilleur résumé de l’objectif principal du module 17 ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,1) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Comprendre et pratiquer : Validez annotations, injection, couches, DTO et statuts HTTP.',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Mémoriser uniquement la syntaxe',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter tous les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Copier une solution sans l’exécuter',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quelle méthode de travail est la plus fiable ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,2) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Écrire une version simple, tester, puis améliorer',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Optimiser avant de compiler',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ignorer les erreurs',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Changer plusieurs choses à la fois sans tester',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Que faut-il faire lorsqu’un programme échoue ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,3) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Lire l’erreur, isoler la cause et reproduire le problème',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Réécrire tout le projet',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Cacher l’exception',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel critère indique une vraie compréhension ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,4) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Pouvoir expliquer et appliquer sur un exemple différent',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir lu la leçon une seule fois',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Connaître le titre par cœur',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir copié le code',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Après un exercice réussi, quelle étape est la plus utile ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,5) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Tester un cas limite et une variante',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ne plus toucher au code',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les commentaires',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter toute refactorisation',false,4);
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mini-projet : API de gestion de bibliothèque','java-a-z-m17-l08','exercise','JAVA DE A À Z — MODULE 17/18

LEÇON 8/8 : Mini-projet : API de gestion de bibliothèque

OBJECTIF
Construisez une API documentée avec PostgreSQL et tests.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Construisez une API documentée avec PostgreSQL et tests.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Mini-projet : API de gestion de bibliothèque','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Mini-projet : API de gestion de bibliothèque');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'Module 18 — Sécurité, authentification et Spring Security', 'Protéger une API et gérer les identités correctement.',18) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Menaces web et principes de sécurité','java-a-z-m18-l01','text','JAVA DE A À Z — MODULE 18/18

LEÇON 1/8 : Menaces web et principes de sécurité

OBJECTIF
Comprenez authentification, autorisation, hash de mot de passe et moindre privilège.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Comprenez authentification, autorisation, hash de mot de passe et moindre privilège.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Menaces web et principes de sécurité','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Menaces web et principes de sécurité');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Spring Security : chaîne de filtres','java-a-z-m18-l02','text','JAVA DE A À Z — MODULE 18/18

LEÇON 2/8 : Spring Security : chaîne de filtres

OBJECTIF
Repérez où et comment les requêtes sont sécurisées.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Repérez où et comment les requêtes sont sécurisées.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Spring Security : chaîne de filtres','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Spring Security : chaîne de filtres');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'JWT : création, validation et expiration','java-a-z-m18-l03','text','JAVA DE A À Z — MODULE 18/18

LEÇON 3/8 : JWT : création, validation et expiration

OBJECTIF
Implémentez un flux de connexion avec token signé.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Implémentez un flux de connexion avec token signé.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — JWT : création, validation et expiration','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — JWT : création, validation et expiration');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Rôles, permissions et CORS','java-a-z-m18-l04','text','JAVA DE A À Z — MODULE 18/18

LEÇON 4/8 : Rôles, permissions et CORS

OBJECTIF
Protégez des endpoints selon le profil utilisateur.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Protégez des endpoints selon le profil utilisateur.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Rôles, permissions et CORS','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Rôles, permissions et CORS');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Exercice : inscription et connexion sécurisées','java-a-z-m18-l05','exercise','JAVA DE A À Z — MODULE 18/18

LEÇON 5/8 : Exercice : inscription et connexion sécurisées

OBJECTIF
Créez register/login avec mot de passe hashé et validation.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Créez register/login avec mot de passe hashé et validation.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Exercice : inscription et connexion sécurisées','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Exercice : inscription et connexion sécurisées');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Challenge : refresh token et révocation','java-a-z-m18-l06','exercise','JAVA DE A À Z — MODULE 18/18

LEÇON 6/8 : Challenge : refresh token et révocation

OBJECTIF
Ajoutez renouvellement et invalidation contrôlée.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Ajoutez renouvellement et invalidation contrôlée.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Challenge : refresh token et révocation','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Challenge : refresh token et révocation');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz : sécurité Java','java-a-z-m18-l07','quiz','JAVA DE A À Z — MODULE 18/18

LEÇON 7/8 : Quiz : sécurité Java

OBJECTIF
Validez JWT, session, CSRF, CORS, rôles et stockage de secrets.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Validez JWT, session, CSRF, CORS, rôles et stockage de secrets.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',1500,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Quiz : sécurité Java','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Quiz : sécurité Java');
  INSERT INTO public.quizzes(lesson_id,title,pass_score,max_attempts) VALUES(v_lesson,'Quiz — Sécurité, authentification et Spring Security',70,NULL) ON CONFLICT(lesson_id) DO UPDATE SET title=EXCLUDED.title,pass_score=70 RETURNING id INTO v_quiz;
  DELETE FROM public.quiz_questions WHERE quiz_id=v_quiz;
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel est le meilleur résumé de l’objectif principal du module 18 ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,1) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Comprendre et pratiquer : Validez JWT, session, CSRF, CORS, rôles et stockage de secrets.',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Mémoriser uniquement la syntaxe',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter tous les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Copier une solution sans l’exécuter',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quelle méthode de travail est la plus fiable ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,2) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Écrire une version simple, tester, puis améliorer',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Optimiser avant de compiler',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ignorer les erreurs',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Changer plusieurs choses à la fois sans tester',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Que faut-il faire lorsqu’un programme échoue ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,3) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Lire l’erreur, isoler la cause et reproduire le problème',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Réécrire tout le projet',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Cacher l’exception',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel critère indique une vraie compréhension ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,4) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Pouvoir expliquer et appliquer sur un exemple différent',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir lu la leçon une seule fois',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Connaître le titre par cœur',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir copié le code',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Après un exercice réussi, quelle étape est la plus utile ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,5) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Tester un cas limite et une variante',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ne plus toucher au code',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les commentaires',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter toute refactorisation',false,4);
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Mini-projet : API sécurisée multi-rôles','java-a-z-m18-l08','exercise','JAVA DE A À Z — MODULE 18/18

LEÇON 8/8 : Mini-projet : API sécurisée multi-rôles

OBJECTIF
Protégez une application complète avec étudiant, tuteur et admin.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Protégez une application complète avec étudiant, tuteur et admin.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Mini-projet : API sécurisée multi-rôles','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Mini-projet : API sécurisée multi-rôles');
  INSERT INTO public.course_modules(course_id,title,description,position) VALUES(v_course,'Module 19 — Architecture avancée, Docker et projet final expert', 'Assembler toutes les compétences dans une application proche d’un projet professionnel.',19) ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description RETURNING id INTO v_module;
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Monolithe modulaire, microservices et choix d’architecture','java-a-z-m19-l01','text','JAVA DE A À Z — MODULE 19/18

LEÇON 1/8 : Monolithe modulaire, microservices et choix d’architecture

OBJECTIF
Comparez les compromis et évitez de choisir les microservices trop tôt.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Comparez les compromis et évitez de choisir les microservices trop tôt.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,1,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Monolithe modulaire, microservices et choix d’architecture','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Monolithe modulaire, microservices et choix d’architecture');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Configuration, profils et variables d’environnement','java-a-z-m19-l02','text','JAVA DE A À Z — MODULE 19/18

LEÇON 2/8 : Configuration, profils et variables d’environnement

OBJECTIF
Séparez dev, test et production sans exposer de secrets.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Séparez dev, test et production sans exposer de secrets.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,2,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Configuration, profils et variables d’environnement','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Configuration, profils et variables d’environnement');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Dockeriser une application Java','java-a-z-m19-l03','text','JAVA DE A À Z — MODULE 19/18

LEÇON 3/8 : Dockeriser une application Java

OBJECTIF
Créez Dockerfile multi-stage et lancez l’application avec PostgreSQL.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Créez Dockerfile multi-stage et lancez l’application avec PostgreSQL.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,3,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Dockeriser une application Java','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Dockeriser une application Java');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Observabilité : logs, métriques et health checks','java-a-z-m19-l04','text','JAVA DE A À Z — MODULE 19/18

LEÇON 4/8 : Observabilité : logs, métriques et health checks

OBJECTIF
Ajoutez des signaux exploitables pour comprendre l’état du système.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Ajoutez des signaux exploitables pour comprendre l’état du système.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2100,4,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Observabilité : logs, métriques et health checks','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Observabilité : logs, métriques et health checks');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Exercice : concevoir l’architecture du projet final','java-a-z-m19-l05','exercise','JAVA DE A À Z — MODULE 19/18

LEÇON 5/8 : Exercice : concevoir l’architecture du projet final

OBJECTIF
Dessinez composants, données, API, sécurité et stratégie de tests.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Dessinez composants, données, API, sécurité et stratégie de tests.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,5,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Exercice : concevoir l’architecture du projet final','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Exercice : concevoir l’architecture du projet final');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Challenge expert : fiabilité et montée en charge','java-a-z-m19-l06','exercise','JAVA DE A À Z — MODULE 19/18

LEÇON 6/8 : Challenge expert : fiabilité et montée en charge

OBJECTIF
Proposez cache, files, retries, idempotence et limites de ressources.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Proposez cache, files, retries, idempotence et limites de ressources.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,6,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Challenge expert : fiabilité et montée en charge','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Challenge expert : fiabilité et montée en charge');
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Quiz final Java de A à Z','java-a-z-m19-l07','quiz','JAVA DE A À Z — MODULE 19/18

LEÇON 7/8 : Quiz final Java de A à Z

OBJECTIF
Validez les connaissances de syntaxe, POO, collections, concurrence, SQL, web, Spring et architecture.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Validez les connaissances de syntaxe, POO, collections, concurrence, SQL, web, Spring et architecture.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',1500,7,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Quiz final Java de A à Z','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Quiz final Java de A à Z');
  INSERT INTO public.quizzes(lesson_id,title,pass_score,max_attempts) VALUES(v_lesson,'Quiz — Architecture avancée, Docker et projet final expert',70,NULL) ON CONFLICT(lesson_id) DO UPDATE SET title=EXCLUDED.title,pass_score=70 RETURNING id INTO v_quiz;
  DELETE FROM public.quiz_questions WHERE quiz_id=v_quiz;
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel est le meilleur résumé de l’objectif principal du module 19 ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,1) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Comprendre et pratiquer : Validez les connaissances de syntaxe, POO, collections, concurrence, SQL, web, Spring et architecture.',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Mémoriser uniquement la syntaxe',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter tous les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Copier une solution sans l’exécuter',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quelle méthode de travail est la plus fiable ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,2) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Écrire une version simple, tester, puis améliorer',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Optimiser avant de compiler',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ignorer les erreurs',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Changer plusieurs choses à la fois sans tester',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Que faut-il faire lorsqu’un programme échoue ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,3) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Lire l’erreur, isoler la cause et reproduire le problème',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Réécrire tout le projet',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les tests',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Cacher l’exception',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Quel critère indique une vraie compréhension ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,4) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Pouvoir expliquer et appliquer sur un exemple différent',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir lu la leçon une seule fois',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Connaître le titre par cœur',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Avoir copié le code',false,4);
  INSERT INTO public.quiz_questions(quiz_id,question,question_type,explanation,points,position) VALUES(v_quiz,'Après un exercice réussi, quelle étape est la plus utile ?','single_choice','Dans ce parcours, la validation repose sur la compréhension, la pratique et la capacité à expliquer la démarche.',1,5) RETURNING id INTO v_question;
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Tester un cas limite et une variante',true,1);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Ne plus toucher au code',false,2);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Supprimer les commentaires',false,3);
  INSERT INTO public.quiz_options(question_id,label,is_correct,position) VALUES(v_question,'Éviter toute refactorisation',false,4);
  INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview) VALUES(v_module,'Projet final : plateforme StudyLink Mini','java-a-z-m19-l08','exercise','JAVA DE A À Z — MODULE 19/18

LEÇON 8/8 : Projet final : plateforme StudyLink Mini

OBJECTIF
Réalisez une API complète avec utilisateurs, cours, inscriptions, sécurité, PostgreSQL, tests, Docker, documentation et plan de déploiement.

EXPLICATION PAS À PAS
1. Commencez par identifier le problème précis à résoudre et les données d’entrée.
2. Écrivez d’abord une version simple et correcte avant de chercher à l’optimiser.
3. Donnez des noms explicites aux classes, méthodes et variables.
4. Testez le cas normal, une valeur limite et au moins une entrée invalide.
5. Utilisez le débogueur ou les messages d’erreur pour comprendre la cause d’un échec au lieu de modifier le code au hasard.

À RETENIR
• Le code doit être correct, mais aussi lisible et testable.
• Une petite méthode avec une responsabilité claire est plus facile à maintenir.
• Chaque erreur rencontrée doit devenir une occasion de comprendre le fonctionnement de Java.

PRATIQUE
Réalisez une API complète avec utilisateurs, cours, inscriptions, sécurité, PostgreSQL, tests, Docker, documentation et plan de déploiement.

Travail demandé : écrivez le code vous-même, exécutez-le, modifiez au moins deux valeurs, provoquez volontairement une erreur puis corrigez-la. Notez enfin en 5 lignes ce que vous avez compris.

CRITÈRES DE RÉUSSITE
• Le programme compile sans erreur.
• Le résultat est correct pour plusieurs jeux de données.
• Vous pouvez expliquer chaque partie importante du code.
• Vous avez testé au moins un cas limite.
• Vous savez citer une amélioration possible.',2700,8,false) ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview RETURNING id INTO v_lesson;
  INSERT INTO public.lesson_resources(lesson_id,title,resource_type,url) SELECT v_lesson,'Fiche pratique — Projet final : plateforme StudyLink Mini','code','/courses/java-spring-boot/modules' WHERE NOT EXISTS (SELECT 1 FROM public.lesson_resources WHERE lesson_id=v_lesson AND title='Fiche pratique — Projet final : plateforme StudyLink Mini');
  UPDATE public.courses SET description=description || E'\n\nContenu détaillé : 18 modules, 144 leçons, 18 quiz, dizaines d’exercices, challenges, débogages et mini-projets, plus un projet final expert.', updated_at=now() WHERE id=v_course;
END $$;
SELECT c.title,c.slug,COUNT(DISTINCT m.id)::int AS modules,COUNT(DISTINCT l.id)::int AS lessons,COUNT(DISTINCT q.id)::int AS quizzes FROM public.courses c LEFT JOIN public.course_modules m ON m.course_id=c.id LEFT JOIN public.lessons l ON l.module_id=m.id LEFT JOIN public.quizzes q ON q.lesson_id=l.id WHERE c.slug='java-spring-boot' GROUP BY c.id,c.title,c.slug;