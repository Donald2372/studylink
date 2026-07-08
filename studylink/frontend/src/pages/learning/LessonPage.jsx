import { useEffect, useMemo, useState } from 'react';
import { Link, useLocation, useNavigate, useParams } from 'react-router-dom';
import { api } from '../../api.js';
import { useAuth } from '../../context/AuthContext.jsx';
import { AppShell, PageHeader, Progress } from '../../components/AppShell.jsx';
import { PYTHON_COURSE_SLUG, pythonCourseFallback, flattenCourseLessons } from '../../data/pythonCourseData.js';
import { englishCourseFallback, isEnglishCourseId } from '../../data/englishCourseData.js';

const englishThemes = {
  A1: { accent: '#1769ff', soft: '#eef5ff', text: '#0f3f91', image: 'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?auto=format&fit=crop&w=1200&q=85' },
  A2: { accent: '#0f9f6e', soft: '#ecfbf5', text: '#08734f', image: 'https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?auto=format&fit=crop&w=1200&q=85' },
  B1: { accent: '#e17800', soft: '#fff6e8', text: '#9a5200', image: 'https://images.unsplash.com/photo-1551836022-d5d88e9218df?auto=format&fit=crop&w=1200&q=85' },
  B2: { accent: '#7c4ae6', soft: '#f5efff', text: '#5531a8', image: 'https://images.unsplash.com/photo-1552664730-d307ca884978?auto=format&fit=crop&w=1200&q=85' },
  C1: { accent: '#d93662', soft: '#fff0f4', text: '#9f2244', image: 'https://images.unsplash.com/photo-1556761175-b413da4baf72?auto=format&fit=crop&w=1200&q=85' },
};

const englishVideoLibrary = {
  A1: [
    { youtube_video_id: 'I_tRSrPru94', title: 'Introductions and beginner English', channel: 'BBC Learning English', minutes: 6 },
    { youtube_video_id: 'SHXPpsIJTb0', title: 'Asking for directions', channel: 'BBC Learning English', minutes: 6 },
    { youtube_video_id: '7GSrQ4DX8gY', title: 'Basic grammar patterns', channel: 'BBC Learning English', minutes: 6 },
  ],
  A2: [
    { youtube_video_id: 'PgsG98vByiw', title: 'Past simple practice', channel: 'BBC Learning English', minutes: 6 },
    { youtube_video_id: 'bVRIpmjTSxM', title: 'Ordering food in English', channel: 'BBC Learning English', minutes: 6 },
    { youtube_video_id: 'FAhpT7BH7GE', title: 'Comparatives and superlatives', channel: 'BBC Learning English', minutes: 6 },
  ],
  B1: [
    { youtube_video_id: 'jwmKjgwlMk8', title: 'Present perfect', channel: 'BBC Learning English', minutes: 6 },
    { youtube_video_id: 'elPHkXNxi2g', title: 'Future plans', channel: 'BBC Learning English', minutes: 6 },
    { youtube_video_id: 'O-jJPd5ZYo4', title: 'Advice with should and must', channel: 'BBC Learning English', minutes: 6 },
  ],
  B2: [
    { youtube_video_id: 'D58LCh_1jmM', title: 'Debate and opinion phrases', channel: 'BBC Learning English', minutes: 6 },
    { youtube_video_id: '7GSrQ4DX8gY', title: 'Passive voice', channel: 'BBC Learning English', minutes: 6 },
    { youtube_video_id: 'uDoBdq0s8eY', title: 'Conditionals', channel: 'BBC Learning English', minutes: 6 },
  ],
  C1: [
    { youtube_video_id: 'VxQNOXpoLC8', title: 'Hedging and advanced nuance', channel: 'BBC Learning English', minutes: 6 },
    { youtube_video_id: 'LEi8Cs2z0Q4', title: 'Academic writing style', channel: 'BBC Learning English', minutes: 6 },
    { youtube_video_id: 'K-Nps59NeBA', title: 'Persuasive speaking', channel: 'BBC Learning English', minutes: 6 },
  ],
};

const extractLine = (content = '', label) => {
  const line = content.split('\n').find((item) => item.trim().toLowerCase().startsWith(label.toLowerCase()));
  return line ? line.replace(new RegExp(`^${label}\\s*:?\\s*`, 'i'), '').trim() : '';
};

const englishResources = [
  { id: 'cambridge-dictionary', title: 'Cambridge Dictionary', resource_type: 'Dictionary', url: 'https://dictionary.cambridge.org/' },
  { id: 'british-council-grammar', title: 'British Council Grammar', resource_type: 'Grammar', url: 'https://learnenglish.britishcouncil.org/grammar' },
  { id: 'british-council-vocabulary', title: 'British Council Vocabulary', resource_type: 'Vocabulary', url: 'https://learnenglish.britishcouncil.org/vocabulary' },
  { id: 'cambridge-pronunciation', title: 'Cambridge Pronunciation', resource_type: 'Pronunciation', url: 'https://dictionary.cambridge.org/pronunciation/english/' },
  { id: 'cefr-grid', title: 'Official CEFR grid', resource_type: 'Reference', url: 'https://www.coe.int/en/web/common-european-framework-reference-languages/table-2-cefr-3.3-common-reference-levels-self-assessment-grid' },
];

const levelSkillProfiles = {
  A1: { target: 'survivre dans une interaction simple', output: '3 a 5 phrases simples', strategy: 'repeter, remplacer un mot, poser une question courte' },
  A2: { target: 'describe everyday situations, order, compare and ask for clarification', output: 'a short six-line dialogue', strategy: 'connect ideas with because, then and after that' },
  B1: { target: 'explain an experience, express an opinion and justify it', output: 'a structured 90-second answer', strategy: 'state the idea, give an example and end with a conclusion' },
  B2: { target: 'defend a point of view and respond to an objection', output: 'an organised argument with a benefit, a limitation and a solution', strategy: 'contrast ideas with however, although and whereas' },
  C1: { target: 'express complex analysis with nuance and precision', output: 'a structured, persuasive spoken response', strategy: 'use hedging, signposting, reformulation and synthesis' },
};

const unitProfiles = [
  { match: /meeting people|introductions/i, context: 'rencontre dans une ecole internationale', roles: ['new student', 'classmate'], samples: ['My name is Lina.', 'I am from Cameroon.', 'I study English twice a week.', 'Nice to meet you.'], cases: [['Premier cours', 'Se presenter et demander le prenom de l autre personne.'], ['Groupe de classe', 'Ecrire un court message de presentation clair.'], ['Entretien simple', 'Dire son nom, son pays, sa ville et son objectif.']] },
  { match: /daily life|routine/i, context: 'description d une journee normale', roles: ['student', 'roommate'], samples: ['I usually wake up at seven.', 'I sometimes study after dinner.', 'She does not drink coffee.', 'Do you work on weekends?'], cases: [['Routine', 'Expliquer son emploi du temps avec usually, sometimes et never.'], ['Organisation', 'Choisir un moment precis pour pratiquer.'], ['Conversation', 'Demander a quelqu un comment il organise sa journee.']] },
  { match: /around town|directions|town/i, context: 'demander son chemin dans une ville', roles: ['visitor', 'local person'], samples: ['Go straight and turn left.', 'The pharmacy is opposite the station.', 'Is there a bus stop near here?', 'It is next to the hotel.'], cases: [['Voyage', 'Demander une direction simple.'], ['Accueil', 'Expliquer ou se trouve un lieu.'], ['Transport', 'Confirmer un arret ou un point de repere.']] },
  { match: /past experiences|weekend|trip/i, context: 'recit d un week-end ou d un voyage', roles: ['friend', 'traveller'], samples: ['I visited Berlin last month.', 'We went by train.', 'I did not stay in a hotel.', 'What did you do yesterday?'], cases: [['Retour de voyage', 'Raconter ou on est alle, ce qu on a fait et ce qu on a aime.'], ['Small talk', 'Repondre naturellement a “How was your weekend?”'], ['Journal', 'Ecrire un court recit au passe avec time markers.']] },
  { match: /food|shopping|order/i, context: 'commande dans un cafe ou achat en magasin', roles: ['customer', 'waiter'], samples: ['Could I have a glass of water?', 'How much is this jacket?', 'Do you have any vegetarian options?', 'There are not many apples left.'], cases: [['Restaurant', 'Commander poliment et verifier une option.'], ['Magasin', 'Comparer deux produits et demander un ticket.'], ['Courses', 'Dire les quantites avec some, any, much et many.']] },
  { match: /comparing|choices|comparatives/i, context: 'comparaison de deux options avant une decision', roles: ['buyer', 'advisor'], samples: ['This room is bigger than mine.', 'The train is the fastest option.', 'It is not warm enough.', 'This phone is too expensive.'], cases: [['Appartement', 'Comparer prix, taille, localisation et confort.'], ['Transport', 'Choisir entre bus, train et voiture avec raisons.'], ['Achat', 'Expliquer pourquoi une option est meilleure ou trop chere.']] },
  { match: /work and study|present perfect|experience/i, context: 'experience de travail, etudes et competences', roles: ['candidate', 'recruiter'], samples: ['I have worked here for two years.', 'She has not finished the report yet.', 'Have you ever led a team?', 'I have already sent the file.'], cases: [['CV oral', 'Presenter son experience sans lister seulement des dates.'], ['Projet', 'Dire ce qui est deja fait et ce qui ne l est pas encore.'], ['Entretien', 'Repondre a “Have you ever...?” avec resultat.']] },
  { match: /making plans|future/i, context: 'organisation d un rendez-vous ou plan futur', roles: ['colleague', 'tutor'], samples: ['I am meeting the tutor at six.', 'We are going to revise grammar.', 'I will send you the file later.', 'Are you available tomorrow?'], cases: [['Planning', 'Fixer une heure, confirmer et proposer une alternative.'], ['Projet', 'Distinguer intention, arrangement et decision spontanee.'], ['Message', 'Ecrire une confirmation professionnelle.']] },
  { match: /giving advice|advice|should|must/i, context: 'conseil pratique pour resoudre un probleme', roles: ['mentor', 'learner'], samples: ['You should practise speaking every day.', 'You must not share your password.', 'If you sleep well, you will concentrate better.', 'You have to prepare before the meeting.'], cases: [['Apprentissage', 'Donner un conseil realiste et expliquer pourquoi.'], ['Securite', 'Exprimer obligation, interdiction et risque.'], ['Coaching', 'Transformer un probleme en plan d action.']] },
  { match: /debating|ideas|debate/i, context: 'discussion argumentee sur education, travail ou technologie', roles: ['speaker', 'opponent'], samples: ['Although online learning is flexible, it requires discipline.', 'The main drawback is isolation.', 'From my perspective, the benefits outweigh the risks.', 'However, the evidence is mixed.'], cases: [['Debat', 'Defendre un point de vue avec avantage et limite.'], ['Reunion', 'Nuancer une opinion sans paraitre agressif.'], ['Essai', 'Construire un paragraphe argumentatif coherent.']] },
  { match: /professional english|passive|project/i, context: 'mise a jour professionnelle en reunion', roles: ['project manager', 'stakeholder'], samples: ['The report was reviewed yesterday.', 'The process will be implemented next month.', 'Could we clarify the timeline?', 'The budget has been approved.'], cases: [['Reunion', 'Presenter un avancement sans accuser une personne.'], ['Email pro', 'Utiliser le passif pour un style formel.'], ['Projet', 'Clarifier timeline, budget, livrables et decisions.']] },
  { match: /hypothetical|conditional/i, context: 'analyse d une decision et de scenarios alternatifs', roles: ['advisor', 'founder'], samples: ['If I had more time, I would take an advanced course.', 'If they had invested earlier, they would have grown faster.', 'What would you do in my position?', 'I would choose the safer option.'], cases: [['Decision', 'Imaginer une consequence avant de choisir.'], ['Business', 'Analyser ce qui aurait pu se passer autrement.'], ['Conseil', 'Proposer une option sans imposer.']] },
  { match: /nuance|precision|hedging/i, context: 'analyse nuancee d un sujet complexe', roles: ['analyst', 'consultant'], samples: ['It is arguably one of the most practical solutions.', 'What is particularly striking is the lack of evidence.', 'Rarely have learners had so many options.', 'The outcome is somewhat uncertain.'], cases: [['Presentation', 'Dire une idee forte sans sur-generaliser.'], ['Article', 'Employer hedging pour rester credible.'], ['Discussion', 'Montrer une position nuancee et defendable.']] },
  { match: /academic|writing|methodology/i, context: 'resume de resultats ou rapport academique', roles: ['researcher', 'reviewer'], samples: ['The implementation of the framework reduced uncertainty.', 'In light of these findings, the team revised its methodology.', 'The proposal is viable, notwithstanding several limitations.', 'The findings suggest a broader implication.'], cases: [['Rapport', 'Transformer une idee orale en formulation academique.'], ['Synthese', 'Relier resultats, limites et implication.'], ['Memoire', 'Utiliser nominalisation et cohesion.']] },
  { match: /persuasive|speaking/i, context: 'discours persuasif de cinq minutes', roles: ['presenter', 'audience'], samples: ['Let me begin by addressing the central question.', 'The evidence points in one direction.', 'What should we do next?', 'This is why action matters now.'], cases: [['Pitch', 'Convaincre avec probleme, preuve et appel a l action.'], ['Oral C1', 'Structurer une reponse longue et fluide.'], ['Leadership', 'Faire resonner une idee avec un public.']] },
];

