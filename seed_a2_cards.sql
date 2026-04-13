-- ============================================================
-- SEED CARDS — A2 Level (10 modules × 20 cards)
-- All cards are system cards (is_system = true)
-- Types: fill_blank, multiple_choice, error_correction
-- ============================================================

-- ============================================================
-- MODULE 1: Present Continuous Tense
-- ============================================================
INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT
  m.id,
  'fill_blank',
  'She ___ (read) a book right now.',
  'is reading',
  NULL, NULL,
  'Present Continuous',
  true
FROM modules m JOIN levels l ON m.level_id = l.id
WHERE l.name = 'A2' AND m.name = 'Present Continuous Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT
  m.id,
  'fill_blank',
  'They ___ (play) football at the moment.',
  'are playing',
  NULL, NULL,
  'Present Continuous',
  true
FROM modules m JOIN levels l ON m.level_id = l.id
WHERE l.name = 'A2' AND m.name = 'Present Continuous Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT
  m.id,
  'fill_blank',
  'I ___ (not / watch) TV right now. I am studying.',
  'am not watching',
  NULL, NULL,
  'Present Continuous',
  true
FROM modules m JOIN levels l ON m.level_id = l.id
WHERE l.name = 'A2' AND m.name = 'Present Continuous Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT
  m.id,
  'fill_blank',
  '___ (he / cook) dinner right now?',
  'Is he cooking',
  NULL, NULL,
  'Present Continuous',
  true
FROM modules m JOIN levels l ON m.level_id = l.id
WHERE l.name = 'A2' AND m.name = 'Present Continuous Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT
  m.id,
  'multiple_choice',
  'Which sentence uses Present Continuous correctly?',
  'He is sleeping now.',
  '["He sleeping now.", "He is sleep now.", "He is sleeping now.", "He are sleeping now."]',
  2,
  'Present Continuous',
  true
FROM modules m JOIN levels l ON m.level_id = l.id
WHERE l.name = 'A2' AND m.name = 'Present Continuous Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT
  m.id,
  'multiple_choice',
  'What is the correct question form? (you / work / from home)',
  'Are you working from home?',
  '["Do you working from home?", "Are you working from home?", "Is you working from home?", "You are working from home?"]',
  1,
  'Present Continuous',
  true
FROM modules m JOIN levels l ON m.level_id = l.id
WHERE l.name = 'A2' AND m.name = 'Present Continuous Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT
  m.id,
  'multiple_choice',
  'Choose the correct sentence.',
  'We are waiting for the bus.',
  '["We waiting for the bus.", "We are wait for the bus.", "We are waiting for the bus.", "We is waiting for the bus."]',
  2,
  'Present Continuous',
  true
FROM modules m JOIN levels l ON m.level_id = l.id
WHERE l.name = 'A2' AND m.name = 'Present Continuous Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT
  m.id,
  'error_correction',
  'Find and correct the error: "She are eating lunch right now."',
  'She is eating lunch right now.',
  NULL, NULL,
  'Present Continuous',
  true
FROM modules m JOIN levels l ON m.level_id = l.id
WHERE l.name = 'A2' AND m.name = 'Present Continuous Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT
  m.id,
  'error_correction',
  'Find and correct the error: "They is playing video games."',
  'They are playing video games.',
  NULL, NULL,
  'Present Continuous',
  true
FROM modules m JOIN levels l ON m.level_id = l.id
WHERE l.name = 'A2' AND m.name = 'Present Continuous Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT
  m.id,
  'error_correction',
  'Find and correct the error: "I am study English now."',
  'I am studying English now.',
  NULL, NULL,
  'Present Continuous',
  true
FROM modules m JOIN levels l ON m.level_id = l.id
WHERE l.name = 'A2' AND m.name = 'Present Continuous Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT
  m.id,
  'fill_blank',
  'The dog ___ (bark) loudly right now.',
  'is barking',
  NULL, NULL,
  'Present Continuous',
  true
FROM modules m JOIN levels l ON m.level_id = l.id
WHERE l.name = 'A2' AND m.name = 'Present Continuous Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT
  m.id,
  'fill_blank',
  'We ___ (have) a meeting at the moment.',
  'are having',
  NULL, NULL,
  'Present Continuous',
  true
FROM modules m JOIN levels l ON m.level_id = l.id
WHERE l.name = 'A2' AND m.name = 'Present Continuous Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT
  m.id,
  'fill_blank',
  'Why ___ (you / cry)?',
  'are you crying',
  NULL, NULL,
  'Present Continuous',
  true
