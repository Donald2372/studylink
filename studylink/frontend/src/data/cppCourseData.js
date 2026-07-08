export const CPP_COURSE_SLUG = 'cpp-complet-debutant-professionnel';

const resource = (title, url, type = 'Lien') => ({ id: `${title}-${url}`, title, resource_type: type, url });

const cover = 'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?auto=format&fit=crop&w=1600&q=85';

const moduleImages = [
  'https://images.unsplash.com/photo-1555066931-4365d14bab8c?auto=format&fit=crop&w=1200&q=85',
  'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?auto=format&fit=crop&w=1200&q=85',
  'https://images.unsplash.com/photo-1498050108023-c5249f4df085?auto=format&fit=crop&w=1200&q=85',
  'https://images.unsplash.com/photo-1558494949-ef010cbdcc31?auto=format&fit=crop&w=1200&q=85',
  'https://images.unsplash.com/photo-1518770660439-4636190af475?auto=format&fit=crop&w=1200&q=85',
  'https://images.unsplash.com/photo-1504639725590-34d0984388bd?auto=format&fit=crop&w=1200&q=85',
  'https://images.unsplash.com/photo-1551288049-bebda4e38f71?auto=format&fit=crop&w=1200&q=85',
  'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?auto=format&fit=crop&w=1200&q=85',
];

const moduleThemes = [
  { accent: '#2563eb', soft: '#eff6ff', text: '#1d4ed8' },
  { accent: '#16a34a', soft: '#f0fdf4', text: '#166534' },
  { accent: '#dc2626', soft: '#fef2f2', text: '#991b1b' },
  { accent: '#7c3aed', soft: '#f5f3ff', text: '#5b21b6' },
  { accent: '#0891b2', soft: '#ecfeff', text: '#155e75' },
  { accent: '#ea580c', soft: '#fff7ed', text: '#9a3412' },
  { accent: '#0f766e', soft: '#f0fdfa', text: '#115e59' },
  { accent: '#4f46e5', soft: '#eef2ff', text: '#3730a3' },
];

const videoLibrary = [
  { id: 'vLnPwxZdW4Y', title: 'C++ Tutorial for Beginners', channel: 'freeCodeCamp', minutes: 240 },
  { id: '8jLOx1hD3_o', title: 'C++ Programming Course', channel: 'freeCodeCamp', minutes: 180 },
  { id: '18c3MTX0PK0', title: 'Modern C++ Concepts', channel: 'CppCon', minutes: 60 },
  { id: 'YnWhqhNdYyk', title: 'C++ Memory and RAII', channel: 'CppCon', minutes: 55 },
  { id: 'bSkpMdDe4g4', title: 'STL and Algorithms', channel: 'CppCon', minutes: 50 },
  { id: '6pXhQ28FVlU', title: 'Concurrency in C++', channel: 'CppCon', minutes: 60 },
  { id: 'ZQFzMfHIxng', title: 'CMake Tutorial', channel: 'Modern CMake', minutes: 45 },
  { id: '2EWejmkKlxs', title: 'Performance and Profiling', channel: 'CppCon', minutes: 55 },
];