const defaultUnitProfile = { context: 'situation de communication concrete', roles: ['speaker', 'listener'], samples: ['I can explain my idea clearly.', 'Could you repeat that, please?', 'Let me give you an example.', 'What do you think?'], cases: [['Conversation', 'Repondre clairement avec une phrase complete.'], ['Message', 'Ecrire une idee simple et utile.'], ['Oral', 'Parler pendant une minute avec exemple et question.']] };
const englishUnitProfiles = [
  { match: /meeting people|introductions/i, context: 'meeting someone at an international school', roles: ['new student', 'classmate'], samples: ['My name is Lina.', 'I am from Cameroon.', 'I study English twice a week.', 'Nice to meet you.'], cases: [['First class', 'Introduce yourself and ask for the other person s first name.'], ['Class group', 'Write a short, clear introduction message.'], ['Simple interview', 'Say your name, country, city and learning goal.']] },
  { match: /daily life|routine/i, context: 'describing a normal day', roles: ['student', 'roommate'], samples: ['I usually wake up at seven.', 'I sometimes study after dinner.', 'She does not drink coffee.', 'Do you work on weekends?'], cases: [['Routine', 'Explain your schedule with usually, sometimes and never.'], ['Organisation', 'Choose a precise time to practise.'], ['Conversation', 'Ask someone how they organise their day.']] },
  { match: /around town|directions|town/i, context: 'asking for directions in a city', roles: ['visitor', 'local person'], samples: ['Go straight and turn left.', 'The pharmacy is opposite the station.', 'Is there a bus stop near here?', 'It is next to the hotel.'], cases: [['Travel', 'Ask for simple directions.'], ['Helping a visitor', 'Explain where a place is.'], ['Transport', 'Confirm a stop or landmark.']] },
  { match: /past experiences|weekend|trip/i, context: 'telling a friend about a weekend or trip', roles: ['friend', 'traveller'], samples: ['I visited Berlin last month.', 'We went by train.', 'I did not stay in a hotel.', 'What did you do yesterday?'], cases: [['Trip story', 'Explain where you went, what you did and what you enjoyed.'], ['Small talk', 'Answer naturally when someone asks: How was your weekend?'], ['Journal entry', 'Write a short past-tense story with time markers.']] },
  { match: /food|shopping|order/i, context: 'ordering in a cafe or shopping in a store', roles: ['customer', 'waiter'], samples: ['Could I have a glass of water?', 'How much is this jacket?', 'Do you have any vegetarian options?', 'There are not many apples left.'], cases: [['Restaurant', 'Order politely and check an option.'], ['Store', 'Compare two products and ask for a receipt.'], ['Groceries', 'Use some, any, much and many for quantities.']] },
  { match: /comparing|choices|comparatives/i, context: 'comparing two options before making a decision', roles: ['buyer', 'advisor'], samples: ['This room is bigger than mine.', 'The train is the fastest option.', 'It is not warm enough.', 'This phone is too expensive.'], cases: [['Apartment', 'Compare price, size, location and comfort.'], ['Transport', 'Choose between bus, train and car with reasons.'], ['Purchase', 'Explain why one option is better or too expensive.']] },
  { match: /work and study|present perfect|experience/i, context: 'talking about work, studies and skills', roles: ['candidate', 'recruiter'], samples: ['I have worked here for two years.', 'She has not finished the report yet.', 'Have you ever led a team?', 'I have already sent the file.'], cases: [['Oral CV', 'Present your experience without only listing dates.'], ['Project update', 'Say what is already done and what is not finished yet.'], ['Interview', 'Answer a Have you ever question with a result.']] },
  { match: /making plans|future/i, context: 'organising an appointment or future plan', roles: ['colleague', 'tutor'], samples: ['I am meeting the tutor at six.', 'We are going to revise grammar.', 'I will send you the file later.', 'Are you available tomorrow?'], cases: [['Planning', 'Set a time, confirm it and suggest an alternative.'], ['Project', 'Distinguish intention, arrangement and spontaneous decision.'], ['Message', 'Write a professional confirmation.']] },
  { match: /giving advice|advice|should|must/i, context: 'giving practical advice to solve a problem', roles: ['mentor', 'learner'], samples: ['You should practise speaking every day.', 'You must not share your password.', 'If you sleep well, you will concentrate better.', 'You have to prepare before the meeting.'], cases: [['Learning', 'Give realistic advice and explain why.'], ['Safety', 'Express obligation, prohibition and risk.'], ['Coaching', 'Turn a problem into an action plan.']] },
  { match: /debating|ideas|debate/i, context: 'discussing education, work or technology with arguments', roles: ['speaker', 'opponent'], samples: ['Although online learning is flexible, it requires discipline.', 'The main drawback is isolation.', 'From my perspective, the benefits outweigh the risks.', 'However, the evidence is mixed.'], cases: [['Debate', 'Defend a point of view with a benefit and a limitation.'], ['Meeting', 'Express a nuanced opinion without sounding aggressive.'], ['Essay', 'Build a coherent argumentative paragraph.']] },
  { match: /professional english|passive|project/i, context: 'giving a professional project update in a meeting', roles: ['project manager', 'stakeholder'], samples: ['The report was reviewed yesterday.', 'The process will be implemented next month.', 'Could we clarify the timeline?', 'The budget has been approved.'], cases: [['Meeting', 'Present progress without blaming a person.'], ['Professional email', 'Use the passive voice for a formal style.'], ['Project', 'Clarify timeline, budget, deliverables and decisions.']] },
  { match: /hypothetical|conditional/i, context: 'analysing a decision and alternative scenarios', roles: ['advisor', 'founder'], samples: ['If I had more time, I would take an advanced course.', 'If they had invested earlier, they would have grown faster.', 'What would you do in my position?', 'I would choose the safer option.'], cases: [['Decision', 'Imagine a consequence before choosing.'], ['Business', 'Analyse what could have happened differently.'], ['Advice', 'Suggest an option without imposing it.']] },
  { match: /nuance|precision|hedging/i, context: 'analysing a complex topic with nuance', roles: ['analyst', 'consultant'], samples: ['It is arguably one of the most practical solutions.', 'What is particularly striking is the lack of evidence.', 'Rarely have learners had so many options.', 'The outcome is somewhat uncertain.'], cases: [['Presentation', 'Make a strong point without overgeneralising.'], ['Article', 'Use hedging to stay credible.'], ['Discussion', 'Show a nuanced, defensible position.']] },
  { match: /academic|writing|methodology/i, context: 'summarising findings or writing an academic report', roles: ['researcher', 'reviewer'], samples: ['The implementation of the framework reduced uncertainty.', 'In light of these findings, the team revised its methodology.', 'The proposal is viable, notwithstanding several limitations.', 'The findings suggest a broader implication.'], cases: [['Report', 'Turn an oral idea into academic wording.'], ['Synthesis', 'Connect findings, limitations and implications.'], ['Dissertation', 'Use nominalisation and cohesion.']] },
  { match: /persuasive|speaking/i, context: 'delivering a five-minute persuasive talk', roles: ['presenter', 'audience'], samples: ['Let me begin by addressing the central question.', 'The evidence points in one direction.', 'What should we do next?', 'This is why action matters now.'], cases: [['Pitch', 'Persuade with a problem, evidence and a call to action.'], ['C1 speaking', 'Structure a long, fluent answer.'], ['Leadership', 'Make an idea resonate with an audience.']] },
];
const englishDefaultUnitProfile = { context: 'a concrete communication situation', roles: ['speaker', 'listener'], samples: ['I can explain my idea clearly.', 'Could you repeat that, please?', 'Let me give you an example.', 'What do you think?'], cases: [['Conversation', 'Answer clearly with a complete sentence.'], ['Message', 'Write a simple, useful idea.'], ['Speaking', 'Speak for one minute with an example and a question.']] };
const getUnitProfile = (cleanTitle, fullEnglish = false) => (fullEnglish ? englishUnitProfiles : unitProfiles).find((profile) => profile.match.test(cleanTitle)) || (fullEnglish ? englishDefaultUnitProfile : defaultUnitProfile);
const getLevelProfile = (level) => levelSkillProfiles[level] || levelSkillProfiles.A1;