FROM modules m JOIN levels l ON m.level_id = l.id
WHERE l.name = 'A2' AND m.name = 'Present Continuous Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT
  m.id,
  'multiple_choice',
  'Which is the correct negative form? (she / not / listen)',
  'She is not listening.',
  '["She not is listening.", "She is not listening.", "She is not listen.", "She are not listening."]',
  1,
  'Present Continuous',
  true
FROM modules m JOIN levels l ON m.level_id = l.id
WHERE l.name = 'A2' AND m.name = 'Present Continuous Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT
  m.id,
  'error_correction',
  'Find and correct the error: "He is not sleep well these days."',
  'He is not sleeping well these days.',
  NULL, NULL,
  'Present Continuous',
  true
FROM modules m JOIN levels l ON m.level_id = l.id
WHERE l.name = 'A2' AND m.name = 'Present Continuous Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT
  m.id,
  'fill_blank',
  'Look! It ___ (snow) outside.',
  'is snowing',
  NULL, NULL,
  'Present Continuous',
  true
FROM modules m JOIN levels l ON m.level_id = l.id
WHERE l.name = 'A2' AND m.name = 'Present Continuous Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT
  m.id,
  'multiple_choice',
  'The present continuous can be used to talk about...',
  'Actions happening right now.',
  '["Habits and routines.", "Actions happening right now.", "Completed past actions.", "General facts."]',
  1,
  'Present Continuous',
  true
FROM modules m JOIN levels l ON m.level_id = l.id
WHERE l.name = 'A2' AND m.name = 'Present Continuous Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT
  m.id,
  'error_correction',
  'Find and correct the error: "My mom are cooking in the kitchen."',
  'My mom is cooking in the kitchen.',
  NULL, NULL,
  'Present Continuous',
  true
FROM modules m JOIN levels l ON m.level_id = l.id
WHERE l.name = 'A2' AND m.name = 'Present Continuous Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT
  m.id,
  'fill_blank',
  'He ___ (not / come) to the party tonight.',
  'is not coming',
  NULL, NULL,
  'Present Continuous',
  true
FROM modules m JOIN levels l ON m.level_id = l.id
WHERE l.name = 'A2' AND m.name = 'Present Continuous Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT
  m.id,
  'multiple_choice',
  'Choose the correct spelling of the -ing form: "swim"',
  'swimming',
  '["swiming", "swimimg", "swimming", "swimning"]',
  2,
  'Present Continuous',
  true
FROM modules m JOIN levels l ON m.level_id = l.id
WHERE l.name = 'A2' AND m.name = 'Present Continuous Tense';

-- ============================================================
-- MODULE 2: Future Tense (will / going to)
-- ============================================================
INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'I ___ (visit) my grandparents next weekend. (planned)',
  'am going to visit', NULL, NULL, 'Future Tense', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Future Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'Look at those clouds. It ___ (rain).',
  'is going to rain', NULL, NULL, 'Future Tense', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Future Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'Don''t worry. I ___ (help) you with that.',
  'will help', NULL, NULL, 'Future Tense', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Future Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'Which sentence expresses a spontaneous decision?',
  'I will answer the door.',
  '["I am going to answer the door.", "I will answer the door.", "I answer the door.", "I answered the door."]',
  1, 'Future Tense', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Future Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'Which sentence expresses a prior plan?',
  'We are going to travel to Bali next month.',
  '["We will travel to Bali next month.", "We are going to travel to Bali next month.", "We travel to Bali next month.", "We traveled to Bali next month."]',
  1, 'Future Tense', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Future Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "She will to call you tonight."',
  'She will call you tonight.', NULL, NULL, 'Future Tense', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Future Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "They are go to buy a new car."',
  'They are going to buy a new car.', NULL, NULL, 'Future Tense', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Future Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  '___ (you / come) to the party tomorrow?',
  'Are you going to come', NULL, NULL, 'Future Tense', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Future Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'I don''t think it ___ (be) easy.',
  'will be', NULL, NULL, 'Future Tense', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Future Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'Choose the correct form: "He ___ to study medicine when he grows up." (firm plan)',
  'is going to study',
  '["will study", "is going to study", "studies", "studied"]',
  1, 'Future Tense', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Future Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "I will going to the mall later."',
  'I am going to the mall later. / I will go to the mall later.', NULL, NULL, 'Future Tense', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Future Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'The weather forecast says it ___ (be) sunny tomorrow.',
  'will be', NULL, NULL, 'Future Tense', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Future Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'Which word is NOT typically used with the future tense?',
  'yesterday',
  '["tomorrow", "next week", "yesterday", "soon"]',
  2, 'Future Tense', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Future Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'She ___ (not / attend) the meeting tomorrow. She is sick.',
  'will not attend / is not going to attend', NULL, NULL, 'Future Tense', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Future Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "Will you to join us for dinner?"',
  'Will you join us for dinner?', NULL, NULL, 'Future Tense', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Future Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'I promise I ___ (not / tell) anyone your secret.',
  'will not tell', NULL, NULL, 'Future Tense', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Future Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  '"I think robots ___ replace many jobs in the future." Choose the best form.',
  'will replace',
  '["are going to replace", "will replace", "replaced", "replacing"]',
  1, 'Future Tense', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Future Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'Watch out! You ___ (fall)!',
  'are going to fall', NULL, NULL, 'Future Tense', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Future Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "We going to celebrate her birthday next Friday."',
  'We are going to celebrate her birthday next Friday.', NULL, NULL, 'Future Tense', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Future Tense';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'Which sentence is a prediction based on evidence?',
  'She is going to have a baby — look at her belly!',
  '["She will have a baby someday.", "She is going to have a baby — look at her belly!", "She has a baby.", "She had a baby."]',
  1, 'Future Tense', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Future Tense';