const modules = [
  {
    title: 'Fondations C++ et environnement',
    level: 'Debutant',
    focus: 'syntaxe, compilation, types, entrees/sorties, fonctions et premieres pratiques propres',
    units: [
      {
        title: 'Installer et comprendre la chaine C++',
        concept: 'compilateur, standard C++17/20/23, fichiers .cpp/.hpp, compilation, linking',
        project: 'Compiler un programme console propre avec plusieurs fichiers',
        vocabulary: ['compiler', 'linker', 'source file', 'header', 'standard', 'warning', 'binary', 'namespace'],
        code: '#include <iostream>\n\nint main() {\n    std::cout << "Bonjour C++" << std::endl;\n    return 0;\n}',
      },
      {
        title: 'Variables, types et expressions',
        concept: 'int, double, bool, char, auto, const, conversions, overflow, initialisation uniforme',
        project: 'Construire une calculatrice de conversion temperature/devise',
        vocabulary: ['int', 'double', 'bool', 'auto', 'const', 'overflow', 'cast', 'initialisation'],
        code: 'const double rate = 655.957;\ndouble euros {25.0};\ndouble francs = euros * rate;',
      },
      {
        title: 'Conditions, boucles et fonctions',
        concept: 'if, switch, for, while, fonctions, parametres, valeur de retour, decomposition',
        project: 'Programmer un mini gestionnaire de notes avec moyenne et mention',
        vocabulary: ['if', 'switch', 'loop', 'function', 'parameter', 'return', 'scope', 'validation'],
        code: 'double average(double a, double b, double c) {\n    return (a + b + c) / 3.0;\n}',
      },
    ],
  },
  {
    title: 'Memoire, references et robustesse',
    level: 'Debutant avance',
    focus: 'pile, tas, references, pointeurs, duree de vie, RAII et erreurs frequentes',
    units: [
      {
        title: 'References, pointeurs et duree de vie',
        concept: 'adresse, reference, pointeur, nullptr, ownership, dangling pointer',
        project: 'Analyser et corriger des fonctions qui modifient des donnees',
        vocabulary: ['reference', 'pointer', 'nullptr', 'address', 'lifetime', 'ownership', 'dangling', 'const reference'],
        code: 'void increment(int& value) {\n    ++value;\n}',
      },
      {
        title: 'Tableaux, string et vector',
        concept: 'std::string, std::vector, indices, iterateurs, push_back, range-for',
        project: 'Creer un carnet de contacts en memoire',
        vocabulary: ['std::string', 'std::vector', 'index', 'iterator', 'push_back', 'range-for', 'size', 'bounds'],
        code: 'std::vector<std::string> names;\nnames.push_back("Ada");\nfor (const auto& name : names) {\n    std::cout << name << "\\n";\n}',
      },
      {
        title: 'Gestion automatique des ressources',
        concept: 'RAII, destructeur, unique_ptr, shared_ptr, make_unique, fuite memoire',
        project: 'Remplacer des pointeurs nus par des smart pointers',
        vocabulary: ['RAII', 'destructor', 'unique_ptr', 'shared_ptr', 'make_unique', 'leak', 'resource', 'move'],
        code: 'auto user = std::make_unique<User>("Lina");\nuser->activate();',
      },
    ],
  },
  {
    title: 'Programmation orientee objet',
    level: 'Intermediaire',
    focus: 'classes, encapsulation, constructeurs, heritage, polymorphisme et design propre',
    units: [
      {
        title: 'Classes, objets et invariants',
        concept: 'class, struct, private/public, constructeur, invariant, const method',
        project: 'Modeliser un compte bancaire robuste',
        vocabulary: ['class', 'object', 'constructor', 'invariant', 'private', 'public', 'method', 'encapsulation'],
        code: 'class Account {\npublic:\n    explicit Account(double balance) : balance_{balance} {}\n    void deposit(double amount) { balance_ += amount; }\nprivate:\n    double balance_{};\n};',
      },
      {
        title: 'Heritage et polymorphisme',
        concept: 'virtual, override, interface, base class, dynamic dispatch, destructor virtuel',
        project: 'Creer un systeme de formes dessinables',
        vocabulary: ['virtual', 'override', 'interface', 'base class', 'derived class', 'polymorphism', 'vtable', 'abstract'],
        code: 'struct Shape {\n    virtual ~Shape() = default;\n    virtual double area() const = 0;\n};',
      },
      {
        title: 'Copie, mouvement et Rule of Zero',
        concept: 'copy constructor, move constructor, assignment, Rule of 0/3/5, noexcept',
        project: 'Optimiser une classe qui contient un buffer',
        vocabulary: ['copy', 'move', 'assignment', 'Rule of Zero', 'Rule of Five', 'noexcept', 'resource', 'value semantics'],
        code: 'std::vector<int> make_values() {\n    std::vector<int> values{1, 2, 3};\n    return values;\n}',
      },
    ],
  },
  {
    title: 'STL, algorithmes et structures de donnees',
    level: 'Intermediaire solide',
    focus: 'containers, iterateurs, algorithmes, lambdas, complexite et choix de structure',
    units: [
      {
        title: 'Containers essentiels',
        concept: 'vector, array, deque, list, map, unordered_map, set, stack, queue',
        project: 'Construire un index de mots et frequences',
        vocabulary: ['vector', 'map', 'unordered_map', 'set', 'iterator', 'complexity', 'lookup', 'hash'],
        code: 'std::unordered_map<std::string, int> count;\nfor (const auto& word : words) {\n    ++count[word];\n}',
      },
      {
        title: 'Algorithmes et lambdas',
        concept: 'sort, find_if, transform, accumulate, lambda capture, ranges',
        project: 'Filtrer et trier un catalogue de produits',
        vocabulary: ['sort', 'find_if', 'transform', 'accumulate', 'lambda', 'capture', 'predicate', 'ranges'],
        code: 'std::sort(products.begin(), products.end(), [](const auto& a, const auto& b) {\n    return a.price < b.price;\n});',
      },
      {
        title: 'Complexite et performance algorithmique',
        concept: 'Big O, allocations, cache locality, reserve, choix vector vs map',
        project: 'Comparer deux implementations de recherche',
        vocabulary: ['Big O', 'allocation', 'cache', 'reserve', 'complexity', 'benchmark', 'linear', 'logarithmic'],
        code: 'std::vector<int> values;\nvalues.reserve(10000);',
      },
    ],
  },
  {
    title: 'C++ moderne et templates',
    level: 'Avance',
    focus: 'generiques, templates, concepts, constexpr, optional, variant, exceptions et API modernes',
    units: [
      {
        title: 'Templates et programmation generique',
        concept: 'function template, class template, type deduction, specialization',
        project: 'Ecrire une bibliotheque generique de statistiques',
        vocabulary: ['template', 'typename', 'deduction', 'specialization', 'generic', 'instantiation', 'type', 'constraint'],
        code: 'template <typename T>\nT max_value(T a, T b) {\n    return a < b ? b : a;\n}',
      },
      {
        title: 'Concepts, constexpr et metaprogrammation utile',
        concept: 'concepts C++20, requires, constexpr, consteval, static_assert',
        project: 'Contraindre une API mathematique compile-time safe',
        vocabulary: ['concept', 'requires', 'constexpr', 'consteval', 'static_assert', 'compile-time', 'constraint', 'metaprogramming'],
        code: 'template <typename T>\nconcept Number = std::is_arithmetic_v<T>;\n\ntemplate <Number T>\nT square(T value) { return value * value; }',
      },
      {
        title: 'Types modernes et gestion des erreurs',
        concept: 'std::optional, std::variant, std::expected, exceptions, error_code',
        project: 'Parser un fichier de configuration sans crash',
        vocabulary: ['optional', 'variant', 'expected', 'exception', 'error_code', 'parse', 'state', 'monad'],
        code: 'std::optional<int> parse_int(std::string_view text);\nif (auto value = parse_int(input)) {\n    std::cout << *value;\n}',
      },
    ],
  },
  {
    title: 'Build, tests, fichiers et bibliotheques',
    level: 'Avance pratique',
    focus: 'CMake, organisation projet, tests unitaires, fichiers, dependances et packaging',
    units: [
      {
        title: 'Architecture de projet CMake',
        concept: 'CMakeLists, targets, include directories, compile features, presets',
        project: 'Structurer une application multi-dossiers propre',
        vocabulary: ['CMake', 'target', 'include', 'library', 'executable', 'preset', 'build type', 'install'],
        code: 'add_library(core src/user.cpp)\ntarget_include_directories(core PUBLIC include)\ntarget_compile_features(core PUBLIC cxx_std_20)',
      },
      {
        title: 'Tests, debug et qualite',
        concept: 'unit tests, assertions, sanitizers, warnings, debugger, CI',
        project: 'Tester un module de calcul avec cas limites',
        vocabulary: ['unit test', 'assertion', 'sanitizer', 'warning', 'debugger', 'CI', 'coverage', 'regression'],
        code: 'assert(factorial(5) == 120);\nassert(factorial(0) == 1);',
      },
      {
        title: 'Fichiers, JSON et dependances',
        concept: 'fstream, serialization, parsing, dependency manager, ABI',
        project: 'Charger et sauvegarder une configuration applicative',
        vocabulary: ['fstream', 'serialization', 'JSON', 'dependency', 'ABI', 'package', 'parse', 'filesystem'],
        code: 'std::ifstream file{"config.txt"};\nstd::string line;\nwhile (std::getline(file, line)) {\n    process(line);\n}',
      },
    ],
  },
  {
    title: 'Concurrence, reseau et systeme',
    level: 'Professionnel',
    focus: 'threads, async, mutex, atomics, sockets, system programming et robustesse',
    units: [
      {
        title: 'Threads, mutex et futures',
        concept: 'std::thread, jthread, mutex, lock_guard, future, async, data race',
        project: 'Calculer des taches en parallele sans data race',
        vocabulary: ['thread', 'jthread', 'mutex', 'lock_guard', 'future', 'async', 'data race', 'deadlock'],
        code: 'std::mutex m;\nstd::lock_guard lock{m};\nshared_state.push_back(value);',
      },
      {
        title: 'Atomics et modeles de memoire',
        concept: 'atomic, memory_order, lock-free, visibility, happens-before',
        project: 'Construire un compteur concurrent correct',
        vocabulary: ['atomic', 'memory_order', 'lock-free', 'visibility', 'happens-before', 'synchronization', 'contention', 'cache line'],
        code: 'std::atomic<int> counter{0};\ncounter.fetch_add(1, std::memory_order_relaxed);',
      },
      {
        title: 'I/O systeme et reseau',
        concept: 'sockets, event loop, buffer, binary protocols, timeouts, errors',
        project: 'Ecrire un mini client TCP ou simulateur de protocole',
        vocabulary: ['socket', 'buffer', 'protocol', 'timeout', 'event loop', 'binary', 'latency', 'throughput'],
        code: 'std::vector<std::byte> buffer(4096);\n// lire, verifier, decoder, traiter, repondre',
      },
    ],
  },
  {
    title: 'Performance, architecture et niveau professionnel',
    level: 'Professionnel senior',
    focus: 'profiling, design, API, patterns, securite, maintenabilite et projets reels',
    units: [
      {
        title: 'Profiling et optimisation',
        concept: 'profiling, benchmarking, cache, allocations, move, inlining, vectorization',
        project: 'Optimiser une boucle de traitement de donnees avec mesure',
        vocabulary: ['profiling', 'benchmark', 'cache', 'allocation', 'move', 'inlining', 'vectorization', 'hot path'],
        code: 'auto start = std::chrono::steady_clock::now();\nrun_workload();\nauto end = std::chrono::steady_clock::now();',
      },
      {
        title: 'Design d API et architecture',
        concept: 'modules, boundaries, dependency inversion, pimpl, immutability, contracts',
        project: 'Concevoir une bibliotheque C++ propre et testable',
        vocabulary: ['API', 'boundary', 'dependency', 'pimpl', 'contract', 'immutability', 'module', 'architecture'],
        code: 'class UserRepository {\npublic:\n    virtual ~UserRepository() = default;\n    virtual std::optional<User> find_by_id(UserId id) = 0;\n};',
      },
      {
        title: 'Projet final professionnel',
        concept: 'architecture complete, tests, CLI, fichiers, concurrence, packaging, documentation',
        project: 'Creer une application C++ complete: moteur de taches, CLI, persistence et tests',
        vocabulary: ['final project', 'CLI', 'persistence', 'logging', 'configuration', 'tests', 'release', 'documentation'],
        code: 'int main(int argc, char** argv) {\n    App app = App::from_args(argc, argv);\n    return app.run();\n}',
      },
    ],
  },
];