function buildInteractiveExercises({ level, cleanTitle, situation, grammar, vocabulary }) {
  const fullEnglish = level !== 'A1';
  const unit = getUnitProfile(cleanTitle, fullEnglish);
  const skill = getLevelProfile(level);
  const words = vocabulary.length ? vocabulary : ['communication', 'question', 'answer', 'context'];
  const usefulWords = [...words, 'question', 'answer', 'example', 'reason', 'context', 'detail'].filter(Boolean);
  const targetOutput = skill.output;
  if (fullEnglish) return [
    {
      id: 'fill',
      type: 'fill',
      title: '1. Complete the key sentences',
      instruction: `Easy level. Complete the sentences with lesson vocabulary: ${usefulWords.slice(0, 8).join(', ')}.`,
      items: [
        { prompt: unit.samples[0].replace(words[0] || 'English', '_____'), answer: words[0] || 'English' },
        { prompt: `In this situation, I speak with a ${unit.roles[1]} and ask one clear _____.`, answer: 'question' },
        { prompt: `For ${unit.context}, I should use _____ language.`, answer: level === 'C1' ? 'precise' : 'clear' },
        { prompt: 'A good answer includes one reason and one _____.', answer: 'example' },
        { prompt: 'Before speaking, I identify the role, the goal and the _____.', answer: 'context' },
      ],
    },
    {
      id: 'choice',
      type: 'choice',
      title: '2. Choose the most natural sentence',
      instruction: `Easy level. Choose the sentence that best fits the situation: ${situation}`,
      items: [
        { prompt: 'Natural sentence', options: [unit.samples[0], `I clear ${cleanTitle} explain.`, `${cleanTitle} me speak good.`], answer: unit.samples[0] },
        { prompt: `${level} strategy`, options: [skill.strategy, 'Translate every word before speaking', 'Speak quickly without structure'], answer: skill.strategy },
        { prompt: 'Answer with follow-up', options: [unit.samples.find((sample) => sample.includes('?')) || unit.samples[3], 'Yes good.', 'I am English lesson.'], answer: unit.samples.find((sample) => sample.includes('?')) || unit.samples[3] },
        { prompt: 'Best communication habit', options: ['Give a sentence, an example and a question', 'Recite a word list without context', 'Avoid speaking to avoid mistakes'], answer: 'Give a sentence, an example and a question' },
      ],
    },
    {
      id: 'vocabulary-use',
      type: 'vocabulary-use',
      title: '3. Use vocabulary in context',
      instruction: 'Easy to medium level. Write one useful sentence with each word, connected to the lesson situation.',
      items: usefulWords.slice(0, 8).map((word) => ({
        prompt: `Use "${word}" in a concrete English sentence.`,
        model: `I can use "${word}" when I speak about ${unit.context}.`,
      })),
    },
    {
      id: 'grammar-drill',
      type: 'grammar-drill',
      title: '4. Automate the grammar',
      instruction: `Medium level. Produce different sentences with the structure: ${grammar}.`,
      items: [
        { prompt: `Write an affirmative sentence with ${unit.roles[0]}.`, model: unit.samples[0] },
        { prompt: `Write a negative or limiting sentence in this context: ${unit.context}.`, model: 'This option does not fully solve the problem.' },
        { prompt: 'Write a direct question to continue the conversation.', model: unit.samples.find((sample) => sample.includes('?')) || 'Could you give me an example?' },
        { prompt: 'Write a sentence with a reason.', model: `${unit.samples[2]} because it helps me communicate clearly.` },
        { prompt: 'Write a sentence with a time, place or frequency detail.', model: 'In this context, the decision should be reviewed before Friday.' },
      ],
    },
    {
      id: 'transform',
      type: 'transform',
      title: '5. Transform without copying',
      instruction: 'Medium level. Rewrite each model so it speaks about your own life or your own situation.',
      items: [
        { prompt: `Model: ${unit.samples[0]}`, model: `${unit.samples[0]} For me, this is useful because I want to ${skill.target}.` },
        { prompt: `Model: ${unit.samples[1]}`, model: `I can adapt this sentence when I speak with a ${unit.roles[1]}.` },
        { prompt: `Model: ${unit.samples[2]}`, model: 'Personally, I would adapt this sentence with a concrete example from my life.' },
        { prompt: `Model: ${unit.samples[3]}`, model: 'I would finish with a natural follow-up question to keep the exchange alive.' },
      ],
    },
    {
      id: 'correction',
      type: 'correction',
      title: '6. Correct common mistakes',
      instruction: 'Medium level. Correct the sentences. Focus on word order, verb form, tense and register.',
      items: [
        { prompt: `I ${cleanTitle} very good explain.`, model: `I can explain ${cleanTitle.toLowerCase()} clearly.` },
        { prompt: 'She not use the grammar correctly.', model: 'She does not use the grammar correctly.' },
        { prompt: 'Can you to repeat the question?', model: 'Can you repeat the question?' },
        { prompt: 'I am agree because this idea is good.', model: 'I agree because this idea is good.' },
        { prompt: 'Yesterday I go in the city.', model: 'Yesterday I went to the city.' },
      ],
    },
    {
      id: 'translation',
      type: 'translation',
      title: '7. Express the idea naturally',
      instruction: 'Medium level. Do not translate word for word. Write natural English that expresses the same idea clearly.',
      items: [
        { prompt: 'I need to speak clearly in this situation.', model: 'I need to speak clearly in this situation.' },
        { prompt: 'Could you give me an example?', model: 'Could you give me an example?' },
        { prompt: 'In my opinion, this option is more useful.', model: 'In my opinion, this option is more useful.' },
        { prompt: 'I would like to explain my idea with a reason.', model: 'I would like to explain my idea with a reason.' },
        { prompt: 'The important point is to answer naturally.', model: 'The important point is to answer naturally.' },
      ],
    },
    {
      id: 'scenario',
      type: 'scenario',
      title: '8. Respond to real cases',
      instruction: 'Medium to difficult level. For each case, write what you would really say in English.',
      items: unit.cases.map(([title, text]) => ({
        prompt: `${title}: ${text}`,
        model: `In this case, I would say: "${unit.samples[0]}" Then I would add one reason and ask a follow-up question.`,
      })),
    },
    {
      id: 'dialogue-build',
      type: 'dialogue-build',
      title: '9. Build a complete dialogue',
      instruction: 'Difficult level. Complete each part of the dialogue with a natural sentence.',
      items: [
        { prompt: `${unit.roles[0]} opens the conversation.`, model: `A: ${unit.samples[0]}` },
        { prompt: `${unit.roles[1]} answers and adds a detail.`, model: `B: ${unit.samples[1]}` },
        { prompt: `${unit.roles[0]} explains a reason.`, model: `A: ${unit.samples[2]} because it is important for me.` },
        { prompt: `${unit.roles[1]} asks a follow-up question.`, model: `B: ${unit.samples.find((sample) => sample.includes('?')) || unit.samples[3]}` },
      ],
    },
    {
      id: 'listening-note',
      type: 'listening-note',
      title: '10. Listening preparation and note-taking',
      instruction: 'Difficult level. Before watching the video or listening to the audio, prepare what you need to notice.',
      items: [
        { prompt: 'Write three words you want to hear in the video.', model: usefulWords.slice(0, 3).join(', ') },
        { prompt: 'Write one question the speaker might ask.', model: unit.samples.find((sample) => sample.includes('?')) || 'Could you explain that?' },
        { prompt: 'Write one useful expression you can reuse when speaking.', model: unit.samples[0] },
        { prompt: 'After listening, summarise the message in one English sentence.', model: `The speaker explains how to handle ${unit.context}.` },
      ],
    },
    {
      id: 'reflection',
      type: 'reflection',
      title: '11. Language reflection',
      instruction: 'Difficult level. Explain why the language works this way. This builds real mastery.',
      items: [
        { prompt: `Why is the grammar "${grammar}" useful here?`, model: `It helps me ${skill.target} with a clear structure.` },
        { prompt: 'Which mistake could you easily make, and how will you avoid it?', model: 'I might translate word for word, so I should reuse an English pattern.' },
        { prompt: 'Which sentence can you memorise as a complete chunk?', model: unit.samples[0] },
        { prompt: `How should this language be adapted at ${level} level?`, model: `I should produce ${targetOutput} and use this strategy: ${skill.strategy}.` },
      ],
    },
    {
      id: 'roleplay',
      type: 'roleplay',
      title: '12. Speaking role-play',
      instruction: `Difficult level. Play ${unit.roles[0]} speaking to ${unit.roles[1]}. Write your script before saying it aloud.`,
      minLength: 80,
      checklist: [`Role A: ${unit.roles[0]}`, `Role B: ${unit.roles[1]}`, `Context: ${unit.context}`, `Goal: ${skill.target}`, 'One follow-up question'],
      model: `A: ${unit.samples[0]}\nB: ${unit.samples[1]}\nA: ${unit.samples[2]} because I want to ${skill.target}.\nB: ${unit.samples[3]}`,
    },
    {
      id: 'production',
      type: 'production',
      title: '13. Guided production',
      instruction: `Difficult level. Write a structured mini-dialogue for this situation: ${situation}`,
      minLength: 100,
      checklist: [`Use: ${grammar}`, `Use at least 6 words: ${usefulWords.slice(0, 6).join(', ')}`, 'Add one reason', 'Finish with a natural question'],
      model: `A (${unit.roles[0]}): ${unit.samples[0]}\nB (${unit.roles[1]}): ${unit.samples[1]}\nA: ${unit.samples[2]} because it helps me communicate better.\nB: ${unit.samples[3]}`,
    },
    {
      id: 'challenge',
      type: 'challenge',
      title: '14. Mastery challenge',
      instruction: `Very difficult level. Produce ${targetOutput}. Prove that you can use the lesson without copying the model.`,
      minLength: level === 'A2' ? 120 : 180,
      checklist: ['Clear introduction', 'Target grammar', 'Varied vocabulary', 'Concrete example', 'Final self-correction'],
      model: `I will speak about ${unit.context}. First, I will introduce the situation. Then I will use the target grammar: ${grammar}. I will add examples, explain my reason and finish with a useful question.`,
    },
    {
      id: 'mastery',
      type: 'mastery',
      title: '15. Personal mastery check',
      instruction: 'Final step. Answer precisely: what have you truly mastered, and what do you still need to review?',
      items: [
        { prompt: 'I can now use this lesson to...', model: `I can use this lesson to ${skill.target}.` },
        { prompt: 'My strongest English sentence is...', model: unit.samples[0] },
        { prompt: 'My current weak point is...', model: `I still need to practise ${grammar}.` },
        { prompt: 'My next speaking practice will be...', model: `I will record myself for one minute about ${unit.context}.` },
      ],
    },
  ];
  return [
    {
      id: 'fill',
      type: 'fill',
      title: '1. Completer les phrases cles',
      instruction: `Niveau facile. Completez avec le vocabulaire de la lecon: ${usefulWords.slice(0, 8).join(', ')}.`,
      items: [
        { prompt: unit.samples[0].replace(words[0] || 'English', '_____'), answer: words[0] || 'English' },
        { prompt: `In this situation, I speak with a ${unit.roles[1]} and ask one clear _____.`, answer: 'question' },
        { prompt: `For ${unit.context}, I should use _____ language.`, answer: level === 'C1' ? 'precise' : 'clear' },
        { prompt: `A good answer includes one reason and one _____.`, answer: 'example' },
        { prompt: `Before speaking, I identify the role, the goal and the _____.`, answer: 'context' },
      ],
    },
    {
      id: 'choice',
      type: 'choice',
      title: '2. Choisir la phrase la plus naturelle',
      instruction: `Niveau facile. Choisissez la phrase qui correspond le mieux a la situation: ${situation}`,
      items: [
        { prompt: 'Phrase naturelle', options: [unit.samples[0], `I clear ${cleanTitle} explain.`, `${cleanTitle} me speak good.`], answer: unit.samples[0] },
        { prompt: `Strategie ${level}`, options: [skill.strategy, 'Traduire chaque mot avant de parler', 'Parler vite sans structure'], answer: skill.strategy },
        { prompt: 'Reponse avec relance', options: [unit.samples.find((sample) => sample.includes('?')) || unit.samples[3], 'Yes good.', 'I am English lesson.'], answer: unit.samples.find((sample) => sample.includes('?')) || unit.samples[3] },
        { prompt: 'Meilleure attitude communicative', options: ['Donner une phrase, un exemple et une question', 'Reciter une liste de mots sans contexte', 'Eviter de parler pour ne pas faire d erreur'], answer: 'Donner une phrase, un exemple et une question' },
      ],
    },
    {
      id: 'vocabulary-use',
      type: 'vocabulary-use',
      title: '3. Employer le vocabulaire en contexte',
      instruction: 'Niveau facile vers moyen. Ecrivez une phrase utile avec chaque mot, liee a la situation de la lecon.',
      items: usefulWords.slice(0, 8).map((word) => ({
        prompt: `Utilisez "${word}" dans une phrase anglaise concrete.`,
        model: `I can use "${word}" when I speak about ${unit.context}.`,
      })),
    },
    {
      id: 'grammar-drill',
      type: 'grammar-drill',
      title: '4. Automatiser la grammaire',
      instruction: `Niveau moyen. Produisez des phrases differentes avec la structure: ${grammar}.`,
      items: [
        { prompt: `Phrase affirmative avec ${unit.roles[0]}.`, model: unit.samples[0] },
        { prompt: `Phrase negative ou limite dans le contexte: ${unit.context}.`, model: level === 'A1' ? 'I am not from this city.' : 'This option does not fully solve the problem.' },
        { prompt: 'Question directe pour continuer la conversation.', model: unit.samples.find((sample) => sample.includes('?')) || 'Could you give me an example?' },
        { prompt: 'Phrase avec une raison.', model: `${unit.samples[2]} because it helps me communicate clearly.` },
        { prompt: 'Phrase avec un detail de temps, lieu ou frequence.', model: level === 'A1' ? 'I study English every evening.' : 'In this context, the decision should be reviewed before Friday.' },
      ],
    },
    {
      id: 'transform',
      type: 'transform',
      title: '5. Transformer sans copier',
      instruction: 'Niveau moyen. Reformulez chaque phrase pour parler de votre propre vie ou de votre propre situation.',
      items: [
        { prompt: `Model: ${unit.samples[0]}`, model: `${unit.samples[0]} For me, this is useful because I want to ${skill.target}.` },
        { prompt: `Model: ${unit.samples[1]}`, model: `I can adapt this sentence when I speak with a ${unit.roles[1]}.` },
        { prompt: `Model: ${unit.samples[2]}`, model: 'Personally, I would adapt this sentence with a concrete example from my life.' },
        { prompt: `Model: ${unit.samples[3]}`, model: 'I would finish with a natural follow-up question to keep the exchange alive.' },
      ],
    },
    {
      id: 'correction',
      type: 'correction',
      title: '6. Corriger les erreurs frequentes',
      instruction: 'Niveau moyen. Corrigez les phrases. Pensez a l ordre des mots, au verbe, au temps et a la politesse.',
      items: [
        { prompt: `I ${cleanTitle} very good explain.`, model: `I can explain ${cleanTitle.toLowerCase()} clearly.` },
        { prompt: 'She not use the grammar correctly.', model: 'She does not use the grammar correctly.' },
        { prompt: 'Can you to repeat the question?', model: 'Can you repeat the question?' },
        { prompt: 'I am agree because this idea is good.', model: 'I agree because this idea is good.' },
        { prompt: 'Yesterday I go in the city.', model: 'Yesterday I went to the city.' },
      ],
    },
    {
      id: 'translation',
      type: 'translation',
      title: '7. Traduire l idee, pas mot a mot',
      instruction: 'Niveau moyen. Traduisez en anglais naturel. Cherchez une phrase claire avant une phrase compliquee.',
      items: [
        { prompt: 'Je dois parler clairement dans cette situation.', model: 'I need to speak clearly in this situation.' },
        { prompt: 'Pouvez-vous me donner un exemple ?', model: 'Could you give me an example?' },
        { prompt: 'A mon avis, cette option est plus utile.', model: 'In my opinion, this option is more useful.' },
        { prompt: 'Je voudrais expliquer mon idee avec une raison.', model: 'I would like to explain my idea with a reason.' },
        { prompt: 'Le point important est de repondre naturellement.', model: 'The important point is to answer naturally.' },
      ],
    },
    {
      id: 'scenario',
      type: 'scenario',
      title: '8. Reagir a des cas concrets',
      instruction: 'Niveau moyen vers difficile. Pour chaque cas, ecrivez ce que vous diriez vraiment en anglais.',
      items: unit.cases.map(([title, text]) => ({
        prompt: `${title}: ${text}`,
        model: `In this case, I would say: "${unit.samples[0]}" Then I would add one reason and ask a follow-up question.`,
      })),
    },
    {
      id: 'dialogue-build',
      type: 'dialogue-build',
      title: '9. Construire un dialogue complet',
      instruction: 'Niveau difficile. Completez chaque partie du dialogue avec une phrase naturelle.',
      items: [
        { prompt: `${unit.roles[0]} ouvre la conversation.`, model: `A: ${unit.samples[0]}` },
        { prompt: `${unit.roles[1]} repond et ajoute un detail.`, model: `B: ${unit.samples[1]}` },
        { prompt: `${unit.roles[0]} explique une raison.`, model: `A: ${unit.samples[2]} because it is important for me.` },
        { prompt: `${unit.roles[1]} pose une question de relance.`, model: `B: ${unit.samples.find((sample) => sample.includes('?')) || unit.samples[3]}` },
      ],
    },
    {
      id: 'listening-note',
      type: 'listening-note',
      title: '10. Preparation ecoute et prise de notes',
      instruction: 'Niveau difficile. Avant de regarder la video ou ecouter l audio, preparez ce que vous devez reperer.',
      items: [
        { prompt: 'Notez trois mots que vous voulez entendre dans la video.', model: usefulWords.slice(0, 3).join(', ') },
        { prompt: 'Notez une question que le locuteur pourrait poser.', model: unit.samples.find((sample) => sample.includes('?')) || 'Could you explain that?' },
        { prompt: 'Notez une expression utile a reutiliser a l oral.', model: unit.samples[0] },
        { prompt: 'Apres ecoute, resumez le message en une phrase anglaise.', model: `The speaker explains how to handle ${unit.context}.` },
      ],
    },
    {
      id: 'reflection',
      type: 'reflection',
      title: '11. Reflexion linguistique',
      instruction: 'Niveau difficile. Expliquez pourquoi la langue fonctionne ainsi. Cette partie renforce la maitrise.',
      items: [
        { prompt: `Pourquoi la grammaire "${grammar}" est-elle utile ici ?`, model: `It helps me ${skill.target} with a clear structure.` },
        { prompt: 'Quelle erreur feriez-vous facilement, et comment l eviter ?', model: 'I might translate from French, so I should reuse an English pattern.' },
        { prompt: 'Quelle phrase pouvez-vous memoriser comme bloc complet ?', model: unit.samples[0] },
        { prompt: `Comment adapter ce langage au niveau ${level} ?`, model: `I should produce ${targetOutput} and use the strategy: ${skill.strategy}.` },
      ],
    },
    {
      id: 'roleplay',
      type: 'roleplay',
      title: '12. Jeu de role oral',
      instruction: `Niveau difficile. Jouez ${unit.roles[0]} face a ${unit.roles[1]}. Ecrivez votre script avant de le dire a voix haute.`,
      minLength: 80,
      checklist: [`Role A: ${unit.roles[0]}`, `Role B: ${unit.roles[1]}`, `Contexte: ${unit.context}`, `Objectif: ${skill.target}`, 'Une question de relance'],
      model: `A: ${unit.samples[0]}\nB: ${unit.samples[1]}\nA: ${unit.samples[2]} because I want to ${skill.target}.\nB: ${unit.samples[3]}`,
    },
    {
      id: 'production',
      type: 'production',
      title: '13. Production guidee',
      instruction: `Niveau difficile. Ecrivez un mini-dialogue structure pour: ${situation}`,
      minLength: 100,
      checklist: [`Utiliser: ${grammar}`, `Utiliser au moins 6 mots: ${usefulWords.slice(0, 6).join(', ')}`, 'Ajouter une raison', 'Terminer par une question naturelle'],
      model: `A (${unit.roles[0]}): ${unit.samples[0]}\nB (${unit.roles[1]}): ${unit.samples[1]}\nA: ${unit.samples[2]} because it helps me communicate better.\nB: ${unit.samples[3]}`,
    },
    {
      id: 'challenge',
      type: 'challenge',
      title: '14. Defi de maitrise',
      instruction: `Niveau tres difficile. Produisez ${targetOutput}. Vous devez prouver que vous savez utiliser la lecon sans modele.`,
      minLength: level === 'A1' ? 90 : level === 'A2' ? 120 : 180,
      checklist: ['Introduction claire', 'Grammaire cible', 'Vocabulaire varie', 'Exemple concret', 'Auto-correction finale'],
      model: `I will speak about ${unit.context}. First, I will introduce the situation. Then I will use the target grammar: ${grammar}. I will add examples, explain my reason and finish with a useful question.`,
    },
    {
      id: 'mastery',
      type: 'mastery',
      title: '15. Bilan personnel avant validation',
      instruction: 'Derniere etape. Repondez avec precision: qu avez-vous vraiment maitrise, et que devez-vous encore revoir ?',
      items: [
        { prompt: 'Je peux maintenant utiliser cette lecon pour...', model: `I can use this lesson to ${skill.target}.` },
        { prompt: 'Ma phrase anglaise la plus solide est...', model: unit.samples[0] },
        { prompt: 'Mon point faible actuel est...', model: `I still need to practise ${grammar}.` },
        { prompt: 'Mon prochain entrainement oral sera...', model: `I will record myself for one minute about ${unit.context}.` },
      ],
    },
  ];
}