-- ============================================================
-- MODULE 3: Comparative & Superlative
-- ============================================================
INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'Mount Everest is ___ (tall) mountain in the world.',
  'the tallest', NULL, NULL, 'Comparative & Superlative', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Comparative & Superlative';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'A car is ___ (fast) than a bicycle.',
  'faster', NULL, NULL, 'Comparative & Superlative', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Comparative & Superlative';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'This is ___ (bad) movie I have ever seen.',
  'the worst', NULL, NULL, 'Comparative & Superlative', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Comparative & Superlative';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'Choose the correct comparative form of "beautiful".',
  'more beautiful',
  '["beautifuler", "more beautiful", "beautifuller", "most beautiful"]',
  1, 'Comparative & Superlative', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Comparative & Superlative';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'What is the superlative form of "good"?',
  'the best',
  '["the goodest", "the most good", "the better", "the best"]',
  3, 'Comparative & Superlative', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Comparative & Superlative';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "She is more taller than her sister."',
  'She is taller than her sister.', NULL, NULL, 'Comparative & Superlative', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Comparative & Superlative';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "He is the most tallest player on the team."',
  'He is the tallest player on the team.', NULL, NULL, 'Comparative & Superlative', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Comparative & Superlative';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'Today is ___ (hot) than yesterday.',
  'hotter', NULL, NULL, 'Comparative & Superlative', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Comparative & Superlative';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'This exercise is ___ (difficult) than the last one.',
  'more difficult', NULL, NULL, 'Comparative & Superlative', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Comparative & Superlative';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'Choose the correct sentence.',
  'This is the most expensive hotel in the city.',
  '["This is the expensivest hotel in the city.", "This is the most expensive hotel in the city.", "This is more expensive hotel in the city.", "This is the more expensive hotel in the city."]',
  1, 'Comparative & Superlative', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Comparative & Superlative';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'My English is getting ___ (good) every day.',
  'better', NULL, NULL, 'Comparative & Superlative', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Comparative & Superlative';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "This bag is more cheap than that one."',
  'This bag is cheaper than that one.', NULL, NULL, 'Comparative & Superlative', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Comparative & Superlative';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'He is ___ (young) of the three brothers.',
  'the youngest', NULL, NULL, 'Comparative & Superlative', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Comparative & Superlative';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'What word do we add before long adjectives to make comparatives?',
  'more',
  '["most", "more", "very", "much"]',
  1, 'Comparative & Superlative', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Comparative & Superlative';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "Summer is the most hot season."',
  'Summer is the hottest season.', NULL, NULL, 'Comparative & Superlative', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Comparative & Superlative';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'This cake is ___ (sweet) than the one I made yesterday.',
  'sweeter', NULL, NULL, 'Comparative & Superlative', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Comparative & Superlative';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'Which is the correct comparative form of "far"?',
  'farther / further',
  '["farer", "more far", "farther / further", "farthest"]',
  2, 'Comparative & Superlative', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Comparative & Superlative';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'Of all the students, Ana works ___ (hard).',
  'the hardest', NULL, NULL, 'Comparative & Superlative', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Comparative & Superlative';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "She is the more intelligent student in the class."',
  'She is the most intelligent student in the class.', NULL, NULL, 'Comparative & Superlative', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Comparative & Superlative';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'Choose the correct sentence comparing two things.',
  'Dogs are friendlier than cats.',
  '["Dogs are more friendlier than cats.", "Dogs are friendlier than cats.", "Dogs are the friendliest than cats.", "Dogs are friendly than cats."]',
  1, 'Comparative & Superlative', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Comparative & Superlative';

