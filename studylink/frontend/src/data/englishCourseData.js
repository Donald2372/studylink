export const ENGLISH_COURSE_SLUG = 'anglais-complet-a1-c1';

const resource = (title, url, type = 'link') => ({ id: `${title}-${url}`, title, resource_type: type, url });

const levelImages = {
  A1: 'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?auto=format&fit=crop&w=1200&q=85',
  A2: 'https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?auto=format&fit=crop&w=1200&q=85',
  B1: 'https://images.unsplash.com/photo-1551836022-d5d88e9218df?auto=format&fit=crop&w=1200&q=85',
  B2: 'https://images.unsplash.com/photo-1552664730-d307ca884978?auto=format&fit=crop&w=1200&q=85',
  C1: 'https://images.unsplash.com/photo-1556761175-b413da4baf72?auto=format&fit=crop&w=1200&q=85',
};

const levelThemes = {
  A1: { accent: '#1769ff', soft: '#eef5ff', text: '#0f3f91' },
  A2: { accent: '#0f9f6e', soft: '#ecfbf5', text: '#08734f' },
  B1: { accent: '#e17800', soft: '#fff6e8', text: '#9a5200' },
  B2: { accent: '#7c4ae6', soft: '#f5efff', text: '#5531a8' },
  C1: { accent: '#d93662', soft: '#fff0f4', text: '#9f2244' },
};

const videoLibrary = {
  A1: [
    { id: 'I_tRSrPru94', title: 'Introductions and beginner English', channel: 'BBC Learning English', minutes: 6 },
    { id: 'I_tRSrPru94', title: 'Verb to be for beginners', channel: 'BBC Learning English', minutes: 6 },
    { id: 'SHXPpsIJTb0', title: 'Asking for directions', channel: 'BBC Learning English', minutes: 6 },
  ],
  A2: [
    { id: 'PgsG98vByiw', title: 'Past simple practice', channel: 'BBC Learning English', minutes: 6 },
    { id: 'bVRIpmjTSxM', title: 'Ordering food in English', channel: 'BBC Learning English', minutes: 6 },
    { id: 'FAhpT7BH7GE', title: 'Comparatives and superlatives', channel: 'BBC Learning English', minutes: 6 },
  ],
  B1: [
    { id: 'jwmKjgwlMk8', title: 'Present perfect', channel: 'BBC Learning English', minutes: 6 },
    { id: 'elPHkXNxi2g', title: 'Talking about future plans', channel: 'BBC Learning English', minutes: 6 },
    { id: 'O-jJPd5ZYo4', title: 'Should, must and advice', channel: 'BBC Learning English', minutes: 6 },
  ],
  B2: [
    { id: 'D58LCh_1jmM', title: 'Debate and opinion phrases', channel: 'BBC Learning English', minutes: 6 },
    { id: '7GSrQ4DX8gY', title: 'Passive voice', channel: 'BBC Learning English', minutes: 6 },
    { id: 'uDoBdq0s8eY', title: 'Conditionals', channel: 'BBC Learning English', minutes: 6 },
  ],
  C1: [
    { id: 'VxQNOXpoLC8', title: 'Hedging and advanced nuance', channel: 'BBC Learning English', minutes: 6 },
    { id: 'LEi8Cs2z0Q4', title: 'Academic writing style', channel: 'BBC Learning English', minutes: 6 },
    { id: 'K-Nps59NeBA', title: 'Persuasive speaking', channel: 'BBC Learning English', minutes: 6 },
  ],
};