const lessonKinds = [
  { suffix: 'concepts', type: 'text', title: 'Cours detaille et notions fondamentales', minutes: 35, goal: 'Comprendre les notions, le vocabulaire technique, les erreurs frequentes et les cas d usage.' },
  { suffix: 'code-lab', type: 'exercise', title: 'Atelier code et implementation concrete', minutes: 45, goal: 'Ecrire du C++ propre, tester les cas limites et corriger les erreurs de conception.' },
  { suffix: 'architecture', type: 'text', title: 'Approfondissement architecture et bonnes pratiques', minutes: 35, goal: 'Relier la notion a la maintenabilite, a la performance et a la qualite professionnelle.' },
  { suffix: 'checkpoint', type: 'quiz', title: 'Quiz, debug et mini-projet', minutes: 25, goal: 'Verifier la comprehension, deboguer du code et produire une mini-fonction ou mini-classe.' },
];

const makeVideo = (moduleIndex, unit, index = 0) => {
  const video = videoLibrary[(moduleIndex + index) % videoLibrary.length];
  return {
    id: `cpp-video-${moduleIndex}-${unit.title}-${index}`,
    title: `${unit.title}: ${video.title}`,
    channel: video.channel,
    youtube_video_id: video.id,
    youtube_url: `https://www.youtube.com/watch?v=${video.id}`,
    thumbnail_url: `https://img.youtube.com/vi/${video.id}/hqdefault.jpg`,
    minutes: video.minutes,
    description: `Video integree pour renforcer la notion: ${unit.title}. Regardez, prenez des notes, puis revenez aux exercices.`,
  };
};

