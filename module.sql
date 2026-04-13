-- ============================================================
-- RESET SEED DATA (levels & modules only, cards kosong)
-- ============================================================

-- Hapus modules dulu (foreign key ke levels)
DELETE FROM modules;

-- Hapus levels
DELETE FROM levels;

-- ============================================================
-- SEED LEVELS: A1 → C2
-- ============================================================
INSERT INTO levels (name, label, "order") VALUES
  ('A1', 'Beginner',          1),
  ('A2', 'Elementary',        2),
  ('B1', 'Intermediate',      3),
  ('B2', 'Upper-Intermediate',4),
  ('C1', 'Advanced',          5),
  ('C2', 'Mastery',           6);

-- ============================================================
-- SEED MODULES — A1 (10 modules)
-- ============================================================
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'To Be',                  'is, am, are, was, were',                        0, 1  FROM levels WHERE name = 'A1';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Subject Pronouns',       'I, you, he, she, it, we, they',                 0, 2  FROM levels WHERE name = 'A1';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Simple Present Tense',   'daily habits & facts',                          0, 3  FROM levels WHERE name = 'A1';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Simple Past Tense',      'past completed actions',                        0, 4  FROM levels WHERE name = 'A1';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Basic Nouns & Articles', 'a / an / the',                                  0, 5  FROM levels WHERE name = 'A1';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Basic Adjectives',       'big, small, good, bad',                         0, 6  FROM levels WHERE name = 'A1';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Question Words',         'what, where, when, who, why, how',              0, 7  FROM levels WHERE name = 'A1';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Basic Negative Sentences','don''t, doesn''t, isn''t',                     0, 8  FROM levels WHERE name = 'A1';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Basic Chunks',           'I want to / I need to / can you',               0, 9  FROM levels WHERE name = 'A1';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Basic Prepositions',     'in, on, at, under, beside',                     0, 10 FROM levels WHERE name = 'A1';

-- ============================================================
-- SEED MODULES — A2 (10 modules)
-- ============================================================
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Present Continuous Tense',    'I am running — actions happening now',     0, 1  FROM levels WHERE name = 'A2';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Future Tense',                'will / going to — plans & predictions',    0, 2  FROM levels WHERE name = 'A2';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Comparative & Superlative',   'bigger / the biggest',                     0, 3  FROM levels WHERE name = 'A2';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Basic Modal Verbs',           'can, must, should, could',                 0, 4  FROM levels WHERE name = 'A2';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Conjunctions',               'and, but, because, so, although',           0, 5  FROM levels WHERE name = 'A2';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Basic Adverbs',              'always, never, sometimes, quickly',         0, 6  FROM levels WHERE name = 'A2';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'A2 Chunks',                  'end up / turn out / used to',               0, 7  FROM levels WHERE name = 'A2';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Possessives',                'my/mine, your/yours',                       0, 8  FROM levels WHERE name = 'A2';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Countable vs Uncountable',   'one bug vs some water',                     0, 9  FROM levels WHERE name = 'A2';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Simple Complex Sentences',   'if/when clauses — If it rains, I will...',  0, 10 FROM levels WHERE name = 'A2';

-- ============================================================
-- SEED MODULES — B1 (10 modules)
-- ============================================================
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Present Perfect Tense',   'have / has + past participle',                 0, 1  FROM levels WHERE name = 'B1';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Past Continuous Tense',   'I was working when...',                        0, 2  FROM levels WHERE name = 'B1';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Basic Passive Voice',     'The bug was fixed',                            0, 3  FROM levels WHERE name = 'B1';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Advanced Modal Verbs',    'might, would, shall',                          0, 4  FROM levels WHERE name = 'B1';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Basic Reported Speech',   'She said that...',                             0, 5  FROM levels WHERE name = 'B1';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Common Phrasal Verbs',    'give up, look into, set up',                   0, 6  FROM levels WHERE name = 'B1';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'B1 Chunks',              'on the other hand / as a result',               0, 7  FROM levels WHERE name = 'B1';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Relative Clauses',       'the app that I built',                          0, 8  FROM levels WHERE name = 'B1';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Gerund vs Infinitive',   'enjoy coding vs want to code',                  0, 9  FROM levels WHERE name = 'B1';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Vocabulary Expansion',   'synonyms, antonyms, word families',             0, 10 FROM levels WHERE name = 'B1';