const levelData = [
  {
    cefr: 'A1',
    title: 'A1 - Foundations',
    focus: 'survival English, introductions, daily routines and simple questions',
    minutes: 780,
    outcomes: [
      'Introduce yourself and ask simple personal questions',
      'Use be, have, there is and basic present simple',
      'Understand short slow conversations about everyday life',
      'Build a core vocabulary of daily objects, places and actions',
    ],
    units: [
      {
        title: 'Meeting People',
        grammar: 'be, subject pronouns, possessive adjectives',
        vocabulary: ['first name', 'surname', 'country', 'city', 'job', 'student', 'teacher', 'phone number'],
        scenario: 'You meet a new classmate at an international language school.',
        language: ['My name is Lina.', 'I am from Cameroon.', 'Nice to meet you.', 'What do you do?'],
      },
      {
        title: 'Daily Life',
        grammar: 'present simple, adverbs of frequency',
        vocabulary: ['wake up', 'commute', 'breakfast', 'usually', 'sometimes', 'never', 'weekday', 'weekend'],
        scenario: 'You describe your normal day and ask someone about their routine.',
        language: ['I usually start work at nine.', 'She does not drink coffee.', 'Do you study every evening?'],
      },
      {
        title: 'Around Town',
        grammar: 'there is / there are, prepositions of place',
        vocabulary: ['station', 'pharmacy', 'corner', 'opposite', 'next to', 'near', 'left', 'right'],
        scenario: 'You ask for directions and describe places in a city.',
        language: ['There is a bank next to the hotel.', 'Go straight and turn left.', 'Is there a bus stop near here?'],
      },
    ],
  },
  {
    cefr: 'A2',
    title: 'A2 - Everyday Communication',
    focus: 'past events, travel, shopping, food and simple social situations',
    minutes: 900,
    outcomes: [
      'Talk about past experiences with regular and common irregular verbs',
      'Handle travel, restaurant and shopping conversations',
      'Compare people, products and places',
      'Write short messages, invitations and simple descriptions',
    ],
    units: [
      {
        title: 'Past Experiences',
        grammar: 'past simple, regular and irregular verbs',
        vocabulary: ['visited', 'met', 'bought', 'went', 'yesterday', 'last week', 'ago', 'trip'],
        scenario: 'You tell a friend about a weekend trip.',
        language: ['I visited Berlin last month.', 'We did not stay in a hotel.', 'What did you do yesterday?'],
      },
      {
        title: 'Food and Shopping',
        grammar: 'countable and uncountable nouns, some / any, much / many',
        vocabulary: ['receipt', 'discount', 'fresh', 'spicy', 'a bottle of', 'a piece of', 'cheap', 'expensive'],
        scenario: 'You buy food, ask about prices and order in a cafe.',
        language: ['Could I have a glass of water?', 'How much is this jacket?', 'There are not many apples left.'],
      },
      {
        title: 'Comparing Choices',
        grammar: 'comparatives, superlatives, too / enough',
        vocabulary: ['faster', 'more comfortable', 'the cheapest', 'crowded', 'quiet', 'modern', 'safe', 'convenient'],
        scenario: 'You compare apartments, phones and transport options.',
        language: ['This room is bigger than mine.', 'The train is the fastest option.', 'It is not warm enough.'],
      },
    ],
  },
  {
    cefr: 'B1',
    title: 'B1 - Independent English',
    focus: 'opinions, explanations, plans, stories and practical problem solving',
    minutes: 1080,
    outcomes: [
      'Explain opinions with reasons and examples',
      'Use present perfect, future forms and modals for advice',
      'Understand clear speech on work, study, travel and society',
      'Write structured emails, short reports and personal stories',
    ],
    units: [
      {
        title: 'Work and Study',
        grammar: 'present perfect, for / since, already / yet',
        vocabulary: ['deadline', 'assignment', 'colleague', 'experience', 'apply', 'improve', 'skill', 'feedback'],
        scenario: 'You talk about studies, work experience and current goals.',
        language: ['I have worked here for two years.', 'She has not finished the report yet.', 'Have you ever led a team?'],
      },
      {
        title: 'Making Plans',
        grammar: 'will, going to, present continuous for future',
        vocabulary: ['appointment', 'schedule', 'reschedule', 'probably', 'definitely', 'arrangement', 'available', 'plan'],
        scenario: 'You organize a meeting and explain future intentions.',
        language: ['I am meeting the tutor at six.', 'We are going to revise grammar.', 'I will send you the file later.'],
      },
      {
        title: 'Giving Advice',
        grammar: 'should, have to, must, first conditional',
        vocabulary: ['recommend', 'avoid', 'healthy', 'stressful', 'solution', 'choice', 'risk', 'benefit'],
        scenario: 'You give practical advice about learning, health and work.',
        language: ['You should practise speaking every day.', 'If you sleep well, you will concentrate better.', 'You must not share your password.'],
      },
    ],
  },
  {
    cefr: 'B2',
    title: 'B2 - Fluent Communication',
    focus: 'argumentation, nuance, professional communication and complex texts',
    minutes: 1260,
    outcomes: [
      'Take part in discussions with clear arguments and counterarguments',
      'Use passive forms, relative clauses and conditionals accurately',
      'Understand podcasts, articles and presentations on familiar topics',
      'Write essays, proposals and professional emails with cohesion',
    ],
    units: [
      {
        title: 'Debating Ideas',
        grammar: 'linking words, concession, contrast',
        vocabulary: ['however', 'although', 'evidence', 'claim', 'impact', 'concern', 'trade-off', 'perspective'],
        scenario: 'You discuss remote work, technology and education.',
        language: ['Although online learning is flexible, it requires discipline.', 'The main drawback is isolation.', 'From my perspective, the benefits outweigh the risks.'],
      },
      {
        title: 'Professional English',
        grammar: 'passive voice, formal register',
        vocabulary: ['proposal', 'stakeholder', 'timeline', 'deliverable', 'budget', 'approved', 'implemented', 'reviewed'],
        scenario: 'You present a project update in a meeting.',
        language: ['The report was reviewed yesterday.', 'The new process will be implemented next month.', 'Could we clarify the timeline?'],
      },
      {
        title: 'Hypothetical Situations',
        grammar: 'second and third conditionals',
        vocabulary: ['opportunity', 'regret', 'alternative', 'outcome', 'investment', 'decision', 'strategy', 'assumption'],
        scenario: 'You analyze decisions and imagine different outcomes.',
        language: ['If I had more time, I would take an advanced course.', 'If they had invested earlier, they would have grown faster.', 'What would you do in my position?'],
      },
    ],
  },
  {
    cefr: 'C1',
    title: 'C1 - Advanced Mastery',
    focus: 'precision, academic style, idiomatic expression and persuasive speaking',
    minutes: 1380,
    outcomes: [
      'Communicate complex ideas with precision, fluency and nuance',
      'Use advanced clauses, hedging, emphasis and idiomatic language',
      'Understand dense lectures, interviews and opinion articles',
      'Produce polished essays, executive summaries and presentations',
    ],
    units: [
      {
        title: 'Nuance and Precision',
        grammar: 'hedging, emphasis, inversion',
        vocabulary: ['arguably', 'subtle', 'compelling', 'nevertheless', 'scope', 'assumption', 'robust', 'drawback'],
        scenario: 'You present a balanced analysis of an important social issue.',
        language: ['What is particularly striking is the lack of long-term evidence.', 'It is arguably one of the most practical solutions.', 'Rarely have learners had so many options.'],
      },
      {
        title: 'Academic and Professional Writing',
        grammar: 'nominalisation, complex noun phrases, cohesion',
        vocabulary: ['framework', 'methodology', 'findings', 'implications', 'therefore', 'whereas', 'in light of', 'notwithstanding'],
        scenario: 'You summarize research findings for a professional audience.',
        language: ['The implementation of the framework reduced uncertainty.', 'In light of these findings, the team revised its methodology.', 'The proposal is viable, notwithstanding several limitations.'],
      },
      {
        title: 'Persuasive Speaking',
        grammar: 'rhetorical questions, signposting, advanced discourse markers',
        vocabulary: ['persuade', 'resonate', 'audience', 'credibility', 'evidence-based', 'call to action', 'memorable', 'concise'],
        scenario: 'You deliver a five-minute persuasive talk and answer follow-up questions.',
        language: ['Let me begin by addressing the central question.', 'The evidence points in one direction.', 'What should we do next?'],
      },
    ],
  },
];

