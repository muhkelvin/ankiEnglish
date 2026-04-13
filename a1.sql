-- ============================================================
-- SEED CARDS: A1 — 10 modules × 20 cards
-- Rasio: 10 fill_blank + 6 multiple_choice + 4 error_correction
-- Jalankan SETELAH seed levels & modules sudah ada
-- ============================================================

-- Helper: kita pakai subquery langsung untuk dapat module_id

-- ============================================================
-- MODULE 1: To Be (is, am, are, was, were)
-- ============================================================

-- FILL IN THE BLANK (10 cards)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(
  (SELECT id FROM modules WHERE name = 'To Be' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'She ___ a student. (to be untuk she)',
  'She IS a student. ("is" digunakan untuk he/she/it)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'To Be' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'I ___ happy today. (to be untuk I)',
  'I AM happy today. ("am" hanya digunakan untuk I)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'To Be' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'They ___ my friends. (to be untuk they)',
  'They ARE my friends. ("are" digunakan untuk you/we/they)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'To Be' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'We ___ at school right now. (to be untuk we)',
  'We ARE at school right now. ("are" digunakan untuk we)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'To Be' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'He ___ a doctor. (to be untuk he)',
  'He IS a doctor. ("is" digunakan untuk he/she/it)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'To Be' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'Yesterday, she ___ sick. (to be past untuk she)',
  'Yesterday, she WAS sick. ("was" adalah bentuk past dari is/am)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'To Be' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'They ___ late for class yesterday. (to be past untuk they)',
  'They WERE late for class yesterday. ("were" adalah bentuk past dari are)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'To Be' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'It ___ very cold last night. (to be past untuk it)',
  'It WAS very cold last night. ("was" digunakan untuk he/she/it di past)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'To Be' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'You ___ my best friend. (to be untuk you)',
  'You ARE my best friend. ("are" digunakan untuk you)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'To Be' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'I ___ a student last year. (to be past untuk I)',
  'I WAS a student last year. ("was" adalah bentuk past dari am)',
  true
);

-- MULTIPLE CHOICE (6 cards)
INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES
(
  (SELECT id FROM modules WHERE name = 'To Be' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'Pilih yang benar: "My cat ___ very cute."',
  'is — "is" digunakan untuk he/she/it (my cat = it)',
  '["is", "am", "are", "were"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'To Be' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'Pilih yang benar: "___ you a teacher?"',
  'Are — "are" digunakan untuk you dalam pertanyaan',
  '["Are", "Is", "Am", "Was"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'To Be' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'Pilih yang benar: "We ___ tired after the game."',
  'were — kalimat past (after the game = sudah terjadi), we → were',
  '["were", "was", "are", "is"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'To Be' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'Pilih yang benar: "I ___ not ready yet."',
  'am — "am" hanya untuk I, bentuk negatif: I am not',
  '["am", "is", "are", "was"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'To Be' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'Pilih yang benar: "The books ___ on the table."',
  'are — "books" adalah jamak, gunakan "are"',
  '["are", "is", "was", "am"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'To Be' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'Pilih yang benar: "She ___ a nurse five years ago."',
  'was — kalimat past (five years ago), she → was',
  '["was", "is", "were", "are"]',
  0,
  true
);

-- ERROR CORRECTION (4 cards)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(
  (SELECT id FROM modules WHERE name = 'To Be' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "We is best friends." — Apa yang salah?',
  'We ARE best friends. ("is" salah untuk subjek jamak "we", harus "are")',
  true
),
(
  (SELECT id FROM modules WHERE name = 'To Be' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "I are a developer." — Apa yang salah?',
  'I AM a developer. ("are" tidak bisa digunakan dengan "I", harus "am")',
  true
),
(
  (SELECT id FROM modules WHERE name = 'To Be' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "He were sick yesterday." — Apa yang salah?',
  'He WAS sick yesterday. ("were" untuk past tapi salah, he/she/it → "was")',
  true
),
(
  (SELECT id FROM modules WHERE name = 'To Be' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "They was happy at the party." — Apa yang salah?',
  'They WERE happy at the party. ("was" salah untuk "they", harus "were")',
  true
);

-- ============================================================
-- MODULE 2: Subject Pronouns (I, you, he, she, it, we, they)
-- ============================================================

-- FILL IN THE BLANK (10 cards)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(
  (SELECT id FROM modules WHERE name = 'Subject Pronouns' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'Andi is my friend. ___ is very kind. (ganti "Andi" dengan pronoun)',
  'He is very kind. ("he" untuk laki-laki tunggal)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Subject Pronouns' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'Sari is a doctor. ___ works at a hospital. (ganti "Sari" dengan pronoun)',
  'She works at a hospital. ("she" untuk perempuan tunggal)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Subject Pronouns' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'Budi and I are classmates. ___ study together. (ganti "Budi and I" dengan pronoun)',
  'We study together. ("we" untuk saya + orang lain)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Subject Pronouns' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'The dog is hungry. ___ wants food. (ganti "the dog" dengan pronoun)',
  'It wants food. ("it" untuk hewan/benda)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Subject Pronouns' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'Rini and Dina are sisters. ___ live in Jakarta. (ganti "Rini and Dina" dengan pronoun)',
  'They live in Jakarta. ("they" untuk lebih dari satu orang)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Subject Pronouns' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'Saya suka kopi. ___ drink coffee every morning. (pronoun untuk "saya")',
  'I drink coffee every morning. ("I" selalu kapital untuk "saya")',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Subject Pronouns' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'Kamu adalah pelajar. ___ study English every day. (pronoun untuk "kamu")',
  'You study English every day. ("you" untuk kamu/Anda)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Subject Pronouns' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'The laptop is new. ___ is very fast. (pronoun untuk benda)',
  'It is very fast. ("it" untuk benda)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Subject Pronouns' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'Mr. Hasan is my teacher. ___ explains very well. (pronoun untuk laki-laki)',
  'He explains very well. ("he" untuk laki-laki)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Subject Pronouns' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'Ibu saya adalah guru. ___ teaches at a school. (pronoun untuk perempuan)',
  'She teaches at a school. ("she" untuk perempuan)',
  true
);

-- MULTIPLE CHOICE (6 cards)
INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES
(
  (SELECT id FROM modules WHERE name = 'Subject Pronouns' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'Doni and Rina are students. ___ study hard every day.',
  'They — lebih dari satu orang, gunakan "they"',
  '["They", "We", "It", "He"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Subject Pronouns' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'My phone is broken. ___ doesn''t work anymore.',
  'It — benda/hewan tunggal, gunakan "it"',
  '["It", "He", "She", "They"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Subject Pronouns' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  '___ am a backend developer. (subjek kalimat ini = saya)',
  'I — "am" hanya berpasangan dengan "I"',
  '["I", "You", "We", "He"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Subject Pronouns' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'Mrs. Dewi is kind. ___ always smiles at students.',
  'She — perempuan tunggal, gunakan "she"',
  '["She", "He", "It", "They"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Subject Pronouns' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'My friends and I play basketball. ___ play every Sunday.',
  'We — saya + orang lain, gunakan "we"',
  '["We", "They", "I", "You"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Subject Pronouns' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  '___ are my new neighbors. (kalimat tentang dua orang)',
  'They — lebih dari satu orang, gunakan "they"',
  '["They", "We", "He", "It"]',
  0,
  true
);

-- ERROR CORRECTION (4 cards)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(
  (SELECT id FROM modules WHERE name = 'Subject Pronouns' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "She and I is classmates. We studies together." — Apa yang salah?',
  'She and I ARE classmates. We STUDY together. (jamak → are; we → study bukan studies)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Subject Pronouns' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "My cat is hungry. He wants food." — Apa yang salah?',
  'My cat is hungry. IT wants food. (hewan/benda → "it", bukan "he")',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Subject Pronouns' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "i am happy today." — Apa yang salah?',
  'I am happy today. ("i" harus selalu kapital menjadi "I")',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Subject Pronouns' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "Dito is my brother. She is tall." — Apa yang salah?',
  'Dito is my brother. HE is tall. (Dito = laki-laki, gunakan "he" bukan "she")',
  true
);

-- ============================================================
-- MODULE 3: Simple Present Tense
-- ============================================================

-- FILL IN THE BLANK (10 cards)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(
  (SELECT id FROM modules WHERE name = 'Simple Present Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'She ___ (go) to school every day. (simple present untuk she)',
  'She GOES to school every day. (he/she/it → tambah -s atau -es)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Simple Present Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'I ___ (eat) breakfast every morning. (simple present untuk I)',
  'I EAT breakfast every morning. (I/you/we/they → verb dasar, tanpa -s)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Simple Present Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'They ___ (play) football on weekends. (simple present untuk they)',
  'They PLAY football on weekends. (they → verb dasar)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Simple Present Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'He ___ (watch) TV every night. (simple present untuk he)',
  'He WATCHES TV every night. (watch → watches, tambah -es karena akhiran -ch)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Simple Present Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'We ___ (study) English at school. (simple present untuk we)',
  'We STUDY English at school. (we → verb dasar)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Simple Present Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'She ___ (not/like) spicy food. (simple present negatif untuk she)',
  'She DOES NOT LIKE spicy food. (negatif he/she/it → does not + verb dasar)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Simple Present Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'I ___ (not/drink) coffee. (simple present negatif untuk I)',
  'I DO NOT DRINK coffee. (negatif I/you/we/they → do not + verb dasar)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Simple Present Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  '___ he ___ (work) here? (pertanyaan simple present untuk he)',
  'DOES he WORK here? (pertanyaan he/she/it → Does + subject + verb dasar)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Simple Present Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'The sun ___ (rise) in the east. (fakta umum)',
  'The sun RISES in the east. (the sun = it → tambah -s)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Simple Present Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  '___ you ___ (like) music? (pertanyaan simple present untuk you)',
  'DO you LIKE music? (pertanyaan you/we/they → Do + subject + verb dasar)',
  true
);

-- MULTIPLE CHOICE (6 cards)
INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES
(
  (SELECT id FROM modules WHERE name = 'Simple Present Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'My brother ___ football every Saturday.',
  'plays — he/she/it → tambah -s pada verb',
  '["plays", "play", "played", "playing"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Simple Present Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'I ___ English every day.',
  'study — I → verb dasar tanpa -s',
  '["study", "studies", "studied", "studying"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Simple Present Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'She ___ not eat meat. (kalimat negatif)',
  'does — negatif untuk she → does not',
  '["does", "do", "did", "is"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Simple Present Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  '___ your parents live in Jambi?',
  'Do — your parents = they, pertanyaan → Do',
  '["Do", "Does", "Is", "Are"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Simple Present Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'Water ___ at 100 degrees Celsius. (fakta ilmiah)',
  'boils — the water = it, fakta → simple present + s',
  '["boils", "boil", "boiled", "boiling"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Simple Present Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'We ___ to the gym three times a week.',
  'go — we → verb dasar tanpa -s',
  '["go", "goes", "went", "going"]',
  0,
  true
);

-- ERROR CORRECTION (4 cards)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(
  (SELECT id FROM modules WHERE name = 'Simple Present Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "She don''t like cold weather." — Apa yang salah?',
  'She DOESN''T like cold weather. (she → does not / doesn''t, bukan don''t)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Simple Present Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "He go to work by bus." — Apa yang salah?',
  'He GOES to work by bus. (he → tambah -s/-es pada verb: go → goes)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Simple Present Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "Do she work here?" — Apa yang salah?',
  'DOES she work here? (she → gunakan "does" untuk pertanyaan, bukan "do")',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Simple Present Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "They plays video games every night." — Apa yang salah?',
  'They PLAY video games every night. (they → verb dasar, tidak perlu -s)',
  true
);

-- ============================================================
-- MODULE 4: Simple Past Tense
-- ============================================================

-- FILL IN THE BLANK (10 cards)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(
  (SELECT id FROM modules WHERE name = 'Simple Past Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'I ___ (visit) my grandmother last Sunday. (regular verb past)',
  'I VISITED my grandmother last Sunday. (regular verb: tambah -ed)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Simple Past Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'She ___ (go) to the market yesterday. (irregular verb past)',
  'She WENT to the market yesterday. (go → went, irregular verb)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Simple Past Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'They ___ (watch) a movie last night. (regular verb past)',
  'They WATCHED a movie last night. (watch → watched, tambah -ed)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Simple Past Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'He ___ (eat) pizza for lunch. (irregular verb past)',
  'He ATE pizza for lunch. (eat → ate, irregular verb)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Simple Past Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'We ___ (not/go) to school yesterday. (past negatif)',
  'We DID NOT GO to school yesterday. (negatif past → did not + verb dasar)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Simple Past Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  '___ you ___ (finish) your homework? (pertanyaan past)',
  'DID you FINISH your homework? (pertanyaan past → Did + subject + verb dasar)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Simple Past Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'I ___ (buy) a new laptop last week. (irregular verb past)',
  'I BOUGHT a new laptop last week. (buy → bought, irregular verb)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Simple Past Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'She ___ (study) for three hours last night. (regular verb past)',
  'She STUDIED for three hours last night. (study → studied, y+ed untuk konsonan+y)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Simple Past Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'They ___ (not/like) the food at the restaurant. (past negatif)',
  'They DID NOT LIKE the food at the restaurant. (negatif past → did not + verb dasar)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Simple Past Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'He ___ (see) an accident on his way home. (irregular verb past)',
  'He SAW an accident on his way home. (see → saw, irregular verb)',
  true
);

-- MULTIPLE CHOICE (6 cards)
INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES
(
  (SELECT id FROM modules WHERE name = 'Simple Past Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'She ___ a letter to her friend yesterday.',
  'wrote — write → wrote (irregular verb past)',
  '["wrote", "write", "writes", "writing"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Simple Past Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'They ___ not come to the party last night.',
  'did — negatif past → did not + verb dasar',
  '["did", "do", "does", "were"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Simple Past Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  '___ he call you this morning?',
  'Did — pertanyaan past → Did + subject + verb dasar',
  '["Did", "Does", "Was", "Do"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Simple Past Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'I ___ very tired after the long trip.',
  'was — past tense dari "am" adalah "was"',
  '["was", "am", "is", "were"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Simple Past Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'We ___ to Bali last month.',
  'went — go → went (irregular verb past)',
  '["went", "go", "goes", "going"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Simple Past Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'She ___ not finish the project on time.',
  'did — negatif past untuk she → did not (bukan does not)',
  '["did", "does", "do", "was"]',
  0,
  true
);

-- ERROR CORRECTION (4 cards)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(
  (SELECT id FROM modules WHERE name = 'Simple Past Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "He goed to the office this morning." — Apa yang salah?',
  'He WENT to the office this morning. (go → went, bukan goed. "go" adalah irregular verb)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Simple Past Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "Did she went to school yesterday?" — Apa yang salah?',
  'Did she GO to school yesterday? (setelah Did → verb dasar, bukan past tense)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Simple Past Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "They didn''t played the game." — Apa yang salah?',
  'They didn''t PLAY the game. (setelah didn''t → verb dasar, bukan past tense)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Simple Past Tense' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "I buyed a new shirt yesterday." — Apa yang salah?',
  'I BOUGHT a new shirt yesterday. (buy → bought, bukan buyed. "buy" adalah irregular verb)',
  true
);

-- ============================================================
-- MODULE 5: Basic Nouns & Articles (a, an, the)
-- ============================================================

-- FILL IN THE BLANK (10 cards)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(
  (SELECT id FROM modules WHERE name = 'Basic Nouns & Articles' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'I have ___ cat. (seekor kucing, belum disebutkan sebelumnya)',
  'I have A cat. ("a" untuk benda tunggal yang umum, dimulai konsonan)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Nouns & Articles' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'She is ___ engineer. (seorang insinyur)',
  'She is AN engineer. ("an" digunakan sebelum bunyi vokal: e, i, o, u, a)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Nouns & Articles' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'Please close ___ door. (pintu yang spesifik, sudah diketahui)',
  'Please close THE door. ("the" untuk benda spesifik yang sudah diketahui)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Nouns & Articles' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'I want to be ___ doctor someday. (profesi umum)',
  'I want to be A doctor someday. ("a" sebelum profesi dimulai konsonan)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Nouns & Articles' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  '___ sun is very bright today. (satu-satunya matahari)',
  'THE sun is very bright today. ("the" untuk benda unik yang hanya ada satu)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Nouns & Articles' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'I saw ___ elephant at the zoo. (seekor gajah)',
  'I saw AN elephant at the zoo. ("an" sebelum bunyi vokal: elephant dimulai "e")',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Nouns & Articles' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'Can you open ___ window? (jendela yang sudah jelas/spesifik)',
  'Can you open THE window? ("the" untuk benda spesifik yang sudah diketahui)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Nouns & Articles' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'I need ___ umbrella. It''s raining. (sebuah payung)',
  'I need AN umbrella. ("an" sebelum bunyi vokal: umbrella dimulai "u")',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Nouns & Articles' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'She bought ___ new bag yesterday. (tas baru, umum)',
  'She bought A new bag yesterday. ("a" untuk benda baru yang belum disebutkan)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Nouns & Articles' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  '___ moon is beautiful tonight. (bulan yang unik)',
  'THE moon is beautiful tonight. ("the" untuk benda unik)',
  true
);

-- MULTIPLE CHOICE (6 cards)
INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES
(
  (SELECT id FROM modules WHERE name = 'Basic Nouns & Articles' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'I have ___ orange on my desk.',
  'an — "orange" dimulai bunyi vokal /ɒ/, gunakan "an"',
  '["an", "a", "the", "-"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Nouns & Articles' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'He is ___ honest man.',
  'an — "honest" dimulai bunyi vokal /ɒ/ (h tidak berbunyi), gunakan "an"',
  '["an", "a", "the", "-"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Nouns & Articles' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  '___ Pacific Ocean is the largest ocean.',
  'The — nama samudra/sungai/laut pakai "the"',
  '["The", "A", "An", "-"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Nouns & Articles' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'She wants to be ___ nurse.',
  'a — "nurse" dimulai konsonan /n/, gunakan "a"',
  '["a", "an", "the", "-"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Nouns & Articles' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'I read ___ book you recommended. (buku yang sudah kita bicarakan)',
  'the — buku spesifik yang sudah diketahui, gunakan "the"',
  '["the", "a", "an", "-"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Nouns & Articles' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  '___ dogs are friendly animals. (pernyataan umum tentang anjing)',
  '- (no article) — pernyataan umum jamak tidak pakai artikel',
  '["-", "The", "A", "An"]',
  0,
  true
);

-- ERROR CORRECTION (4 cards)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(
  (SELECT id FROM modules WHERE name = 'Basic Nouns & Articles' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "She is a engineer." — Apa yang salah?',
  'She is AN engineer. ("an" harus digunakan sebelum bunyi vokal: engineer dimulai "e")',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Nouns & Articles' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "I saw the dog in the park. A dog was very cute." — Apa yang salah?',
  'I saw THE dog in the park. THE dog was very cute. (sudah disebutkan sebelumnya → gunakan "the")',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Nouns & Articles' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "Can I borrow a pen on your desk?" — Apa yang salah?',
  'Can I borrow THE pen on your desk? (spesifik → pena yang ada di meja itu, gunakan "the")',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Nouns & Articles' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "He ate a breakfast this morning." — Apa yang salah?',
  'He ate breakfast this morning. (breakfast = uncountable/meal noun, tidak pakai artikel)',
  true
);

-- ============================================================
-- MODULE 6: Basic Adjectives (big, small, good, bad)
-- ============================================================

-- FILL IN THE BLANK (10 cards)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(
  (SELECT id FROM modules WHERE name = 'Basic Adjectives' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'This pizza is really ___. I love it! (lezat)',
  'This pizza is really DELICIOUS / GOOD. (adjective setelah "is" = predicate adjective)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Adjectives' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'Jakarta is a ___ city. (besar)',
  'Jakarta is a BIG city. (adjective sebelum noun = attributive adjective)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Adjectives' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'The weather is ___ today. I need a jacket. (dingin)',
  'The weather is COLD today. (adjective mendeskripsikan keadaan cuaca)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Adjectives' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'She has a ___ smile. Everyone likes her. (cantik/indah)',
  'She has a BEAUTIFUL smile. (adjective sebelum noun: beautiful smile)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Adjectives' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'This bag is too ___. I can''t carry it. (berat)',
  'This bag is too HEAVY. (adjective setelah "is too")',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Adjectives' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'The movie was ___. I fell asleep. (membosankan)',
  'The movie was BORING. (adjective mendeskripsikan pengalaman)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Adjectives' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'He is a ___ student. He always gets good grades. (rajin/pintar)',
  'He is a SMART / HARDWORKING student. (adjective sebelum noun)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Adjectives' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'The coffee is too ___. Let it cool down. (panas)',
  'The coffee is too HOT. (adjective setelah "too")',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Adjectives' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'I live in a ___ apartment. Only one room. (kecil)',
  'I live in a SMALL apartment. (adjective sebelum noun)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Adjectives' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'The test was ___, but I passed. (sulit)',
  'The test was DIFFICULT / HARD. (adjective setelah "was")',
  true
);

-- MULTIPLE CHOICE (6 cards)
INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES
(
  (SELECT id FROM modules WHERE name = 'Basic Adjectives' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'This room is very ___. Please turn on the light.',
  'dark — adjective yang tepat untuk "gelap"',
  '["dark", "tall", "wide", "soft"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Adjectives' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'She has ___ hair. It reaches her waist.',
  'long — adjective yang tepat untuk mendeskripsikan rambut panjang',
  '["long", "tall", "big", "wide"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Adjectives' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'The food is ___. Do not eat it.',
  'bad — adjective yang tepat untuk makanan yang tidak layak dimakan',
  '["bad", "small", "cold", "dark"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Adjectives' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'This laptop is very ___. I can carry it everywhere.',
  'light — adjective yang tepat untuk "ringan" (kebalikan dari heavy)',
  '["light", "small", "short", "thin"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Adjectives' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'My grandmother is very ___. She is 85 years old.',
  'old — adjective yang tepat untuk mendeskripsikan usia tua',
  '["old", "big", "heavy", "slow"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Adjectives' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'The answer is ___. You got 100%.',
  'correct — adjective yang tepat untuk jawaban yang benar',
  '["correct", "good", "easy", "fast"]',
  0,
  true
);

-- ERROR CORRECTION (4 cards)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(
  (SELECT id FROM modules WHERE name = 'Basic Adjectives' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "She has eyes beautiful." — Apa yang salah?',
  'She has BEAUTIFUL eyes. (adjective harus sebelum noun, bukan sesudah)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Adjectives' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "He is a very tall, he plays basketball." — Apa yang salah?',
  'He is very tall. He plays basketball. (kalimat perlu dipisah; "a" tidak perlu karena "tall" adalah predicate adjective)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Adjectives' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "The weather is sun today." — Apa yang salah?',
  'The weather is SUNNY today. ("sun" adalah noun, harus diubah jadi adjective "sunny")',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Adjectives' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "It was a moment very scary." — Apa yang salah?',
  'It was a very SCARY moment. (adjective harus sebelum noun: "a very scary moment")',
  true
);

-- ============================================================
-- MODULE 7: Question Words (what, where, when, who, why, how)
-- ============================================================

-- FILL IN THE BLANK (10 cards)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(
  (SELECT id FROM modules WHERE name = 'Question Words' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  '___ is your name? (menanyakan nama)',
  'WHAT is your name? ("what" untuk menanyakan hal/sesuatu)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Question Words' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  '___ do you live? (menanyakan tempat tinggal)',
  'WHERE do you live? ("where" untuk menanyakan tempat/lokasi)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Question Words' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  '___ is your birthday? (menanyakan tanggal/waktu)',
  'WHEN is your birthday? ("when" untuk menanyakan waktu)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Question Words' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  '___ is your English teacher? (menanyakan orang)',
  'WHO is your English teacher? ("who" untuk menanyakan orang)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Question Words' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  '___ are you late today? (menanyakan alasan)',
  'WHY are you late today? ("why" untuk menanyakan alasan/sebab)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Question Words' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  '___ do you go to school? (menanyakan cara/metode)',
  'HOW do you go to school? ("how" untuk menanyakan cara)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Question Words' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  '___ old are you? (menanyakan usia)',
  'HOW old are you? ("how + adjective" untuk menanyakan ukuran/jumlah)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Question Words' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  '___ subject do you like most? (menanyakan mata pelajaran favorit)',
  'WHAT subject do you like most? ("what" + noun untuk menanyakan pilihan)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Question Words' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  '___ is the nearest hospital? (menanyakan lokasi)',
  'WHERE is the nearest hospital? ("where" untuk menanyakan lokasi)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Question Words' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  '___ many students are in your class? (menanyakan jumlah)',
  'HOW many students are in your class? ("how many" untuk menanyakan jumlah countable noun)',
  true
);

-- MULTIPLE CHOICE (6 cards)
INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES
(
  (SELECT id FROM modules WHERE name = 'Question Words' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  '"___ do you feel today?" — "I feel great, thanks!"',
  'How — "how" untuk menanyakan keadaan/perasaan',
  '["How", "What", "Where", "Why"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Question Words' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  '"___ is your favorite food?" — "I like fried rice."',
  'What — "what" untuk menanyakan sesuatu/pilihan',
  '["What", "Who", "When", "How"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Question Words' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  '"___ did the class start?" — "It started at 8 AM."',
  'When — "when" untuk menanyakan waktu',
  '["When", "Where", "Why", "Who"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Question Words' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  '"___ called you last night?" — "My mom called me."',
  'Who — "who" untuk menanyakan orang (subjek)',
  '["Who", "What", "When", "Where"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Question Words' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  '"___ did you skip breakfast?" — "Because I was late."',
  'Why — "why" untuk menanyakan alasan',
  '["Why", "When", "How", "What"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Question Words' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  '"___ much does this cost?" — "It costs 50,000 rupiah."',
  'How — "how much" untuk menanyakan harga/jumlah uncountable',
  '["How", "What", "Why", "Where"]',
  0,
  true
);

-- ERROR CORRECTION (4 cards)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(
  (SELECT id FROM modules WHERE name = 'Question Words' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "Where you live?" — Apa yang salah?',
  'WHERE do you live? (pertanyaan dengan question word perlu auxiliary verb: do/does/did)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Question Words' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "What is your age have?" — Apa yang salah?',
  'How old are you? (untuk usia gunakan "how old", bukan "what age have")',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Question Words' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "Who did call you?" — Apa yang salah?',
  'Who called you? ("who" sebagai subjek tidak perlu "did", langsung + past verb)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Question Words' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "How many money do you have?" — Apa yang salah?',
  'How MUCH money do you have? ("money" adalah uncountable noun, gunakan "how much" bukan "how many")',
  true
);

-- ============================================================
-- MODULE 8: Basic Negative Sentences (don't, doesn't, isn't)
-- ============================================================

-- FILL IN THE BLANK (10 cards)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(
  (SELECT id FROM modules WHERE name = 'Basic Negative Sentences' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'I ___ like spicy food. (negatif simple present, I)',
  'I DON''T like spicy food. ("don''t" = do not, untuk I/you/we/they)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Negative Sentences' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'She ___ have a car. (negatif simple present, she)',
  'She DOESN''T have a car. ("doesn''t" = does not, untuk he/she/it)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Negative Sentences' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'He ___ a teacher. He is a doctor. (negatif to be present)',
  'He ISN''T a teacher. ("isn''t" = is not, untuk he/she/it)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Negative Sentences' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'They ___ at home right now. (negatif to be present, they)',
  'They AREN''T at home right now. ("aren''t" = are not, untuk you/we/they)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Negative Sentences' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'We ___ go to school on Sunday. (negatif simple present, we)',
  'We DON''T go to school on Sunday. ("don''t" untuk we)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Negative Sentences' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'It ___ rain in the desert often. (negatif simple present, it)',
  'It DOESN''T rain in the desert often. ("doesn''t" untuk it)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Negative Sentences' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'I ___ ready yet. Give me 5 minutes. (negatif to be, I)',
  'I AM NOT / I''M NOT ready yet. ("am not" untuk I, tidak ada kontraksi "amn''t")',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Negative Sentences' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'The answer ___ correct. Try again. (negatif to be, singular)',
  'The answer ISN''T correct. ("isn''t" = is not, untuk singular benda)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Negative Sentences' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'You ___ need to worry. Everything is fine. (negatif simple present, you)',
  'You DON''T need to worry. ("don''t" untuk you)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Negative Sentences' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'He ___ know the answer. (negatif simple present, he)',
  'He DOESN''T know the answer. ("doesn''t" untuk he)',
  true
);

-- MULTIPLE CHOICE (6 cards)
INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES
(
  (SELECT id FROM modules WHERE name = 'Basic Negative Sentences' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'My sister ___ like vegetables.',
  'doesn''t — she (sister) → doesn''t',
  '["doesn''t", "don''t", "isn''t", "aren''t"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Negative Sentences' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'The students ___ in the classroom. They are outside.',
  'aren''t — the students (plural) → aren''t',
  '["aren''t", "isn''t", "don''t", "doesn''t"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Negative Sentences' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'I ___ understand this lesson.',
  'don''t — I → don''t',
  '["don''t", "doesn''t", "isn''t", "am not"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Negative Sentences' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'The coffee ___ hot anymore. It''s cold now.',
  'isn''t — the coffee (singular it) → isn''t',
  '["isn''t", "aren''t", "don''t", "doesn''t"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Negative Sentences' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'We ___ have class tomorrow. It''s a holiday.',
  'don''t — we → don''t',
  '["don''t", "doesn''t", "aren''t", "isn''t"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Negative Sentences' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'He ___ happy about the result.',
  'isn''t — he → isn''t (negatif to be)',
  '["isn''t", "doesn''t", "don''t", "aren''t"]',
  0,
  true
);

-- ERROR CORRECTION (4 cards)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(
  (SELECT id FROM modules WHERE name = 'Basic Negative Sentences' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "She don''t like rainy days." — Apa yang salah?',
  'She DOESN''T like rainy days. (she → doesn''t, bukan don''t)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Negative Sentences' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "He isn''t works on Sunday." — Apa yang salah?',
  'He DOESN''T work on Sunday. (untuk action verb, negatif = doesn''t + verb dasar, bukan isn''t + verb)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Negative Sentences' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "I amn''t ready yet." — Apa yang salah?',
  'I AM NOT / I''M NOT ready yet. ("amn''t" tidak ada dalam bahasa Inggris, gunakan "am not")',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Negative Sentences' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "They doesn''t understand the instructions." — Apa yang salah?',
  'They DON''T understand the instructions. (they → don''t, bukan doesn''t)',
  true
);

-- ============================================================
-- MODULE 9: Basic Chunks (I want to / I need to / can you)
-- ============================================================

-- FILL IN THE BLANK (10 cards)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(
  (SELECT id FROM modules WHERE name = 'Basic Chunks' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'Saya lapar. ___ eat something. (saya ingin...)',
  'I WANT TO eat something. ("I want to" + verb dasar = saya ingin)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Chunks' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'Deadline sudah dekat. ___ finish this today. (saya perlu...)',
  'I NEED TO finish this today. ("I need to" + verb dasar = saya perlu)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Chunks' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'Tolong, ___ help me? (bisakah kamu...)',
  'CAN YOU help me? ("can you" + verb dasar = bisakah kamu)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Chunks' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'Ini error terus. ___ fix this bug. (saya harus...)',
  'I HAVE TO fix this bug. ("I have to" + verb dasar = saya harus)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Chunks' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  '___ go to the bathroom? (bolehkah saya...)',
  'CAN I go to the bathroom? ("can I" + verb dasar = bolehkah saya)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Chunks' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'Terima kasih atas bantuannya. ___ you very much! (terima kasih banyak)',
  'THANK YOU very much! ("thank you" = terima kasih, chunk yang sering dipakai)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Chunks' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'Sampai jumpa besok. ___ tomorrow! (sampai jumpa)',
  'SEE YOU tomorrow! ("see you" = sampai jumpa, chunk percakapan)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Chunks' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  '___ me about your project. (ceritakan kepada saya...)',
  'TELL ME about your project. ("tell me" + about = ceritakan kepada saya)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Chunks' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'Maaf saya terlambat. ___. (maaf / mohon maaf)',
  'I''M SORRY. / SORRY I''M LATE. ("I''m sorry" = maaf, chunk yang paling sering dipakai)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Chunks' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'Saya tidak mengerti. ___? (bisa diulang?)',
  'CAN YOU REPEAT THAT? / COULD YOU SAY THAT AGAIN? (chunk meminta pengulangan)',
  true
);

-- MULTIPLE CHOICE (6 cards)
INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES
(
  (SELECT id FROM modules WHERE name = 'Basic Chunks' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  '"___ help me carry this?" — "Sure, no problem!"',
  'Can you — chunk untuk meminta bantuan dengan sopan',
  '["Can you", "Do you", "Are you", "Will you"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Chunks' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  '"I ___ learn more about NestJS." — (punya keinginan)',
  'want to — "want to" = ingin, chunk yang paling natural',
  '["want to", "wants to", "wanting to", "wanted to"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Chunks' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  '"___ use your pen?" — "Go ahead."',
  'Can I — chunk sopan untuk meminta izin',
  '["Can I", "Do I", "Am I", "Will I"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Chunks' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  '"I ___ submit this before 5 PM." — (ada keharusan)',
  'need to — "need to" = perlu/harus, chunk yang natural',
  '["need to", "needs to", "needed to", "needing to"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Chunks' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  '"___ you later!" — (pamit/sampai jumpa)',
  'See — "See you" = sampai jumpa, chunk umum',
  '["See", "Look", "Watch", "Meet"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Chunks' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  '"I ___ understand. Can you explain again?" — (tidak mengerti)',
  'don''t — "I don''t understand" = saya tidak mengerti, chunk percakapan',
  '["don''t", "can''t", "won''t", "haven''t"]',
  0,
  true
);

-- ERROR CORRECTION (4 cards)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(
  (SELECT id FROM modules WHERE name = 'Basic Chunks' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "I want eat pizza." — Apa yang salah?',
  'I want TO eat pizza. ("want" harus diikuti "to" sebelum verb: want to + verb)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Chunks' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "Can you to help me?" — Apa yang salah?',
  'Can you help me? (setelah modal "can" → verb dasar tanpa "to")',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Chunks' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "I need to going home now." — Apa yang salah?',
  'I need to GO home now. (setelah "need to" → verb dasar, bukan -ing)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Chunks' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "Can I to borrow your charger?" — Apa yang salah?',
  'Can I borrow your charger? (setelah modal "can" → verb dasar tanpa "to")',
  true
);

-- ============================================================
-- MODULE 10: Basic Prepositions (in, on, at, under, beside)
-- ============================================================

-- FILL IN THE BLANK (10 cards)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(
  (SELECT id FROM modules WHERE name = 'Basic Prepositions' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'My laptop is ___ the table. (di atas meja)',
  'My laptop is ON the table. ("on" untuk permukaan: di atas meja, di dinding)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Prepositions' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'I was born ___ 2000. (tahun lahir)',
  'I was born IN 2000. ("in" untuk tahun, bulan, musim)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Prepositions' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'She arrives ___ 7 AM every day. (jam spesifik)',
  'She arrives AT 7 AM every day. ("at" untuk jam/waktu spesifik)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Prepositions' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'The cat is ___ the bed. (di bawah tempat tidur)',
  'The cat is UNDER the bed. ("under" untuk posisi di bawah sesuatu)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Prepositions' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'I live ___ Jakarta. (kota/negara)',
  'I live IN Jakarta. ("in" untuk kota, negara, daerah)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Prepositions' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'He was born ___ Monday. (hari)',
  'He was born ON Monday. ("on" untuk hari dan tanggal spesifik)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Prepositions' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'My phone is ___ the table. (posisi samping)',
  'My phone is BESIDE / NEXT TO the table. ("beside/next to" = di samping)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Prepositions' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'The class starts ___ Monday morning. (hari + waktu umum)',
  'The class starts ON Monday morning. ("on" untuk hari)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Prepositions' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'There is a picture ___ the wall. (menempel di dinding)',
  'There is a picture ON the wall. ("on" untuk permukaan)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Prepositions' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'fill_blank',
  'We meet ___ night. (waktu: malam)',
  'We meet AT night. ("at" untuk night, noon, midnight)',
  true
);

-- MULTIPLE CHOICE (6 cards)
INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES
(
  (SELECT id FROM modules WHERE name = 'Basic Prepositions' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'The meeting is ___ Friday afternoon.',
  'on — "on" untuk hari (Friday)',
  '["on", "in", "at", "under"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Prepositions' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'She was born ___ December.',
  'in — "in" untuk bulan',
  '["in", "on", "at", "by"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Prepositions' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'The keys are ___ the drawer.',
  'in — "in" untuk di dalam sesuatu yang tertutup/memiliki ruang',
  '["in", "on", "at", "under"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Prepositions' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'I will call you ___ 3 PM.',
  'at — "at" untuk jam spesifik',
  '["at", "in", "on", "by"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Prepositions' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'The dog is sleeping ___ the sofa.',
  'under — "under" = di bawah sesuatu',
  '["under", "on", "in", "at"]',
  0,
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Prepositions' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'multiple_choice',
  'I study English ___ the evening.',
  'in — "in the morning/afternoon/evening" (pakai "in" untuk bagian hari)',
  '["in", "at", "on", "by"]',
  0,
  true
);

-- ERROR CORRECTION (4 cards)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(
  (SELECT id FROM modules WHERE name = 'Basic Prepositions' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "She was born in Monday." — Apa yang salah?',
  'She was born ON Monday. ("on" untuk hari, "in" untuk bulan/tahun)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Prepositions' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "The meeting starts at 9 AM on the morning." — Apa yang salah?',
  'The meeting starts at 9 AM IN the morning. ("in the morning", bukan "on the morning")',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Prepositions' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "I live on Jambi." — Apa yang salah?',
  'I live IN Jambi. ("in" untuk kota/wilayah, "on" untuk permukaan/hari)',
  true
),
(
  (SELECT id FROM modules WHERE name = 'Basic Prepositions' AND level_id = (SELECT id FROM levels WHERE name = 'A1')),
  'error_correction',
  'Temukan kesalahan: "The book is in the table." — Apa yang salah?',
  'The book is ON the table. ("on" untuk di atas permukaan, "in" untuk di dalam sesuatu)',
  true
);

-- ============================================================
-- UPDATE total_cards untuk semua A1 modules
-- ============================================================
UPDATE modules SET total_cards = (
  SELECT COUNT(*) FROM cards WHERE cards.module_id = modules.id
)
WHERE level_id = (SELECT id FROM levels WHERE name = 'A1');