function buildContent(module, unit, kind) {
  return `${unit.title}

Niveau: ${module.level}
Objectif de la lecon: ${kind.goal}
Projet concret: ${unit.project}

1. Idee simple avant les mots compliques
Imaginez que votre programme est une petite usine. Les donnees sont les objets qui circulent dans l usine, les fonctions sont les machines, les types sont les etiquettes qui disent ce qu on a le droit de faire avec chaque objet, et le compilateur est le controleur qui refuse les pieces mal fabriquees.

La notion du jour est: ${unit.concept}.

Dit simplement: cette notion explique comment organiser une partie de cette usine pour que le programme fasse exactement ce qu on attend, sans casser, sans perdre de donnees et sans devenir impossible a comprendre.

2. Pourquoi on apprend ca
En C++, l ordinateur vous donne beaucoup de pouvoir. Vous pouvez controler la memoire, choisir des structures rapides, eviter des copies, creer vos propres types et parler presque directement a la machine. Mais ce pouvoir vient avec une responsabilite: si vous dites quelque chose de faux au programme, il peut compiler puis planter plus tard.

Cette lecon vous apprend donc a penser comme ceci:
- Quelles donnees entrent dans le probleme?
- Qui possede ces donnees?
- Combien de temps ces donnees doivent vivre?
- Quel type rend l erreur impossible ou visible?
- Comment verifier que le code marche dans les cas faciles et les cas limites?

3. Notion centrale, expliquee doucement
${unit.concept}

Ne lisez pas cette ligne comme une liste abstraite. Lisez-la comme une boite a outils. Chaque mot designe une question pratique. Par exemple, si la notion parle de reference, demandez-vous: "est-ce que je veux copier la valeur ou seulement regarder/modifier l originale ?" Si elle parle de vector, demandez-vous: "est-ce que j ai une liste qui grandit ?" Si elle parle de thread, demandez-vous: "est-ce que deux parties du programme touchent la meme donnee en meme temps ?"

4. Exemple concret a lire ligne par ligne
${unit.code}

Comment lire ce code:
- Reperez les types: ils disent la forme des donnees.
- Reperez les noms: ils doivent raconter l intention.
- Reperez ce qui est modifie et ce qui ne doit pas l etre.
- Reperez la valeur retour: elle dit ce que la fonction promet de produire.
- Demandez-vous ce qui se passe si l entree est vide, trop grande, invalide ou inattendue.

5. Explication comme a un debutant
Pour ${unit.project}, ne commencez pas par taper du code au hasard. Commencez par raconter le probleme en francais simple. Ensuite transformez chaque morceau du probleme en morceau de programme.

Exemple de raisonnement:
- "J ai besoin de stocker plusieurs elements" peut devenir std::vector.
- "Je ne veux pas modifier cette valeur" peut devenir const.
- "Je veux eviter une copie" peut devenir const reference.
- "Je veux garantir qu une ressource est liberee" peut devenir RAII.
- "Je veux choisir entre plusieurs comportements" peut devenir une fonction, une classe ou du polymorphisme selon le niveau du probleme.

6. Methode professionnelle
La bonne methode est toujours la meme:
1. Lire le besoin.
2. Ecrire un exemple minuscule.
3. Compiler vite.
4. Corriger les warnings.
5. Ajouter un cas limite.
6. Nettoyer le nom des variables et fonctions.
7. Expliquer votre choix a voix haute.

7. Erreurs frequentes
- Copier du code sans comprendre la duree de vie des objets.
- Utiliser des pointeurs nus quand un objet ou un smart pointer suffit.
- Choisir une structure de donnees sans analyser la complexite.
- Confondre code qui compile et code correct.
- Optimiser sans profilage.

8. Tache d application guidee
Construisez une petite fonctionnalite liee au projet: ${unit.project}.

Etapes:
- Ecrivez d abord une version tres simple qui compile.
- Ajoutez un exemple d entree et de sortie.
- Ajoutez un cas limite.
- Expliquez pourquoi vos types sont adaptes.
- Ameliorez le code sans changer son comportement.

A la fin, vous devez pouvoir expliquer la lecon sans reciter: "J ai choisi cette structure parce que..., j ai evite ce risque parce que..., j ai teste ces cas parce que...".`;
}

