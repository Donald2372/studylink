-- StudyLink 021 - C++ complet debutant a professionnel
-- Version compatible Supabase SQL Editor : uniquement des INSERT et des WITH.

INSERT INTO public.learning_categories(name, slug, description)
SELECT 'Informatique', 'informatique', 'Programmation, developpement logiciel, systeme et architecture'
WHERE NOT EXISTS (SELECT 1 FROM public.learning_categories WHERE name = 'Informatique');

INSERT INTO public.courses(author_id, category_id, title, slug, short_description, description, cover_url, level, language, estimated_minutes, price, is_free, status, content_type, objectives, prerequisites, published_at)
SELECT
  (SELECT id FROM public.users ORDER BY CASE WHEN role = 'admin' THEN 0 ELSE 1 END, created_at LIMIT 1),
  (SELECT id FROM public.learning_categories WHERE name = 'Informatique' ORDER BY id LIMIT 1),
  'C++ complet : debutant a professionnel',
  'cpp-complet-debutant-professionnel',
  'Un parcours C++ massif et concret, des bases jusqu au niveau professionnel.',
  'Cours complet de C++ couvrant compilation, syntaxe, memoire, POO, STL, templates, CMake, tests, concurrence, performance, architecture et projet final. Chaque lecon contient une video integree, une explication pas a pas, des cas concrets, des exercices progressifs et un quiz.',
  'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?auto=format&fit=crop&w=1600&q=85',
  'all',
  'cpp',
  7200,
  0,
  true,
  'published',
  'course',
  ARRAY['Comprendre C++ depuis zero','Maitriser memoire, RAII, POO, STL et templates','Construire des projets CMake testes et maintenables','Aborder concurrence, performance et architecture professionnelle'],
  ARRAY['Aucun prerequis C++ obligatoire','Un ordinateur avec compilateur C++ moderne','Pratiquer chaque exercice en compilant le code'],
  now()
WHERE EXISTS (SELECT 1 FROM public.users)
ON CONFLICT(slug) DO UPDATE SET
  title = EXCLUDED.title,
  short_description = EXCLUDED.short_description,
  description = EXCLUDED.description,
  cover_url = EXCLUDED.cover_url,
  level = EXCLUDED.level,
  language = EXCLUDED.language,
  estimated_minutes = EXCLUDED.estimated_minutes,
  status = EXCLUDED.status,
  objectives = EXCLUDED.objectives,
  prerequisites = EXCLUDED.prerequisites,
  updated_at = now();