function enrichEnglishLesson(lesson, courseId) {
  if (!isEnglishCourseId(courseId) && !/anglais|english|A1|A2|B1|B2|C1/i.test(`${lesson.title} ${lesson.module?.title || ''}`)) return lesson;
  const level = (`${lesson.title} ${lesson.module?.title || ''}`.match(/\b(A1|A2|B1|B2|C1)\b/i)?.[1] || 'A1').toUpperCase();
  const fullEnglish = level !== 'A1';
  const theme = englishThemes[level] || englishThemes.A1;
  const cleanTitle = lesson.title
    .replace(/\b(A1|A2|B1|B2|C1)\b/gi, '')
    .replace(/\s-\s(Video de la lecon|Explication et objets|Exercices corriges|Quiz et oral).*$/i, '')
    .trim() || lesson.title;
  const content = lesson.content || '';
  const grammar = extractLine(content, 'Grammar') || extractLine(content, 'Key grammar') || extractLine(content, 'Grammaire') || extractLine(content, '- Utiliser la grammaire') || (fullEnglish ? 'the lesson grammar pattern' : 'structure grammaticale de la lecon');
  const vocabText = extractLine(content, 'Vocabulary bank') || extractLine(content, 'Vocabulary') || extractLine(content, 'Vocabulaire') || extractLine(content, '- Employer le vocabulaire') || 'useful words, expressions and pronunciation';
  const vocabulary = vocabText.split(',').map((item) => item.trim()).filter(Boolean).slice(0, 10);
  const unit = getUnitProfile(cleanTitle, fullEnglish);
  const skill = getLevelProfile(level);
  const situation = extractLine(content, 'Real-life situation') || extractLine(content, 'Situation') || extractLine(content, '- Comprendre la situation') || (fullEnglish ? unit.context : 'Utiliser l anglais dans une situation reelle et concrete.');
  const baseVideos = englishVideoLibrary[level] || englishVideoLibrary.A1;
  const directVideo = lesson.youtube_video_id ? [{ youtube_video_id: lesson.youtube_video_id, title: fullEnglish ? `${cleanTitle} - main video` : `${cleanTitle} - video principale`, channel: 'StudyLink English', minutes: Math.max(1, Math.round((Number(lesson.duration_seconds) || 600) / 60)) }] : [];
  const videos = [...directVideo, ...baseVideos]
    .filter((video, index, arr) => video.youtube_video_id && arr.findIndex((item) => item.youtube_video_id === video.youtube_video_id) === index)
    .map((video, index) => ({
      id: `${lesson.id}-video-${index}`,
      ...video,
      thumbnail_url: `https://img.youtube.com/vi/${video.youtube_video_id}/hqdefault.jpg`,
      description: fullEnglish ? `Integrated video practice for ${cleanTitle} at ${level} level.` : `Video integree pour pratiquer ${cleanTitle} au niveau ${level}.`,
    }));
  const fullEnglishReferenceContent = `${cleanTitle}

Level: ${level}
Real-life situation: ${situation}

Detailed explanation:
This lesson trains English as a practical communication skill. First, identify who is speaking, what the goal is, which register is appropriate and which information must be exchanged. Then connect the grammar to a real communicative purpose instead of treating it as an isolated rule.

Core grammar:
${grammar}

Useful language:
- ${unit.samples.join('\n- ')}

Vocabulary bank:
${vocabulary.length ? vocabulary.map((word) => `- ${word}`).join('\n') : '- useful words\n- expressions\n- pronunciation\n- communication'}

Use cases:
${unit.cases.map(([title, text]) => `- ${title}: ${text}`).join('\n')}

Practice method:
Notice the pattern, repeat the sentence aloud, replace one element, add a reason, then ask a follow-up question. At ${level} level, your target is to ${skill.target}. Your expected output is ${skill.output}.

Application task:
Write original sentences for your own life, say them aloud, correct the grammar, then produce a short spoken answer without reading.`;

  return {
    ...lesson,
    content: fullEnglish ? fullEnglishReferenceContent : lesson.content,
    theme: lesson.theme || theme,
    ui_full_english: fullEnglish,
    image_url: lesson.image_url || theme.image,
    vocabulary: lesson.vocabulary?.length ? lesson.vocabulary : vocabulary,
    grammar_focus: lesson.grammar_focus || grammar,
    audio_script: lesson.audio_script || `${cleanTitle}. ${situation} ${grammar}. ${vocabulary.slice(0, 5).join(', ')}.`,
    lesson_objectives: fullEnglish ? [
      `Understand the communication situation: ${situation}`,
      `Use the target grammar accurately: ${grammar}`,
      `Use useful vocabulary: ${vocabulary.slice(0, 6).join(', ') || vocabText}`,
      'Produce a short, clear and natural spoken answer',
    ] : lesson.lesson_objectives?.length ? lesson.lesson_objectives : [
      `Comprendre la situation : ${situation}`,
      `Utiliser correctement : ${grammar}`,
      `Employer le vocabulaire utile : ${vocabulary.slice(0, 6).join(', ') || vocabText}`,
      'Produire une reponse orale courte, claire et naturelle',
    ],
    learning_objects: fullEnglish ? [
      { label: 'Situation', value: situation },
      { label: 'Grammar object', value: grammar },
      { label: 'Vocabulary object', value: vocabulary.slice(0, 6).join(', ') || vocabText },
      { label: 'Speaking object', value: 'listen, repeat, answer, then reformulate with your own words' },
      { label: 'CEFR level', value: level },
    ] : lesson.learning_objects?.length ? lesson.learning_objects : [
      { label: 'Situation', value: situation },
      { label: 'Objet grammatical', value: grammar },
      { label: 'Objet vocabulaire', value: vocabulary.slice(0, 6).join(', ') || vocabText },
      { label: 'Objet oral', value: 'ecouter, repeter, repondre, puis reformuler avec ses propres mots' },
      { label: 'Niveau CECRL', value: level },
    ],
    detailed_sections: fullEnglish ? [
      { title: '1. Real communication context', body: `Exact context: ${unit.context}. You play the role of ${unit.roles[0]} and speak with ${unit.roles[1]}. The ${level} goal is to ${skill.target}, not only to recite a memorised phrase.` },
      { title: '2. Language object', body: `The central point is: ${grammar}. In this unit, it helps you produce this kind of message: "${unit.samples[0]}". You learn the form, then transform it for a personal context.` },
      { title: '3. Meaning and vocabulary', body: `The vocabulary (${vocabulary.slice(0, 8).join(', ') || vocabText}) must be connected to a concrete action. Example context: ${unit.cases[0][1]}` },
      { title: '4. Interactive production', body: `Expected production: ${skill.output}. Method: ${skill.strategy}. You must produce a model sentence, a personal variation and a follow-up question.` },
    ] : lesson.detailed_sections?.length ? lesson.detailed_sections : [
      { title: '1. Mise en situation', body: `Contexte exact: ${unit.context}. Vous jouez le role de ${unit.roles[0]} et vous parlez avec ${unit.roles[1]}. L objectif ${level} est de ${skill.target}, pas seulement de reciter une phrase.` },
      { title: '2. Objet de langue', body: `Le point central est: ${grammar}. Dans cette unite, il sert a produire ce type de message: "${unit.samples[0]}". On apprend la forme, puis on la transforme pour l utiliser dans un contexte personnel.` },
      { title: '3. Construction du sens', body: `Le vocabulaire (${vocabulary.slice(0, 8).join(', ') || vocabText}) doit etre associe a une action concrete. Exemple de contexte: ${unit.cases[0][1]}` },
      { title: '4. Production interactive', body: `Production attendue: ${skill.output}. Methode: ${skill.strategy}. Vous devez produire une phrase modele, une variante personnelle et une question de relance.` },
    ],
    examples: fullEnglish ? [
      { title: 'Model sentence', text: unit.samples[0] },
      { title: 'Useful question', text: unit.samples.find((sample) => sample.includes('?')) || unit.samples[1] },
      { title: 'Personal answer', text: `${unit.samples[2]} This matters because I want to ${skill.target}.` },
      { title: unit.cases[0][0], text: unit.cases[0][1] },
      { title: unit.cases[1][0], text: unit.cases[1][1] },
      { title: 'Mini-dialogue', text: `A: ${unit.samples[0]}\nB: ${unit.samples[1]}\nA: ${unit.samples[2]}\nB: ${unit.samples[3]}` },
    ] : lesson.examples?.length ? lesson.examples : [
      { title: 'Phrase modele', text: unit.samples[0] },
      { title: 'Question utile', text: unit.samples.find((sample) => sample.includes('?')) || unit.samples[1] },
      { title: 'Reponse personnelle', text: `${unit.samples[2]} This matters because I want to ${skill.target}.` },
      { title: unit.cases[0][0], text: unit.cases[0][1] },
      { title: unit.cases[1][0], text: unit.cases[1][1] },
      { title: 'Mini-dialogue', text: `A: ${unit.samples[0]}\nB: ${unit.samples[1]}\nA: ${unit.samples[2]}\nB: ${unit.samples[3]}` },
    ],
    common_mistakes: fullEnglish ? [
      'Translating word for word before speaking instead of using an English pattern.',
      `Forgetting the main grammar point: ${grammar}.`,
      'Speaking too quickly before controlling pronunciation and pauses.',
    ] : lesson.common_mistakes?.length ? lesson.common_mistakes : [
      'Traduire mot a mot depuis le francais au lieu d utiliser une structure anglaise simple.',
      `Oublier le point de grammaire principal : ${grammar}.`,
      'Parler trop vite avant de maitriser la prononciation et les pauses.',
    ],
    corrected_exercise: fullEnglish ? {
      prompt: `Produce six personal sentences for this situation: ${situation}`,
      answer: `In this situation, I would speak clearly and use the key grammar: ${grammar}.`,
      correction: 'The answer is correct if it uses the target structure, at least four vocabulary items and one follow-up question.',
    } : lesson.corrected_exercise || {
      prompt: `Produisez six phrases personnelles pour la situation suivante : ${situation}`,
      answer: `In this situation, I would speak clearly and use the key grammar: ${grammar}.`,
      correction: 'La reponse est correcte si elle utilise la structure cible, au moins quatre mots de vocabulaire et une question de relance.',
    },
    oral_practice: lesson.oral_practice || {
      prompt: `Speak for 60 seconds in English. Situation: ${situation}`,
      checklist: [`Use the grammar: ${grammar}`, `Use vocabulary: ${vocabulary.slice(0, 4).join(', ') || vocabText}`, 'Finish with one follow-up question'],
      modelAnswer: `In this situation, I would be polite and clear. I would use simple sentences, key vocabulary and one follow-up question.`,
    },
    youtube_videos: videos,
    resources: lesson.resources?.length ? lesson.resources : englishResources.map((resource) => ({ ...resource, id: `${lesson.id}-${resource.id}` })),
    interactive_exercises: lesson.interactive_exercises?.length ? lesson.interactive_exercises : buildInteractiveExercises({ level, cleanTitle, situation, grammar, vocabulary }),
    use_cases: lesson.use_cases?.length ? lesson.use_cases : [
      ...unit.cases.map(([title, text]) => ({ title, text })),
    ],
    grammar_cards: fullEnglish ? [
      { title: 'Target form', formula: grammar, example: unit.samples[0], note: `At ${level} level, this form helps you ${skill.target}.` },
      { title: 'Useful question', formula: 'Question word / auxiliary + subject + verb?', example: unit.samples.find((sample) => sample.includes('?')) || unit.samples[1], note: 'The question should keep the conversation moving, not only check grammar.' },
      { title: 'Extension', formula: 'Answer + reason + example', example: `${unit.samples[2]} For example, ${unit.cases[0][1].toLowerCase()}`, note: `To progress, aim for: ${skill.output}.` },
    ] : lesson.grammar_cards?.length ? lesson.grammar_cards : [
      { title: 'Forme cible', formula: grammar, example: unit.samples[0], note: `Au niveau ${level}, cette forme sert a ${skill.target}.` },
      { title: 'Question utile', formula: 'Question word / auxiliary + subject + verb?', example: unit.samples.find((sample) => sample.includes('?')) || unit.samples[1], note: 'La question doit relancer la conversation, pas seulement verifier la grammaire.' },
      { title: 'Extension', formula: 'Answer + reason + example', example: `${unit.samples[2]} For example, ${unit.cases[0][1].toLowerCase()}`, note: `Pour progresser, visez: ${skill.output}.` },
    ],
    vocabulary_focus: lesson.vocabulary_focus?.length ? lesson.vocabulary_focus : vocabulary.slice(0, 8).map((word, index) => ({
      word,
      meaning: fullEnglish ? `Useful word in this context: ${unit.context}.` : `Mot utile dans le contexte: ${unit.context}.`,
      example: `${unit.samples[index % unit.samples.length]} (${word})`,
      collocation: index % 2 ? `${word} in context` : `use ${word} naturally`,
    })),
    dialogues: lesson.dialogues?.length ? lesson.dialogues : [
      {
        title: fullEnglish ? 'Model dialogue' : 'Dialogue modele',
        lines: [
          `A (${unit.roles[0]}): ${unit.samples[0]}`,
          `B (${unit.roles[1]}): ${unit.samples[1]}`,
          `A: ${unit.samples[2]}`,
          `B: ${unit.samples[3]}`,
        ],
      },
      {
        title: fullEnglish ? 'Dialogue to transform' : 'Dialogue a transformer',
        lines: [
          `A: I am practising ${cleanTitle.toLowerCase()} for ${unit.context}.`,
          `B: Use this structure: ${grammar}.`,
          `A: ${unit.samples[0]} Then I add a personal detail.`,
          `B: Good. Now finish with a follow-up question.`,
        ],
      },
    ],
    study_method: fullEnglish ? [
      `Identify the roles: you are ${unit.roles[0]}, and your partner is ${unit.roles[1]}.`,
      `Memorise one model sentence: "${unit.samples[0]}".`,
      'Change two elements: person, place, time or opinion.',
      `Apply the ${level} strategy: ${skill.strategy}.`,
      `Produce ${skill.output}, then check grammar, vocabulary and the final question.`,
    ] : lesson.study_method?.length ? lesson.study_method : [
      `Identifier le role: vous etes ${unit.roles[0]}, votre interlocuteur est ${unit.roles[1]}.`,
      `Memoriser une phrase modele: "${unit.samples[0]}".`,
      `Changer deux elements: personne, lieu, temps ou opinion.`,
      `Appliquer la strategie ${level}: ${skill.strategy}.`,
      `Produire ${skill.output}, puis verifier grammaire, vocabulaire et question finale.`,
    ],
  };
}