function buildExercises(module, unit) {
  const words = unit.vocabulary;
  return [
    { id: 'fill', type: 'fill', title: '1. Completer les notions cles', instruction: `Facile. Completez avec les termes: ${words.slice(0, 8).join(', ')}.`, items: [
      { prompt: `En C++, un fichier source est souvent compile par le _____.`, answer: 'compiler' },
      { prompt: `Une ressource doit avoir une duree de vie claire: c est le principe _____.`, answer: words.includes('RAII') ? 'RAII' : 'ownership' },
      { prompt: `Le concept travaille ici: _____.`, answer: unit.concept.split(',')[0] },
      { prompt: 'Une solution professionnelle doit etre lisible, testable et _____.', answer: 'maintenable' },
      { prompt: 'Avant d optimiser, il faut mesurer avec un _____.', answer: 'benchmark' },
    ] },
    { id: 'choice', type: 'choice', title: '2. Choisir la meilleure decision C++', instruction: 'Facile. Choisissez la decision la plus robuste.', items: [
      { prompt: 'Pour eviter une fuite memoire, on prefere...', options: ['RAII et smart pointers', 'new/delete partout', 'ignorer le destructeur'], answer: 'RAII et smart pointers' },
      { prompt: 'Pour parcourir un vector sans copier les objets lourds...', options: ['for (const auto& item : items)', 'for (auto item : items)', 'while(true)'], answer: 'for (const auto& item : items)' },
      { prompt: 'Pour comprendre une lenteur...', options: ['Profiler puis optimiser', 'Optimiser au hasard', 'Changer tout le code'], answer: 'Profiler puis optimiser' },
      { prompt: 'Pour une API claire...', options: ['types explicites, invariants, tests', 'variables globales partout', 'exceptions silencieuses'], answer: 'types explicites, invariants, tests' },
    ] },
    { id: 'vocabulary-use', type: 'vocabulary-use', title: '3. Expliquer le vocabulaire technique', instruction: 'Moyen. Donnez une definition courte et un exemple C++ pour chaque terme.', items: words.slice(0, 8).map((word) => ({ prompt: `Expliquez "${word}" dans le contexte C++.`, model: `"${word}" est utile pour ${unit.concept}. Exemple: reliez-le au projet "${unit.project}".` })) },
    { id: 'grammar-drill', type: 'grammar-drill', title: '4. Lire et commenter le code', instruction: 'Moyen. Analysez ce que fait le code et ce qui pourrait mal tourner.', items: [
      { prompt: `Expliquez ce code:\n${unit.code}`, model: 'Le code illustre la notion centrale. Il faut identifier les types, les donnees modifiees et la duree de vie.' },
      { prompt: 'Quel invariant faut-il proteger?', model: 'Un objet ne doit jamais exister dans un etat impossible ou incoherent.' },
      { prompt: 'Quel cas limite faut-il tester?', model: 'Tester entree vide, taille 0, valeur negative, ressource absente ou erreur de parsing selon le cas.' },
      { prompt: 'Quelle amelioration rendrait le code plus professionnel?', model: 'Ajouter const, separer les responsabilites, tester, nommer clairement et eviter les allocations inutiles.' },
    ] },
    { id: 'transform', type: 'transform', title: '5. Transformer en code plus propre', instruction: 'Moyen. Proposez une version plus claire, plus sure ou plus moderne.', items: [
      { prompt: 'Remplacez une copie inutile par une reference const.', model: 'void print(const std::vector<int>& values);' },
      { prompt: 'Remplacez une gestion manuelle de ressource par RAII.', model: 'auto file = std::ifstream{"data.txt"}; verifier ensuite file.is_open().' },
      { prompt: 'Transformez une boucle manuelle en algorithme STL.', model: 'std::find_if, std::count_if, std::transform ou std::accumulate selon le besoin.' },
      { prompt: 'Rendez une fonction plus testable.', model: 'Extraire la logique pure, passer les dependances en parametre et eviter les variables globales.' },
    ] },
    { id: 'correction', type: 'correction', title: '6. Corriger des erreurs C++ frequentes', instruction: 'Moyen. Corrigez le probleme et expliquez le risque.', items: [
      { prompt: 'int* p = new int{4}; return; // aucune liberation', model: 'Utiliser int value{4}; ou std::unique_ptr<int>. Eviter new/delete manuel.' },
      { prompt: 'for (int i = 0; i <= values.size(); ++i)', model: 'Utiliser i < values.size() ou range-for pour eviter le depassement.' },
      { prompt: 'std::string& getName() { std::string name; return name; }', model: 'Ne jamais retourner une reference vers une variable locale.' },
      { prompt: 'catch (...) {}', model: 'Ne pas avaler les erreurs. Logguer, convertir ou relancer selon le contexte.' },
      { prompt: 'std::thread t(work); // sans join ni detach', model: 'Utiliser std::jthread ou appeler join pour gerer la duree de vie.' },
    ] },
    { id: 'translation', type: 'translation', title: '7. Traduire un besoin en conception C++', instruction: 'Moyen. Transformez le besoin metier en decision technique.', items: [
      { prompt: 'Je dois stocker une liste ordonnee et parcourue souvent.', model: 'std::vector, reserve si la taille est connue, parcours par const reference.' },
      { prompt: 'Je dois associer une cle a une valeur avec recherche rapide.', model: 'std::unordered_map si l ordre n importe pas; std::map si ordre necessaire.' },
      { prompt: 'Je dois representer une valeur optionnelle.', model: 'std::optional<T> au lieu de valeur magique ou pointeur nullable.' },
      { prompt: 'Je dois garantir la liberation d une ressource.', model: 'RAII: objet possedant la ressource, destructeur ou smart pointer.' },
      { prompt: 'Je dois executer une tache en parallele.', model: 'std::async, std::jthread, mutex/atomic selon le partage de donnees.' },
    ] },
    { id: 'scenario', type: 'scenario', title: '8. Cas concrets de developpeur', instruction: 'Difficile. Repondez comme dans une vraie revue de code.', items: [
      { prompt: `Cas: ${unit.project}. Quelle architecture minimale proposez-vous?`, model: 'Separer modele, logique, entrees/sorties, tests. Garder les invariants dans les types.' },
      { prompt: 'Un collegue veut utiliser des variables globales. Que proposez-vous?', model: 'Injecter les dependances, creer une classe de configuration ou passer les donnees explicitement.' },
      { prompt: 'Le code compile mais plante parfois. Quelle demarche?', model: 'Reproduire, activer sanitizers, ajouter tests, inspecter duree de vie, concurrence et limites.' },
    ] },
    { id: 'dialogue-build', type: 'dialogue-build', title: '9. Dialogue de revue de code', instruction: 'Difficile. Redigez un dialogue technique entre developpeur et reviewer.', items: [
      { prompt: 'Le reviewer demande pourquoi vous avez choisi cette structure.', model: 'J ai choisi std::vector car le parcours sequentiel domine et la localite cache est meilleure.' },
      { prompt: 'Le reviewer signale une copie inutile.', model: 'Je vais passer par const reference et mesurer si le type est lourd.' },
      { prompt: 'Le reviewer demande les tests.', model: 'J ai couvert cas nominal, entree vide, limites, erreur et regression.' },
      { prompt: 'Le reviewer demande la gestion d erreur.', model: 'Je retourne optional/expected ou je lance une exception documentee selon le niveau d abstraction.' },
    ] },
    { id: 'listening-note', type: 'listening-note', title: '10. Preparation video et prise de notes', instruction: 'Difficile. Avant la video, preparez ce que vous devez observer.', items: [
      { prompt: 'Listez trois mots cles a reperer.', model: words.slice(0, 3).join(', ') },
      { prompt: 'Notez une question technique a laquelle la video doit repondre.', model: `Comment appliquer ${unit.concept} dans un projet reel?` },
      { prompt: 'Notez un extrait de code que vous voulez comparer.', model: unit.code },
      { prompt: 'Apres visionnage, resumez en une decision C++ concrete.', model: 'Je dois choisir un type ou une structure qui rend les erreurs impossibles ou visibles.' },
    ] },
    { id: 'reflection', type: 'reflection', title: '11. Reflexion professionnelle', instruction: 'Difficile. Justifiez vos choix comme un developpeur professionnel.', items: [
      { prompt: `Pourquoi ${unit.concept} est important en production?`, model: 'Parce que cela influence correction, performance, maintenabilite et debogage.' },
      { prompt: 'Quel bug subtil cette notion evite-t-elle?', model: 'Fuite memoire, reference pendante, data race, copie couteuse, invariant casse ou comportement indefini.' },
      { prompt: 'Quel compromis acceptez-vous?', model: 'Lisibilite vs performance, abstraction vs controle, exception vs code erreur, vector vs map.' },
      { prompt: 'Comment verifier objectivement la qualite?', model: 'Tests, warnings, sanitizers, profiling, revue de code et documentation concise.' },
    ] },
    { id: 'roleplay', type: 'roleplay', title: '12. Simulation entretien technique', instruction: 'Tres difficile. Redigez une reponse orale structuree comme en entretien.', minLength: 180, checklist: ['Definition claire', 'Exemple C++', 'Erreur frequente', 'Cas reel', 'Trade-off'], model: `Je commencerais par definir ${unit.concept}. Ensuite je montrerais un exemple: ${unit.code}. Puis j expliquerais les erreurs frequentes et comment je testerais la solution.` },
    { id: 'production', type: 'production', title: '13. Production de code guidee', instruction: `Tres difficile. Ecrivez une solution pour: ${unit.project}.`, minLength: 220, checklist: ['Types clairs', 'Fonctions courtes', 'Gestion erreur', 'Tests limites', 'Explication'], model: `// Plan\n// 1. definir les types\n// 2. implementer la logique pure\n// 3. ajouter les tests\n// 4. mesurer ou verifier les erreurs\n${unit.code}` },
    { id: 'challenge', type: 'challenge', title: '14. Defi de maitrise', instruction: 'Expert. Construisez une mini-fonction ou mini-classe utilisable et expliquez vos choix.', minLength: 280, checklist: ['API propre', 'RAII/const correctness', 'Tests', 'Complexite', 'Limites connues'], model: `Une bonne solution pour "${unit.project}" expose une API petite, protege ses invariants, documente les erreurs et se teste sans dependances globales.` },
    { id: 'mastery', type: 'mastery', title: '15. Bilan de maitrise', instruction: 'Derniere etape. Dites ce que vous savez vraiment faire maintenant.', items: [
      { prompt: 'Je peux maintenant expliquer...', model: unit.concept },
      { prompt: 'Je peux coder concretement...', model: unit.project },
      { prompt: 'Je dois encore renforcer...', model: 'les cas limites, les tests, la duree de vie ou la performance selon mes erreurs.' },
      { prompt: 'Mon prochain entrainement sera...', model: 'refaire l exercice sans modele, ajouter tests et passer un sanitizer.' },
    ] },
  ];
}

