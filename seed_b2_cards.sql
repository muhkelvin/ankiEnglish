-- ============================================================
-- SEED CARDS — B2 Level (10 modules × 20 cards)
-- Types: fill_blank, multiple_choice, error_correction
-- Run AFTER schema + levels/modules seed
-- ============================================================

DO $$
DECLARE
  mod_id UUID;
BEGIN

-- ============================================================
-- MODULE 1: Present Perfect Continuous
-- ============================================================
SELECT id INTO mod_id FROM modules WHERE name = 'Present Perfect Continuous' AND level_id = (SELECT id FROM levels WHERE name = 'B2');

INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES

-- fill_blank (8 cards)
(mod_id, 'fill_blank', 'She ________ (work) at this company for five years.', 'has been working', NULL, NULL, true),
(mod_id, 'fill_blank', 'They ________ (argue) all morning. I'm exhausted just listening to them.', 'have been arguing', NULL, NULL, true),
(mod_id, 'fill_blank', 'How long ________ you ________ (wait) for the bus?', 'have / been waiting', NULL, NULL, true),
(mod_id, 'fill_blank', 'I ________ (study) English since I was ten years old.', 'have been studying', NULL, NULL, true),
(mod_id, 'fill_blank', 'He looks tired because he ________ (run) all afternoon.', 'has been running', NULL, NULL, true),
(mod_id, 'fill_blank', 'We ________ (try) to fix this bug for three hours now.', 'have been trying', NULL, NULL, true),
(mod_id, 'fill_blank', 'It ________ (rain) since early this morning.', 'has been raining', NULL, NULL, true),
(mod_id, 'fill_blank', 'The team ________ (develop) the new feature all week.', 'has been developing', NULL, NULL, true),

-- multiple_choice (6 cards)
(mod_id, 'multiple_choice', 'Which sentence uses Present Perfect Continuous correctly?',
  'I have finished my work.',
  '["I have been finishing my work for 2 hours.", "I have been finish my work.", "I am having been working.", "I have been worked all day."]',
  0, true),
(mod_id, 'multiple_choice', 'Choose the correct form: She ________ (not / sleep) well lately.',
  'has not been sleeping',
  '["has not been sleeping", "have not been sleeping", "had not been sleeping", "is not been sleeping"]',
  0, true),
(mod_id, 'multiple_choice', 'What does "I have been learning French" imply?',
  'The action started in the past and may still be ongoing.',
  '["The action is finished.", "The action started in the past and may still be ongoing.", "The action happened once.", "The action will happen soon."]',
  1, true),
(mod_id, 'multiple_choice', 'Select the sentence that is NOT in Present Perfect Continuous.',
  'She has written three reports.',
  '["He has been coding for hours.", "They have been waiting.", "She has written three reports.", "I have been reading this book."]',
  2, true),
(mod_id, 'multiple_choice', 'Which time expression does NOT typically go with Present Perfect Continuous?',
  'yesterday',
  '["for two hours", "since morning", "all day", "yesterday"]',
  3, true),
(mod_id, 'multiple_choice', '"The road is wet." What does this suggest in Present Perfect Continuous context?',
  'It has been raining.',
  '["It rained yesterday.", "It has been raining.", "It will rain soon.", "It rains every day."]',
  1, true),

-- error_correction (6 cards)
(mod_id, 'error_correction', 'Find and correct the error: "She have been working here since 2020."', 'She HAS been working here since 2020. (have → has, subject is 3rd person singular)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "They has been travelling for two weeks."', 'They HAVE been travelling for two weeks. (has → have, subject is plural)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "I have been wait for you all day."', 'I have been WAITING for you all day. (wait → waiting, need -ing form)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "How long have you been know her?"', 'How long have you been KNOWING her? → Actually: How long HAVE YOU KNOWN her? (stative verb "know" does not use continuous)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "He has been worked at the clinic since July."', 'He has been WORKING at the clinic since July. (worked → working)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "We have been lived in Jakarta since 2018."', 'We have been LIVING in Jakarta since 2018. (lived → living)', NULL, NULL, true);


-- ============================================================
-- MODULE 2: Past Perfect Tense
-- ============================================================
SELECT id INTO mod_id FROM modules WHERE name = 'Past Perfect Tense' AND level_id = (SELECT id FROM levels WHERE name = 'B2');

INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES

(mod_id, 'fill_blank', 'By the time she arrived, we ________ (already / eat) dinner.', 'had already eaten', NULL, NULL, true),
(mod_id, 'fill_blank', 'He ________ (never / see) such a beautiful sunset before that trip.', 'had never seen', NULL, NULL, true),
(mod_id, 'fill_blank', 'The project ________ (finish) before the deadline arrived.', 'had finished', NULL, NULL, true),
(mod_id, 'fill_blank', 'They ________ (live) in London for ten years before moving to Jakarta.', 'had lived', NULL, NULL, true),
(mod_id, 'fill_blank', 'I realised I ________ (leave) my phone at the office.', 'had left', NULL, NULL, true),
(mod_id, 'fill_blank', 'She ________ (not / meet) him before that conference.', 'had not met', NULL, NULL, true),
(mod_id, 'fill_blank', 'After they ________ (discuss) the plan, they sent the proposal.', 'had discussed', NULL, NULL, true),
(mod_id, 'fill_blank', 'The train ________ (already / depart) when we reached the station.', 'had already departed', NULL, NULL, true),

(mod_id, 'multiple_choice', 'Choose the sentence that correctly uses Past Perfect.',
  'She had submitted the report before the meeting started.',
  '["She has submitted the report before the meeting started.", "She had submitted the report before the meeting started.", "She submitted the report before the meeting had started.", "She had been submit the report before the meeting."]',
  1, true),
(mod_id, 'multiple_choice', 'Which word/phrase commonly signals Past Perfect?',
  'by the time',
  '["tomorrow", "by the time", "right now", "since yesterday"]',
  1, true),
(mod_id, 'multiple_choice', 'Select the correct sentence.',
  'When I got to the party, everyone had already left.',
  '["When I got to the party, everyone already left.", "When I had got to the party, everyone left.", "When I got to the party, everyone had already left.", "When I get to the party, everyone had left."]',
  2, true),
(mod_id, 'multiple_choice', 'What is the structure of Past Perfect?',
  'had + past participle',
  '["have + past participle", "had + past participle", "was/were + past participle", "had + base verb"]',
  1, true),
(mod_id, 'multiple_choice', '"I had never eaten sushi before I visited Japan." When did I first eat sushi?',
  'During the visit to Japan.',
  '["Before visiting Japan.", "During the visit to Japan.", "After returning from Japan.", "I never ate sushi."]',
  1, true),
(mod_id, 'multiple_choice', 'Which sentence is grammatically correct?',
  'She had already gone home when he called.',
  '["She have already gone home when he called.", "She had already went home when he called.", "She had already gone home when he called.", "She had already going home when he called."]',
  2, true),

(mod_id, 'error_correction', 'Find and correct the error: "By the time we arrived, the movie already started."', 'By the time we arrived, the movie had ALREADY STARTED. (need Past Perfect for the earlier action)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "She has finished the test before the bell rang."', 'She HAD finished the test before the bell rang. (has → had, Past Perfect needed)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "They had went to the market before it closed."', 'They had GONE to the market before it closed. (went → gone, irregular past participle)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "He told me that he never visited Paris before."', 'He told me that he had NEVER VISITED Paris before. (Past Perfect needed for earlier past action)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "After she had went to bed, the phone rang."', 'After she had GONE to bed, the phone rang. (went → gone)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "I realized I forget to lock the door."', 'I realized I HAD FORGOTTEN to lock the door. (forget → had forgotten, Past Perfect needed)', NULL, NULL, true);


-- ============================================================
-- MODULE 3: Advanced Passive Voice
-- ============================================================
SELECT id INTO mod_id FROM modules WHERE name = 'Advanced Passive Voice' AND level_id = (SELECT id FROM levels WHERE name = 'B2');

INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES

(mod_id, 'fill_blank', 'The report ________ (submit) by noon tomorrow. [future passive]', 'will be submitted', NULL, NULL, true),
(mod_id, 'fill_blank', 'The new policy ________ (announce) at yesterday's meeting. [simple past passive]', 'was announced', NULL, NULL, true),
(mod_id, 'fill_blank', 'The package ________ (deliver) by the time you get home. [future perfect passive]', 'will have been delivered', NULL, NULL, true),
(mod_id, 'fill_blank', 'The app ________ (develop) by a small team in 2022. [simple past passive]', 'was developed', NULL, NULL, true),
(mod_id, 'fill_blank', 'The suspect ________ (question) by the police right now. [present continuous passive]', 'is being questioned', NULL, NULL, true),
(mod_id, 'fill_blank', 'The documents ________ (sign) before the meeting ended. [past perfect passive]', 'had been signed', NULL, NULL, true),
(mod_id, 'fill_blank', 'Several errors ________ (find) during the code review. [simple past passive]', 'were found', NULL, NULL, true),
(mod_id, 'fill_blank', 'The bridge ________ (build) for three years when it finally opened. [past perfect continuous passive]', 'had been being built', NULL, NULL, true),

(mod_id, 'multiple_choice', 'Which is the correct Present Perfect Passive form of "They have approved the budget"?',
  'The budget has been approved.',
  '["The budget was approved.", "The budget has been approved.", "The budget is being approved.", "The budget had been approved."]',
  1, true),
(mod_id, 'multiple_choice', 'Convert to passive: "Someone is fixing the server right now."',
  'The server is being fixed right now.',
  '["The server is fixed right now.", "The server was being fixed right now.", "The server is being fixed right now.", "The server has been fixed right now."]',
  2, true),
(mod_id, 'multiple_choice', 'Which passive sentence is grammatically INCORRECT?',
  'The cake was being ate when she arrived.',
  '["The memo will be sent tomorrow.", "The car has been repaired.", "The cake was being ate when she arrived.", "The project is being reviewed."]',
  2, true),
(mod_id, 'multiple_choice', 'Which tense is used in: "The suspects were being followed by detectives"?',
  'Past Continuous Passive',
  '["Simple Past Passive", "Past Perfect Passive", "Past Continuous Passive", "Present Continuous Passive"]',
  2, true),
(mod_id, 'multiple_choice', '"The website will have been launched by Friday." This means:',
  'The launch will be completed before Friday.',
  '["The website launched on Friday.", "The launch will be completed before Friday.", "The website is being launched.", "The website launched before Friday."]',
  1, true),
(mod_id, 'multiple_choice', 'Which sentence correctly uses passive with a modal verb?',
  'The problem should be solved immediately.',
  '["The problem should solved immediately.", "The problem should be solved immediately.", "The problem should been solved immediately.", "The problem should be solving immediately."]',
  1, true),

(mod_id, 'error_correction', 'Find and correct the error: "The letter was wrote by my assistant."', 'The letter was WRITTEN by my assistant. (wrote → written, past participle)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "The cars is being repaired at the garage."', 'The cars ARE being repaired at the garage. (is → are, subject is plural)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "This book has been wrote by a famous author."', 'This book has been WRITTEN by a famous author. (wrote → written)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "The project will been completed next week."', 'The project will BE completed next week. (will been → will be)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "She was been promoted last month."', 'She WAS promoted last month. (was been → was, simple past passive)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "The report is wrote every month by the manager."', 'The report is WRITTEN every month by the manager. (wrote → written)', NULL, NULL, true);


-- ============================================================
-- MODULE 4: Advanced Conditionals
-- ============================================================
SELECT id INTO mod_id FROM modules WHERE name = 'Advanced Conditionals' AND level_id = (SELECT id FROM levels WHERE name = 'B2');

INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES

(mod_id, 'fill_blank', 'If I ________ (know) about the bug, I would have fixed it immediately.', 'had known', NULL, NULL, true),
(mod_id, 'fill_blank', 'She ________ (pass) the exam if she had studied harder.', 'would have passed', NULL, NULL, true),
(mod_id, 'fill_blank', 'If we ________ (not / miss) the flight, we would be in Bali now.', 'had not missed', NULL, NULL, true),
(mod_id, 'fill_blank', 'He speaks as if he ________ (know) everything. [subjunctive]', 'knew', NULL, NULL, true),
(mod_id, 'fill_blank', 'If you ________ (heat) water to 100°C, it boils. [zero conditional]', 'heat', NULL, NULL, true),
(mod_id, 'fill_blank', 'I wish I ________ (study) medicine instead of law.', 'had studied', NULL, NULL, true),
(mod_id, 'fill_blank', 'Were I in your position, I ________ (accept) the offer. [formal inversion]', 'would accept', NULL, NULL, true),
(mod_id, 'fill_blank', 'If only she ________ (tell) me the truth earlier!', 'had told', NULL, NULL, true),

(mod_id, 'multiple_choice', 'Which is a correct 3rd Conditional sentence?',
  'If he had left earlier, he would have caught the train.',
  '["If he left earlier, he would catch the train.", "If he had left earlier, he would have caught the train.", "If he leaves earlier, he will catch the train.", "If he had left earlier, he would catch the train."]',
  1, true),
(mod_id, 'multiple_choice', 'Which conditional expresses an unreal situation in the present?',
  '2nd Conditional',
  '["Zero Conditional", "1st Conditional", "2nd Conditional", "3rd Conditional"]',
  2, true),
(mod_id, 'multiple_choice', '"Had I known the answer, I would have told you." This is an example of:',
  'Formal inversion of 3rd Conditional',
  '["Mixed conditional", "Zero conditional", "Formal inversion of 3rd Conditional", "1st Conditional"]',
  2, true),
(mod_id, 'multiple_choice', 'What does a Mixed Conditional express?',
  'A past condition with a present result (or vice versa)',
  '["A real future possibility", "A past condition with a present result (or vice versa)", "A scientific fact", "A polite request"]',
  1, true),
(mod_id, 'multiple_choice', 'Select the correct Mixed Conditional sentence.',
  'If she had taken the job offer, she would be rich now.',
  '["If she took the job offer, she would be rich now.", "If she had taken the job offer, she would be rich now.", "If she takes the job offer, she will be rich now.", "If she had taken the job offer, she would been rich now."]',
  1, true),
(mod_id, 'multiple_choice', 'Which sentence expresses a wish about the past?',
  'I wish I had saved more money.',
  '["I wish I save more money.", "I wish I will save more money.", "I wish I had saved more money.", "I wish I am saving more money."]',
  2, true),

(mod_id, 'error_correction', 'Find and correct the error: "If I would have known, I would have helped."', 'If I HAD KNOWN (not "would have known"), I would have helped. (no "would" in the if-clause)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "She would passed the test if she had studied."', 'She would HAVE PASSED the test if she had studied. (would passed → would have passed)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "If he had worked harder, he would be promoted."', 'If he had worked harder, he would HAVE BEEN promoted. (Mixed or 3rd conditional — "would be" should be "would have been" for 3rd conditional)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "I wish I knew her before the incident."', 'I wish I HAD KNOWN her before the incident. (knew → had known, wish about the past)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "Unless you won''t apologise, she will stay angry."', 'Unless you APOLOGISE, she will stay angry. (unless already means "if not", so remove "won''t")', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "If the weather will be nice tomorrow, we go to the beach."', 'If the weather IS nice tomorrow, we will go to the beach. (1st conditional: if + present, main + will)', NULL, NULL, true);


-- ============================================================
-- MODULE 5: Advanced Reported Speech
-- ============================================================
SELECT id INTO mod_id FROM modules WHERE name = 'Advanced Reported Speech' AND level_id = (SELECT id FROM levels WHERE name = 'B2');

INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES

(mod_id, 'fill_blank', '"I will call you tomorrow." → She said she ________ call me the next day.', 'would', NULL, NULL, true),
(mod_id, 'fill_blank', '"Are you coming to the meeting?" → He asked me if I ________ going to the meeting.', 'was', NULL, NULL, true),
(mod_id, 'fill_blank', '"Don''t open that file." → She told me ________ open that file.', 'not to', NULL, NULL, true),
(mod_id, 'fill_blank', '"We have finished the project." → They announced that they ________ finished the project.', 'had', NULL, NULL, true),
(mod_id, 'fill_blank', '"I saw him yesterday." → She said she ________ him the day before.', 'had seen', NULL, NULL, true),
(mod_id, 'fill_blank', '"Can you help me?" → He asked if I ________ help him.', 'could', NULL, NULL, true),
(mod_id, 'fill_blank', '"We must submit the report today." → They said they ________ submit the report that day.', 'had to', NULL, NULL, true),
(mod_id, 'fill_blank', '"Where is the office?" → She asked where the office ________.', 'was', NULL, NULL, true),

(mod_id, 'multiple_choice', 'Report this: "I am working on a new app." He said that…',
  'he was working on a new app.',
  '["he is working on a new app.", "he was working on a new app.", "he has been working on a new app.", "he worked on a new app."]',
  1, true),
(mod_id, 'multiple_choice', 'Which reported speech is correct? Direct: "Did she pass the exam?"',
  'He asked whether she had passed the exam.',
  '["He asked whether she passed the exam.", "He asked whether did she pass the exam.", "He asked whether she had passed the exam.", "He asked whether she will pass the exam."]',
  2, true),
(mod_id, 'multiple_choice', 'Identify the correct reported command: "Please close the door." (She said)',
  'She asked me to close the door.',
  '["She said to close the door.", "She said me close the door.", "She asked me to close the door.", "She told that I close the door."]',
  2, true),
(mod_id, 'multiple_choice', 'Which tense change is correct in reported speech?',
  'Present Perfect → Past Perfect',
  '["Simple Present → Past Perfect", "Present Perfect → Past Perfect", "Simple Past → Simple Present", "Will → Would have"]',
  1, true),
(mod_id, 'multiple_choice', 'Which word does NOT shift in reported speech?',
  'could',
  '["will", "can", "may", "could"]',
  3, true),
(mod_id, 'multiple_choice', '"Here" in direct speech becomes ________ in reported speech.',
  'there',
  '["now", "here", "there", "then"]',
  2, true),

(mod_id, 'error_correction', 'Find and correct the error: "She said that she will finish the report tomorrow."', 'She said that she WOULD finish the report the NEXT DAY. (will → would; tomorrow → the next day)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "He told me don''t use his laptop."', 'He told me NOT TO USE his laptop. (don''t → not to, reported command)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "She asked me where do I live."', 'She asked me where I LIVED. (no inversion in reported question; backshift to past)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "They said they have already sent the email."', 'They said they HAD ALREADY SENT the email. (have → had, backshift)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "He asked whether I can join the meeting."', 'He asked whether I COULD join the meeting. (can → could, backshift)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "She told that she was tired."', 'She SAID (that) she was tired. (told requires an object: "told me/us"; or use "said")', NULL, NULL, true);


-- ============================================================
-- MODULE 6: Advanced Phrasal Verbs
-- ============================================================
SELECT id INTO mod_id FROM modules WHERE name = 'Advanced Phrasal Verbs' AND level_id = (SELECT id FROM levels WHERE name = 'B2');

INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES

(mod_id, 'fill_blank', 'I can''t ________ her constant interruptions anymore. (tolerate)', 'put up with', NULL, NULL, true),
(mod_id, 'fill_blank', 'He ________ an old friend at the supermarket yesterday. (met unexpectedly)', 'came across', NULL, NULL, true),
(mod_id, 'fill_blank', 'She ________ the meeting until next week due to illness. (postponed)', 'put off', NULL, NULL, true),
(mod_id, 'fill_blank', 'The scandal ________ just before the election. (became known)', 'came out', NULL, NULL, true),
(mod_id, 'fill_blank', 'We need to ________ a solution before the deadline. (think of)', 'come up with', NULL, NULL, true),
(mod_id, 'fill_blank', 'Could you ________ this data in the spreadsheet? (enter/record)', 'fill in', NULL, NULL, true),
(mod_id, 'fill_blank', 'The company decided to ________ the product launch. (cancel)', 'call off', NULL, NULL, true),
(mod_id, 'fill_blank', 'It took me a while to ________ the meaning from context. (understand/figure out)', 'work out', NULL, NULL, true),

(mod_id, 'multiple_choice', 'What does "come across" mean in: "She came across as very confident"?',
  'To appear or seem a certain way',
  '["To find something unexpectedly", "To travel across", "To appear or seem a certain way", "To approach someone"]',
  2, true),
(mod_id, 'multiple_choice', 'Which phrasal verb means "to investigate"?',
  'look into',
  '["look up", "look into", "look after", "look out"]',
  1, true),
(mod_id, 'multiple_choice', '"The deal fell through." What happened?',
  'The deal failed to happen.',
  '["The deal was successful.", "The deal was postponed.", "The deal failed to happen.", "The deal was renegotiated."]',
  2, true),
(mod_id, 'multiple_choice', 'Choose the sentence using "give up" correctly.',
  'She gave up trying to fix the old laptop.',
  '["She gave up the problem easily.", "She gave the meeting up.", "She gave up trying to fix the old laptop.", "She gave up to her manager."]',
  2, true),
(mod_id, 'multiple_choice', 'What does "back down" mean?',
  'To withdraw from a position or argument',
  '["To support someone", "To withdraw from a position or argument", "To sit at the back", "To return to a previous place"]',
  1, true),
(mod_id, 'multiple_choice', 'What is the meaning of "carry out" in "They carried out a full investigation"?',
  'To perform or complete a task',
  '["To transport something", "To perform or complete a task", "To exit carrying something", "To cancel a plan"]',
  1, true),

(mod_id, 'error_correction', 'Find and correct the error: "I can''t put up her rude behaviour."', 'I can''t put up WITH her rude behaviour. (missing "with" — put up with = tolerate)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "They called the meeting off at last minute."', 'They called off the meeting at the last minute. (correct but "at the last minute" needs "the"; both word orders are valid for separable phrasal verbs)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "She came up a great idea during the brainstorm."', 'She came up WITH a great idea during the brainstorm. (came up with = think of)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "We need to look the complaint into immediately."', 'We need to look INTO the complaint immediately. (inseparable phrasal verb — cannot split)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "He gave up to learn the guitar after a month."', 'He gave up LEARNING the guitar after a month. (give up + gerund, not infinitive)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "The project fell through because lack of funding."', 'The project fell through because OF a lack of funding. (because + of + noun phrase)', NULL, NULL, true);


-- ============================================================
-- MODULE 7: B2 Chunks
-- ============================================================
SELECT id INTO mod_id FROM modules WHERE name = 'B2 Chunks' AND level_id = (SELECT id FROM levels WHERE name = 'B2');

INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES

(mod_id, 'fill_blank', 'The results were impressive. ________, the team still has room for improvement.', 'That said', NULL, NULL, true),
(mod_id, 'fill_blank', '________ saying, everyone should respect their colleagues.', 'It goes without', NULL, NULL, true),
(mod_id, 'fill_blank', '________ in mind that the deadline is on Friday.', 'Bear', NULL, NULL, true),
(mod_id, 'fill_blank', 'He''s not the best speaker, but he gets his ________ across clearly.', 'point', NULL, NULL, true),
(mod_id, 'fill_blank', 'At the end of the ________, what matters most is the result.', 'day', NULL, NULL, true),
(mod_id, 'fill_blank', 'We need to ________ track of our expenses carefully this quarter.', 'keep', NULL, NULL, true),
(mod_id, 'fill_blank', 'The new regulation will ________ into effect next January.', 'come', NULL, NULL, true),
(mod_id, 'fill_blank', 'She managed to ________ a balance between work and personal life.', 'strike', NULL, NULL, true),

(mod_id, 'multiple_choice', 'What does "it goes without saying" mean?',
  'Something is so obvious it does not need to be stated.',
  '["Something is difficult to explain.", "Something is a secret.", "Something is so obvious it does not need to be stated.", "Something is not important."]',
  2, true),
(mod_id, 'multiple_choice', '"Bear in mind" is closest in meaning to:',
  'Remember / Keep in mind',
  '["Ignore", "Remember / Keep in mind", "Take action", "Disagree with"]',
  1, true),
(mod_id, 'multiple_choice', 'Which chunk is used to introduce a contrasting point after a positive statement?',
  'That said,',
  '["As a result,", "That said,", "In addition,", "For instance,"]',
  1, true),
(mod_id, 'multiple_choice', '"At the end of the day" is best used to express:',
  'What ultimately matters most',
  '["Time of day", "A summary conclusion of what matters most", "A reference to working hours", "What ultimately matters most"]',
  3, true),
(mod_id, 'multiple_choice', 'Which of the following is a B2-level chunk meaning "to consider"?',
  'take into account',
  '["give a hand", "take into account", "break the ice", "on the go"]',
  1, true),
(mod_id, 'multiple_choice', '"Come into effect" means:',
  'To become officially active or enforceable',
  '["To have an impact", "To become officially active or enforceable", "To cause a problem", "To end a rule"]',
  1, true),

(mod_id, 'error_correction', 'Find and correct the error: "It goes without to say that honesty is important."', '"It goes without SAYING that honesty is important." (to say → saying)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "Bear on mind that the exam is next week."', '"Bear IN mind that the exam is next week." (on → in)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "We should take in account the user feedback."', '"We should take INTO account the user feedback." (in → into)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "At the end of day, results speak for themselves."', '"At the end of THE day, results speak for themselves." (missing "the")', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "She got her message across to the audiences effectively."', '"She got her message across to the AUDIENCE effectively." (audiences → audience, no plural needed here)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "The new law will come on effect from next month."', '"The new law will come INTO effect from next month." (on → into)', NULL, NULL, true);


-- ============================================================
-- MODULE 8: Inversion
-- ============================================================
SELECT id INTO mod_id FROM modules WHERE name = 'Inversion' AND level_id = (SELECT id FROM levels WHERE name = 'B2');

INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES

(mod_id, 'fill_blank', 'Not only ________ he arrive late, but he also forgot the documents.', 'did', NULL, NULL, true),
(mod_id, 'fill_blank', 'Rarely ________ I see such dedication in a team.', 'do', NULL, NULL, true),
(mod_id, 'fill_blank', 'Under no circumstances ________ you share your password.', 'should', NULL, NULL, true),
(mod_id, 'fill_blank', 'Hardly ________ she sat down when the meeting started.', 'had', NULL, NULL, true),
(mod_id, 'fill_blank', 'Never ________ I experienced such a chaotic project launch.', 'have', NULL, NULL, true),
(mod_id, 'fill_blank', 'Only after the review ________ the team realise the mistake.', 'did', NULL, NULL, true),
(mod_id, 'fill_blank', 'No sooner ________ she left than the problem was solved.', 'had', NULL, NULL, true),
(mod_id, 'fill_blank', 'Little ________ they know about the upcoming changes.', 'do', NULL, NULL, true),

(mod_id, 'multiple_choice', 'Which sentence is an example of formal inversion?',
  'Not only did he solve the bug, but he also improved performance.',
  '["He not only solved the bug but also improved performance.", "Not only did he solve the bug, but he also improved performance.", "Not only he solved the bug, but also improved performance.", "He solved the bug and also improved performance."]',
  1, true),
(mod_id, 'multiple_choice', '"Rarely do we encounter such talent." What is the base sentence?',
  'We rarely encounter such talent.',
  '["Talent is rarely encountered.", "We rarely encounter such talent.", "Such talent is rarely here.", "We do rarely encounter talent."]',
  1, true),
(mod_id, 'multiple_choice', 'Which negative adverbial triggers inversion?',
  'Under no circumstances',
  '["Usually", "Sometimes", "Under no circumstances", "Often"]',
  2, true),
(mod_id, 'multiple_choice', 'Choose the correct inversion: "She had no sooner arrived ________ the alarm went off."',
  'than',
  '["when", "than", "then", "that"]',
  1, true),
(mod_id, 'multiple_choice', 'Which of the following does NOT trigger inversion?',
  'Although',
  '["Hardly", "Never", "Only then", "Although"]',
  3, true),
(mod_id, 'multiple_choice', '"Only when the deadline passed did we realise the error." This structure is used to:',
  'Add formal emphasis to the timing of the realisation.',
  '["Describe a future plan.", "Suggest a condition.", "Add formal emphasis to the timing of the realisation.", "Show a contrast."]',
  2, true),

(mod_id, 'error_correction', 'Find and correct the error: "Not only he failed the test, but also missed the deadline."', '"Not only DID HE fail the test, but he also missed the deadline." (inversion required after "not only")', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "Rarely I see such commitment in young employees."', '"Rarely DO I see such commitment in young employees." (inversion: auxiliary + subject)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "No sooner she had left than the news broke."', '"No sooner HAD SHE left than the news broke." (inversion required after "no sooner")', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "Under no circumstances you should give up."', '"Under no circumstances SHOULD YOU give up." (inversion: modal + subject)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "Never I have seen such a mess in my life."', '"Never HAVE I seen such a mess in my life." (inversion: have + I)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "Hardly she had started when the power cut out."', '"Hardly HAD SHE started when the power cut out." (inversion required after "hardly")', NULL, NULL, true);


-- ============================================================
-- MODULE 9: Discourse Markers
-- ============================================================
SELECT id INTO mod_id FROM modules WHERE name = 'Discourse Markers' AND level_id = (SELECT id FROM levels WHERE name = 'B2');

INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES

(mod_id, 'fill_blank', 'The experiment was a failure. ________, it gave us valuable data.', 'Nevertheless', NULL, NULL, true),
(mod_id, 'fill_blank', '________, the company plans to expand into three new markets.', 'Furthermore', NULL, NULL, true),
(mod_id, 'fill_blank', 'The first approach failed. ________, we decided to try a different method.', 'Consequently', NULL, NULL, true),
(mod_id, 'fill_blank', 'He is highly qualified. ________, he lacks practical experience.', 'In contrast', NULL, NULL, true),
(mod_id, 'fill_blank', 'The project was costly. ________, it was worth the investment.', 'Nonetheless', NULL, NULL, true),
(mod_id, 'fill_blank', 'She prepared thoroughly. ________, she passed with flying colours.', 'As a result', NULL, NULL, true),
(mod_id, 'fill_blank', 'The policy is strict. ________, it has been effective in reducing errors.', 'That said', NULL, NULL, true),
(mod_id, 'fill_blank', 'The report was long. ________, every section was clearly written.', 'Even so', NULL, NULL, true),

(mod_id, 'multiple_choice', 'Which discourse marker shows CONTRAST?',
  'Nevertheless',
  '["Furthermore", "Therefore", "Nevertheless", "As a result"]',
  2, true),
(mod_id, 'multiple_choice', 'Which marker adds information to a previous point?',
  'Moreover',
  '["On the contrary", "However", "Moreover", "Despite this"]',
  2, true),
(mod_id, 'multiple_choice', 'What does "consequently" signal?',
  'A result or effect',
  '["A contrast", "A result or effect", "An addition", "A concession"]',
  1, true),
(mod_id, 'multiple_choice', '"In contrast" is best used when:',
  'Showing a difference between two things',
  '["Adding a new point", "Giving an example", "Showing a difference between two things", "Stating a conclusion"]',
  2, true),
(mod_id, 'multiple_choice', 'Which of the following is a discourse marker for CONCESSION?',
  'Even though',
  '["Therefore", "In addition", "Even though", "As a result"]',
  2, true),
(mod_id, 'multiple_choice', 'Which sentence uses a discourse marker INCORRECTLY?',
  'The app crashed. Furthermore, it was a great experience.',
  '["The app crashed. As a result, we lost data.", "The app crashed. Furthermore, it was a great experience.", "The app crashed. Nevertheless, we recovered quickly.", "The app crashed. Therefore, we restarted the server."]',
  1, true),

(mod_id, 'error_correction', 'Find and correct the error: "She studied hard. Despite, she failed the test."', '"She studied hard. DESPITE THIS / EVEN SO, she failed the test." ("Despite" must be followed by a noun/gerund or "this"; not used alone as a sentence connector)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "The team worked overnight. However, they submitted the project in time."', 'Correct usage — but better with a comma: "The team worked overnight. However, they submitted the project ON time." ("in time" means before a deadline — actually this is acceptable. Accept as correct or note: both "in time" and "on time" are possible.)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "Furthermore, but the results were positive."', '"Furthermore, the results were positive." OR "The results were positive, but…" (cannot combine "Furthermore" and "but")', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "The budget was cut. Nevertheless but they continued the project."', '"The budget was cut. Nevertheless, they continued the project." (remove "but" — do not combine two contrast markers)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "As a result of, the company grew rapidly."', '"As a result, the company grew rapidly." OR "As a result OF the strategy, the company grew rapidly." (cannot end with "of" alone)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "In contrast to, the second team performed better."', '"In contrast, the second team performed better." OR "In contrast TO the first team, the second team performed better." (cannot end with "to" alone)', NULL, NULL, true);


-- ============================================================
-- MODULE 10: Collocations & Idioms
-- ============================================================
SELECT id INTO mod_id FROM modules WHERE name = 'Collocations & Idioms' AND level_id = (SELECT id FROM levels WHERE name = 'B2');

INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES

(mod_id, 'fill_blank', 'She needs to ________ a decision about the job offer by Friday.', 'make', NULL, NULL, true),
(mod_id, 'fill_blank', 'It took a lot of courage to ________ a habit of waking up at 5 AM.', 'break', NULL, NULL, true),
(mod_id, 'fill_blank', 'The new policy will ________ effect from next quarter.', 'take', NULL, NULL, true),
(mod_id, 'fill_blank', 'Don''t worry — things will ________ into place once the team settles in.', 'fall', NULL, NULL, true),
(mod_id, 'fill_blank', 'He tends to ________ corners when he''s under pressure. (do something carelessly)', 'cut', NULL, NULL, true),
(mod_id, 'fill_blank', 'We need to ________ an exception this time given the circumstances.', 'make', NULL, NULL, true),
(mod_id, 'fill_blank', 'She always ________ the initiative during team meetings.', 'takes', NULL, NULL, true),
(mod_id, 'fill_blank', 'It''s time to ________ the bull by the horns and address the issue directly.', 'take', NULL, NULL, true),

(mod_id, 'multiple_choice', 'Which collocation is correct?',
  'make a mistake',
  '["do a mistake", "make a mistake", "have a mistake", "take a mistake"]',
  1, true),
(mod_id, 'multiple_choice', 'What does "hit the nail on the head" mean?',
  'To say or identify something exactly right',
  '["To injure someone", "To say or identify something exactly right", "To work very hard", "To solve a problem physically"]',
  1, true),
(mod_id, 'multiple_choice', 'Which phrase means "to start from the beginning, without any advantage"?',
  'from scratch',
  '["from the top", "from scratch", "from now on", "from the ground"]',
  1, true),
(mod_id, 'multiple_choice', 'Choose the correct collocation: "We need to ________ progress on this issue."',
  'make',
  '["do", "take", "make", "have"]',
  2, true),
(mod_id, 'multiple_choice', '"Bite the bullet" means:',
  'To endure a difficult situation with courage',
  '["To eat something dangerous", "To speak aggressively", "To endure a difficult situation with courage", "To make a quick decision"]',
  2, true),
(mod_id, 'multiple_choice', 'Which idiom means "to avoid the main topic"?',
  'beat around the bush',
  '["hit the ground running", "beat around the bush", "cut to the chase", "face the music"]',
  1, true),

(mod_id, 'error_correction', 'Find and correct the error: "She did a great decision during the crisis."', '"She MADE a great decision during the crisis." (do → make, collocation: make a decision)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "He took a habit of reading before bed."', '"He MADE a habit of reading before bed." OR "He BROKE a bad habit." (take a habit → make a habit)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "Let''s make from scratch and redesign the whole thing."', '"Let''s START from scratch and redesign the whole thing." (make from scratch → start from scratch)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "The manager did an exception for the new hire."', '"The manager MADE an exception for the new hire." (do → make)', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "She always beats around bushes instead of being direct."', '"She always beats around THE bush instead of being direct." (missing "the")', NULL, NULL, true),
(mod_id, 'error_correction', 'Find and correct the error: "They took the initiative to solving the problem early."', '"They took the initiative to SOLVE the problem early." (to + gerund → to + base verb)', NULL, NULL, true);

END $$;

-- ============================================================
-- UPDATE total_cards for all B2 modules
-- ============================================================
UPDATE modules m
SET total_cards = (
  SELECT COUNT(*) FROM cards c WHERE c.module_id = m.id
)
WHERE m.level_id = (SELECT id FROM levels WHERE name = 'B2');