-- ============================================================
-- SEED MODULES — B2 (10 modules)
-- ============================================================
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Present Perfect Continuous', 'I have been working for 2 hours',          0, 1  FROM levels WHERE name = 'B2';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Past Perfect Tense',         'I had finished before he arrived',         0, 2  FROM levels WHERE name = 'B2';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Advanced Passive Voice',     'passive across all tenses',                0, 3  FROM levels WHERE name = 'B2';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Advanced Conditionals',      'If I had known, I would have fixed it',    0, 4  FROM levels WHERE name = 'B2';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Advanced Reported Speech',   'reporting questions & commands',           0, 5  FROM levels WHERE name = 'B2';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Advanced Phrasal Verbs',     'come across, put up with',                 0, 6  FROM levels WHERE name = 'B2';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'B2 Chunks',                 'it goes without saying / bear in mind',     0, 7  FROM levels WHERE name = 'B2';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Inversion',                 'Not only did I... — formal emphasis',       0, 8  FROM levels WHERE name = 'B2';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Discourse Markers',         'nevertheless, furthermore, in contrast',    0, 9  FROM levels WHERE name = 'B2';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Collocations & Idioms',     'make a decision, break a habit',            0, 10 FROM levels WHERE name = 'B2';

-- ============================================================
-- SEED MODULES — C1 (10 modules)
-- ============================================================
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Mixed Conditionals',         'past + present hypothetical mix',           0, 1  FROM levels WHERE name = 'C1';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Subjunctive',                'I suggest that he be... — formal',          0, 2  FROM levels WHERE name = 'C1';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Cleft Sentences',            'It was the deadline that stressed me out',  0, 3  FROM levels WHERE name = 'C1';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Advanced Passive Forms',     'complex passive across tense & context',   0, 4  FROM levels WHERE name = 'C1';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Ellipsis & Substitution',   '"Are you coming?" "I might." — native shortcuts', 0, 5 FROM levels WHERE name = 'C1';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'C1 Phrasal Verbs',           'see through, fall back on',                0, 6  FROM levels WHERE name = 'C1';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Register & Tone',            'formal vs informal vs casual switching',   0, 7  FROM levels WHERE name = 'C1';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'C1 Chunks',                 'needless to say / all things considered',   0, 8  FROM levels WHERE name = 'C1';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Discourse & Cohesion',      'smooth flow from idea to idea',             0, 9  FROM levels WHERE name = 'C1';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Nuance Vocabulary',         'imply vs infer, subtle vs obvious',         0, 10 FROM levels WHERE name = 'C1';

-- ============================================================
-- SEED MODULES — C2 (8 modules)
-- ============================================================
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Stylistic Variation',        'journalistic, academic, casual, poetic',   0, 1  FROM levels WHERE name = 'C2';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Advanced Idioms & Fixed Expressions', 'all native idioms used correctly', 0, 2 FROM levels WHERE name = 'C2';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Pragmatics',                 'hidden meaning, humor, sarcasm, implication', 0, 3 FROM levels WHERE name = 'C2';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Intonation & Stress',        'which word to stress changes meaning',     0, 4  FROM levels WHERE name = 'C2';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Hedging & Vagueness',        'sort of, kind of, roughly, more or less',  0, 5  FROM levels WHERE name = 'C2';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Advanced Collocations',      'natural word combos without thinking',     0, 6  FROM levels WHERE name = 'C2';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Cultural References',        'humor, context, and unwritten meaning',    0, 7  FROM levels WHERE name = 'C2';
INSERT INTO modules (level_id, name, description, total_cards, "order")
SELECT id, 'Speed & Automaticity',       'all grammar & vocab running on autopilot', 0, 8  FROM levels WHERE name = 'C2';