-- ============================================================
-- MODULE 4: Basic Modal Verbs (can, must, should, could)
-- ============================================================
INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'You ___ eat more vegetables. They are good for you. (advice)',
  'should', NULL, NULL, 'Modal Verbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Modal Verbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'I ___ swim when I was five years old. (past ability)',
  'could', NULL, NULL, 'Modal Verbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Modal Verbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'You ___ touch that wire! It''s dangerous. (prohibition)',
  'must not / mustn''t', NULL, NULL, 'Modal Verbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Modal Verbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'She ___ speak three languages. (present ability)',
  'can', NULL, NULL, 'Modal Verbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Modal Verbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'Which modal expresses obligation or necessity?',
  'must',
  '["can", "should", "must", "could"]',
  2, 'Modal Verbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Modal Verbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  '"___ I borrow your pen?" — What is the most polite option?',
  'Could',
  '["Must", "Should", "Could", "Will"]',
  2, 'Modal Verbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Modal Verbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "She can to drive a car."',
  'She can drive a car.', NULL, NULL, 'Modal Verbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Modal Verbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "You should to rest more."',
  'You should rest more.', NULL, NULL, 'Modal Verbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Modal Verbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "He musts finish the report today."',
  'He must finish the report today.', NULL, NULL, 'Modal Verbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Modal Verbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'Choose the correct sentence.',
  'You should not stay up too late.',
  '["You should not to stay up too late.", "You should not stayed up too late.", "You should not stay up too late.", "You shouldn''t to stay up too late."]',
  2, 'Modal Verbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Modal Verbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  '___ you help me carry this box? (request)',
  'Can / Could', NULL, NULL, 'Modal Verbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Modal Verbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'Students ___ not use their phones during the exam.',
  'must', NULL, NULL, 'Modal Verbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Modal Verbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'Which sentence gives advice?',
  'You should drink more water.',
  '["You must drink more water.", "You should drink more water.", "You can drink more water.", "You could drink more water."]',
  1, 'Modal Verbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Modal Verbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "Could you to open the window please?"',
  'Could you open the window please?', NULL, NULL, 'Modal Verbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Modal Verbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'When I was young, I ___ run very fast, but now I can''t.',
  'could', NULL, NULL, 'Modal Verbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Modal Verbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'You ___ park here. It''s a no-parking zone.',
  'must not / can''t', NULL, NULL, 'Modal Verbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Modal Verbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'Which modal is used for past ability?',
  'could',
  '["must", "should", "will", "could"]',
  3, 'Modal Verbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Modal Verbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "You must to wear a seatbelt in the car."',
  'You must wear a seatbelt in the car.', NULL, NULL, 'Modal Verbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Modal Verbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'I ___ understand the question. It''s too confusing. (inability)',
  'can''t / cannot', NULL, NULL, 'Modal Verbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Modal Verbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  '"You ___ wash your hands before eating." What fits best?',
  'should',
  '["could", "must", "should", "can"]',
  2, 'Modal Verbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Modal Verbs';

-- ============================================================
-- MODULE 5: Conjunctions (and, but, because, so, although)
-- ============================================================
INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'I was tired, ___ I went to bed early.',
  'so', NULL, NULL, 'Conjunctions', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Conjunctions';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'She studied hard ___ she passed the exam.',
  'because / so', NULL, NULL, 'Conjunctions', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Conjunctions';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  '___ it was raining, we still went for a walk.',
  'Although', NULL, NULL, 'Conjunctions', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Conjunctions';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'I like coffee ___ tea.',
  'and', NULL, NULL, 'Conjunctions', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Conjunctions';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'He is rich ___ he is not happy.',
  'but', NULL, NULL, 'Conjunctions', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Conjunctions';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'Which conjunction shows contrast?',
  'but',
  '["and", "so", "because", "but"]',
  3, 'Conjunctions', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Conjunctions';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'Which conjunction shows reason/cause?',
  'because',
  '["although", "but", "so", "because"]',
  3, 'Conjunctions', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Conjunctions';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'Choose the correct sentence.',
  'I was hungry, so I made a sandwich.',
  '["I was hungry, although I made a sandwich.", "I was hungry, so I made a sandwich.", "I was hungry, but I made a sandwich.", "I was hungry, because I made a sandwich."]',
  1, 'Conjunctions', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Conjunctions';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "I like cats but I also like dog."',
  'I like cats but I also like dogs.', NULL, NULL, 'Conjunctions', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Conjunctions';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "She failed the test although she studied."  — Is this correct?',
  'Correct! "Although she studied, she failed the test." is the same meaning.', NULL, NULL, 'Conjunctions', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Conjunctions';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'I didn''t go to school ___ I was sick.',
  'because', NULL, NULL, 'Conjunctions', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Conjunctions';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'She is smart ___ hardworking.',
  'and', NULL, NULL, 'Conjunctions', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Conjunctions';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "He wanted to come, so he was busy."',
  'He wanted to come, but he was busy.', NULL, NULL, 'Conjunctions', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Conjunctions';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  '"___ I don''t like the weather here, I love the people." Which fits?',
  'Although',
  '["Because", "So", "And", "Although"]',
  3, 'Conjunctions', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Conjunctions';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'It was late, ___ we decided to take a taxi.',
  'so', NULL, NULL, 'Conjunctions', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Conjunctions';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "Because she was late, and she missed the bus."',
  'Because she was late, she missed the bus.', NULL, NULL, 'Conjunctions', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Conjunctions';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'The food was expensive ___ delicious.',
  'but', NULL, NULL, 'Conjunctions', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Conjunctions';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  '"So" is used to show...',
  'result or effect',
  '["contrast", "reason", "result or effect", "addition"]',
  2, 'Conjunctions', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Conjunctions';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  '___ she was nervous, she gave a great speech.',
  'Although', NULL, NULL, 'Conjunctions', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Conjunctions';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "I like swimming but also I enjoy running."',
  'I like swimming, and I also enjoy running.', NULL, NULL, 'Conjunctions', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Conjunctions';

