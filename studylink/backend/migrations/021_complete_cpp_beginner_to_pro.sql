-- StudyLink 021 - C++ complet debutant a professionnel
-- Migration idempotente : cree un cours C++ massif, 8 modules, 96 lecons, videos integrees, exercices et quiz.
DO $$
DECLARE
  v_author UUID;
  v_cat INTEGER;
  v_course UUID;
  v_module UUID;
  v_module_data JSONB;
  v_unit JSONB;
  v_modules JSONB := '[
    {"title":"Fondations C++ et environnement","level":"Debutant","focus":"syntaxe, compilation, types, entrees/sorties, fonctions","videos":["vLnPwxZdW4Y","8jLOx1hD3_o","18c3MTX0PK0"],"units":[
      {"title":"Installer et comprendre la chaine C++","concept":"compilateur, standard C++17/20/23, fichiers .cpp/.hpp, compilation et linking","project":"Compiler un programme console propre avec plusieurs fichiers","vocab":"compiler, linker, source file, header, standard, warning, binary, namespace"},
      {"title":"Variables, types et expressions","concept":"int, double, bool, char, auto, const, conversions, overflow, initialisation uniforme","project":"Construire une calculatrice de conversion temperature/devise","vocab":"int, double, bool, auto, const, overflow, cast, initialisation"},
      {"title":"Conditions, boucles et fonctions","concept":"if, switch, for, while, fonctions, parametres, valeur de retour, decomposition","project":"Programmer un mini gestionnaire de notes avec moyenne et mention","vocab":"if, switch, loop, function, parameter, return, scope, validation"}]},
    {"title":"Memoire, references et robustesse","level":"Debutant avance","focus":"pile, tas, references, pointeurs, duree de vie, RAII","videos":["YnWhqhNdYyk","vLnPwxZdW4Y","8jLOx1hD3_o"],"units":[
      {"title":"References, pointeurs et duree de vie","concept":"adresse, reference, pointeur, nullptr, ownership, dangling pointer","project":"Corriger des fonctions qui modifient des donnees sans copie inutile","vocab":"reference, pointer, nullptr, address, lifetime, ownership, dangling, const reference"},
      {"title":"Tableaux, string, vector et ranges","concept":"std::array, std::vector, std::string, iteration, index, bounds, range-for","project":"Creer un analyseur de notes et statistiques simple","vocab":"array, vector, string, range, iterator, index, capacity, bounds"},
      {"title":"Erreurs, exceptions et RAII","concept":"exception safety, destructeur, ressource, invariant, smart pointer, cleanup automatique","project":"Lire un fichier en securisant erreurs et ressources","vocab":"exception, RAII, invariant, destructor, resource, unique_ptr, shared_ptr, cleanup"}]},
    {"title":"Programmation orientee objet","level":"Intermediaire","focus":"classes, encapsulation, heritage prudent, polymorphisme, design d API","videos":["18c3MTX0PK0","8jLOx1hD3_o","vLnPwxZdW4Y"],"units":[
      {"title":"Classes, constructeurs et invariants","concept":"class, struct, private/public, constructor, invariant, const method","project":"Modeliser un compte bancaire robuste","vocab":"class, object, constructor, invariant, method, private, public, const"},
      {"title":"Composition, heritage et polymorphisme","concept":"composition over inheritance, virtual, override, interface, destructor virtual","project":"Construire un systeme de paiement extensible","vocab":"composition, inheritance, virtual, override, interface, base class, derived class, polymorphism"},
      {"title":"Operateurs, copie et deplacement","concept":"rule of zero/five, copy constructor, move constructor, operator overload","project":"Creer une classe ressource qui evite les copies couteuses","vocab":"copy, move, operator, overload, resource, noexcept, swap, value semantics"}]},
    {"title":"STL, algorithmes et structures de donnees","level":"Intermediaire solide","focus":"containers, iterateurs, algorithmes, complexite, choix de structure","videos":["bSkpMdDe4g4","18c3MTX0PK0","8jLOx1hD3_o"],"units":[
      {"title":"Containers STL et complexite","concept":"vector, list, deque, map, unordered_map, set, complexite Big-O","project":"Choisir la bonne structure pour un carnet de contacts","vocab":"container, vector, map, unordered_map, set, complexity, lookup, insertion"},
      {"title":"Algorithmes standard et lambdas","concept":"sort, find_if, transform, accumulate, lambda, predicate, projection","project":"Nettoyer, filtrer et classer une collection de donnees","vocab":"algorithm, lambda, predicate, sort, transform, accumulate, filter, projection"},
      {"title":"Iterateurs, ranges et vues","concept":"iterator categories, begin/end, ranges, views, lazy evaluation","project":"Construire un pipeline de traitement sans boucle manuelle inutile","vocab":"iterator, range, view, lazy, begin, end, pipeline, category"}]},
    {"title":"C++ moderne et templates","level":"Avance","focus":"templates, concepts, constexpr, type deduction, generics modernes","videos":["18c3MTX0PK0","bSkpMdDe4g4","YnWhqhNdYyk"],"units":[
      {"title":"Templates de fonctions et de classes","concept":"template parameter, instantiation, specialization, generic programming","project":"Ecrire une bibliotheque de statistiques generique","vocab":"template, generic, instantiation, specialization, type parameter, deduction, overload, constraint"},
      {"title":"Concepts, auto et contraintes","concept":"C++20 concepts, requires, auto, decltype, contraintes lisibles","project":"Limiter une API generique aux types corrects","vocab":"concept, requires, auto, decltype, constraint, readable error, type trait, generic API"},
      {"title":"constexpr, enum class et types forts","concept":"constexpr, consteval, enum class, strong type, compile-time calculation","project":"Valider des constantes et unites a la compilation","vocab":"constexpr, consteval, enum class, strong type, compile-time, constant, validation, unit"}]},
    {"title":"Build, tests, fichiers et bibliotheques","level":"Avance pratique","focus":"CMake, tests, packaging, fichiers, dependances, qualite","videos":["ZQFzMfHIxng","8jLOx1hD3_o","18c3MTX0PK0"],"units":[
      {"title":"CMake et organisation de projet","concept":"target, library, executable, include directories, compile features","project":"Structurer une application avec lib, app et tests","vocab":"CMake, target, library, executable, include, compile feature, build type, install"},
      {"title":"Tests unitaires et refactoring","concept":"test case, assertion, fixture, regression, refactoring, dependency injection","project":"Ajouter une suite de tests a une logique metier","vocab":"unit test, assertion, fixture, regression, refactor, coverage, dependency, mock"},
      {"title":"Fichiers, serialisation et erreurs IO","concept":"fstream, parsing, validation, JSON/CSV, gestion des erreurs","project":"Importer et exporter des donnees de configuration","vocab":"fstream, parse, serialize, CSV, JSON, validation, error, format"}]},
    {"title":"Concurrence, reseau et systeme","level":"Professionnel","focus":"threads, async, mutex, atomics, sockets, integration systeme","videos":["6pXhQ28FVlU","18c3MTX0PK0","2EWejmkKlxs"],"units":[
      {"title":"Threads, mutex et conditions de course","concept":"std::thread, mutex, lock_guard, race condition, deadlock","project":"Paralleliser un traitement tout en protegeant les donnees partagees","vocab":"thread, mutex, lock, race condition, deadlock, shared state, join, synchronization"},
      {"title":"Futures, async et taches","concept":"std::async, future, promise, task-based concurrency, exception propagation","project":"Lancer des calculs independants et collecter les resultats","vocab":"future, promise, async, task, result, exception, launch policy, continuation"},
      {"title":"Bases reseau et integration systeme","concept":"sockets, protocoles, processus, CLI, configuration, logs","project":"Construire un outil CLI qui communique avec un service","vocab":"socket, protocol, process, CLI, config, log, timeout, retry"}]},
    {"title":"Performance, architecture et niveau professionnel","level":"Expert","focus":"profiling, cache, allocation, architecture, code review, projet final","videos":["2EWejmkKlxs","18c3MTX0PK0","YnWhqhNdYyk"],"units":[
      {"title":"Mesure, profiling et optimisation","concept":"benchmark, profiler, cache locality, allocation, algorithmic complexity","project":"Optimiser un traitement de donnees apres mesure objective","vocab":"benchmark, profiler, cache, allocation, hot path, complexity, latency, throughput"},
      {"title":"Architecture propre en C++","concept":"separation of concerns, API stable, boundaries, dependency direction","project":"Transformer un prototype en application maintenable","vocab":"architecture, boundary, API, module, dependency, layer, interface, maintainability"},
      {"title":"Projet final professionnel","concept":"specification, design, implementation, tests, packaging, documentation, review","project":"Livrer une application C++ complete, testee et documentee","vocab":"specification, design, implementation, test, package, documentation, review, release"}]}
  ]'::jsonb;
  v_module_index INTEGER := 0;
  v_unit_index INTEGER := 0;
  v_video_id TEXT;
  v_base_content TEXT;