function YouTubeEmbed({ id, title }) {
  if (!id) return null;
  return <div className="lesson-video-frame"><iframe src={`https://www.youtube.com/embed/${id}?rel=0`} title={title || 'Video StudyLink'} allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowFullScreen /></div>;
}

function renderContent(content = '') {
  return content.split('\n').map((line, index) => line.trim() ? <p key={index}>{line}</p> : <br key={index} />);
}

function HighlightedText({ text = '', words = [] }) {
  const terms = words.filter(Boolean).slice(0, 8);
  if (!terms.length || !text) return text;
  const pattern = new RegExp(`(${terms.map((word) => word.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')).join('|')})`, 'gi');
  return text.split(pattern).map((part, index) => terms.some((word) => word.toLowerCase() === part.toLowerCase()) ? <mark key={index} className="lesson-keyword">{part}</mark> : part);
}

function speak(text) {
  if (!text || !('speechSynthesis' in window)) return;
  window.speechSynthesis.cancel();
  const utterance = new SpeechSynthesisUtterance(text);
  utterance.lang = 'en-US';
  utterance.rate = 0.86;
  utterance.pitch = 1;
  window.speechSynthesis.speak(utterance);
}

function LanguageAudioLab({ lesson, transcript, setTranscript }) {
  const [recording, setRecording] = useState(false);
  const en = lesson.ui_full_english;
  const recognitionAvailable = typeof window !== 'undefined' && (window.SpeechRecognition || window.webkitSpeechRecognition);
  const script = lesson.audio_script || lesson.content || '';
  const oral = lesson.oral_practice;

  function startRecording() {
    const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
    if (!SpeechRecognition) return;
    const recognition = new SpeechRecognition();
    recognition.lang = 'en-US';
    recognition.interimResults = false;
    recognition.maxAlternatives = 1;
    recognition.onstart = () => setRecording(true);
    recognition.onend = () => setRecording(false);
    recognition.onerror = () => setRecording(false);
    recognition.onresult = (event) => setTranscript(event.results?.[0]?.[0]?.transcript || '');
    recognition.start();
  }

  return <div className="course-panel language-lab">
    <div className="between"><div><h2>{en ? 'Audio and speaking practice' : 'Audio et entrainement oral'}</h2><p>{en ? 'Listen to the model, repeat it, then record a short answer.' : 'Ecoutez le modele, repetez, puis enregistrez une reponse courte.'}</p></div><button className="primary-btn" onClick={() => speak(script)}>{en ? 'Listen to the model' : 'Ecouter le modele'}</button></div>
    <div className="language-lab-grid">
      <section>
        <h3>{en ? 'Audio script' : 'Script audio'}</h3>
        <p>{script}</p>
        <div className="language-chip-row">{(lesson.vocabulary || []).map((word) => <button key={word} onClick={() => speak(word)}>{word}</button>)}</div>
      </section>
      {oral && <section>
        <h3>{en ? 'Speaking mission' : 'Mission orale'}</h3>
        <p>{oral.prompt}</p>
        <ul>{oral.checklist.map((item) => <li key={item}>{item}</li>)}</ul>
        <div className="language-lab-actions">
          <button className="outline-btn" onClick={() => speak(oral.modelAnswer)}>{en ? 'Listen to a model answer' : 'Ecouter une reponse modele'}</button>
          <button className="primary-btn" onClick={startRecording} disabled={!recognitionAvailable || recording}>{recording ? (en ? 'Recording...' : 'Enregistrement...') : (en ? 'Speak now' : 'Parler maintenant')}</button>
        </div>
        {!recognitionAvailable && <small>{en ? 'Speech recognition is not available in this browser, but you can practise with the script and the audio model.' : 'La reconnaissance vocale n est pas disponible dans ce navigateur, mais vous pouvez pratiquer avec le script et le modele audio.'}</small>}
        {transcript && <div className="speech-result"><b>{en ? 'Your transcript' : 'Votre transcription'}</b><p>{transcript}</p></div>}
      </section>}
    </div>
  </div>;
}