const lessonKinds = [
  {
    suffix: 'input',
    type: 'audio',
    title: 'Listening and pronunciation lab',
    minutes: 25,
    goal: 'Listen, repeat and notice stress, rhythm and useful chunks.',
  },
  {
    suffix: 'grammar',
    type: 'text',
    title: 'Grammar and usage workshop',
    minutes: 30,
    goal: 'Understand the grammar pattern and use it in controlled examples.',
  },
  {
    suffix: 'practice',
    type: 'exercise',
    title: 'Application exercises',
    minutes: 35,
    goal: 'Apply the vocabulary and grammar in real communicative tasks.',
  },
  {
    suffix: 'quiz',
    type: 'quiz',
    title: 'Quiz and oral checkpoint',
    minutes: 20,
    goal: 'Check comprehension and record a short spoken answer.',
  },
];

function buildContent(level, unit, kind, levelIndex, unitIndex) {
  const sample = unit.language.join('\n- ');
  return `${kind.goal}

Level: ${level.cefr}
Unit focus: ${unit.title}
Real-life situation: ${unit.scenario}

Detailed explanation:
This lesson teaches English as a tool for a real situation, not as isolated grammar. First, observe the model sentences and identify who is speaking, what information is exchanged and which words carry the main meaning. Then connect the grammar to a communicative intention: giving personal information, describing a routine, narrating a past event, presenting an opinion or persuading an audience.

At this level, accuracy and fluency must progress together. Accuracy means choosing the correct structure; fluency means speaking without translating every word. The practical method is simple: notice the pattern, repeat useful chunks aloud, change one element, then create a sentence about your own life. When you can change the sentence while keeping the grammar correct, the language becomes active knowledge.

Key grammar:
${unit.grammar}

Useful language:
- ${sample}

Vocabulary bank:
${unit.vocabulary.map((word) => `- ${word}`).join('\n')}

Annotations:
- Notice word stress and sentence rhythm before trying to speak faster.
- Build answers with complete sentences first, then make them more natural.
- Keep a personal example for each phrase so the language becomes usable.

Application task:
Write six original sentences for your own life, then say them aloud twice: once slowly for accuracy and once naturally for fluency.

Corrected model:
Prompt: introduce the situation in two or three sentences.
Good answer: "${unit.language[0]} ${unit.language[1] || ''} In this situation, I want to be clear, polite and specific. I can ask a follow-up question to keep the conversation natural."
Why it works: the answer uses the target grammar, includes real vocabulary from the unit, and finishes with communication instead of a memorised sentence.

Challenge:
Use at least three vocabulary items from this unit in a short conversation of 60 to 90 seconds.`;
}