-- ============================================================
-- MODULE 6: Basic Adverbs
-- ============================================================
INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'She ___ wakes up at 6 AM. (every day without exception)',
  'always', NULL, NULL, 'Adverbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Adverbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'He ___ eats breakfast. He usually skips it. (not at any time)',
  'never', NULL, NULL, 'Adverbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Adverbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'I ___ go to the gym — maybe twice a week.',
  'sometimes / often', NULL, NULL, 'Adverbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Adverbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'Please speak ___. I can''t hear you. (opposite of quietly)',
  'loudly', NULL, NULL, 'Adverbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Adverbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'Where does a frequency adverb usually go in a sentence?',
  'Before the main verb (after subject)',
  '["At the end of the sentence", "Before the subject", "Before the main verb (after subject)", "After the object"]',
  2, 'Adverbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Adverbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'Which sentence is correct?',
  'She always drinks coffee in the morning.',
  '["She drinks always coffee in the morning.", "Always she drinks coffee in the morning.", "She always drinks coffee in the morning.", "She drinks coffee always in the morning."]',
  2, 'Adverbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Adverbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "He runs very fastly."',
  'He runs very fast.', NULL, NULL, 'Adverbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Adverbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "I never have been to Paris." (simple present context)',
  'I have never been to Paris.', NULL, NULL, 'Adverbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Adverbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'The adverb form of "quick" is ___.',
  'quickly', NULL, NULL, 'Adverbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Adverbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'The adverb form of "careful" is ___.',
  'carefully', NULL, NULL, 'Adverbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Adverbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'What is the adverb form of "good"?',
  'well',
  '["goodly", "well", "good", "gooder"]',
  1, 'Adverbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Adverbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "She speaks English very good."',
  'She speaks English very well.', NULL, NULL, 'Adverbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Adverbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'He is ___ late for work. (about 90% of the time)',
  'usually / often', NULL, NULL, 'Adverbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Adverbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'Choose the correct order of frequency (highest to lowest).',
  'always → usually → sometimes → rarely → never',
  '["always → sometimes → usually → never → rarely", "always → usually → sometimes → rarely → never", "usually → always → sometimes → rarely → never", "never → rarely → sometimes → usually → always"]',
  1, 'Adverbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Adverbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "They played the game very hardly."',
  'They played the game very hard.', NULL, NULL, 'Adverbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Adverbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'Drive ___! The road is wet. (in a careful way)',
  'carefully', NULL, NULL, 'Adverbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Adverbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'Which word is an adverb of manner?',
  'slowly',
  '["happy", "slow", "slowly", "slowness"]',
  2, 'Adverbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Adverbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'The baby is sleeping. Please speak ___.',
  'quietly / softly', NULL, NULL, 'Adverbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Adverbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "She sings beautiful."',
  'She sings beautifully.', NULL, NULL, 'Adverbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Adverbs';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'In "He is always tired after work," the adverb "always" modifies...',
  'the adjective "tired"',
  '["the noun ''work''", "the verb ''is''", "the adjective ''tired''", "the whole sentence"]',
  2, 'Adverbs', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Basic Adverbs';