WITH module_data(position, title, level_name, focus, videos, units) AS (
  VALUES
  (1, 'Fondations C++ et environnement', 'Debutant', 'syntaxe, compilation, types, entrees/sorties, fonctions', '["vLnPwxZdW4Y","8jLOx1hD3_o","18c3MTX0PK0"]'::jsonb, '[{"title":"Installer et comprendre la chaine C++","concept":"compilateur, standard C++17/20/23, fichiers .cpp/.hpp, compilation et linking","project":"Compiler un programme console propre avec plusieurs fichiers","vocab":"compiler, linker, source file, header, standard, warning, binary, namespace"},{"title":"Variables, types et expressions","concept":"int, double, bool, char, auto, const, conversions, overflow, initialisation uniforme","project":"Construire une calculatrice de conversion temperature/devise","vocab":"int, double, bool, auto, const, overflow, cast, initialisation"},{"title":"Conditions, boucles et fonctions","concept":"if, switch, for, while, fonctions, parametres, valeur de retour, decomposition","project":"Programmer un mini gestionnaire de notes avec moyenne et mention","vocab":"if, switch, loop, function, parameter, return, scope, validation"}]'::jsonb),
  (2, 'Memoire, references et robustesse', 'Debutant avance', 'pile, tas, references, pointeurs, duree de vie, RAII', '["YnWhqhNdYyk","vLnPwxZdW4Y","8jLOx1hD3_o"]'::jsonb, '[{"title":"References, pointeurs et duree de vie","concept":"adresse, reference, pointeur, nullptr, ownership, dangling pointer","project":"Corriger des fonctions qui modifient des donnees sans copie inutile","vocab":"reference, pointer, nullptr, address, lifetime, ownership, dangling, const reference"},{"title":"Tableaux, string, vector et ranges","concept":"std::array, std::vector, std::string, iteration, index, bounds, range-for","project":"Creer un analyseur de notes et statistiques simple","vocab":"array, vector, string, range, iterator, index, capacity, bounds"},{"title":"Erreurs, exceptions et RAII","concept":"exception safety, destructeur, ressource, invariant, smart pointer, cleanup automatique","project":"Lire un fichier en securisant erreurs et ressources","vocab":"exception, RAII, invariant, destructor, resource, unique_ptr, shared_ptr, cleanup"}]'::jsonb),
  (3, 'Programmation orientee objet', 'Intermediaire', 'classes, encapsulation, heritage prudent, polymorphisme, design d API', '["18c3MTX0PK0","8jLOx1hD3_o","vLnPwxZdW4Y"]'::jsonb, '[{"title":"Classes, constructeurs et invariants","concept":"class, struct, private/public, constructor, invariant, const method","project":"Modeliser un compte bancaire robuste","vocab":"class, object, constructor, invariant, method, private, public, const"},{"title":"Composition, heritage et polymorphisme","concept":"composition over inheritance, virtual, override, interface, destructor virtual","project":"Construire un systeme de paiement extensible","vocab":"composition, inheritance, virtual, override, interface, base class, derived class, polymorphism"},{"title":"Operateurs, copie et deplacement","concept":"rule of zero/five, copy constructor, move constructor, operator overload","project":"Creer une classe ressource qui evite les copies couteuses","vocab":"copy, move, operator, overload, resource, noexcept, swap, value semantics"}]'::jsonb),
  (4, 'STL, algorithmes et structures de donnees', 'Intermediaire solide', 'containers, iterateurs, algorithmes, complexite, choix de structure', '["bSkpMdDe4g4","18c3MTX0PK0","8jLOx1hD3_o"]'::jsonb, '[{"title":"Containers STL et complexite","concept":"vector, list, deque, map, unordered_map, set, complexite Big-O","project":"Choisir la bonne structure pour un carnet de contacts","vocab":"container, vector, map, unordered_map, set, complexity, lookup, insertion"},{"title":"Algorithmes standard et lambdas","concept":"sort, find_if, transform, accumulate, lambda, predicate, projection","project":"Nettoyer, filtrer et classer une collection de donnees","vocab":"algorithm, lambda, predicate, sort, transform, accumulate, filter, projection"},{"title":"Iterateurs, ranges et vues","concept":"iterator categories, begin/end, ranges, views, lazy evaluation","project":"Construire un pipeline de traitement sans boucle manuelle inutile","vocab":"iterator, range, view, lazy, begin, end, pipeline, category"}]'::jsonb),
  (5, 'C++ moderne et templates', 'Avance', 'templates, concepts, constexpr, type deduction, generics modernes', '["18c3MTX0PK0","bSkpMdDe4g4","YnWhqhNdYyk"]'::jsonb, '[{"title":"Templates de fonctions et de classes","concept":"template parameter, instantiation, specialization, generic programming","project":"Ecrire une bibliotheque de statistiques generique","vocab":"template, generic, instantiation, specialization, type parameter, deduction, overload, constraint"},{"title":"Concepts, auto et contraintes","concept":"C++20 concepts, requires, auto, decltype, contraintes lisibles","project":"Limiter une API generique aux types corrects","vocab":"concept, requires, auto, decltype, constraint, readable error, type trait, generic API"},{"title":"constexpr, enum class et types forts","concept":"constexpr, consteval, enum class, strong type, compile-time calculation","project":"Valider des constantes et unites a la compilation","vocab":"constexpr, consteval, enum class, strong type, compile-time, constant, validation, unit"}]'::jsonb),
  (6, 'Build, tests, fichiers et bibliotheques', 'Avance pratique', 'CMake, tests, packaging, fichiers, dependances, qualite', '["ZQFzMfHIxng","8jLOx1hD3_o","18c3MTX0PK0"]'::jsonb, '[{"title":"CMake et organisation de projet","concept":"target, library, executable, include directories, compile features","project":"Structurer une application avec lib, app et tests","vocab":"CMake, target, library, executable, include, compile feature, build type, install"},{"title":"Tests unitaires et refactoring","concept":"test case, assertion, fixture, regression, refactoring, dependency injection","project":"Ajouter une suite de tests a une logique metier","vocab":"unit test, assertion, fixture, regression, refactor, coverage, dependency, mock"},{"title":"Fichiers, serialisation et erreurs IO","concept":"fstream, parsing, validation, JSON/CSV, gestion des erreurs","project":"Importer et exporter des donnees de configuration","vocab":"fstream, parse, serialize, CSV, JSON, validation, error, format"}]'::jsonb),
  (7, 'Concurrence, reseau et systeme', 'Professionnel', 'threads, async, mutex, atomics, sockets, integration systeme', '["6pXhQ28FVlU","18c3MTX0PK0","2EWejmkKlxs"]'::jsonb, '[{"title":"Threads, mutex et conditions de course","concept":"std::thread, mutex, lock_guard, race condition, deadlock","project":"Paralleliser un traitement tout en protegeant les donnees partagees","vocab":"thread, mutex, lock, race condition, deadlock, shared state, join, synchronization"},{"title":"Futures, async et taches","concept":"std::async, future, promise, task-based concurrency, exception propagation","project":"Lancer des calculs independants et collecter les resultats","vocab":"future, promise, async, task, result, exception, launch policy, continuation"},{"title":"Bases reseau et integration systeme","concept":"sockets, protocoles, processus, CLI, configuration, logs","project":"Construire un outil CLI qui communique avec un service","vocab":"socket, protocol, process, CLI, config, log, timeout, retry"}]'::jsonb),
  (8, 'Performance, architecture et niveau professionnel', 'Expert', 'profiling, cache, allocation, architecture, code review, projet final', '["2EWejmkKlxs","18c3MTX0PK0","YnWhqhNdYyk"]'::jsonb, '[{"title":"Mesure, profiling et optimisation","concept":"benchmark, profiler, cache locality, allocation, algorithmic complexity","project":"Optimiser un traitement de donnees apres mesure objective","vocab":"benchmark, profiler, cache, allocation, hot path, complexity, latency, throughput"},{"title":"Architecture propre en C++","concept":"separation of concerns, API stable, boundaries, dependency direction","project":"Transformer un prototype en application maintenable","vocab":"architecture, boundary, API, module, dependency, layer, interface, maintainability"},{"title":"Projet final professionnel","concept":"specification, design, implementation, tests, packaging, documentation, review","project":"Livrer une application C++ complete, testee et documentee","vocab":"specification, design, implementation, test, package, documentation, review, release"}]'::jsonb)
)
INSERT INTO public.course_modules(course_id, title, description, position)
SELECT c.id, md.title, md.level_name || ' - ' || md.focus, md.position
FROM module_data md
CROSS JOIN public.courses c
WHERE c.slug = 'cpp-complet-debutant-professionnel'
ON CONFLICT(course_id, position) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