function LessonAnnotations({ lesson }) {
  if (!lesson.annotations?.length && !lesson.grammar_focus) return null;
  const en = lesson.ui_full_english;
  return <div className="course-panel language-annotations">
    <h2>{en ? 'Learning annotations' : 'Annotations pedagogiques'}</h2>
    {lesson.grammar_focus && <p><b>{en ? 'Grammar focus:' : 'Focus grammaire :'}</b> {lesson.grammar_focus}</p>}
    <div className="annotation-list">{(lesson.annotations || []).map((item) => <span key={item}>{item}</span>)}</div>
  </div>;
}

function LessonRichOverview({ lesson, done }) {
  const theme = lesson.theme || { accent: '#1769ff', soft: '#eef5ff', text: '#0f3f91' };
  const en = lesson.ui_full_english;
  const highlightWords = [lesson.grammar_focus, ...(lesson.vocabulary || [])].filter(Boolean);
  return <>
    {lesson.image_url && <div className="lesson-visual-card rich" style={{ '--lesson-accent': theme.accent, '--lesson-soft': theme.soft, '--lesson-text': theme.text }}><img src={lesson.image_url} alt="" /><div><span>{en ? 'Lesson context' : 'Contexte de la lecon'}</span><b>{lesson.title}</b><p><HighlightedText text={lesson.oral_practice?.prompt || (en ? 'Observe the situation, identify the speakers and prepare useful language.' : 'Observez la situation, identifiez les interlocuteurs et preparez le langage utile.')} words={highlightWords} /></p></div></div>}
    {lesson.lesson_objectives?.length > 0 && <div className="course-panel lesson-objectives-panel" style={{ '--lesson-accent': theme.accent, '--lesson-soft': theme.soft, '--lesson-text': theme.text }}>
      <div className="lesson-panel-head"><span>{en ? 'Goals' : 'Objectifs'}</span><h2>{en ? 'What you must be able to do' : 'Ce que vous devez savoir faire'}</h2></div>
      <div className="lesson-objective-list">{lesson.lesson_objectives.map((item, index) => <article key={item}><span>{index + 1}</span><p>{item}</p></article>)}</div>
    </div>}
    {lesson.learning_objects?.length > 0 && <div className="course-panel lesson-object-panel" style={{ '--lesson-accent': theme.accent, '--lesson-soft': theme.soft, '--lesson-text': theme.text }}>
      <div className="lesson-panel-head"><span>{en ? 'Objects' : 'Objets'}</span><h2>{en ? 'Lesson learning objects' : 'Objets du cours'}</h2></div>
      <div className="lesson-object-grid">{lesson.learning_objects.map((item) => <article key={item.label}><span>{item.label}</span><b>{item.value}</b></article>)}</div>
    </div>}
    {lesson.detailed_sections?.length > 0 && <div className="course-panel lesson-detail-panel" style={{ '--lesson-accent': theme.accent, '--lesson-soft': theme.soft, '--lesson-text': theme.text }}>
      <div className="lesson-panel-head"><span>{en ? 'Explanation' : 'Explication'}</span><h2>{en ? 'Understand the lesson step by step' : 'Comprendre le cours pas a pas'}</h2></div>
      <div className="lesson-section-list">{lesson.detailed_sections.map((section) => <article key={section.title}><h3>{section.title}</h3><p><HighlightedText text={section.body} words={highlightWords} /></p></article>)}</div>
    </div>}
    {lesson.grammar_cards?.length > 0 && <div className="course-panel grammar-masterclass-panel" style={{ '--lesson-accent': theme.accent, '--lesson-soft': theme.soft, '--lesson-text': theme.text }}>
      <div className="lesson-panel-head"><span>{en ? 'Grammar' : 'Grammaire'}</span><h2>{en ? 'Deep grammar focus' : 'Le point de grammaire en profondeur'}</h2></div>
      <div className="grammar-card-grid">{lesson.grammar_cards.map((card) => <article key={card.title}><span>{card.title}</span><code>{card.formula}</code><p><HighlightedText text={card.example} words={highlightWords} /></p><small>{card.note}</small></article>)}</div>
    </div>}
    {lesson.vocabulary_focus?.length > 0 && <div className="course-panel vocabulary-focus-panel" style={{ '--lesson-accent': theme.accent, '--lesson-soft': theme.soft, '--lesson-text': theme.text }}>
      <div className="lesson-panel-head"><span>{en ? 'Vocabulary' : 'Vocabulaire'}</span><h2>{en ? 'Important words and natural examples' : 'Mots importants et exemples naturels'}</h2></div>
      <div className="vocabulary-table">{lesson.vocabulary_focus.map((item) => <article key={item.word}><b>{item.word}</b><p>{item.meaning}</p><em>{item.example}</em><small>{en ? 'Collocation:' : 'Collocation :'} {item.collocation}</small></article>)}</div>
    </div>}
    {lesson.dialogues?.length > 0 && <div className="course-panel dialogue-lab-panel" style={{ '--lesson-accent': theme.accent, '--lesson-soft': theme.soft, '--lesson-text': theme.text }}>
      <div className="lesson-panel-head"><span>Dialogues</span><h2>{en ? 'Concrete dialogues to practise' : 'Dialogues concrets a pratiquer'}</h2></div>
      <div className="dialogue-grid">{lesson.dialogues.map((dialogue) => <article key={dialogue.title}><h3>{dialogue.title}</h3>{dialogue.lines.map((line) => <p key={line}><HighlightedText text={line} words={highlightWords} /></p>)}<button onClick={() => speak(dialogue.lines.join(' '))}>{en ? 'Listen to the dialogue' : 'Ecouter le dialogue'}</button></article>)}</div>
    </div>}
    {lesson.examples?.length > 0 && <div className="course-panel lesson-examples-panel">
      <div className="lesson-panel-head"><span>{en ? 'Examples' : 'Exemples'}</span><h2>{en ? 'Concrete examples and use cases' : 'Exemples concrets et cas d utilisation'}</h2></div>
      <div className="lesson-example-list">{lesson.examples.map((item) => <article key={item.title}><span>{item.title}</span><p>{item.text}</p><button onClick={() => speak(item.text)}>{en ? 'Listen' : 'Ecouter'}</button></article>)}</div>
    </div>}
    {lesson.use_cases?.length > 0 && <div className="course-panel lesson-usecase-panel" style={{ '--lesson-accent': theme.accent, '--lesson-soft': theme.soft, '--lesson-text': theme.text }}>
      <div className="lesson-panel-head"><span>{en ? 'Cases' : 'Cas'}</span><h2>{en ? 'Use cases' : 'Cas d utilisation'}</h2></div>
      <div className="lesson-usecase-grid">{lesson.use_cases.map((item) => <article key={item.title}><b>{item.title}</b><p><HighlightedText text={item.text} words={highlightWords} /></p></article>)}</div>
    </div>}
    {lesson.study_method?.length > 0 && <div className="course-panel study-method-panel" style={{ '--lesson-accent': theme.accent, '--lesson-soft': theme.soft, '--lesson-text': theme.text }}>
      <div className="lesson-panel-head"><span>{en ? 'Method' : 'Methode'}</span><h2>{en ? 'How to study this lesson effectively' : 'Comment apprendre cette lecon efficacement'}</h2></div>
      <div className="study-method-steps">{lesson.study_method.map((step, index) => <article key={step}><span>{index + 1}</span><p>{step}</p></article>)}</div>
    </div>}
    <div className="course-panel lesson-copy lesson-reference-copy">
      <h2>{en ? 'Complete lesson sheet' : 'Fiche complete'}</h2>
      {renderContent(lesson.content || (en ? 'Additional lesson content will be available soon.' : 'Le contenu complementaire de cette lecon sera bientot disponible.'))}
      {done && <div className="lesson-success">{en ? '? This lesson is complete and saved in your progress.' : '? Cette lecon est terminee et enregistree dans votre progression.'}</div>}
    </div>
    {lesson.common_mistakes?.length > 0 && <div className="course-panel language-annotations">
      <h2>{en ? 'Common mistakes' : 'Erreurs frequentes'}</h2>
      <div className="annotation-list">{lesson.common_mistakes.map((item) => <span key={item}>{item}</span>)}</div>
    </div>}
    <LessonAnnotations lesson={lesson} />
  </>;
}