-- ============================================================
-- MODULE 7: A2 Chunks (end up / turn out / used to)
-- ============================================================
INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'I ___ live in Jakarta, but now I live in Bandung.',
  'used to', NULL, NULL, 'A2 Chunks', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'A2 Chunks';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'She ___ working late every night when she had that job.',
  'used to end up', NULL, NULL, 'A2 Chunks', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'A2 Chunks';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'It ___ that the restaurant was closed, so we went home.',
  'turned out', NULL, NULL, 'A2 Chunks', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'A2 Chunks';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'We ___ spending the whole day at the beach.',
  'ended up', NULL, NULL, 'A2 Chunks', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'A2 Chunks';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  '"Turn out" means...',
  'to happen or result in a certain way',
  '["to spin something around", "to happen or result in a certain way", "to turn off a light", "to arrive somewhere"]',
  1, 'A2 Chunks', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'A2 Chunks';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'Which sentence uses "used to" correctly?',
  'He used to play football every weekend.',
  '["He used to playing football every weekend.", "He used to plays football every weekend.", "He used to played football every weekend.", "He used to play football every weekend."]',
  3, 'A2 Chunks', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'A2 Chunks';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "I use to hate vegetables when I was a child."',
  'I used to hate vegetables when I was a child.', NULL, NULL, 'A2 Chunks', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'A2 Chunks';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "We end up going to the wrong station."',
  'We ended up going to the wrong station.', NULL, NULL, 'A2 Chunks', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'A2 Chunks';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'The movie ___ being really good, even though the reviews were bad.',
  'turned out to be', NULL, NULL, 'A2 Chunks', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'A2 Chunks';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  '"End up" is typically followed by...',
  'verb + -ing',
  '["infinitive (to + verb)", "verb + -ing", "past tense verb", "noun only"]',
  1, 'A2 Chunks', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'A2 Chunks';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'Did you ___ (use to) have a pet when you were young?',
  'used to have', NULL, NULL, 'A2 Chunks', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'A2 Chunks';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "It turned out to being a great trip."',
  'It turned out to be a great trip.', NULL, NULL, 'A2 Chunks', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'A2 Chunks';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'They argued for hours and ___ not talking to each other.',
  'ended up', NULL, NULL, 'A2 Chunks', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'A2 Chunks';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'What does "used to" express?',
  'A habit or state in the past that no longer exists',
  '["A habit happening right now", "A future plan", "A habit or state in the past that no longer exists", "A polite request"]',
  2, 'A2 Chunks', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'A2 Chunks';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'The plan didn''t work, and we ___ waiting in line for nothing.',
  'ended up', NULL, NULL, 'A2 Chunks', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'A2 Chunks';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "She used to goes to church every Sunday."',
  'She used to go to church every Sunday.', NULL, NULL, 'A2 Chunks', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'A2 Chunks';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'How did the exam ___? Did you pass?',
  'turn out', NULL, NULL, 'A2 Chunks', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'A2 Chunks';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'Complete: "We got lost and ___ sleeping in the car."',
  'ended up',
  '["used to", "turned out", "ended up", "end up"]',
  2, 'A2 Chunks', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'A2 Chunks';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'I ___ (not) be afraid of dogs, but now I love them.',
  'used not to / didn''t use to', NULL, NULL, 'A2 Chunks', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'A2 Chunks';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "It turn out that he was right all along."',
  'It turned out that he was right all along.', NULL, NULL, 'A2 Chunks', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'A2 Chunks';

-- ============================================================
-- MODULE 8: Possessives (my/mine, your/yours, etc.)
-- ============================================================
INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'This is ___ bag. (belonging to me)',
  'my', NULL, NULL, 'Possessives', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Possessives';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'That pen is not mine. It''s ___. (belonging to you)',
  'yours', NULL, NULL, 'Possessives', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Possessives';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'The cat licked ___ paw. (belonging to it)',
  'its', NULL, NULL, 'Possessives', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Possessives';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'These shoes are ___. (belonging to them)',
  'theirs', NULL, NULL, 'Possessives', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Possessives';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'Which word is a possessive pronoun (used alone, without a noun)?',
  'mine',
  '["my", "mine", "me", "I"]',
  1, 'Possessives', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Possessives';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'Choose the correct sentence.',
  'Is this your jacket or hers?',
  '["Is this your jacket or her''s?", "Is this your jacket or hers?", "Is this yours jacket or hers?", "Is this your jacket or her?"]',
  1, 'Possessives', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Possessives';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "This is her''s book."',
  'This is her book. / This book is hers.', NULL, NULL, 'Possessives', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Possessives';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "The dog wagged it''s tail."',
  'The dog wagged its tail.', NULL, NULL, 'Possessives', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Possessives';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'We finished ___ homework. (belonging to us)',
  'our', NULL, NULL, 'Possessives', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Possessives';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'That car is ___. (belonging to us — standalone)',
  'ours', NULL, NULL, 'Possessives', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Possessives';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'What is the possessive adjective for "he"?',
  'his',
  '["him", "he", "his", "himself"]',
  2, 'Possessives', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Possessives';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "Their house is bigger than our''s."',
  'Their house is bigger than ours.', NULL, NULL, 'Possessives', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Possessives';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  '___ phone rang during the meeting. (belonging to her)',
  'Her', NULL, NULL, 'Possessives', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Possessives';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  '"Its" vs "It''s" — which one shows possession?',
  'its',
  '["it''s", "its", "both", "neither"]',
  1, 'Possessives', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Possessives';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "Is this book your or mine?"',
  'Is this book yours or mine?', NULL, NULL, 'Possessives', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Possessives';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'The students submitted ___ assignments on time.',
  'their', NULL, NULL, 'Possessives', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Possessives';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'Choose the correct possessive pronoun: "This bicycle is not ___, it belongs to Tom."',
  'mine',
  '["my", "mine", "me", "I"]',
  1, 'Possessives', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Possessives';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'He forgot ___ keys at home.',
  'his', NULL, NULL, 'Possessives', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Possessives';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "The children lost there toys."',
  'The children lost their toys.', NULL, NULL, 'Possessives', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Possessives';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'Which sentence is correct?',
  'The results speak for themselves.',
  '["The results speak for theirselves.", "The results speak for themself.", "The results speak for themselves.", "The results speak for theirself."]',
  2, 'Possessives', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Possessives';