function buildQuiz(unit) {
  return [
    { question: `Quelle notion est centrale dans "${unit.title}"?`, options: [unit.concept, 'HTML et CSS', 'Administration reseau uniquement'], answer: unit.concept, explanation: 'La lecon est construite autour de cette notion C++.' },
    { question: 'Quelle habitude est la plus professionnelle en C++?', options: ['Compiler avec warnings, tester et verifier les durees de vie', 'Ignorer les warnings', 'Optimiser sans mesurer'], answer: 'Compiler avec warnings, tester et verifier les durees de vie', explanation: 'C++ donne beaucoup de controle; il faut donc beaucoup de discipline.' },
    { question: 'Que faut-il preferer pour gerer une ressource?', options: ['RAII', 'new/delete partout', 'variable globale mutable'], answer: 'RAII', explanation: 'RAII rend la liberation automatique et robuste.' },
  ];
}

function makeLessons(module, moduleIndex, unit, unitIndex) {
  return lessonKinds.map((kind, kindIndex) => {
    const id = `cpp-m${moduleIndex + 1}-u${unitIndex + 1}-${kind.suffix}`;
    const theme = moduleThemes[moduleIndex % moduleThemes.length];
    return {
      id,
      title: `${module.level} C++ - ${unit.title}: ${kind.title}`,
      lesson_type: kind.type,
      duration_seconds: kind.minutes * 60,
      content: buildContent(module, unit, kind),
      ui_locale: 'fr',
      image_url: moduleImages[moduleIndex % moduleImages.length],
      theme,
      lesson_objectives: [
        `Comprendre: ${unit.concept}`,
        `Implementer concretement: ${unit.project}`,
        `Utiliser le vocabulaire technique: ${unit.vocabulary.slice(0, 6).join(', ')}`,
        'Ecrire, tester, corriger et justifier une solution C++ propre',
      ],
      learning_objects: [
        { label: 'Notion', value: unit.concept },
        { label: 'Projet', value: unit.project },
        { label: 'Code objet', value: unit.code },
        { label: 'Niveau', value: module.level },
      ],
      detailed_sections: [
        { title: '1. Le probleme raconte simplement', body: `Vous voulez construire ceci: ${unit.project}. Avant de coder, imaginez l utilisateur, les donnees qui arrivent, le resultat attendu et les erreurs possibles. Le C++ sert ici a transformer cette histoire en instructions tres precises.` },
        { title: '2. L image mentale', body: `Pensez a ${unit.concept} comme a une regle de rangement. Si les donnees sont rangees au bon endroit, avec le bon proprietaire et la bonne duree de vie, le programme devient beaucoup plus facile a comprendre.` },
        { title: '3. Le piege du debutant', body: 'Un debutant regarde seulement si le code compile. Un developpeur C++ regarde aussi: qui possede la memoire, qui peut modifier la donnee, combien coute une copie, que se passe-t-il si l entree est vide, et comment le bug sera detecte.' },
        { title: '4. Lecture guidee du code', body: `Point de depart:\n${unit.code}\n\nLisez le code en trois passages: d abord les types, ensuite les noms, enfin les valeurs qui entrent et sortent. Cette methode evite de se noyer dans la syntaxe.` },
        { title: '5. Passage au niveau professionnel', body: 'Une solution professionnelle n est pas seulement une solution qui marche une fois. Elle compile avec warnings stricts, se teste facilement, limite les etats impossibles, documente ses limites et reste lisible pour une autre personne.' },
      ],
      examples: [
        { title: 'Code minimal a observer', text: unit.code },
        { title: 'Cas reel a construire', text: unit.project },
        { title: 'Explication en mots simples', text: `Je dois utiliser ${unit.concept} pour que mon code soit clair, previsible et facile a corriger.` },
        { title: 'Question de comprehension', text: 'Si je change une entree, une taille, une valeur nulle ou une erreur de fichier, est-ce que mon code reste correct ?' },
      ],
      use_cases: [
        { title: 'Application console', text: 'Transformer la notion en fonctionnalite executable.' },
        { title: 'Bibliotheque', text: 'Creer une API reutilisable avec invariants et tests.' },
        { title: 'Production', text: 'Verifier performance, erreurs, logs et maintenance.' },
      ],
      grammar_cards: [
        { title: 'Idee a retenir', formula: unit.concept, example: unit.code, note: 'Ne commencez pas par memoriser la syntaxe. Commencez par comprendre le probleme que cette notion resout.' },
        { title: 'Invariant', formula: 'types + conditions + tests', example: unit.project, note: 'Un invariant est une regle qui doit toujours rester vraie. Plus vos invariants sont clairs, moins les bugs peuvent se cacher.' },
        { title: 'Qualite', formula: 'warnings + tests + RAII + mesure', example: 'Compiler, tester, profiler, refactorer.', note: 'Le niveau professionnel arrive quand vous savez prouver que votre code est correct, pas seulement esperer qu il l est.' },
      ],
      vocabulary_focus: unit.vocabulary.map((word) => ({ word, meaning: `Mot technique a comprendre dans ${unit.title}. Demandez toujours: a quel probleme concret ce mot repond-il ?`, example: `Dans le projet "${unit.project}", le mot "${word}" aide a nommer une decision de code.`, collocation: `${word} en C++ moderne` })),
      dialogues: [
        { title: 'Revue de code', lines: ['Reviewer: Pourquoi ce choix?', `Dev: Parce que ${unit.concept} rend la solution plus robuste.`, 'Reviewer: Quels tests couvrent les limites?', 'Dev: Cas normal, cas vide, erreur et regression.'] },
      ],
      common_mistakes: ['Confondre compilation et correction.', 'Ne pas tester les cas limites.', 'Oublier la duree de vie des objets.', 'Optimiser sans mesure.', 'Utiliser une structure de donnees par habitude.'],
      corrected_exercise: {
        prompt: `Construisez une premiere version pour: ${unit.project}`,
        answer: unit.code,
        correction: 'La correction attend une solution compileable, lisible, avec types clairs, cas limites et justification.',
      },
      oral_practice: {
        prompt: `Expliquez en 90 secondes la notion suivante comme a un debutant: ${unit.concept}.`,
        checklist: ['Image simple', 'Probleme resolu', 'Exemple de code', 'Erreur frequente', 'Test a faire'],
        modelAnswer: `Cette notion aide a realiser "${unit.project}". Je commencerais par expliquer le probleme avec des mots simples, puis je montrerais le code, puis je dirais quel bug cette notion permet d eviter.`,
      },
      resources: [
        resource('cppreference', 'https://en.cppreference.com/w/', 'Reference'),
        resource('C++ Core Guidelines', 'https://isocpp.github.io/CppCoreGuidelines/CppCoreGuidelines', 'Guidelines'),
        resource('Compiler Explorer', 'https://godbolt.org/', 'Outil'),
        resource('CMake Documentation', 'https://cmake.org/documentation/', 'Build'),
      ],
      youtube_videos: [makeVideo(moduleIndex, unit, 0), makeVideo(moduleIndex, unit, 1)],
      interactive_exercises: buildExercises(module, unit),
      vocabulary: unit.vocabulary,
      grammar_focus: unit.concept,
      audio_script: `C++: ${unit.title}. Notion: ${unit.concept}. Projet: ${unit.project}. Exemple: ${unit.code}`,
      quiz: buildQuiz(unit),
      annotations: [`Module: ${module.title}`, `Niveau: ${module.level}`, `Focus: ${module.focus}`, `Projet: ${unit.project}`],
      study_method: ['Lire l image mentale avant la syntaxe.', 'Compiler un exemple minimal.', 'Changer une seule chose et observer le resultat.', 'Ajouter un cas limite.', 'Expliquer le choix technique avec des mots simples.'],
      is_preview: moduleIndex === 0 && unitIndex === 0 && kindIndex === 0,
    };
  });
}