function buildDetailedSections(level, unit, kind) {
  if (level.cefr !== 'A1') {
    return [
      {
        title: '1. Understand the real situation',
        body: `The lesson starts from a real communication problem: ${unit.scenario} Before studying the grammar, the learner identifies the speakers, the purpose, the tone and the information that must be exchanged. This turns the lesson into practical communication instead of isolated rules.`,
      },
      {
        title: '2. Observe the model language',
        body: `The model sentences show natural English patterns. Read them, listen to them, then notice which words can change. For example, "${unit.language[0]}" becomes a reusable frame that the learner can adapt to personal situations.`,
      },
      {
        title: '3. Master the form and the function',
        body: `The central language point is: ${unit.grammar}. The goal is not only to memorise a rule, but to understand when to use it, which errors to avoid and how to build a message that is accurate, clear and natural.`,
      },
      {
        title: '4. Produce independently',
        body: `The final step is to speak or write without copying. The learner creates original sentences, uses vocabulary from the unit and checks whether the message is clear. A strong answer is accurate, personal and useful in real life.`,
      },
    ];
  }
  return [
    {
      title: '1. Comprendre la situation',
      body: `La lecon commence par une situation reelle: ${unit.scenario} Avant d apprendre la grammaire, l apprenant doit comprendre le contexte. Qui parle ? Quelle information est demandee ? Quel ton faut-il utiliser ? Cette etape transforme la lecon en communication concrete.`,
    },
    {
      title: '2. Observer le modele',
      body: `Les phrases modele montrent la structure naturelle de l anglais. Il faut les lire, les ecouter, puis reperer les mots qui changent. Exemple: "${unit.language[0]}" devient une matrice que l apprenant peut adapter a sa propre vie.`,
    },
    {
      title: '3. Maitriser la forme',
      body: `Le point central est: ${unit.grammar}. On ne memorise pas seulement une regle: on apprend quand l utiliser, quelle erreur eviter et comment construire une phrase claire. La precision vient d abord, la vitesse vient ensuite.`,
    },
    {
      title: '4. Produire',
      body: `La derniere etape consiste a parler ou ecrire sans copier. L apprenant cree ses phrases, utilise le vocabulaire de l unite, puis verifie si le message est clair. Une bonne reponse doit etre correcte, personnelle et utile dans la vraie vie.`,
    },
  ];
}

function buildQuiz(level, unit) {
  return [
    {
      question: `Which sentence best fits the unit "${unit.title}"?`,
      options: unit.language,
      answer: unit.language[0],
      explanation: `This sentence uses the target language for ${level.cefr}: ${unit.grammar}.`,
    },
    {
      question: 'What should you do when you learn a new phrase?',
      options: ['Memorise it without context', 'Use it in a personal sentence', 'Avoid saying it aloud'],
      answer: 'Use it in a personal sentence',
      explanation: 'Personal examples make vocabulary easier to remember and use in conversation.',
    },
    {
      question: `Which grammar point is practised here?`,
      options: [unit.grammar, 'reported speech only', 'phrasal verbs only'],
      answer: unit.grammar,
      explanation: `The unit is built around ${unit.grammar}.`,
    },
  ];
}