function LessonResources({ lesson }) {
  const theme = lesson.theme || { accent: '#1769ff', soft: '#eef5ff', text: '#0f3f91' };
  const en = lesson.ui_full_english;
  const grouped = lesson.resources || [];
  return <div className="course-panel rich-resource-panel" style={{ '--lesson-accent': theme.accent, '--lesson-soft': theme.soft, '--lesson-text': theme.text }}>
    <div className="lesson-panel-head"><span>{en ? 'Resources' : 'Ressources'}</span><h2>{en ? 'Lesson resources' : 'Ressources de la lecon'}</h2></div>
    <div className="rich-resource-grid">{grouped.map((resource) => <a key={resource.id || resource.url} href={resource.url} target="_blank" rel="noreferrer">
      <span>{resource.resource_type?.slice(0, 2) || '↗'}</span>
      <div><b>{resource.title}</b><small>{resource.resource_type || (en ? 'Useful link' : 'Lien utile')}</small><p>{en ? 'Open this resource to deepen the lesson and check examples.' : 'Ouvrir cette ressource pour approfondir la lecon et verifier les exemples.'}</p></div>
      <strong>{en ? 'Open' : 'Ouvrir'}</strong>
    </a>)}</div>
  </div>;
}

function InteractiveExercises({ lesson, complete, done }) {
  const [answers, setAnswers] = useState({});
  const [revealed, setRevealed] = useState({});
  const en = lesson.ui_full_english;
  const exercises = lesson.interactive_exercises || [];
  const writtenExerciseTypes = ['transform', 'vocabulary-use', 'grammar-drill', 'correction', 'translation', 'scenario', 'dialogue-build', 'listening-note', 'reflection', 'mastery'];
  const longProductionTypes = ['roleplay', 'production', 'challenge'];
  const isExerciseComplete = (exercise) => {
    if (exercise.type === 'fill') return exercise.items.every((_, index) => (answers[`${exercise.id}-${index}`] || '').trim());
    if (exercise.type === 'choice') return exercise.items.every((_, index) => answers[`${exercise.id}-${index}`]);
    if (writtenExerciseTypes.includes(exercise.type)) return exercise.items.every((_, index) => (answers[`${exercise.id}-${index}`] || '').trim().length >= 8);
    if (longProductionTypes.includes(exercise.type)) return (answers[exercise.id] || '').trim().length >= (exercise.minLength || 60);
    return false;
  };
  const completed = exercises.length && exercises.every((exercise) => {
    return isExerciseComplete(exercise);
  });
  const doneCount = exercises.filter(isExerciseComplete).length;
  return <div className="course-panel lesson-exercise-panel rich-exercise-panel">
    <div className="lesson-panel-head"><span>{en ? 'Workshop' : 'Atelier'}</span><h2>{en ? 'Interactive exercises' : 'Exercices interactifs'}</h2></div>
    <div className="exercise-volume-banner"><b>{doneCount}/{exercises.length} {en ? 'blocks completed' : 'blocs completes'}</b><p>{en ? 'Progression from simple to demanding: vocabulary, grammar, correction, reformulation, situations, speaking and final production.' : 'Progression du plus simple au plus exigeant: vocabulaire, grammaire, correction, traduction, situations, oral et production finale.'}</p></div>
    <div className="interactive-exercise-list">
      {exercises.map((exercise) => <article key={exercise.id} className={`interactive-exercise-card ${exercise.type}`}>
        <div className="exercise-card-head"><div><span>{isExerciseComplete(exercise) ? 'complete' : exercise.type}</span><h3>{exercise.title}</h3><p>{exercise.instruction}</p></div><button type="button" onClick={() => setRevealed((state) => ({ ...state, [exercise.id]: !state[exercise.id] }))}>{revealed[exercise.id] ? (en ? 'Hide model' : 'Masquer le modele') : (en ? 'Show model' : 'Voir le modele')}</button></div>
        {exercise.type === 'fill' && <div className="exercise-field-grid">{exercise.items.map((item, index) => <label key={item.prompt}><span>{item.prompt}</span><input value={answers[`${exercise.id}-${index}`] || ''} onChange={(event) => setAnswers((state) => ({ ...state, [`${exercise.id}-${index}`]: event.target.value }))} placeholder={en ? 'Your answer' : 'Votre reponse'} />{revealed[exercise.id] && <small>{en ? 'Possible answer:' : 'Reponse possible :'} {item.answer}</small>}</label>)}</div>}
        {exercise.type === 'choice' && <div className="choice-exercise-list">{exercise.items.map((item, index) => <div key={item.prompt}><b>{item.prompt}</b>{item.options.map((option) => <button type="button" key={option} className={answers[`${exercise.id}-${index}`] === option ? 'active' : ''} onClick={() => setAnswers((state) => ({ ...state, [`${exercise.id}-${index}`]: option }))}>{option}</button>)}{revealed[exercise.id] && <small>{en ? 'Correct answer:' : 'Bonne reponse :'} {item.answer}</small>}</div>)}</div>}
        {writtenExerciseTypes.includes(exercise.type) && <div className="exercise-field-grid">{exercise.items.map((item, index) => <label key={item.prompt}><span>{item.prompt}</span><textarea rows={exercise.type === 'scenario' || exercise.type === 'reflection' ? '3' : '2'} value={answers[`${exercise.id}-${index}`] || ''} onChange={(event) => setAnswers((state) => ({ ...state, [`${exercise.id}-${index}`]: event.target.value }))} placeholder={en ? 'Write a complete English answer' : 'Ecrivez une reponse anglaise complete'} />{revealed[exercise.id] && <small>{en ? 'Model:' : 'Modele :'} {item.model}</small>}</label>)}</div>}
        {longProductionTypes.includes(exercise.type) && <div className="production-exercise"><textarea rows="7" value={answers[exercise.id] || ''} onChange={(event) => setAnswers((state) => ({ ...state, [exercise.id]: event.target.value }))} placeholder={en ? 'Write your complete answer here...' : 'Ecrivez votre reponse complete ici...'} /><div>{exercise.checklist.map((item) => <span key={item}>{item}</span>)}</div><small className="exercise-length-hint">{(answers[exercise.id] || '').trim().length}/{exercise.minLength || 60} {en ? 'minimum characters' : 'caracteres minimum'}</small>{revealed[exercise.id] && <pre>{exercise.model}</pre>}</div>}
      </article>)}
    </div>
    <button className="primary-btn" disabled={!completed} onClick={complete}>{done ? (en ? 'Activities validated ?' : 'Activites validees ?') : (en ? 'Validate all exercises' : 'Valider tous les exercices')}</button>
  </div>;
}

function LessonVideos({ lesson }) {
  const videos = lesson.youtube_videos || [];
  const [active, setActive] = useState(videos[0]?.youtube_video_id || '');
  useEffect(() => { setActive(videos[0]?.youtube_video_id || ''); }, [lesson.id]);
  const current = videos.find((video) => video.youtube_video_id === active) || videos[0];
  return <div className="course-panel lesson-youtube-panel">
    <div className="lesson-panel-head"><span>Videos</span><h2>{lesson.ui_full_english ? 'Lesson videos' : 'Videos de la lecon'}</h2></div>
    {current?.youtube_video_id && <div className="lesson-integrated-video"><iframe src={`https://www.youtube-nocookie.com/embed/${current.youtube_video_id}?rel=0`} title={current.title} allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowFullScreen /></div>}
    <div className="youtube-recommendation-grid embedded">
      {videos.map((video) => <button key={video.id} type="button" className={video.youtube_video_id === current?.youtube_video_id ? 'active' : ''} onClick={() => setActive(video.youtube_video_id)}>
        <img src={video.thumbnail_url} alt="" />
        <div><b>{video.title}</b><small>{video.channel} - {video.minutes} min</small><p>{video.description}</p></div>
      </button>)}
    </div>
  </div>;
}