-- ============================================================
-- MODULE 9: Countable vs Uncountable
-- ============================================================
INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'Can I have ___ water, please? (some/any)',
  'some', NULL, NULL, 'Countable vs Uncountable', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Countable vs Uncountable';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'There are ___ apples in the basket. (a few / a little)',
  'a few', NULL, NULL, 'Countable vs Uncountable', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Countable vs Uncountable';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'I only have ___ money left. (a few / a little)',
  'a little', NULL, NULL, 'Countable vs Uncountable', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Countable vs Uncountable';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'Which of these is an uncountable noun?',
  'information',
  '["book", "car", "information", "idea"]',
  2, 'Countable vs Uncountable', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Countable vs Uncountable';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'Which sentence is correct?',
  'She gave me some advice.',
  '["She gave me an advice.", "She gave me some advices.", "She gave me some advice.", "She gave me a advice."]',
  2, 'Countable vs Uncountable', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Countable vs Uncountable';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "I need some informations about the flight."',
  'I need some information about the flight.', NULL, NULL, 'Countable vs Uncountable', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Countable vs Uncountable';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "She has a lot of luggages."',
  'She has a lot of luggage.', NULL, NULL, 'Countable vs Uncountable', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Countable vs Uncountable';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'Is there ___ milk in the fridge? (some / any — question)',
  'any', NULL, NULL, 'Countable vs Uncountable', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Countable vs Uncountable';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'We use "___ " for countable nouns (small number) and "___ " for uncountable nouns (small amount).',
  'a few / a little', NULL, NULL, 'Countable vs Uncountable', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Countable vs Uncountable';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'Which noun CAN be counted?',
  'chair',
  '["furniture", "weather", "music", "chair"]',
  3, 'Countable vs Uncountable', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Countable vs Uncountable';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "I don''t have many money."',
  'I don''t have much money.', NULL, NULL, 'Countable vs Uncountable', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Countable vs Uncountable';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'There isn''t ___ sugar in my coffee. (much / many)',
  'much', NULL, NULL, 'Countable vs Uncountable', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Countable vs Uncountable';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'How ___ students are in your class? (much / many)',
  'many', NULL, NULL, 'Countable vs Uncountable', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Countable vs Uncountable';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'Which is correct: "a piece of ___"?',
  'advice',
  '["books", "dogs", "advice", "cars"]',
  2, 'Countable vs Uncountable', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Countable vs Uncountable';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "Can you give me an information?"',
  'Can you give me some information? / Can you give me a piece of information?', NULL, NULL, 'Countable vs Uncountable', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Countable vs Uncountable';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'We need ___ flour for this recipe. (a lot of / many)',
  'a lot of', NULL, NULL, 'Countable vs Uncountable', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Countable vs Uncountable';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  '"Much" is used with...',
  'uncountable nouns in questions and negatives',
  '["countable nouns in questions", "uncountable nouns in questions and negatives", "any noun in any sentence", "plural countable nouns"]',
  1, 'Countable vs Uncountable', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Countable vs Uncountable';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "He gave me many helpful advices."',
  'He gave me a lot of helpful advice.', NULL, NULL, 'Countable vs Uncountable', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Countable vs Uncountable';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'There are ___ clouds in the sky today. (many / much)',
  'many', NULL, NULL, 'Countable vs Uncountable', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Countable vs Uncountable';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'Which sentence is correct?',
  'I have a little patience left.',
  '["I have a few patience left.", "I have a little patience left.", "I have little patients left.", "I have few patience left."]',
  1, 'Countable vs Uncountable', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Countable vs Uncountable';