function buildOralPractice(level, unit) {
  return {
    prompt: `Speak for 60 seconds in English. Situation: ${unit.scenario}`,
    checklist: [
      `Use at least four words: ${unit.vocabulary.slice(0, 4).join(', ')}`,
      `Use the grammar point: ${unit.grammar}`,
      'Speak clearly, pause between ideas and finish with one follow-up question',
    ],
    modelAnswer: `${unit.language[0]} ${unit.language[1] || ''} In this situation, I would try to be clear, polite and specific. I would also ask one question to keep the conversation natural.`,
  };
}

function buildLearningObjects(level, unit, kind) {
  return [
    { label: 'Situation', value: unit.scenario },
    { label: 'Grammar object', value: unit.grammar },
    { label: 'Vocabulary object', value: unit.vocabulary.slice(0, 6).join(', ') },
    { label: 'Skill object', value: kind.type === 'audio' ? 'listening, pronunciation and rhythm' : kind.type === 'quiz' ? 'checking understanding and oral recall' : kind.type === 'exercise' ? 'controlled practice and transfer' : 'clear explanation and sentence building' },
    { label: 'CEFR target', value: `${level.cefr} - ${level.focus}` },
  ];
}

function buildLessonObjectives(level, unit, kind) {
  if (level.cefr !== 'A1') {
    return [
      `Understand a ${level.cefr} communication situation: ${unit.scenario}`,
      `Use the target grammar accurately: ${unit.grammar}`,
      `Use at least six useful words: ${unit.vocabulary.slice(0, 6).join(', ')}`,
      kind.type === 'audio' ? 'Reproduce rhythm, pauses, stress and pronunciation from the model' : 'Produce personal sentences without translating word for word',
    ];
  }
  return [
    `Comprendre une situation de communication ${level.cefr}: ${unit.scenario}`,
    `Utiliser correctement: ${unit.grammar}`,
    `Employer au moins six mots utiles: ${unit.vocabulary.slice(0, 6).join(', ')}`,
    kind.type === 'audio' ? 'Reproduire le rythme, les pauses et la prononciation du modele' : 'Produire des phrases personnelles sans traduire mot a mot',
  ];
}

function buildExamples(unit) {
  return [
    { title: 'Model sentence', text: unit.language[0] },
    { title: 'Question form', text: unit.language.find((sentence) => sentence.includes('?')) || `Can you use "${unit.vocabulary[0]}" in your own sentence?` },
    { title: 'Personalised version', text: unit.language[1] || `I use ${unit.vocabulary[0]} when I explain my daily life.` },
  ];
}

function buildVideoRecommendations(level, unit) {
  const videos = videoLibrary[level.cefr] || [];
  return videos.map((video, index) => ({
    id: `yt-${level.cefr}-${unit.title}-${index}`,
    title: `${unit.title}: ${video.title}`,
    channel: video.channel,
    youtube_video_id: video.id,
    youtube_url: `https://www.youtube.com/watch?v=${video.id}`,
    thumbnail_url: `https://img.youtube.com/vi/${video.id}/hqdefault.jpg`,
    minutes: video.minutes,
    description: level.cefr === 'A1' ? `Video integree pour renforcer la lecon: ${unit.title}, niveau ${level.cefr}.` : `Integrated video practice for this lesson: ${unit.title}, level ${level.cefr}.`,
  }));
}

function makeLessons(level, unit, levelIndex, unitIndex) {
  return lessonKinds.map((kind, kindIndex) => {
    const id = `eng-${level.cefr.toLowerCase()}-u${unitIndex + 1}-${kind.suffix}`;
    const base = {
      id,
      title: `${level.cefr} ${unit.title}: ${kind.title}`,
      lesson_type: kind.type,
      duration_seconds: kind.minutes * 60,
      content: buildContent(level, unit, kind, levelIndex, unitIndex),
      resources: [
        resource('Cambridge Dictionary', 'https://dictionary.cambridge.org/'),
        resource('British Council LearnEnglish', 'https://learnenglish.britishcouncil.org/'),
      ],
      annotations: [
        `CEFR ${level.cefr}: focus on ${level.focus}.`,
        `Grammar target: ${unit.grammar}.`,
        `Speaking situation: ${unit.scenario}`,
      ],
      image_url: levelImages[level.cefr],
      theme: levelThemes[level.cefr],
      lesson_objectives: buildLessonObjectives(level, unit, kind),
      detailed_sections: buildDetailedSections(level, unit, kind),
      learning_objects: buildLearningObjects(level, unit, kind),
      examples: buildExamples(unit),
      common_mistakes: [
        `Do not translate word for word from French before speaking.`,
        `Check the verb form connected to: ${unit.grammar}.`,
        `Use short, clear sentences before trying longer answers.`,
      ],
      corrected_exercise: {
        prompt: `Create a short answer for this situation: ${unit.scenario}`,
        answer: `${unit.language[0]} ${unit.language[1] || ''}`,
        correction: `The answer is correct because it uses ${unit.grammar} and vocabulary from the unit. To improve it, add one reason and one follow-up question.`,
      },
      youtube_videos: buildVideoRecommendations(level, unit),
      vocabulary: unit.vocabulary,
      grammar_focus: unit.grammar,
      audio_script: `${unit.language.join(' ')} ${unit.scenario} Please repeat each sentence, then answer with your own example.`,
      oral_practice: buildOralPractice(level, unit),
      quiz: buildQuiz(level, unit),
      is_preview: levelIndex === 0 && unitIndex === 0 && kindIndex === 0,
    };
    return base;
  });
}