export const cppCourseFallback = {
  course: {
    id: CPP_COURSE_SLUG,
    slug: CPP_COURSE_SLUG,
    title: 'C++ complet : debutant a professionnel',
    short_description: 'Un parcours C++ massif et concret, des bases jusqu au niveau professionnel: syntaxe, memoire, POO, STL, templates, concurrence, CMake, tests, performance et architecture.',
    description: 'Ce cours couvre C++ du premier programme jusqu aux pratiques professionnelles. Chaque notion est reliee a du code concret, a des erreurs frequentes, a des exercices progressifs, a des mini-projets, a des videos integrees, a des ressources de reference et a une demarche de qualite logicielle.',
    category_name: 'Informatique',
    level: 'all',
    language: 'fr',
    estimated_minutes: modules.reduce((sum, module) => sum + module.units.length * lessonKinds.reduce((n, kind) => n + kind.minutes, 0), 0),
    cover_url: cover,
    author_name: 'StudyLink C++ Academy',
    enrollment_count: 3120,
    objectives: [
      'Partir de zero et comprendre la compilation C++',
      'Maitriser types, fonctions, memoire, references, pointeurs et RAII',
      'Construire des classes, APIs, projets CMake et tests unitaires',
      'Utiliser STL, algorithmes, templates et C++ moderne',
      'Comprendre concurrence, performance, profiling et architecture professionnelle',
      'Realiser un projet final complet et maintenable',
    ],
    prerequisites: ['Aucune experience C++ obligatoire', 'Un ordinateur avec compilateur C++ moderne est recommande', 'Curiosite pour la programmation systeme et la performance'],
    is_free: true,
    module_count: modules.length,
    lesson_count: modules.reduce((sum, module) => sum + module.units.length * lessonKinds.length, 0),
  },
  files: [
    resource('cppreference', 'https://en.cppreference.com/w/', 'reference'),
    resource('C++ Core Guidelines', 'https://isocpp.github.io/CppCoreGuidelines/CppCoreGuidelines', 'reference'),
    resource('Compiler Explorer', 'https://godbolt.org/', 'tool'),
    resource('CMake Documentation', 'https://cmake.org/documentation/', 'reference'),
  ].map((item) => ({ ...item, file_name: item.title, file_url: item.url, mime_type: 'text/html' })),
  modules: modules.map((module, moduleIndex) => ({
    id: `cpp-m${moduleIndex + 1}`,
    title: module.title,
    description: `${module.level}. ${module.focus}`,
    position: moduleIndex + 1,
    lessons: module.units.flatMap((unit, unitIndex) => makeLessons(module, moduleIndex, unit, unitIndex)),
  })),
};

export const cppCourseSummary = {
  ...cppCourseFallback.course,
  module_count: cppCourseFallback.modules.length,
  lesson_count: cppCourseFallback.modules.reduce((sum, module) => sum + module.lessons.length, 0),
};

export function isCppCourseId(id) {
  return id === CPP_COURSE_SLUG || id === 'demo-cpp' || id === 'cpp-complet' || id === 'c-plus-plus-complet';
}