export default function LessonPage() {
  const { id } = useParams();
  const { search } = useLocation();
  const navigate = useNavigate();
  const courseId = new URLSearchParams(search).get('course') || PYTHON_COURSE_SLUG;
  const { token } = useAuth();
  const [data, setData] = useState(null);
  const [learning, setLearning] = useState({ enrollment: null, progress: [], notes: [] });
  const [tab, setTab] = useState('Resume');
  const [note, setNote] = useState('');
  const [savingNote, setSavingNote] = useState(false);
  const [error, setError] = useState('');
  const [exerciseChecks, setExerciseChecks] = useState([false, false, false]);
  const [quizAnswers, setQuizAnswers] = useState(['', '', '']);
  const [richQuizAnswers, setRichQuizAnswers] = useState({});
  const [speechTranscript, setSpeechTranscript] = useState('');

  const fallback = courseId === PYTHON_COURSE_SLUG || courseId === 'demo-python' || isEnglishCourseId(courseId);
  useEffect(() => {
    api.getCourse(courseId)
      .then(setData)
      .catch((e) => {
        if (fallback) setData(isEnglishCourseId(courseId) ? englishCourseFallback : pythonCourseFallback);
        else setError(e.message);
      });
  }, [courseId, fallback]);
  useEffect(() => {
    if (token && data) api.getCourseLearning(courseId, token).then((r) => {
      setLearning(r);
      const existing = (r.notes || []).find((n) => String(n.lesson_id) === String(id));
      setNote(existing?.content || '');
    }).catch(() => {});
  }, [courseId, id, token, data]);
  useEffect(() => {
    setExerciseChecks([false, false, false]);
    setQuizAnswers(['', '', '']);
    setRichQuizAnswers({});
    setSpeechTranscript('');
    setTab('Resume');
  }, [id]);

  const flat = useMemo(() => flattenCourseLessons(data || { modules: [] }), [data]);
  const rawLesson = flat.find((l) => String(l.id) === String(id));
  const lesson = rawLesson ? enrichEnglishLesson(rawLesson, courseId) : null;
  const index = flat.findIndex((l) => String(l.id) === String(id));
  const progress = learning.progress?.find((p) => String(p.lesson_id) === String(id));
  const done = progress?.status === 'completed';
  const overall = learning.enrollment?.progress_percent ? Math.round(Number(learning.enrollment.progress_percent)) : Math.round((learning.progress || []).filter((p) => p.status === 'completed').length / Math.max(1, flat.length) * 100);

  async function complete() {
    if (!token) return navigate('/login');
    try {
      const r = await api.saveLessonProgress(id, { progress_percent: 100, completed: true }, token);
      setLearning((s) => ({ ...s, progress: [...(s.progress || []).filter((p) => String(p.lesson_id) !== String(id)), r.progress], enrollment: { ...(s.enrollment || {}), progress_percent: r.course_progress_percent } }));
    } catch (e) { setError(e.message); }
  }
  async function saveNote() {
    if (!token) return navigate('/login');
    setSavingNote(true);
    try {
      const r = await api.saveLessonNote(id, note, token);
      setLearning((s) => ({ ...s, notes: [...(s.notes || []).filter((n) => String(n.lesson_id) !== String(id)), ...(r.note ? [r.note] : [])] }));
    } catch (e) { setError(e.message); }
    finally { setSavingNote(false); }
  }

  if (!lesson) return <AppShell><div className="page course-page"><PageHeader title="Lecon StudyLink" back />{error ? <div className="admin-error">{error}</div> : <div className="course-skeleton">Chargement de la lecon...</div>}</div></AppShell>;
  const prev = flat[index - 1], next = flat[index + 1];
  const tabs = ['Resume', 'Videos', 'Audio oral', 'Notes', 'Ressources', 'Exercices'].filter((item) => item !== 'Audio oral' || lesson.audio_script || lesson.oral_practice);
  const en = lesson.ui_full_english;
  const tabLabels = en ? { Resume: 'Summary', Videos: 'Videos', 'Audio oral': 'Speaking lab', Notes: 'Notes', Ressources: 'Resources', Exercices: 'Exercises' } : {};

  return <AppShell><div className="page lesson-page"><PageHeader title={en ? 'Lesson' : 'Lecon'} back />
    {error && <div className="admin-error">{error}</div>}
    <div className="lesson-topbar"><div><p className="breadcrumb">{en ? 'My courses' : 'Mes cours'} &gt; {data.course.title} &gt; {lesson.module.title}</p><h1>{lesson.title}</h1><p>{lesson.module.title} - {Math.max(1, Math.round((Number(lesson.duration_seconds) || 0) / 60))} min - {data.course.level === 'beginner' ? (en ? 'Beginner' : 'Debutant') : data.course.level}</p></div><div className="lesson-overall-progress"><span>{overall}% {en ? 'of the course' : 'du cours'}</span><Progress value={overall} /></div></div>

    {lesson.lesson_type === 'youtube' && <YouTubeEmbed id={lesson.youtube_video_id} title={lesson.title} />}
    {lesson.lesson_type === 'video_upload' && lesson.media_url && <video src={lesson.media_url} controls className="uploaded-video" />}
    {lesson.lesson_type === 'pdf' && lesson.media_url && <div className="lesson-file-card"><span>PDF</span><div><b>{lesson.title}</b><p>{en ? 'Lesson document' : 'Document de la lecon'}</p></div><a href={lesson.media_url} target="_blank" rel="noreferrer">{en ? 'Open' : 'Ouvrir'}</a></div>}
    {['exercise', 'text', 'audio'].includes(lesson.lesson_type) && <div className={`lesson-type-banner ${lesson.lesson_type}`}><span>{lesson.lesson_type === 'exercise' ? '⌘' : lesson.lesson_type === 'audio' ? '♪' : '▤'}</span><div><b>{lesson.lesson_type === 'exercise' ? (en ? 'Practice exercise' : 'Exercice pratique') : lesson.lesson_type === 'audio' ? (en ? 'Audio and pronunciation' : 'Audio et prononciation') : (en ? 'Guided reading' : 'Lecture guidee')}</b><p>{en ? 'Follow the instructions below, then mark the lesson as complete.' : 'Suivez les consignes ci-dessous, puis marquez la lecon comme terminee.'}</p></div></div>}

    <nav className="lesson-tabs">{tabs.map((item) => <button key={item} onClick={() => setTab(item)} className={tab === item ? 'active' : ''}>{tabLabels[item] || item}{item === 'Ressources' && lesson.resources?.length ? ` (${lesson.resources.length})` : ''}</button>)}</nav>

    <section className="lesson-content-grid">
      <main className="lesson-main-content">
        {tab === 'Resume' && <LessonRichOverview lesson={lesson} done={done} />}
        {tab === 'Videos' && <LessonVideos lesson={lesson} />}
        {tab === 'Audio oral' && <LanguageAudioLab lesson={lesson} transcript={speechTranscript} setTranscript={setSpeechTranscript} />}
        {tab === 'Notes' && <div className="course-panel"><div className="between"><div><h2>{en ? 'My personal notes' : 'Mes notes personnelles'}</h2><p>{en ? 'Your notes are private and linked to your account.' : 'Vos notes sont privees et liees a votre compte.'}</p></div><button className="primary-btn" onClick={saveNote} disabled={savingNote}>{savingNote ? (en ? 'Saving...' : 'Enregistrement...') : (en ? 'Save' : 'Enregistrer')}</button></div><textarea className="lesson-note-editor" rows="12" value={note} onChange={(e) => setNote(e.target.value)} placeholder={en ? 'Write what you want to remember, a tutor question or a useful extract...' : 'Ecrivez ici ce que vous voulez retenir, une question a poser au tuteur, un extrait...'} /></div>}
        {tab === 'Ressources' && <LessonResources lesson={lesson} />}
        {tab === 'Exercices' && (lesson.interactive_exercises?.length ? <InteractiveExercises lesson={lesson} complete={complete} done={done} /> : <div className="course-panel lesson-exercise-panel">
          <h2>{lesson.lesson_type === 'quiz' || lesson.quiz?.length ? 'Quiz de validation' : 'Passer a la pratique'}</h2>
          {lesson.quiz?.length ? <>
            <p>Choisissez la meilleure reponse, puis validez quand toutes les questions sont completees.</p>
            <div className="lesson-quiz-list">
              {lesson.quiz.map((question, i) => <div className="lesson-quiz-question" key={question.question}><b>{i + 1}. {question.question}</b><div>{question.options.map((option) => <button key={option} className={richQuizAnswers[i] === option ? 'active' : ''} onClick={() => setRichQuizAnswers((a) => ({ ...a, [i]: option }))}>{option}</button>)}</div>{richQuizAnswers[i] && <small>{richQuizAnswers[i] === question.answer ? 'Correct. ' : 'A revoir. '}{question.explanation}</small>}</div>)}
            </div>
            <button className="primary-btn" disabled={lesson.quiz.some((_, i) => !richQuizAnswers[i])} onClick={complete}>{done ? 'Quiz valide ✓' : 'Valider le quiz'}</button>
          </> : lesson.lesson_type === 'quiz' ? <>
            <p>Repondez honnetement a ces trois questions. Le but est de verifier votre autonomie avant de continuer.</p>
            <div className="lesson-quiz-list">
              {[
                'Pouvez-vous expliquer le concept principal sans relire la lecon ?',
                'Pouvez-vous appliquer la methode sur un exemple different ?',
                'Savez-vous identifier et corriger une erreur frequente ?',
              ].map((question, i) => <div className="lesson-quiz-question" key={question}><b>{i + 1}. {question}</b><div><button className={quizAnswers[i] === 'yes' ? 'active' : ''} onClick={() => setQuizAnswers((a) => a.map((v, j) => j === i ? 'yes' : v))}>Oui</button><button className={quizAnswers[i] === 'notyet' ? 'active' : ''} onClick={() => setQuizAnswers((a) => a.map((v, j) => j === i ? 'notyet' : v))}>Pas encore</button></div></div>)}
            </div>
            <button className="primary-btn" disabled={quizAnswers.some((a) => !a)} onClick={complete}>{done ? 'Quiz valide ✓' : 'Valider mon auto-evaluation'}</button>
          </> : <>
            <p>{lesson.lesson_type === 'exercise' ? lesson.content : 'Reproduisez l exemple de la lecon sans copier, puis modifiez une valeur ou ajoutez une fonctionnalite.'}</p>
            {lesson.corrected_exercise && <div className="corrected-exercise-card"><b>Exercice corrige</b><p><strong>Consigne :</strong> {lesson.corrected_exercise.prompt}</p><p><strong>Reponse modele :</strong> {lesson.corrected_exercise.answer}</p><p><strong>Correction :</strong> {lesson.corrected_exercise.correction}</p></div>}
            <div className="exercise-checklist">
              {['J ai reproduit l exemple', 'J ai teste une variante', 'J ai compris les erreurs rencontrees'].map((label, i) => <label key={label}><input type="checkbox" checked={exerciseChecks[i]} onChange={(e) => setExerciseChecks((a) => a.map((v, j) => j === i ? e.target.checked : v))} /> {label}</label>)}
            </div>
            <button className="primary-btn" disabled={!exerciseChecks.every(Boolean)} onClick={complete}>{done ? 'Activite validee ✓' : 'Valider l activite'}</button>
          </>}
        </div>)}
      </main>
      <aside className="lesson-side-panel">
        <div className="course-panel"><h3>{en ? 'Progress' : 'Progression'}</h3><div className="course-progress-circle" style={{ '--progress': `${(done ? 100 : Number(progress?.progress_percent || 0)) * 3.6}deg` }}><strong>{done ? 100 : Math.round(Number(progress?.progress_percent || 0))}%</strong></div><button className={`primary-btn full ${done ? 'success-btn' : ''}`} onClick={complete}>{done ? (en ? 'Completed ✓' : 'Terminee ✓') : (en ? 'Mark as complete' : 'Marquer comme terminee')}</button></div>
        <div className="course-panel"><h3>{en ? 'In this module' : 'Dans le module'}</h3>{(lesson.module.lessons || []).map((item, i) => <Link key={item.id} className={`lesson-mini-link ${String(item.id) === String(id) ? 'active' : ''}`} to={`/lessons/${item.id}?course=${encodeURIComponent(courseId)}`}><span>{i + 1}</span><b>{item.title}</b></Link>)}</div>
      </aside>
    </section>

    <div className="lesson-navigation"><Link className={`outline-btn ${!prev ? 'disabled-link' : ''}`} to={prev ? `/lessons/${prev.id}?course=${encodeURIComponent(courseId)}` : `/courses/${courseId}/modules`}>← {prev ? (en ? 'Previous lesson' : 'Lecon precedente') : (en ? 'Syllabus' : 'Programme')}</Link><Link className="outline-btn" to={`/courses/${courseId}/modules`}>☰ {en ? 'Syllabus' : 'Programme'}</Link>{next ? <Link className="primary-btn" to={`/lessons/${next.id}?course=${encodeURIComponent(courseId)}`}>{en ? 'Next lesson' : 'Lecon suivante'} →</Link> : <Link className="primary-btn" to={`/courses/${courseId}`}>{en ? 'View my final review' : 'Voir mon bilan final'} ✓</Link>}</div>
  </div></AppShell>;
}