BEGIN
  SELECT id INTO v_author FROM public.users ORDER BY CASE WHEN role='admin' THEN 0 ELSE 1 END, created_at LIMIT 1;
  IF v_author IS NULL THEN RAISE EXCEPTION 'Aucun utilisateur existe. Creez d abord un compte StudyLink.'; END IF;

  INSERT INTO public.learning_categories(name,slug,description)
  SELECT 'Informatique','informatique','Programmation, developpement logiciel, systeme et architecture'
  WHERE NOT EXISTS (SELECT 1 FROM public.learning_categories WHERE name='Informatique');
  SELECT id INTO v_cat FROM public.learning_categories WHERE name='Informatique' ORDER BY id LIMIT 1;

  INSERT INTO public.courses(author_id,category_id,title,slug,short_description,description,cover_url,level,language,estimated_minutes,price,is_free,status,content_type,objectives,prerequisites,published_at)
  VALUES(v_author,v_cat,'C++ complet : debutant a professionnel','cpp-complet-debutant-professionnel','Un parcours C++ massif et concret, des bases jusqu au niveau professionnel.','Cours complet de C++ couvrant compilation, syntaxe, memoire, POO, STL, templates, CMake, tests, concurrence, performance, architecture et projet final. Chaque lecon contient une video integree, une explication detaillee, des objets de cours, des cas concrets, des exercices progressifs et un quiz.','https://images.unsplash.com/photo-1515879218367-8466d910aaa4?auto=format&fit=crop&w=1600&q=85','all','cpp',7200,0,true,'published','course',ARRAY['Comprendre C++ depuis zero','Maitriser memoire, RAII, POO, STL et templates','Construire des projets CMake testes et maintenables','Aborder concurrence, performance et architecture professionnelle'],ARRAY['Aucun prerequis C++ obligatoire','Un ordinateur avec compilateur C++ moderne','Pratiquer chaque exercice en compilant le code'],now())
  ON CONFLICT(slug) DO UPDATE SET title=EXCLUDED.title,short_description=EXCLUDED.short_description,description=EXCLUDED.description,cover_url=EXCLUDED.cover_url,level='all',language='cpp',estimated_minutes=EXCLUDED.estimated_minutes,status='published',objectives=EXCLUDED.objectives,prerequisites=EXCLUDED.prerequisites,updated_at=now()
  RETURNING id INTO v_course;

  FOR v_module_data IN SELECT * FROM jsonb_array_elements(v_modules) LOOP
    v_module_index := v_module_index + 1;
    INSERT INTO public.course_modules(course_id,title,description,position)
    VALUES(v_course, v_module_data->>'title', (v_module_data->>'level') || ' - ' || (v_module_data->>'focus'), v_module_index)
    ON CONFLICT(course_id,position) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description
    RETURNING id INTO v_module;

    v_unit_index := 0;
    FOR v_unit IN SELECT * FROM jsonb_array_elements(v_module_data->'units') LOOP
      v_unit_index := v_unit_index + 1;
      v_video_id := (v_module_data->'videos'->>(v_unit_index - 1));
      v_base_content := 'OBJECTIFS' || chr(10) ||
        '- Comprendre la notion: ' || (v_unit->>'concept') || chr(10) ||
        '- Realiser le projet: ' || (v_unit->>'project') || chr(10) ||
        '- Utiliser le vocabulaire technique: ' || (v_unit->>'vocab') || chr(10) || chr(10) ||
        'EXPLICATION DETAILLEE' || chr(10) ||
        'Cette lecon part d un besoin concret de developpement. Vous devez identifier le probleme, choisir les types, raisonner sur la duree de vie des objets, compiler avec des warnings stricts, tester les cas limites et expliquer le compromis technique.' || chr(10) || chr(10) ||
        'OBJETS DU COURS' || chr(10) ||
        'Notion: ' || (v_unit->>'concept') || chr(10) ||
        'Mini-projet: ' || (v_unit->>'project') || chr(10) ||
        'Qualite attendue: code compileable, lisible, teste, robuste et justifie.' || chr(10) || chr(10) ||
        'EXERCICES PROGRESSIFS' || chr(10) ||
        '1. Definir la notion en une phrase.' || chr(10) ||
        '2. Ecrire un exemple minimal qui compile.' || chr(10) ||
        '3. Ajouter deux cas limites.' || chr(10) ||
        '4. Corriger une erreur volontaire.' || chr(10) ||
        '5. Refactorer pour rendre le code plus maintenable.' || chr(10) ||
        '6. Justifier le choix de structure, d API ou d algorithme.' || chr(10) || chr(10) ||
        'QUIZ' || chr(10) ||
        'Question cle: quel risque cette notion evite-t-elle dans un vrai projet C++ ?';

      INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,youtube_url,youtube_video_id,duration_seconds,position,is_preview)
      VALUES(v_module,'C++ - ' || (v_unit->>'title') || ' : video et contexte',lower(regexp_replace('cpp-' || (v_unit->>'title') || '-video','[^a-zA-Z0-9]+','-','g')),'youtube',v_base_content,'https://www.youtube.com/watch?v=' || v_video_id,v_video_id,1800,((v_unit_index - 1) * 4) + 1,v_module_index=1 AND v_unit_index=1)
      ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,youtube_url=EXCLUDED.youtube_url,youtube_video_id=EXCLUDED.youtube_video_id,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview;

      INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview)
      VALUES(v_module,'C++ - ' || (v_unit->>'title') || ' : explication approfondie',lower(regexp_replace('cpp-' || (v_unit->>'title') || '-explication','[^a-zA-Z0-9]+','-','g')),'text',v_base_content,2400,((v_unit_index - 1) * 4) + 2,false)
      ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview;

      INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview)
      VALUES(v_module,'C++ - ' || (v_unit->>'title') || ' : exercices corriges',lower(regexp_replace('cpp-' || (v_unit->>'title') || '-exercices','[^a-zA-Z0-9]+','-','g')),'exercise',v_base_content,3000,((v_unit_index - 1) * 4) + 3,false)
      ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview;

      INSERT INTO public.lessons(module_id,title,slug,lesson_type,content,duration_seconds,position,is_preview)
      VALUES(v_module,'C++ - ' || (v_unit->>'title') || ' : quiz et projet',lower(regexp_replace('cpp-' || (v_unit->>'title') || '-quiz-projet','[^a-zA-Z0-9]+','-','g')),'quiz',v_base_content,1800,((v_unit_index - 1) * 4) + 4,false)
      ON CONFLICT(module_id,position) DO UPDATE SET title=EXCLUDED.title,slug=EXCLUDED.slug,lesson_type=EXCLUDED.lesson_type,content=EXCLUDED.content,duration_seconds=EXCLUDED.duration_seconds,is_preview=EXCLUDED.is_preview;
    END LOOP;
  END LOOP;
END $$;