export const englishCourseFallback = {
  course: {
    id: ENGLISH_COURSE_SLUG,
    slug: ENGLISH_COURSE_SLUG,
    title: 'Anglais complet A1 a C1',
    short_description: 'Un parcours complet pour apprendre l anglais de A1 a C1 avec grammaire, vocabulaire, quiz, audio, annotations et entrainement oral.',
    description: `Ce parcours StudyLink couvre les niveaux A1, A2, B1, B2 et C1 avec une progression inspiree du CECRL. Chaque niveau combine comprehension orale, grammaire, vocabulaire, exercices d application, quiz, annotations pedagogiques et entrainement oral.

L objectif est de passer d une communication simple a une expression fluide, precise et professionnelle. Les lecons utilisent des situations concretes: se presenter, voyager, etudier, travailler, debattre, presenter un projet et argumenter avec nuance.`,
    category_name: 'Langues',
    level: 'all',
    language: 'en',
    estimated_minutes: levelData.reduce((sum, level) => sum + level.minutes, 0),
    cover_url: 'https://images.unsplash.com/photo-1546410531-bb4caa6b424d?auto=format&fit=crop&w=1600&q=85',
    author_name: 'StudyLink English Academy',
    enrollment_count: 2380,
    objectives: [
      'Atteindre une progression structuree de A1 a C1',
      'Comprendre des dialogues, podcasts, reunions et presentations en anglais',
      'Parler avec plus de fluidite grace aux scripts audio et exercices oraux',
      'Maitriser les points essentiels de grammaire et de vocabulaire par niveau',
      'Valider chaque unite avec des quiz et des taches d application',
      'Produire des emails, descriptions, opinions, essais courts et presentations',
    ],
    prerequisites: ['Aucun prerequis pour commencer au niveau A1', 'Un micro est recommande pour l espace d entrainement oral'],
    is_free: true,
    module_count: levelData.length,
    lesson_count: levelData.reduce((sum, level) => sum + level.units.length * lessonKinds.length, 0),
  },
  files: [
    resource('CEFR self-assessment grid', 'https://www.coe.int/en/web/common-european-framework-reference-languages/table-2-cefr-3.3-common-reference-levels-self-assessment-grid', 'reference'),
    resource('British Council grammar reference', 'https://learnenglish.britishcouncil.org/grammar', 'reference'),
    resource('Cambridge Dictionary pronunciation', 'https://dictionary.cambridge.org/pronunciation/english/', 'reference'),
  ].map((item) => ({ ...item, file_name: item.title, file_url: item.url, mime_type: 'text/html' })),
  modules: levelData.map((level, levelIndex) => ({
    id: `eng-${level.cefr.toLowerCase()}`,
    title: level.title,
    description: `${level.focus}. Outcomes: ${level.outcomes.join(' | ')}`,
    position: levelIndex + 1,
    lessons: level.units.flatMap((unit, unitIndex) => makeLessons(level, unit, levelIndex, unitIndex)),
  })),
};

export const englishCourseSummary = {
  ...englishCourseFallback.course,
  module_count: englishCourseFallback.modules.length,
  lesson_count: englishCourseFallback.modules.reduce((sum, module) => sum + module.lessons.length, 0),
};

export function isEnglishCourseId(id) {
  return id === ENGLISH_COURSE_SLUG || id === 'demo-anglais' || id === 'english-a1-c1';
}