-- ============================================================
-- MODULE 10: Simple Complex Sentences (if/when clauses)
-- ============================================================
INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'If it ___ (rain) tomorrow, we will stay home.',
  'rains', NULL, NULL, 'If/When Clauses', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Simple Complex Sentences';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'When she ___ (arrive), call me immediately.',
  'arrives', NULL, NULL, 'If/When Clauses', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Simple Complex Sentences';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'If you study hard, you ___ (pass) the test.',
  'will pass', NULL, NULL, 'If/When Clauses', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Simple Complex Sentences';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'I ___ (call) you when I get home.',
  'will call', NULL, NULL, 'If/When Clauses', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Simple Complex Sentences';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'In a real conditional sentence (Type 1), the if-clause uses...',
  'simple present tense',
  '["will + verb", "simple present tense", "past tense", "present perfect"]',
  1, 'If/When Clauses', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Simple Complex Sentences';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'Choose the correct sentence.',
  'If she calls, I will answer.',
  '["If she will call, I will answer.", "If she calls, I will answer.", "If she call, I will answer.", "If she called, I will answer."]',
  1, 'If/When Clauses', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Simple Complex Sentences';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "If it will rain, we will cancel the trip."',
  'If it rains, we will cancel the trip.', NULL, NULL, 'If/When Clauses', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Simple Complex Sentences';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "When he will arrive, tell him to call me."',
  'When he arrives, tell him to call me.', NULL, NULL, 'If/When Clauses', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Simple Complex Sentences';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'If you don''t hurry, you ___ (miss) the train.',
  'will miss', NULL, NULL, 'If/When Clauses', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Simple Complex Sentences';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  '"Unless" means...',
  'if not',
  '["and also", "if not", "because", "although"]',
  1, 'If/When Clauses', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Simple Complex Sentences';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'Unless you hurry, you ___ (be) late.',
  'will be', NULL, NULL, 'If/When Clauses', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Simple Complex Sentences';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "I will call you when I will finish work."',
  'I will call you when I finish work.', NULL, NULL, 'If/When Clauses', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Simple Complex Sentences';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'If water reaches 100°C, it ___ (boil). (general truth)',
  'boils', NULL, NULL, 'If/When Clauses', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Simple Complex Sentences';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'Which sentence states a general truth?',
  'If you heat water to 100°C, it boils.',
  '["If you heat water, it will boil tomorrow.", "If you heat water to 100°C, it boils.", "If you heated water, it would boil.", "When you heat water, it boiled."]',
  1, 'If/When Clauses', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Simple Complex Sentences';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "When I will be older, I want to travel the world."',
  'When I am older, I want to travel the world.', NULL, NULL, 'If/When Clauses', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Simple Complex Sentences';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'If you ___ (not / eat) breakfast, you will feel weak.',
  'don''t eat', NULL, NULL, 'If/When Clauses', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Simple Complex Sentences';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'The "when" clause refers to something...',
  'certain to happen in the future',
  '["that might happen", "certain to happen in the future", "impossible to happen", "that happened in the past"]',
  1, 'If/When Clauses', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Simple Complex Sentences';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'fill_blank',
  'She will feel better if she ___ (rest) for a few days.',
  'rests', NULL, NULL, 'If/When Clauses', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Simple Complex Sentences';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'error_correction',
  'Find and correct the error: "If you will need help, ask me."',
  'If you need help, ask me.', NULL, NULL, 'If/When Clauses', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Simple Complex Sentences';

INSERT INTO cards (module_id, type, question, answer, options, correct_index, category, is_system)
SELECT m.id, 'multiple_choice',
  'Which sentence is a correct Type 1 conditional?',
  'If she studies, she will pass.',
  '["If she will study, she will pass.", "If she studied, she will pass.", "If she studies, she will pass.", "If she study, she will pass."]',
  2, 'If/When Clauses', true
FROM modules m JOIN levels l ON m.level_id = l.id WHERE l.name = 'A2' AND m.name = 'Simple Complex Sentences';

-- ============================================================
-- UPDATE total_cards for all A2 modules
-- ============================================================
UPDATE modules
SET total_cards = (
  SELECT COUNT(*) FROM cards
  WHERE cards.module_id = modules.id
)
WHERE level_id = (SELECT id FROM levels WHERE name = 'A2');