WITH module_data(position, title, level_name, focus, videos, units) AS (
  VALUES
  (1, 'Fondations C++ et environnement', 'Debutant', 'syntaxe, compilation, types, entrees/sorties, fonctions', '["vLnPwxZdW4Y","8jLOx1hD3_o","18c3MTX0PK0"]'::jsonb, '[{"title":"Installer et comprendre la chaine C++","concept":"compilateur, standard C++17/20/23, fichiers .cpp/.hpp, compilation et linking","project":"Compiler un programme console propre avec plusieurs fichiers","vocab":"compiler, linker, source file, header, standard, warning, binary, namespace"},{"title":"Variables, types et expressions","concept":"int, double, bool, char, auto, const, conversions, overflow, initialisation uniforme","project":"Construire une calculatrice de conversion temperature/devise","vocab":"int, double, bool, auto, const, overflow, cast, initialisation"},{"title":"Conditions, boucles et fonctions","concept":"if, switch, for, while, fonctions, parametres, valeur de retour, decomposition","project":"Programmer un mini gestionnaire de notes avec moyenne et mention","vocab":"if, switch, loop, function, parameter, return, scope, validation"}]'::jsonb),
  (2, 'Memoire, references et robustesse', 'Debutant avance', 'pile, tas, references, pointeurs, duree de vie, RAII', '["YnWhqhNdYyk","vLnPwxZdW4Y","8jLOx1hD3_o"]'::jsonb, '[{"title":"References, pointeurs et duree de vie","concept":"adresse, reference, pointeur, nullptr, ownership, dangling pointer","project":"Corriger des fonctions qui modifient des donnees sans copie inutile","vocab":"reference, pointer, nullptr, address, lifetime, ownership, dangling, const reference"},{"title":"Tableaux, string, vector et ranges","concept":"std::array, std::vector, std::string, iteration, index, bounds, range-for","project":"Creer un analyseur de notes et statistiques simple","vocab":"array, vector, string, range, iterator, index, capacity, bounds"},{"title":"Erreurs, exceptions et RAII","concept":"exception safety, destructeur, ressource, invariant, smart pointer, cleanup automatique","project":"Lire un fichier en securisant erreurs et ressources","vocab":"exception, RAII, invariant, destructor, resource, unique_ptr, shared_ptr, cleanup"}]'::jsonb),
  (3, 'Programmation orientee objet', 'Intermediaire', 'classes, encapsulation, heritage prudent, polymorphisme, design d API', '["18c3MTX0PK0","8jLOx1hD3_o","vLnPwxZdW4Y"]'::jsonb, '[{"title":"Classes, constructeurs et invariants","concept":"class, struct, private/public, constructor, invariant, const method","project":"Modeliser un compte bancaire robuste","vocab":"class, object, constructor, invariant, method, private, public, const"},{"title":"Composition, heritage et polymorphisme","concept":"composition over inheritance, virtual, override, interface, destructor virtual","project":"Construire un systeme de paiement extensible","vocab":"composition, inheritance, virtual, override, interface, base class, derived class, polymorphism"},{"title":"Operateurs, copie et deplacement","concept":"rule of zero/five, copy constructor, move constructor, operator overload","project":"Creer une classe ressource qui evite les copies couteuses","vocab":"copy, move, operator, overload, resource, noexcept, swap, value semantics"}]'::jsonb),
  (4, 'STL, algorithmes et structures de donnees', 'Intermediaire solide', 'containers, iterateurs, algorithmes, complexite, choix de structure', '["bSkpMdDe4g4","18c3MTX0PK0","8jLOx1hD3_o"]'::jsonb, '[{"title":"Containers STL et complexite","concept":"vector, list, deque, map, unordered_map, set, complexite Big-O","project":"Choisir la bonne structure pour un carnet de contacts","vocab":"container, vector, map, unordered_map, set, complexity, lookup, insertion"},{"title":"Algorithmes standard et lambdas","concept":"sort, find_if, transform, accumulate, lambda, predicate, projection","project":"Nettoyer, filtrer et classer une collection de donnees","vocab":"algorithm, lambda, predicate, sort, transform, accumulate, filter, projection"},{"title":"Iterateurs, ranges et vues","concept":"iterator categories, begin/end, ranges, views, lazy evaluation","project":"Construire un pipeline de traitement sans boucle manuelle inutile","vocab":"iterator, range, view, lazy, begin, end, pipeline, category"}]'::jsonb),
  (5, 'C++ moderne et templates', 'Avance', 'templates, concepts, constexpr, type deduction, generics modernes', '["18c3MTX0PK0","bSkpMdDe4g4","YnWhqhNdYyk"]'::jsonb, '[{"title":"Templates de fonctions et de classes","concept":"template parameter, instantiation, specialization, generic programming","project":"Ecrire une bibliotheque de statistiques generique","vocab":"template, generic, instantiation, specialization, type parameter, deduction, overload, constraint"},{"title":"Concepts, auto et contraintes","concept":"C++20 concepts, requires, auto, decltype, contraintes lisibles","project":"Limiter une API generique aux types corrects","vocab":"concept, requires, auto, decltype, constraint, readable error, type trait, generic API"},{"title":"constexpr, enum class et types forts","concept":"constexpr, consteval, enum class, strong type, compile-time calculation","project":"Valider des constantes et unites a la compilation","vocab":"constexpr, consteval, enum class, strong type, compile-time, constant, validation, unit"}]'::jsonb),
  (6, 'Build, tests, fichiers et bibliotheques', 'Avance pratique', 'CMake, tests, packaging, fichiers, dependances, qualite', '["ZQFzMfHIxng","8jLOx1hD3_o","18c3MTX0PK0"]'::jsonb, '[{"title":"CMake et organisation de projet","concept":"target, library, executable, include directories, compile features","project":"Structurer une application avec lib, app et tests","vocab":"CMake, target, library, executable, include, compile feature, build type, install"},{"title":"Tests unitaires et refactoring","concept":"test case, assertion, fixture, regression, refactoring, dependency injection","project":"Ajouter une suite de tests a une logique metier","vocab":"unit test, assertion, fixture, regression, refactor, coverage, dependency, mock"},{"title":"Fichiers, serialisation et erreurs IO","concept":"fstream, parsing, validation, JSON/CSV, gestion des erreurs","project":"Importer et exporter des donnees de configuration","vocab":"fstream, parse, serialize, CSV, JSON, validation, error, format"}]'::jsonb),
  (7, 'Concurrence, reseau et systeme', 'Professionnel', 'threads, async, mutex, atomics, sockets, integration systeme', '["6pXhQ28FVlU","18c3MTX0PK0","2EWejmkKlxs"]'::jsonb, '[{"title":"Threads, mutex et conditions de course","concept":"std::thread, mutex, lock_guard, race condition, deadlock","project":"Paralleliser un traitement tout en protegeant les donnees partagees","vocab":"thread, mutex, lock, race condition, deadlock, shared state, join, synchronization"},{"title":"Futures, async et taches","concept":"std::async, future, promise, task-based concurrency, exception propagation","project":"Lancer des calculs independants et collecter les resultats","vocab":"future, promise, async, task, result, exception, launch policy, continuation"},{"title":"Bases reseau et integration systeme","concept":"sockets, protocoles, processus, CLI, configuration, logs","project":"Construire un outil CLI qui communique avec un service","vocab":"socket, protocol, process, CLI, config, log, timeout, retry"}]'::jsonb),
  (8, 'Performance, architecture et niveau professionnel', 'Expert', 'profiling, cache, allocation, architecture, code review, projet final', '["2EWejmkKlxs","18c3MTX0PK0","YnWhqhNdYyk"]'::jsonb, '[{"title":"Mesure, profiling et optimisation","concept":"benchmark, profiler, cache locality, allocation, algorithmic complexity","project":"Optimiser un traitement de donnees apres mesure objective","vocab":"benchmark, profiler, cache, allocation, hot path, complexity, latency, throughput"},{"title":"Architecture propre en C++","concept":"separation of concerns, API stable, boundaries, dependency direction","project":"Transformer un prototype en application maintenable","vocab":"architecture, boundary, API, module, dependency, layer, interface, maintainability"},{"title":"Projet final professionnel","concept":"specification, design, implementation, tests, packaging, documentation, review","project":"Livrer une application C++ complete, testee et documentee","vocab":"specification, design, implementation, test, package, documentation, review, release"}]'::jsonb)
),
unit_data AS (
  SELECT
    md.position AS module_position,
    md.level_name,
    md.focus,
    u.ordinality::integer AS unit_position,
    u.value->>'title' AS unit_title,
    u.value->>'concept' AS concept,
    u.value->>'project' AS project,
    u.value->>'vocab' AS vocab,
    md.videos->>(u.ordinality::integer - 1) AS video_id
  FROM module_data md
  CROSS JOIN LATERAL jsonb_array_elements(md.units) WITH ORDINALITY AS u(value, ordinality)
),
lesson_kind(lesson_position, suffix, lesson_type, label, duration_seconds) AS (
  VALUES
  (1, 'video', 'youtube', 'video et contexte', 1800),
  (2, 'explication', 'text', 'explication approfondie', 2400),
  (3, 'exercices', 'exercise', 'exercices corriges', 3000),
  (4, 'quiz-projet', 'quiz', 'quiz et projet', 1800)
)
INSERT INTO public.lessons(module_id, title, slug, lesson_type, content, youtube_url, youtube_video_id, duration_seconds, position, is_preview)
SELECT
  cm.id,
  'C++ - ' || ud.unit_title || ' : ' || lk.label,
  lower(regexp_replace('cpp-' || ud.unit_title || '-' || lk.suffix, '[^a-zA-Z0-9]+', '-', 'g')),
  lk.lesson_type,
  'COURS EXPLIQUE PAS A PAS' || chr(10) ||
  'Imaginez que votre programme est une petite usine. Les donnees sont les objets qui circulent, les fonctions sont les machines, les types sont les etiquettes, et le compilateur est le controleur qui refuse les pieces mal formees.' || chr(10) || chr(10) ||
  'NOTION DU JOUR' || chr(10) || ud.concept || chr(10) || chr(10) ||
  'Dit simplement, cette notion sert a organiser le programme pour qu il fasse exactement ce qu on veut, sans casser, sans perdre les donnees et sans devenir impossible a comprendre.' || chr(10) || chr(10) ||
  'POURQUOI ON APPREND CA' || chr(10) ||
  'En C++, l ordinateur vous donne beaucoup de controle. Vous pouvez choisir comment les donnees vivent, comment elles sont copiees, comment elles sont stockees et comment elles sont partagees. Mais si vous choisissez mal, le programme peut compiler puis planter plus tard.' || chr(10) || chr(10) ||
  'PROJET CONCRET' || chr(10) || ud.project || chr(10) || chr(10) ||
  'COMMENT RAISONNER AVANT DE CODER' || chr(10) ||
  '1. Racontez le besoin en francais simple.' || chr(10) ||
  '2. Reperez les donnees qui entrent et sortent.' || chr(10) ||
  '3. Choisissez les types qui rendent les erreurs visibles.' || chr(10) ||
  '4. Ecrivez un exemple minuscule qui compile.' || chr(10) ||
  '5. Ajoutez un cas limite: entree vide, taille zero, valeur invalide, fichier absent ou concurrence selon la lecon.' || chr(10) ||
  '6. Nettoyez les noms et expliquez votre choix a voix haute.' || chr(10) || chr(10) ||
  'VOCABULAIRE TECHNIQUE' || chr(10) || ud.vocab || chr(10) || chr(10) ||
  'EXERCICES PROGRESSIFS' || chr(10) ||
  '1. Expliquez la notion comme a un debutant total.' || chr(10) ||
  '2. Ecrivez un exemple minimal qui compile.' || chr(10) ||
  '3. Lisez le code ligne par ligne: types, noms, entrees, sorties.' || chr(10) ||
  '4. Ajoutez deux cas limites.' || chr(10) ||
  '5. Corrigez une erreur volontaire.' || chr(10) ||
  '6. Refactorez pour rendre le code plus clair.' || chr(10) ||
  '7. Justifiez votre choix comme en revue de code.' || chr(10) || chr(10) ||
  'QUESTION DE MAITRISE' || chr(10) ||
  'Quel bug cette notion permet-elle d eviter dans un vrai projet C++ ? Expliquez avec un exemple simple.',
  CASE WHEN lk.lesson_type = 'youtube' THEN 'https://www.youtube.com/watch?v=' || ud.video_id ELSE NULL END,
  CASE WHEN lk.lesson_type = 'youtube' THEN ud.video_id ELSE NULL END,
  lk.duration_seconds,
  ((ud.unit_position - 1) * 4) + lk.lesson_position,
  ud.module_position = 1 AND ud.unit_position = 1 AND lk.lesson_position = 1
FROM unit_data ud
JOIN public.courses c ON c.slug = 'cpp-complet-debutant-professionnel'
JOIN public.course_modules cm ON cm.course_id = c.id AND cm.position = ud.module_position
CROSS JOIN lesson_kind lk
ON CONFLICT(module_id, position) DO UPDATE SET
  title = EXCLUDED.title,
  slug = EXCLUDED.slug,
  lesson_type = EXCLUDED.lesson_type,
  content = EXCLUDED.content,
  youtube_url = EXCLUDED.youtube_url,
  youtube_video_id = EXCLUDED.youtube_video_id,
  duration_seconds = EXCLUDED.duration_seconds,
  is_preview = EXCLUDED.is_preview;
