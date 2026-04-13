-- ============================================================
-- SEED CARDS -- C1 & C2 Level (18 modules x 20 cards = 360 cards)
-- Types: fill_blank, multiple_choice, error_correction
-- All characters ASCII-safe, apostrophes escaped as ''
-- Run AFTER schema + levels/modules seed
-- ============================================================

DO $$
DECLARE
  mod_id UUID;
BEGIN

-- ============================================================
-- C1 MODULE 1: Mixed Conditionals
-- ============================================================
SELECT id INTO mod_id FROM modules WHERE name = 'Mixed Conditionals' AND level_id = (SELECT id FROM levels WHERE name = 'C1');

INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES

(mod_id, 'fill_blank', 'If she ________ (take) the scholarship, she would be living in London now.', 'had taken', NULL, NULL, true),
(mod_id, 'fill_blank', 'He wouldn''t be so confident now if he ________ (not / practice) for years.', 'had not practised', NULL, NULL, true),
(mod_id, 'fill_blank', 'If I ________ (be) more disciplined as a student, I would have a degree by now.', 'were', NULL, NULL, true),
(mod_id, 'fill_blank', 'She ________ (finish) the project by now if she had started earlier.', 'would have finished', NULL, NULL, true),
(mod_id, 'fill_blank', 'If he ________ (not / be) so stubborn, he would have accepted the help.', 'were not', NULL, NULL, true),
(mod_id, 'fill_blank', 'They ________ (still / work) here if the company had not downsized.', 'would still be working', NULL, NULL, true),
(mod_id, 'fill_blank', 'If I ________ (listen) to my mentor, I would not be in this situation now.', 'had listened', NULL, NULL, true),
(mod_id, 'fill_blank', 'She ________ (know) the answer by now if she had read the manual.', 'would know', NULL, NULL, true),

(mod_id, 'multiple_choice', 'Which sentence is a correct Mixed Conditional?',
  'If he had trained harder, he would be on the national team now.',
  '["If he trained harder, he would be on the national team now.", "If he had trained harder, he would be on the national team now.", "If he had trained harder, he would have been on the national team now.", "If he trains harder, he will be on the national team."]',
  1, true),
(mod_id, 'multiple_choice', 'A Mixed Conditional typically combines which two conditionals?',
  '3rd conditional if-clause + 2nd conditional result',
  '["1st conditional if-clause + 3rd conditional result", "3rd conditional if-clause + 2nd conditional result", "Zero conditional + 1st conditional", "2nd conditional if-clause + 1st conditional result"]',
  1, true),
(mod_id, 'multiple_choice', '"If I were braver, I would have spoken up at the meeting." What does this express?',
  'A present trait causing regret about a past action.',
  '["A past trait causing a present consequence.", "A present trait causing regret about a past action.", "A future plan based on a past decision.", "An unreal present situation with no connection to the past."]',
  1, true),
(mod_id, 'multiple_choice', 'Choose the correct Mixed Conditional: She is not a doctor. She did not treat the patient.',
  'If she were a doctor, she would have treated the patient.',
  '["If she had been a doctor, she would treat the patient.", "If she is a doctor, she would have treated the patient.", "If she were a doctor, she would have treated the patient.", "If she was a doctor, she will treat the patient."]',
  2, true),
(mod_id, 'multiple_choice', 'Identify the mixed conditional type: "If I had invested early, I would be retired by now."',
  'Past if-clause, present result clause',
  '["Present if-clause, past result clause", "Past if-clause, present result clause", "Past if-clause, past result clause", "Present if-clause, present result clause"]',
  1, true),
(mod_id, 'multiple_choice', 'Which sentence shows the reverse mixed conditional (present -> past consequence)?',
  'If he were not so careless, he would not have made that mistake.',
  '["If he had been careful, he would be more reliable now.", "If he were not so careless, he would not have made that mistake.", "If he had not made the mistake, he would be careful now.", "If he is careful, he would not have made the mistake."]',
  1, true),

(mod_id, 'error_correction', 'Correct the error: "If I had more confidence now, I would have applied for the job last year."', 'If I HAD HAD more confidence then/at that time, I would have applied for the job last year. (the if-clause needs past perfect for a past situation -- or restructure entirely)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "If she was more organised, she would have met the deadline."', 'If she WERE more organised (now), she would have met the deadline. (use "were" not "was" for subjunctive in hypothetical mixed conditionals)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "He wouldn''t be struggling now if he would have listened."', 'He wouldn''t be struggling now if he HAD listened. (no "would" in the if-clause -- use had + past participle)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "If they invested better, they would have been wealthy now."', 'If they HAD INVESTED better, they would BE wealthy now. (past perfect in if-clause; would be for present result)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "She would have a better job now if she studied harder at university."', 'She would have a better job now if she HAD STUDIED harder at university. (past perfect needed for completed past action)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "If I am more patient, I would not have quit."', 'If I WERE more patient (by nature), I would not have quit. (present hypothetical needs "were", not "am")', NULL, NULL, true);


-- ============================================================
-- C1 MODULE 2: Subjunctive
-- ============================================================
SELECT id INTO mod_id FROM modules WHERE name = 'Subjunctive' AND level_id = (SELECT id FROM levels WHERE name = 'C1');

INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES

(mod_id, 'fill_blank', 'The committee recommends that every member ________ (submit) a report monthly.', 'submit', NULL, NULL, true),
(mod_id, 'fill_blank', 'It is essential that the contract ________ (sign) before the end of the week.', 'be signed', NULL, NULL, true),
(mod_id, 'fill_blank', 'The doctor insisted that he ________ (rest) for at least a week.', 'rest', NULL, NULL, true),
(mod_id, 'fill_blank', 'If I ________ (be) you, I would reconsider the offer.', 'were', NULL, NULL, true),
(mod_id, 'fill_blank', 'It is vital that the data ________ (back up) every 24 hours.', 'be backed up', NULL, NULL, true),
(mod_id, 'fill_blank', 'She spoke as if she ________ (own) the entire company.', 'owned', NULL, NULL, true),
(mod_id, 'fill_blank', 'The board proposed that the budget ________ (review) quarterly.', 'be reviewed', NULL, NULL, true),
(mod_id, 'fill_blank', 'It is crucial that each delegate ________ (have) a copy of the agenda.', 'have', NULL, NULL, true),

(mod_id, 'multiple_choice', 'Which sentence uses the mandative subjunctive correctly?',
  'The manager requested that the team submit the report by Friday.',
  '["The manager requested that the team submits the report by Friday.", "The manager requested that the team submitted the report by Friday.", "The manager requested that the team submit the report by Friday.", "The manager requested that the team will submit the report by Friday."]',
  2, true),
(mod_id, 'multiple_choice', 'The subjunctive form "be" is used after which type of expression?',
  'Expressions of necessity, recommendation, or urgency',
  '["Questions about ability", "Expressions of necessity, recommendation, or urgency", "Simple factual statements", "Time expressions with while or when"]',
  1, true),
(mod_id, 'multiple_choice', '"Were I to resign, the whole team would be affected." This is an example of:',
  'Formal subjunctive inversion replacing an if-clause',
  '["A passive sentence", "Formal subjunctive inversion replacing an if-clause", "An indirect question", "A relative clause"]',
  1, true),
(mod_id, 'multiple_choice', 'Which sentence correctly uses the past subjunctive?',
  'She wished she were able to attend the ceremony.',
  '["She wished she was able to attend the ceremony.", "She wished she is able to attend the ceremony.", "She wished she were able to attend the ceremony.", "She wished she would be able to attend the ceremony."]',
  2, true),
(mod_id, 'multiple_choice', 'Identify the subjunctive in: "It is imperative that all staff be present."',
  '"be" -- base form used regardless of subject',
  '["present" -- present tense verb", "be" -- base form used regardless of subject", "staff" -- collective noun acting as subject", "all" -- universal quantifier"]',
  1, true),
(mod_id, 'multiple_choice', 'Which word does NOT typically trigger the mandative subjunctive?',
  'think',
  '["recommend", "insist", "suggest", "think"]',
  3, true),

(mod_id, 'error_correction', 'Correct the error: "The policy requires that every employee signs the form."', 'The policy requires that every employee SIGN the form. (subjunctive -- no -s on third person singular)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "It is essential that she is informed immediately."', 'It is essential that she BE informed immediately. (subjunctive passive -- "be informed", not "is informed")', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "I suggest that he reconsiders his decision."', 'I suggest that he RECONSIDER his decision. (subjunctive -- no -s, base form)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "If I was in charge, I would handle it differently."', 'If I WERE in charge, I would handle it differently. (past subjunctive uses "were" for all persons)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "The committee proposed that the funds are allocated fairly."', 'The committee proposed that the funds BE ALLOCATED fairly. (mandative subjunctive passive)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "She acted as if she owns the place."', 'She acted as if she OWNED the place. (past subjunctive after "as if" -- backshift to past)', NULL, NULL, true);


-- ============================================================
-- C1 MODULE 3: Cleft Sentences
-- ============================================================
SELECT id INTO mod_id FROM modules WHERE name = 'Cleft Sentences' AND level_id = (SELECT id FROM levels WHERE name = 'C1');

INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES

(mod_id, 'fill_blank', '________ was the deadline that caused all the stress, not the workload.', 'It', NULL, NULL, true),
(mod_id, 'fill_blank', 'What I need right now ________ a strong cup of coffee.', 'is', NULL, NULL, true),
(mod_id, 'fill_blank', 'It ________ John who came up with the solution, not Sarah.', 'was', NULL, NULL, true),
(mod_id, 'fill_blank', 'What surprised me most ________ how quickly the team adapted.', 'was', NULL, NULL, true),
(mod_id, 'fill_blank', 'It is the attention to detail ________ sets this team apart.', 'that', NULL, NULL, true),
(mod_id, 'fill_blank', 'What we really need to focus on ________ customer retention.', 'is', NULL, NULL, true),
(mod_id, 'fill_blank', 'It was not until she read the report ________ she understood the full picture.', 'that', NULL, NULL, true),
(mod_id, 'fill_blank', 'What the users are asking for ________ a simpler interface.', 'is', NULL, NULL, true),

(mod_id, 'multiple_choice', 'Which is a correct it-cleft sentence?',
  'It was the new manager who introduced the policy.',
  '["It was the new manager introduced the policy.", "It is the new manager who introduced the policy.", "It was the new manager who introduced the policy.", "It was the new manager that he introduced the policy."]',
  2, true),
(mod_id, 'multiple_choice', 'What is the purpose of a cleft sentence?',
  'To emphasise one specific element of a sentence',
  '["To form a passive construction", "To emphasise one specific element of a sentence", "To express a condition", "To show reported speech"]',
  1, true),
(mod_id, 'multiple_choice', '"What I enjoy most is collaborating with creative people." This is a:',
  'Wh-cleft (pseudo-cleft) sentence',
  '["It-cleft sentence", "Wh-cleft (pseudo-cleft) sentence", "Passive cleft", "Inverted cleft"]',
  1, true),
(mod_id, 'multiple_choice', 'Rewrite with emphasis on "the budget": "The board rejected the budget."',
  'It was the budget that the board rejected.',
  '["It was the board that rejected the budget.", "It was the budget that the board rejected.", "What the board did was to reject the budget.", "The budget, it was rejected by the board."]',
  1, true),
(mod_id, 'multiple_choice', 'Which sentence is a reverse cleft (inverted pseudo-cleft)?',
  'A sense of urgency is what the team is missing.',
  '["What the team is missing is a sense of urgency.", "A sense of urgency is what the team is missing.", "It is a sense of urgency the team misses.", "The team is missing what is a sense of urgency."]',
  1, true),
(mod_id, 'multiple_choice', '"It was not until midnight that the system came back online." This cleft emphasises:',
  'The late timing of the recovery',
  '["The system itself", "The cause of the outage", "The late timing of the recovery", "The person responsible"]',
  2, true),

(mod_id, 'error_correction', 'Correct the error: "It was the manager who he solved the problem."', 'It was the manager who SOLVED the problem. (remove redundant "he" -- "who" is already the subject)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "What I need it is more time."', 'What I need IS more time. (remove redundant "it" -- "what I need" is already the subject)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "It is honesty what I value most."', 'It is honesty THAT I value most. (use "that" not "what" in it-cleft)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "It was not until she left that she realises the impact."', 'It was not until she left that she REALISED the impact. (past tense needed for consistency)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "What the report shows them are serious gaps."', 'What the report shows IS serious gaps. (remove "them"; "what...shows" is the subject, verb should be "is")', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "It was the feedback which it helped me grow."', 'It was the feedback THAT helped me grow. (use "that", remove second "it")', NULL, NULL, true);


-- ============================================================
-- C1 MODULE 4: Advanced Passive Forms
-- ============================================================
SELECT id INTO mod_id FROM modules WHERE name = 'Advanced Passive Forms' AND level_id = (SELECT id FROM levels WHERE name = 'C1');

INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES

(mod_id, 'fill_blank', 'The new law is expected ________ (enforce) strictly from next year.', 'to be enforced', NULL, NULL, true),
(mod_id, 'fill_blank', 'He is believed ________ (flee) the country before the arrest warrant was issued.', 'to have fled', NULL, NULL, true),
(mod_id, 'fill_blank', 'It ________ (report) that the CEO will step down next quarter.', 'is reported', NULL, NULL, true),
(mod_id, 'fill_blank', 'The suspect is said ________ (seen) near the building that evening.', 'to have been seen', NULL, NULL, true),
(mod_id, 'fill_blank', 'The findings ________ (present) to the board before the decision was made.', 'had been presented', NULL, NULL, true),
(mod_id, 'fill_blank', 'She ________ (consider) one of the most influential designers of her generation.', 'is considered', NULL, NULL, true),
(mod_id, 'fill_blank', 'The data ________ (collect) over a three-year period before the results were published.', 'had been collected', NULL, NULL, true),
(mod_id, 'fill_blank', 'The bridge ________ (expect / complete) by the end of the decade.', 'is expected to be completed', NULL, NULL, true),

(mod_id, 'multiple_choice', 'Which sentence uses the passive infinitive correctly?',
  'The report is said to have been leaked.',
  '["The report is said to have leaked.", "The report is said to have been leaked.", "The report said to be leaked.", "The report is saying to have been leaked."]',
  1, true),
(mod_id, 'multiple_choice', 'Transform to passive: "People believe he stole the data."',
  'He is believed to have stolen the data.',
  '["He is believed to steal the data.", "He is believed to have stolen the data.", "He was believed to steal the data.", "He has been believed to have stolen the data."]',
  1, true),
(mod_id, 'multiple_choice', '"It is alleged that she embezzled company funds." The personal passive form is:',
  'She is alleged to have embezzled company funds.',
  '["She alleged to have embezzled company funds.", "She is alleged to embezzle company funds.", "She is alleged to have embezzled company funds.", "She has been alleged to embezzle company funds."]',
  2, true),
(mod_id, 'multiple_choice', 'Which passive form correctly refers to an action earlier than the reporting verb?',
  'Passive infinitive perfect: to have been + past participle',
  '["Simple passive infinitive: to be + past participle", "Passive infinitive perfect: to have been + past participle", "Passive gerund: being + past participle", "Modal passive: should be + past participle"]',
  1, true),
(mod_id, 'multiple_choice', 'Choose the correct sentence: The document ___ before the meeting ended.',
  'had been signed',
  '["has been signed", "was being signed", "had been signed", "will have been signed"]',
  2, true),
(mod_id, 'multiple_choice', 'Which verb does NOT typically introduce an impersonal passive (It is... that)?',
  'enjoy',
  '["claim", "believe", "report", "enjoy"]',
  3, true),

(mod_id, 'error_correction', 'Correct the error: "He is believed to flee the country last month."', 'He is believed to HAVE FLED the country last month. (past reference needs perfect passive infinitive)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "It is reported that the prices will rise next year."', 'Grammatically acceptable -- but also correct as: "Prices are reported to be set to rise next year." (accept as correct or note the more formal alternative)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "The research was said to be conducting for five years."', 'The research was said to have been CONDUCTED for five years. (conducting -> conducted; need perfect passive infinitive)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "She is considered as one of the best in her field."', 'She is considered ONE of the best in her field. (remove "as" -- consider does not take "as" in passive)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "The new regulation is expected enforcing from next month."', 'The new regulation is expected TO BE ENFORCED from next month. (need passive infinitive: to be + past participle)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "By the time auditors arrived, all files were destroying."', 'By the time auditors arrived, all files HAD BEEN DESTROYED. (past perfect passive needed; destroying -> destroyed)', NULL, NULL, true);


-- ============================================================
-- C1 MODULE 5: Ellipsis & Substitution
-- ============================================================
SELECT id INTO mod_id FROM modules WHERE name = 'Ellipsis & Substitution' AND level_id = (SELECT id FROM levels WHERE name = 'C1');

INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES

(mod_id, 'fill_blank', '"Are you coming tonight?" "I ________." (expressing possibility without repeating "coming tonight")', 'might', NULL, NULL, true),
(mod_id, 'fill_blank', '"Did she call?" "She said she ________." (avoiding repetition of "would call")', 'would', NULL, NULL, true),
(mod_id, 'fill_blank', 'I wanted to go to the concert, but I wasn''t able ________. (ellipsis of "to go")', 'to', NULL, NULL, true),
(mod_id, 'fill_blank', '"Can you help?" "I''ll try ________." (ellipsis of "to help")', 'to', NULL, NULL, true),
(mod_id, 'fill_blank', '"Have you eaten?" "Not ________." (short elliptical answer)', 'yet', NULL, NULL, true),
(mod_id, 'fill_blank', 'She said she would finish the task, and she ________. (substitution with "did")', 'did', NULL, NULL, true),
(mod_id, 'fill_blank', '"Who broke the window?" "________ did." (substitution for a noun phrase)', 'He / She / They', NULL, NULL, true),
(mod_id, 'fill_blank', 'I have never been to Japan, and neither ________ my sister.', 'has', NULL, NULL, true),

(mod_id, 'multiple_choice', 'What is ellipsis in grammar?',
  'Omitting words that are understood from context',
  '["Replacing a word with a pronoun", "Omitting words that are understood from context", "Using formal language in informal contexts", "Inverting subject and verb for emphasis"]',
  1, true),
(mod_id, 'multiple_choice', '"I can swim and so can she." What is "so can she" an example of?',
  'Substitution using an auxiliary verb',
  '["Ellipsis of the verb phrase", "Substitution using an auxiliary verb", "Inversion for emphasis", "A cleft sentence"]',
  1, true),
(mod_id, 'multiple_choice', 'Which response uses ellipsis correctly?',
  'A: "Are you ready?" B: "Almost."',
  '["A: Are you ready? B: I am almost ready.", "A: Are you ready? B: Almost.", "A: Are you ready? B: Ready almost.", "A: Are you ready? B: Yes, I ready."]',
  1, true),
(mod_id, 'multiple_choice', '"She promised to call, and she did." What does "did" substitute?',
  '"called" (the full verb phrase)',
  '["she" (the subject)", "promised" (the main verb)", "called" (the full verb phrase)", "to call" (the infinitive phrase)"]',
  2, true),
(mod_id, 'multiple_choice', 'Which sentence uses "so" as substitution correctly?',
  'A: "Is the meeting cancelled?" B: "I believe so."',
  '["A: Is the meeting cancelled? B: I believe it so.", "A: Is the meeting cancelled? B: I believe so.", "A: Is the meeting cancelled? B: I so believe.", "A: Is the meeting cancelled? B: So I believe it."]',
  1, true),
(mod_id, 'multiple_choice', '"I didn''t enjoy the film, but my colleague did." What tense/form does "did" stand in for?',
  '"enjoyed the film" in simple past',
  '["enjoyed the film" in simple past", "enjoys the film" in simple present", "had enjoyed the film" in past perfect", "was enjoying the film" in past continuous"]',
  0, true),

(mod_id, 'error_correction', 'Correct the error: "I wanted to go but I wasn''t able to go."', '"I wanted to go but I wasn''t able TO." (omit "go" -- ellipsis after "to" is natural)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "She said she''d come and she came did."', '"She said she''d come and she DID." (incorrect placement and form -- use "did" at the end, not "came did")', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "I haven''t finished yet my report."', '"I haven''t finished my report YET." (yet goes at the end of the clause)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "Neither I have been to Paris."', '"Neither HAVE I been to Paris." (inversion required after neither)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "A: Can you drive? B: I think not so."', '"A: Can you drive? B: I think NOT." or "I don''t think so." ("not so" is not idiomatic -- use "not" alone or "I don''t think so")', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "He finished early and so I did."', '"He finished early and SO DID I." (inversion: so + auxiliary + subject)', NULL, NULL, true);


-- ============================================================
-- C1 MODULE 6: C1 Phrasal Verbs
-- ============================================================
SELECT id INTO mod_id FROM modules WHERE name = 'C1 Phrasal Verbs' AND level_id = (SELECT id FROM levels WHERE name = 'C1');

INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES

(mod_id, 'fill_blank', 'Don''t be fooled by his charm -- I can ________ him. He''s not being sincere. (see through)', 'see through', NULL, NULL, true),
(mod_id, 'fill_blank', 'When everything else failed, she had to ________ her savings. (rely on as a backup)', 'fall back on', NULL, NULL, true),
(mod_id, 'fill_blank', 'The investigation ________ evidence of widespread corruption. (revealed)', 'brought to light', NULL, NULL, true),
(mod_id, 'fill_blank', 'He managed to ________ his nerves before the presentation. (control)', 'keep a lid on', NULL, NULL, true),
(mod_id, 'fill_blank', 'The deal ________ after months of negotiation. (finally succeeded)', 'came through', NULL, NULL, true),
(mod_id, 'fill_blank', 'She could not ________ what the consultant was implying. (understand fully)', 'make out', NULL, NULL, true),
(mod_id, 'fill_blank', 'The new manager really ________ the expectations set by her predecessor. (exceeded)', 'lived up to', NULL, NULL, true),
(mod_id, 'fill_blank', 'We had to ________ the launch because of supplier delays. (delay further)', 'push back', NULL, NULL, true),

(mod_id, 'multiple_choice', 'What does "see through" mean in "She saw through his excuse immediately"?',
  'To recognise that something is not genuine',
  '["To look carefully at something transparent", "To finish something to the end", "To recognise that something is not genuine", "To support someone through difficulty"]',
  2, true),
(mod_id, 'multiple_choice', 'What does "fall back on" mean?',
  'To rely on something as a last resort',
  '["To trip and fall", "To rely on something as a last resort", "To reject an idea", "To return to a previous position"]',
  1, true),
(mod_id, 'multiple_choice', '"The scandal came to light last week." What does "came to light" mean?',
  'Became publicly known',
  '["Was resolved", "Was covered up", "Became publicly known", "Was investigated"]',
  2, true),
(mod_id, 'multiple_choice', 'Which phrasal verb means "to meet the required standard"?',
  'live up to',
  '["fall back on", "live up to", "bring about", "see off"]',
  1, true),
(mod_id, 'multiple_choice', '"The company had to write off the losses." What does "write off" mean here?',
  'To accept something as a loss and remove it from accounts',
  '["To document the losses in writing", "To accept something as a loss and remove it from accounts", "To investigate the losses", "To dispute the losses legally"]',
  1, true),
(mod_id, 'multiple_choice', 'What does "make out" mean in "I couldn''t make out what she was saying"?',
  'To understand or hear clearly',
  '["To pretend", "To write a cheque", "To understand or hear clearly", "To argue"]',
  2, true),

(mod_id, 'error_correction', 'Correct the error: "She fell back in her emergency fund after losing her job."', '"She fell back ON her emergency fund after losing her job." (fall back on = rely on as a last resort)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "He tried to see the deception through immediately."', '"He tried to see THROUGH the deception immediately." (inseparable phrasal verb -- cannot split)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "The project finally came through of all the obstacles."', '"The project finally came through DESPITE all the obstacles." (came through does not take "of")', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "The research brought to light that corruption was widespread."', 'Acceptable -- but more natural: "The research brought TO LIGHT evidence of widespread corruption." (usually brings a noun phrase to light, not a full clause)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "He didn''t live up the high standards set by his mentor."', '"He didn''t live up TO the high standards set by his mentor." (live up to -- missing "to")', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "We had to push the launch date back of two weeks."', '"We had to push the launch date back BY two weeks." (push back by -- "of" -> "by")', NULL, NULL, true);


-- ============================================================
-- C1 MODULE 7: Register & Tone
-- ============================================================
SELECT id INTO mod_id FROM modules WHERE name = 'Register & Tone' AND level_id = (SELECT id FROM levels WHERE name = 'C1');

INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES

(mod_id, 'fill_blank', 'Formal: "We regret to inform you that your application has been ________." (not successful)', 'unsuccessful', NULL, NULL, true),
(mod_id, 'fill_blank', 'Informal equivalent of "I wish to enquire about": "I just wanted to ________ about..."', 'ask', NULL, NULL, true),
(mod_id, 'fill_blank', 'Academic writing avoids first-person: Instead of "I found", use "It ________ found that..."', 'was', NULL, NULL, true),
(mod_id, 'fill_blank', 'Formal alternative to "but": "________, the results were inconclusive."', 'However', NULL, NULL, true),
(mod_id, 'fill_blank', 'Softening a refusal in formal English: "I am afraid we are ________ to accommodate your request."', 'unable', NULL, NULL, true),
(mod_id, 'fill_blank', 'Casual alternative to "therefore": "________, I think we should go ahead."', 'So', NULL, NULL, true),
(mod_id, 'fill_blank', 'In academic writing, "a lot of" is replaced by "________ of" or "a great deal of".', 'a significant number / a large amount', NULL, NULL, true),
(mod_id, 'fill_blank', 'Formal alternative to "find out": "We will ________ the cause of the error."', 'ascertain / determine / investigate', NULL, NULL, true),

(mod_id, 'multiple_choice', 'Which sentence is most appropriate for a formal business email?',
  'We would like to bring to your attention a discrepancy in the recent invoice.',
  '["Hey, there''s a mistake in the bill.", "Just wanted to flag a problem with the invoice.", "We would like to bring to your attention a discrepancy in the recent invoice.", "FYI, something''s off with the invoice."]',
  2, true),
(mod_id, 'multiple_choice', 'Which feature is typical of academic register?',
  'Impersonal passive constructions and formal vocabulary',
  '["Contractions and colloquial vocabulary", "Short sentences and personal anecdotes", "Impersonal passive constructions and formal vocabulary", "Exclamation marks and emotional appeals"]',
  2, true),
(mod_id, 'multiple_choice', 'Which word is MOST informal?',
  'reckon',
  '["consider", "assume", "believe", "reckon"]',
  3, true),
(mod_id, 'multiple_choice', 'Identify the appropriate register shift: converting "We''re sorry to say we can''t help." to formal.',
  'We regret to inform you that we are unable to assist.',
  '["Sorry, we can''t help you out.", "We are sad to tell you we cannot help.", "We regret to inform you that we are unable to assist.", "Unfortunately we won''t be able to help."]',
  2, true),
(mod_id, 'multiple_choice', 'Which is a hedging expression typical of formal/academic register?',
  'It could be argued that...',
  '["Obviously...", "Everyone knows that...", "It could be argued that...", "Clearly and simply..."]',
  2, true),
(mod_id, 'multiple_choice', 'In formal writing, contractions such as "don''t" and "can''t" should be:',
  'Avoided and replaced with full forms',
  '["Used frequently for natural flow", "Used only with modals", "Avoided and replaced with full forms", "Used in parentheses only"]',
  2, true),

(mod_id, 'error_correction', 'Correct the register error in a formal letter: "I wanna ask about the job vacancy."', '"I wish to enquire about the job vacancy." or "I am writing to ask about the job vacancy." ("wanna" is far too informal)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error in academic writing: "Lots of studies have shown this to be true."', '"A significant number of studies have demonstrated this to be true." (lots of -> a significant number of; shown -> demonstrated)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the register error: (In a report) "So the data shows we''ve done pretty well."', '"Therefore, the data indicates that performance has been satisfactory." (so -> therefore; we''ve done pretty well -> performance has been satisfactory)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error in a formal apology: "We''re really sorry for messing things up."', '"We sincerely apologise for the inconvenience caused." (too casual; replace with formal apology phrasing)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: (Academic) "I think globalisation is a good thing for everyone."', '"It can be argued that globalisation yields broad benefits." (avoid first person opinion in academic writing; hedge with it-cleft or passive)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the register mismatch: "Per your email of the 5th, wanna confirm the details."', '"Further to your email of the 5th, I would like to confirm the details." (wanna is informal; needs formal phrasing)', NULL, NULL, true);


-- ============================================================
-- C1 MODULE 8: C1 Chunks
-- ============================================================
SELECT id INTO mod_id FROM modules WHERE name = 'C1 Chunks' AND level_id = (SELECT id FROM levels WHERE name = 'C1');

INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES

(mod_id, 'fill_blank', 'The solution is imperfect. ________ considered, it is still the best available option.', 'All things', NULL, NULL, true),
(mod_id, 'fill_blank', '________ to say, the announcement caused widespread concern.', 'Needless', NULL, NULL, true),
(mod_id, 'fill_blank', 'The design is elegant, but it comes ________ a price.', 'at', NULL, NULL, true),
(mod_id, 'fill_blank', 'She didn''t say it outright, but she was clearly hinting ________ something.', 'at', NULL, NULL, true),
(mod_id, 'fill_blank', 'I''d like to ________ your attention to the second paragraph.', 'draw', NULL, NULL, true),
(mod_id, 'fill_blank', 'His behaviour left a lot ________ desired.', 'to be', NULL, NULL, true),
(mod_id, 'fill_blank', 'The plan is sound ________ principle, but difficult to execute.', 'in', NULL, NULL, true),
(mod_id, 'fill_blank', 'To put it ________, the project was a disaster.', 'bluntly', NULL, NULL, true),

(mod_id, 'multiple_choice', 'What does "all things considered" signal in a sentence?',
  'A balanced conclusion that acknowledges complexity',
  '["A strong contrast with the previous point", "A balanced conclusion that acknowledges complexity", "An introduction to new evidence", "A direct contradiction"]',
  1, true),
(mod_id, 'multiple_choice', '"Needless to say" is used when:',
  'The following point is obvious or already understood',
  '["The point is complex and needs explanation", "The speaker is uncertain", "The following point is obvious or already understood", "The speaker wants to emphasise a new idea"]',
  2, true),
(mod_id, 'multiple_choice', '"It leaves a lot to be desired" means:',
  'It is quite disappointing or below expectations',
  '["It is very impressive", "It needs a little improvement", "It is quite disappointing or below expectations", "It is exactly what was hoped for"]',
  2, true),
(mod_id, 'multiple_choice', '"To put it bluntly" signals that the speaker is about to:',
  'Say something directly and honestly, even if uncomfortable',
  '["Give a polite diplomatic response", "Introduce a complicated idea", "Say something directly and honestly, even if uncomfortable", "Contradict what was just said"]',
  2, true),
(mod_id, 'multiple_choice', 'What does "in principle" mean in "I agree in principle, but the details worry me"?',
  'In general or as a concept, but not necessarily in practice',
  '["Completely and without reservation", "In terms of financial principles", "In general or as a concept, but not necessarily in practice", "At the start of the process"]',
  2, true),
(mod_id, 'multiple_choice', '"I''d like to draw your attention to..." is typically used to:',
  'Direct the listener to focus on a specific point',
  '["Apologise for a mistake", "Direct the listener to focus on a specific point", "Introduce yourself formally", "Request clarification"]',
  1, true),

(mod_id, 'error_correction', 'Correct the error: "All things considered, the project it was a success."', '"All things considered, the project WAS a success." (remove redundant "it")', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "Needless saying, the results were disappointing."', '"Needless TO SAY, the results were disappointing." (needless to say -- fixed chunk)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "Quality comes on a price."', '"Quality comes AT a price." (come at a price -- correct preposition)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "She left much to be desired about her communication skills."', '"Her communication skills left much to be desired." (restructure -- the subject of "left...to be desired" should be the thing being criticised)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "I''d like to draw attention of the board to the risks."', '"I''d like to draw THE ATTENTION OF the board to the risks." or "I''d like to draw the board''s attention TO the risks." (phrasing fix)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "The idea is sound on principle but hard to implement."', '"The idea is sound IN principle but hard to implement." (in principle -- correct preposition)', NULL, NULL, true);


-- ============================================================
-- C1 MODULE 9: Discourse & Cohesion
-- ============================================================
SELECT id INTO mod_id FROM modules WHERE name = 'Discourse & Cohesion' AND level_id = (SELECT id FROM levels WHERE name = 'C1');

INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES

(mod_id, 'fill_blank', 'The economy grew. ________, unemployment fell to a record low.', 'Correspondingly', NULL, NULL, true),
(mod_id, 'fill_blank', 'He is widely respected. ________, his recent decisions have been criticised.', 'That said', NULL, NULL, true),
(mod_id, 'fill_blank', 'The report ________ two key issues: funding and staffing.', 'identifies', NULL, NULL, true),
(mod_id, 'fill_blank', 'The argument ________ on the assumption that resources are unlimited.', 'rests', NULL, NULL, true),
(mod_id, 'fill_blank', 'This point ________ to the broader issue of accountability.', 'relates', NULL, NULL, true),
(mod_id, 'fill_blank', 'To ________ up the key points: efficiency, clarity, and consistency.', 'sum', NULL, NULL, true),
(mod_id, 'fill_blank', 'The proposal has merit. ________, it raises several ethical questions.', 'Even so', NULL, NULL, true),
(mod_id, 'fill_blank', 'The results ________ the hypothesis put forward in the introduction.', 'support / confirm / validate', NULL, NULL, true),

(mod_id, 'multiple_choice', 'Which device improves cohesion by linking back to a previously mentioned idea?',
  'Anaphoric reference (e.g., using "this", "it", "the former")',
  '["A cleft sentence", "Anaphoric reference (e.g., using this, it, the former)", "A modal verb", "An adverbial phrase of time"]',
  1, true),
(mod_id, 'multiple_choice', 'Which of the following best signals a logical consequence?',
  'As a result',
  '["On the other hand", "For instance", "As a result", "In contrast"]',
  2, true),
(mod_id, 'multiple_choice', 'What is the role of "the former" and "the latter" in written discourse?',
  'To refer back to two previously mentioned items without repetition',
  '["To introduce two new items", "To refer back to two previously mentioned items without repetition", "To contrast two ideas", "To summarise a paragraph"]',
  1, true),
(mod_id, 'multiple_choice', 'Which sentence best demonstrates lexical cohesion through synonym use?',
  'The government introduced a new policy. This regulation has been widely praised.',
  '["The government did something new. It is good.", "The government introduced a new policy. This regulation has been widely praised.", "A policy was introduced. Policies are important.", "The government acted. People noticed."]',
  1, true),
(mod_id, 'multiple_choice', 'What is the purpose of a topic sentence in a paragraph?',
  'To introduce the main idea that the rest of the paragraph develops',
  '["To conclude the paragraph with evidence", "To introduce the main idea that the rest of the paragraph develops", "To provide a counterargument", "To give a specific example"]',
  1, true),
(mod_id, 'multiple_choice', '"This suggests that..." is a useful phrase for:',
  'Interpreting evidence and linking it to a broader argument',
  '["Introducing new evidence", "Contradicting previous points", "Interpreting evidence and linking it to a broader argument", "Transitioning to a new section"]',
  2, true),

(mod_id, 'error_correction', 'Correct the cohesion error: "The company expanded. Also, it hired more staff. Also, it opened new offices."', 'Avoid repeating "Also" -- use varied connectors: "The company expanded, hiring more staff and opening new offices." or use "Furthermore" and "In addition."', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "The study focuses on two issues. The first issue is funding. The second issue is staffing."', 'Use referencing to avoid repetition: "The study focuses on two issues: funding and staffing. The FORMER concerns budget allocation, while the LATTER relates to workforce planning."', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "Results showed improvement. In addition, but challenges remained."', '"Results showed improvement. IN ADDITION, challenges remained." OR "Results showed improvement, but challenges remained." (do not combine "In addition" and "but")', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the coherence issue: "Renewable energy is important. Pandas are endangered. We must act on climate change."', 'The second sentence is off-topic. Remove it or replace with a relevant sentence that connects energy and climate: "Renewable energy is crucial for reducing emissions. We must act urgently on climate change."', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "The argument rests on three pillars. Those three pillars are cost, time, and quality."', 'Avoid redundancy: "The argument rests on three pillars: cost, time, and quality." (state them directly without repeating "three pillars")', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "In conclusion, I discussed climate change and I talked about solutions and I mentioned policy."', '"In conclusion, this essay examined climate change, proposed solutions, and highlighted key policy implications." (avoid "I" in academic writing; use parallel structure)', NULL, NULL, true);


-- ============================================================
-- C1 MODULE 10: Nuance Vocabulary
-- ============================================================
SELECT id INTO mod_id FROM modules WHERE name = 'Nuance Vocabulary' AND level_id = (SELECT id FROM levels WHERE name = 'C1');

INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES

(mod_id, 'fill_blank', 'The speaker ________ that the policy had failed without saying so directly. (implied)', 'implied', NULL, NULL, true),
(mod_id, 'fill_blank', 'The journalist ________ from the speech that the minister would resign. (drew a conclusion)', 'inferred', NULL, NULL, true),
(mod_id, 'fill_blank', 'The change was ________, visible only to the most careful observers. (not obvious)', 'subtle', NULL, NULL, true),
(mod_id, 'fill_blank', 'His tone was ________, making it hard to tell if he was joking or serious. (unclear, doubtful)', 'ambiguous', NULL, NULL, true),
(mod_id, 'fill_blank', 'She gave a ________ response, neither fully agreeing nor disagreeing. (deliberately unclear)', 'equivocal', NULL, NULL, true),
(mod_id, 'fill_blank', 'The professor''s explanation was surprisingly ________ given the complexity of the topic. (easy to understand)', 'lucid', NULL, NULL, true),
(mod_id, 'fill_blank', 'He made a ________ remark that offended several colleagues. (cleverly cutting or sarcastic)', 'caustic', NULL, NULL, true),
(mod_id, 'fill_blank', 'The findings were ________, pointing in opposite directions. (contradictory)', 'contradictory / conflicting / paradoxical', NULL, NULL, true),

(mod_id, 'multiple_choice', 'What is the difference between "imply" and "infer"?',
  'The speaker implies; the listener infers.',
  '["They are synonyms and can be used interchangeably.", "The speaker infers; the listener implies.", "The speaker implies; the listener infers.", "Imply is formal; infer is informal."]',
  2, true),
(mod_id, 'multiple_choice', 'Which word means "apparently true but actually flawed in logic"?',
  'specious',
  '["lucid", "succinct", "specious", "candid"]',
  2, true),
(mod_id, 'multiple_choice', '"Ambiguous" and "equivocal" share a meaning, but "equivocal" often implies:',
  'Deliberate vagueness to avoid commitment',
  '["Clarity of expression", "Deliberate vagueness to avoid commitment", "A complimentary tone", "Excessive detail"]',
  1, true),
(mod_id, 'multiple_choice', 'Choose the sentence using "subtle" correctly.',
  'There was a subtle difference in tone between the two versions.',
  '["The explosion was subtle and heard across the city.", "There was a subtle difference in tone between the two versions.", "She gave a subtle shout across the hall.", "The problem was subtle and obvious to everyone."]',
  1, true),
(mod_id, 'multiple_choice', 'What does "candid" mean?',
  'Honest and straightforward, even if uncomfortable',
  '["Polite and diplomatic", "Honest and straightforward, even if uncomfortable", "Excessively formal", "Indirect and vague"]',
  1, true),
(mod_id, 'multiple_choice', 'Which word best completes: "Her ________ remarks cut through the pretension of the discussion."',
  'incisive',
  '["vague", "verbose", "incisive", "ambiguous"]',
  2, true),

(mod_id, 'error_correction', 'Correct the error: "The data infers that there is a strong correlation."', '"The data IMPLIES (or SUGGESTS) that there is a strong correlation." (data cannot infer -- only a person can infer; data implies)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "She gave an ambiguous response that was very clear to everyone."', 'Contradiction in terms -- ambiguous means unclear. Use: "She gave a CLEAR / UNAMBIGUOUS response that was easy to understand." or "She gave an ambiguous response that left everyone confused."', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "His argument was specious and completely logical."', 'Contradiction -- specious means seemingly correct but actually flawed. Use: "His argument was SOUND and completely logical." or "His argument was specious and ultimately UNCONVINCING."', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "The change was so subtle that everyone noticed it immediately."', '"The change was so OBVIOUS that everyone noticed it immediately." (subtle means hard to notice -- contradicts "everyone noticed immediately")', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "She implied from his hesitation that he was lying."', '"She INFERRED from his hesitation that he was lying." (to draw a conclusion from clues = infer, not imply)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "His verbose speech was short and to the point."', '"His CONCISE/SUCCINCT speech was short and to the point." (verbose = using too many words -- contradicts short)', NULL, NULL, true);


-- ============================================================
-- C2 MODULE 1: Stylistic Variation
-- ============================================================
SELECT id INTO mod_id FROM modules WHERE name = 'Stylistic Variation' AND level_id = (SELECT id FROM levels WHERE name = 'C2');

INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES

(mod_id, 'fill_blank', 'Journalistic style often uses the ________ tense for immediacy: "The minister RESIGNS." ', 'present', NULL, NULL, true),
(mod_id, 'fill_blank', 'Academic style favours ________ voice to maintain objectivity.', 'passive', NULL, NULL, true),
(mod_id, 'fill_blank', 'Poetic language often uses ________, giving human traits to non-human things.', 'personification', NULL, NULL, true),
(mod_id, 'fill_blank', 'In casual conversation, speakers often ________ sentences, leaving words implied.', 'truncate / shorten', NULL, NULL, true),
(mod_id, 'fill_blank', 'Journalistic prose tends to use ________ sentences for clarity and impact.', 'short / punchy', NULL, NULL, true),
(mod_id, 'fill_blank', 'Legal writing is characterised by ________ language -- precise, formal, and explicit.', 'unambiguous / technical / precise', NULL, NULL, true),
(mod_id, 'fill_blank', 'Rhetorical writing often uses ________ -- the repetition of a structure at the start of clauses.', 'anaphora', NULL, NULL, true),
(mod_id, 'fill_blank', 'Literary prose may use ________ syntax -- unusual word order for stylistic effect.', 'inverted', NULL, NULL, true),

(mod_id, 'multiple_choice', 'Which stylistic feature is most characteristic of journalistic writing?',
  'Short paragraphs, active voice, and a strong lead sentence',
  '["Long paragraphs and passive constructions", "Short paragraphs, active voice, and a strong lead sentence", "Abstract noun-heavy sentences and hedging", "Rhetorical questions and direct address"]',
  1, true),
(mod_id, 'multiple_choice', '"The night whispered secrets into the ears of the sleeping city." This is an example of:',
  'Personification and poetic register',
  '["Journalistic directness", "Academic hedging", "Personification and poetic register", "Legal precision"]',
  2, true),
(mod_id, 'multiple_choice', 'Which feature is most typical of academic writing?',
  'Hedged claims, impersonal constructions, and formal vocabulary',
  '["Short punchy sentences", "Personal anecdotes in first person", "Hedged claims, impersonal constructions, and formal vocabulary", "Slang and contractions for relatability"]',
  2, true),
(mod_id, 'multiple_choice', 'What is the effect of using very short sentences in a row?',
  'Creates urgency, tension, or dramatic emphasis',
  '["Sounds academic and formal", "Creates urgency, tension, or dramatic emphasis", "Signals a complex argument", "Softens the tone"]',
  1, true),
(mod_id, 'multiple_choice', '"We shall fight. We shall not yield. We shall prevail." This uses:',
  'Anaphora for rhetorical emphasis',
  '["Ellipsis for brevity", "Anaphora for rhetorical emphasis", "Passive voice for objectivity", "Hedging for caution"]',
  1, true),
(mod_id, 'multiple_choice', 'A register shift from formal to informal mid-text is typically considered:',
  'A stylistic inconsistency unless done deliberately for effect',
  '["A sign of proficiency", "A stylistic inconsistency unless done deliberately for effect", "Standard practice in all genres", "A feature of legal writing"]',
  1, true),

(mod_id, 'error_correction', 'Identify the style error: (Academic paper) "This study is totally about how kids learn stuff."', '"This study investigates children''s language acquisition." (too informal -- "totally about", "kids", "stuff" are inappropriate in academic register)', NULL, NULL, true),
(mod_id, 'error_correction', 'Identify the style error: (News headline) "There Has Been a Significant Increase in the Number of Reported Incidents."', '"Incidents Surge" or "Reports Spike" -- headlines use short active phrases, not full formal sentences.', NULL, NULL, true),
(mod_id, 'error_correction', 'Identify the style error: (Literary fiction) "She walked to the door. She opened it. She saw him. She was surprised."', 'Overly repetitive subject-verb structure. Vary: "She crossed to the door, pulled it open -- and stopped. There he was."', NULL, NULL, true),
(mod_id, 'error_correction', 'Identify the style error: (Formal letter) "I''m writing to say that I really think your product is not great."', '"I am writing to express my concerns regarding the quality of your product." (contractions, informal vocabulary, and vague criticism are inappropriate)', NULL, NULL, true),
(mod_id, 'error_correction', 'Identify the style error: (Legal document) "The party of the first part should basically do what they said."', '"The party of the first part shall fulfil the obligations as specified in Section 2." ("basically", "what they said" are too vague and informal for legal register)', NULL, NULL, true),
(mod_id, 'error_correction', 'Identify the style error: (Rhetorical speech) "We must act now. Because of climate change. Because of inequality. Yeah, that kind of thing."', '"Yeah, that kind of thing" undermines the rhetorical register. End with: "Because of climate change. Because of inequality. Because the future demands nothing less."', NULL, NULL, true);


-- ============================================================
-- C2 MODULE 2: Advanced Idioms & Fixed Expressions
-- ============================================================
SELECT id INTO mod_id FROM modules WHERE name = 'Advanced Idioms & Fixed Expressions' AND level_id = (SELECT id FROM levels WHERE name = 'C2');

INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES

(mod_id, 'fill_blank', 'The new regulations threw a ________ in the works, delaying everything. (caused disruption)', 'spanner', NULL, NULL, true),
(mod_id, 'fill_blank', 'After the scandal, the minister was left ________ in the wind. (abandoned)', 'twisting', NULL, NULL, true),
(mod_id, 'fill_blank', 'She has always managed to land on her ________. (recover well from problems)', 'feet', NULL, NULL, true),
(mod_id, 'fill_blank', 'They were burning the ________ at both ends and eventually burned out. (overworking)', 'candle', NULL, NULL, true),
(mod_id, 'fill_blank', 'His explanation didn''t hold ________. There were too many inconsistencies. (was not convincing)', 'water', NULL, NULL, true),
(mod_id, 'fill_blank', 'The decision went against the ________, surprising even her closest allies. (expectation)', 'grain', NULL, NULL, true),
(mod_id, 'fill_blank', 'After years of effort, her work finally ________ dividends. (produced results)', 'paid', NULL, NULL, true),
(mod_id, 'fill_blank', 'We need to address the elephant in the ________. (an obvious problem being ignored)', 'room', NULL, NULL, true),

(mod_id, 'multiple_choice', 'What does "throw a spanner in the works" mean?',
  'To cause disruption to a plan or process',
  '["To help fix a problem", "To cause disruption to a plan or process", "To work very hard", "To disagree publicly"]',
  1, true),
(mod_id, 'multiple_choice', '"Left twisting in the wind" describes someone who is:',
  'Abandoned without support in a difficult situation',
  '["Celebrated for their resilience", "Abandoned without support in a difficult situation", "Confused by conflicting advice", "Promoted unexpectedly"]',
  1, true),
(mod_id, 'multiple_choice', '"It doesn''t hold water" means the argument or excuse is:',
  'Not convincing or logically flawed',
  '["Extremely persuasive", "Not convincing or logically flawed", "Difficult to understand", "Emotionally powerful"]',
  1, true),
(mod_id, 'multiple_choice', 'What does "go against the grain" mean?',
  'To act contrary to what is expected or conventional',
  '["To follow instructions carefully", "To act contrary to what is expected or conventional", "To make a controversial decision", "To lose momentum"]',
  1, true),
(mod_id, 'multiple_choice', '"Pay dividends" is used to mean:',
  'To produce a benefit or reward, especially after some effort',
  '["To pay financial interest", "To produce a benefit or reward, especially after some effort", "To invest in stocks", "To distribute resources fairly"]',
  1, true),
(mod_id, 'multiple_choice', '"The elephant in the room" refers to:',
  'An obvious problem that no one wants to talk about',
  '["A large and intimidating challenge", "An obvious problem that no one wants to talk about", "A powerful person in the organisation", "An unresolved legal dispute"]',
  1, true),

(mod_id, 'error_correction', 'Correct the idiom: "The new policy threw a wrench in the plans." (British English context)', '"The new policy threw A SPANNER in the works." (wrench = American English; spanner = British English)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the idiom error: "She always manages to land on her hands."', '"She always manages to land on her FEET." (fixed expression -- "land on one''s feet")', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "His alibi doesn''t hold ground."', '"His alibi doesn''t HOLD WATER." (fixed idiom -- hold water, not hold ground)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "They were burning the lamp at both ends."', '"They were burning the CANDLE at both ends." (fixed idiom -- burn the candle at both ends)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the idiom: "Let''s address the tiger in the room."', '"Let''s address the ELEPHANT in the room." (fixed idiom -- elephant in the room)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "Her efforts finally paid benefits."', '"Her efforts finally PAID DIVIDENDS." (fixed collocation -- pay dividends)', NULL, NULL, true);


-- ============================================================
-- C2 MODULE 3: Pragmatics
-- ============================================================
SELECT id INTO mod_id FROM modules WHERE name = 'Pragmatics' AND level_id = (SELECT id FROM levels WHERE name = 'C2');

INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES

(mod_id, 'fill_blank', 'In pragmatics, what a speaker ________ is often more important than what they literally say.', 'means / implies / intends', NULL, NULL, true),
(mod_id, 'fill_blank', '"Could you pass the salt?" is not really a question -- it is a ________ speech act.', 'indirect', NULL, NULL, true),
(mod_id, 'fill_blank', 'When someone says "That''s just great" in a sarcastic tone, they are using ________. (saying opposite of what they mean)', 'irony / sarcasm / verbal irony', NULL, NULL, true),
(mod_id, 'fill_blank', 'The ________ of an utterance is what the speaker intends to achieve -- informing, requesting, apologising.', 'illocutionary force / speech act', NULL, NULL, true),
(mod_id, 'fill_blank', '"Nice weather, isn''t it?" said between two people sheltering from rain is an example of ________.', 'irony / sarcasm', NULL, NULL, true),
(mod_id, 'fill_blank', 'Grice''s maxim of ________ means you should not say more than is required.', 'quantity', NULL, NULL, true),
(mod_id, 'fill_blank', '"I''m not saying he''s dishonest, but..." implies the speaker ________ thinks he is.', 'actually / indeed / does', NULL, NULL, true),
(mod_id, 'fill_blank', 'Using "with all due respect" before a criticism is an example of ________ face-threatening act mitigation.', 'politeness / hedging', NULL, NULL, true),

(mod_id, 'multiple_choice', 'What does "pragmatics" study?',
  'How context shapes meaning beyond the literal words used',
  '["The grammatical structure of sentences", "The pronunciation of words in context", "How context shapes meaning beyond the literal words used", "The etymology of vocabulary"]',
  2, true),
(mod_id, 'multiple_choice', '"I''m a little busy right now." said when someone asks for help actually means:',
  '"I cannot help you right now." -- an indirect refusal',
  '["I will help you in a moment.", "I cannot help you right now." -- an indirect refusal", "I am confused about the request.", "I am interested but need more time."]',
  1, true),
(mod_id, 'multiple_choice', 'Which is an example of implicature?',
  'A: "Is John a good speaker?" B: "Well, he''s very punctual." (implying he is not a good speaker)',
  '["A: Did you eat? B: Yes, I ate.", "A: Is John a good speaker? B: Well, he''s very punctual. (implying he is not a good speaker)", "A: What time is it? B: Three o''clock.", "A: Can you help? B: Sure, of course."]',
  1, true),
(mod_id, 'multiple_choice', 'What is "face" in Brown and Levinson''s politeness theory?',
  'A person''s desire to be respected and not imposed upon',
  '["Literal facial expression", "A person''s desire to be respected and not imposed upon", "The grammar of polite requests", "The tone used in formal emails"]',
  1, true),
(mod_id, 'multiple_choice', 'Which sentence is most likely sarcastic in context?',
  '"Oh brilliant, another Monday morning."',
  '["Monday is my favourite day of the week.", "I genuinely enjoy early meetings.", "Oh brilliant, another Monday morning.", "I look forward to starting the new week."]',
  2, true),
(mod_id, 'multiple_choice', 'Grice''s maxim of Quality states that speakers should:',
  'Say only what they believe to be true and have evidence for',
  '["Be brief and avoid excess", "Say only what they believe to be true and have evidence for", "Be relevant to the topic", "Be clear and avoid ambiguity"]',
  1, true),

(mod_id, 'error_correction', 'Identify the pragmatic failure: A British colleague says "That''s an interesting idea" and you respond enthusiastically, not realising they meant it dismissively.', 'This is a PRAGMATIC FAILURE -- "interesting" in British understatement often signals polite disapproval. A native speaker would probe further: "Do you have any reservations about it?"', NULL, NULL, true),
(mod_id, 'error_correction', 'Identify the pragmatic error: Responding to "Could you open the window?" with "Yes, I could." and not opening it.', 'The question is an INDIRECT SPEECH ACT -- a polite request, not a question about ability. The correct response is to open the window, not merely confirm ability.', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the pragmatic mismatch: Replying to your boss''s sarcastic "Oh, another delay -- how wonderful" with genuine enthusiasm.', 'Recognise the SARCASM and respond appropriately: "I understand your frustration. I''ll make sure we get back on track immediately."', NULL, NULL, true),
(mod_id, 'error_correction', 'Identify the violation: In a meeting, someone gives a five-minute irrelevant story before answering a yes/no question.', 'This violates Grice''s MAXIMS OF QUANTITY (too much) and RELEVANCE (off-topic). The response should be brief and on-topic.', NULL, NULL, true),
(mod_id, 'error_correction', 'Identify the error: "With all due respect, you are completely wrong and incompetent."', '"With all due respect" is meant to soften criticism -- following it with a blunt insult is INCONSISTENT and creates greater offence. Use: "With all due respect, I believe the data points to a different conclusion."', NULL, NULL, true),
(mod_id, 'error_correction', 'Identify the implicature error: A: "Did everyone enjoy the presentation?" B: "The slides were well-designed." -- interpreted as full praise.', 'B''s response IMPLICATES that only the slides were good -- a careful listener should infer that the content or delivery may not have been. Accepting it as full praise misses the implicature.', NULL, NULL, true);


-- ============================================================
-- C2 MODULE 4: Intonation & Stress
-- ============================================================
SELECT id INTO mod_id FROM modules WHERE name = 'Intonation & Stress' AND level_id = (SELECT id FROM levels WHERE name = 'C2');

INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES

(mod_id, 'fill_blank', 'In the sentence "I didn''t say SHE stole it", the stress on "she" implies someone ________ stole it.', 'else', NULL, NULL, true),
(mod_id, 'fill_blank', 'Rising intonation at the end of a statement can signal ________ or checking for agreement.', 'uncertainty / a question', NULL, NULL, true),
(mod_id, 'fill_blank', 'In English, content words such as nouns and ________ tend to receive the most stress.', 'verbs / adjectives / adverbs', NULL, NULL, true),
(mod_id, 'fill_blank', 'The word "RECORD" is a noun when stressed on the first syllable, and a ________ when stressed on the second.', 'verb', NULL, NULL, true),
(mod_id, 'fill_blank', 'A fall-rise tone in "I SUPPOSE it''s okay" signals ________ or lack of full commitment.', 'hesitation / reservation / doubt', NULL, NULL, true),
(mod_id, 'fill_blank', '"I didn''t say he STOLE the money" implies he may have ________ it without stealing.', 'borrowed / taken / moved', NULL, NULL, true),
(mod_id, 'fill_blank', 'Function words like articles and ________ are typically unstressed in natural speech.', 'prepositions / pronouns / conjunctions', NULL, NULL, true),
(mod_id, 'fill_blank', 'In connected speech, the phenomenon where sounds merge between words is called ________. (e.g., "want to" -> "wanna")', 'assimilation / linking / elision / reduction', NULL, NULL, true),

(mod_id, 'multiple_choice', 'What changes when stress shifts in "I didn''t SAY he took it" vs "I didn''t say HE took it"?',
  'The implied meaning -- who is being emphasised or denied',
  '["The grammatical tense", "The implied meaning -- who is being emphasised or denied", "The formality of the sentence", "The number of syllables"]',
  1, true),
(mod_id, 'multiple_choice', 'Rising intonation at the end of a declarative sentence often signals:',
  'A question, uncertainty, or a request for confirmation',
  '["Anger or frustration", "A definitive statement", "A question, uncertainty, or a request for confirmation", "Formal register"]',
  2, true),
(mod_id, 'multiple_choice', 'The word "object" is stressed differently as a noun vs a verb. As a verb, the stress falls on:',
  'The second syllable: ob-JECT',
  '["The first syllable: OB-ject", "The second syllable: ob-JECT", "Both syllables equally", "Neither syllable -- it is unstressed"]',
  1, true),
(mod_id, 'multiple_choice', 'Which word in a typical English sentence carries the most stress?',
  'The word conveying the most important new information',
  '["The first word in the sentence", "The subject of the sentence", "The word conveying the most important new information", "The verb in all cases"]',
  2, true),
(mod_id, 'multiple_choice', '"She DOES like it." The stress on "does" here signals:',
  'Contradiction or confirmation of a previous doubt',
  '["Uncertainty", "Contradiction or confirmation of a previous doubt", "A question form", "Past tense"]',
  1, true),
(mod_id, 'multiple_choice', 'What is "nuclear stress" in phonology?',
  'The most prominent stress in an intonation unit, marking key information',
  '["Stress used only in formal registers", "The most prominent stress in an intonation unit, marking key information", "Equal stress across all syllables", "Stress that only applies to modal verbs"]',
  1, true),

(mod_id, 'error_correction', 'Identify the misunderstanding: A learner reads "I didn''t say he STOLE the money" and interprets it as a denial that the speaker spoke at all.', '"I didn''t SAY" would deny speaking -- but "he STOLE" shifts stress to the ACTION, implying he took it by other means. The learner missed the contrastive stress on "stole".', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the understanding error: A student thinks "REcord" (noun) and "reCORD" (verb) are the same word with the same meaning.', 'They are the SAME spelling but different STRESS patterns change the word class and sometimes the meaning. "REcord" = noun (a vinyl record, a world record); "reCORD" = verb (to record a video).', NULL, NULL, true),
(mod_id, 'error_correction', 'Identify the error: A learner stresses every word equally in "I want a cup of tea," making it sound unnatural.', 'Natural English stress: "I WANT a CUP of TEA." -- content words (want, cup, tea) are stressed; function words (a, of) are reduced. Equal stress sounds robotic.', NULL, NULL, true),
(mod_id, 'error_correction', 'Identify the pragmatic-phonological error: A learner says "It''s FINE" with a fall-rise tone and the listener thinks they are fully satisfied.', 'Fall-rise on "FINE" signals RESERVATION or reluctant acceptance, not full satisfaction. The listener should probe: "Are you sure? You sound hesitant."', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: A student thinks rising intonation always means a question.', 'Rising intonation can indicate UNCERTAINTY, politeness, or continuation -- not just questions. For example, listing items uses rising intonation until the final item, which falls.', NULL, NULL, true),
(mod_id, 'error_correction', 'Identify the error: "She DIDN''T steal it" (heavy stress on didn''t) -- student interprets this as neutral denial.', 'Heavy stress on "DIDN''T" signals STRONG CONTRADICTION -- someone previously accused her. Neutral denial would have softer, more even stress. Stress signals discourse context.', NULL, NULL, true);


-- ============================================================
-- C2 MODULE 5: Hedging & Vagueness
-- ============================================================
SELECT id INTO mod_id FROM modules WHERE name = 'Hedging & Vagueness' AND level_id = (SELECT id FROM levels WHERE name = 'C2');

INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES

(mod_id, 'fill_blank', 'The results ________ suggest a link between diet and cognitive performance.', 'would seem to / appear to / seem to', NULL, NULL, true),
(mod_id, 'fill_blank', 'It is ________ likely that the policy will be revised next year.', 'fairly / quite / relatively', NULL, NULL, true),
(mod_id, 'fill_blank', 'She ________ of lost interest halfway through the presentation.', 'sort', NULL, NULL, true),
(mod_id, 'fill_blank', 'The report covers ________ twenty cases across three regions.', 'roughly / approximately', NULL, NULL, true),
(mod_id, 'fill_blank', 'The new system is ________ better than the previous one -- not perfect, but an improvement.', 'somewhat / marginally / a bit', NULL, NULL, true),
(mod_id, 'fill_blank', 'I ________ agree with you, but I have a few reservations.', 'broadly / largely / mostly', NULL, NULL, true),
(mod_id, 'fill_blank', 'The evidence ________ that further research is needed.', 'suggests / indicates / implies', NULL, NULL, true),
(mod_id, 'fill_blank', 'There were ________ fifty participants, give or take a few.', 'around / about / roughly', NULL, NULL, true),

(mod_id, 'multiple_choice', 'What is the primary function of hedging language?',
  'To reduce the strength of a claim and signal caution or tentativeness',
  '["To make claims sound more certain and authoritative", "To reduce the strength of a claim and signal caution or tentativeness", "To add emphasis to a strong opinion", "To introduce a counterargument"]',
  1, true),
(mod_id, 'multiple_choice', 'Which sentence uses hedging most appropriately in academic writing?',
  'The findings suggest a possible correlation between the two variables.',
  '["The findings prove that there is a correlation.", "The findings definitively show a direct link.", "The findings suggest a possible correlation between the two variables.", "The findings sort of show a connection."]',
  2, true),
(mod_id, 'multiple_choice', '"Sort of", "kind of", and "more or less" are examples of:',
  'Approximators or vague language used for hedging',
  '["Formal academic hedging devices", "Approximators or vague language used for hedging", "Discourse markers signalling contrast", "Intensifiers used for emphasis"]',
  1, true),
(mod_id, 'multiple_choice', 'Which is the most appropriate hedge in a scientific report?',
  'It would appear that the compound inhibits cell growth.',
  '["The compound definitely stops cell growth.", "The compound kind of stops cell growth.", "It would appear that the compound inhibits cell growth.", "The compound, like, reduces cell growth."]',
  2, true),
(mod_id, 'multiple_choice', 'When is vague language appropriate in formal English?',
  'When giving rough estimates or when precision is impossible',
  '["When writing legal contracts", "When making binding promises", "When giving rough estimates or when precision is impossible", "When quoting exact statistics"]',
  2, true),
(mod_id, 'multiple_choice', '"I''m not entirely sure, but it could be argued that..." demonstrates:',
  'Epistemic hedging -- signalling uncertainty about one''s own knowledge',
  '["Assertive certainty", "Epistemic hedging -- signalling uncertainty about one''s own knowledge", "Deontic modality", "A factual statement with evidence"]',
  1, true),

(mod_id, 'error_correction', 'Correct the error: (Academic) "This clearly proves that social media causes depression."', '"This SUGGESTS / INDICATES that there MAY BE a link between social media use and depression." (overclaims; needs hedging and nuance)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: (Spoken) "The meeting is sort of starting at kind of nine-ish." to a client.', 'Too vague for a professional context: "The meeting starts at approximately 9 a.m." or simply "9 o''clock." (vague language inappropriate when precision is possible and expected)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: (Report) "There were sort of improvements across most areas."', '"There were SOME improvements across most areas." or "Improvements were BROADLY observed across most areas." ("sort of" is too informal for a written report)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the over-hedging: "It might possibly perhaps be the case that there could potentially be a minor link."', 'Over-hedged to the point of meaninglessness. Simplify: "There may be a link." or "The evidence tentatively suggests a connection."', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: (Scientific paper) "It seems the results are kind of significant."', '"The results APPEAR to be STATISTICALLY SIGNIFICANT." (kind of is too informal; seem -> appear; be more precise)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "The findings would seem to clearly proves the hypothesis."', '"The findings WOULD SEEM TO SUPPORT the hypothesis." (subject-verb agreement: proves -> support after modal; "clearly" and "would seem to" are contradictory in strength)', NULL, NULL, true);


-- ============================================================
-- C2 MODULE 6: Advanced Collocations
-- ============================================================
SELECT id INTO mod_id FROM modules WHERE name = 'Advanced Collocations' AND level_id = (SELECT id FROM levels WHERE name = 'C2');

INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES

(mod_id, 'fill_blank', 'The scandal ________ considerable damage to the minister''s reputation.', 'inflicted / caused', NULL, NULL, true),
(mod_id, 'fill_blank', 'The court ________ a landmark ruling that changed labour law permanently.', 'handed down / issued / delivered', NULL, NULL, true),
(mod_id, 'fill_blank', 'The company ________ sweeping changes to its hiring policy last quarter.', 'implemented / introduced / made', NULL, NULL, true),
(mod_id, 'fill_blank', 'The proposal ________ fierce opposition from local residents.', 'met with / encountered / faced', NULL, NULL, true),
(mod_id, 'fill_blank', 'The audit ________ serious irregularities in the accounts.', 'uncovered / revealed / identified', NULL, NULL, true),
(mod_id, 'fill_blank', 'She ________ a compelling case for restructuring the entire department.', 'made / presented / put forward', NULL, NULL, true),
(mod_id, 'fill_blank', 'The negotiations ________ a deadlock after three days of talks.', 'reached / hit', NULL, NULL, true),
(mod_id, 'fill_blank', 'The technology ________ a paradigm shift in how we think about communication.', 'triggered / sparked / caused', NULL, NULL, true),

(mod_id, 'multiple_choice', 'Which collocation is correct?',
  'deliver a verdict',
  '["make a verdict", "deliver a verdict", "do a verdict", "have a verdict"]',
  1, true),
(mod_id, 'multiple_choice', 'Which verb collocates with "damage" most naturally in formal writing?',
  'inflict',
  '["make", "inflict", "do", "get"]',
  1, true),
(mod_id, 'multiple_choice', 'Which collocation is incorrect?',
  'make a deadlock',
  '["reach a deadlock", "hit a deadlock", "break a deadlock", "make a deadlock"]',
  3, true),
(mod_id, 'multiple_choice', '"The study ________ light on the underlying causes." Which verb completes this correctly?',
  'shed',
  '["threw", "shed", "gave", "made"]',
  1, true),
(mod_id, 'multiple_choice', 'Which sentence uses a correct advanced collocation?',
  'The legislation sparked a nationwide debate.',
  '["The legislation made a nationwide debate.", "The legislation sparked a nationwide debate.", "The legislation did a nationwide debate.", "The legislation caused a nationwide debate to happen."]',
  1, true),
(mod_id, 'multiple_choice', 'Which is the correct collocation: "The prime minister ________ the blame for the crisis."',
  'shouldered',
  '["took", "shouldered", "gave", "put"]',
  1, true),

(mod_id, 'error_correction', 'Correct the collocation error: "The judge made a landmark ruling."', '"The judge HANDED DOWN / DELIVERED a landmark ruling." (make is too generic; hand down or deliver is the natural collocation for legal rulings)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "The research did light on a previously unknown mechanism."', '"The research SHED light on a previously unknown mechanism." (shed light on = fixed collocation)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "The scandal caused severe damage on his reputation."', '"The scandal caused severe damage TO his reputation." or "inflicted severe damage ON his reputation." (preposition: damage to, not damage on; or inflict damage on)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "They made sweeping changes in their policy."', '"They implemented / introduced sweeping changes TO their policy." (made -> implemented; changes to, not changes in)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "The proposal encountered a fierce opposition."', '"The proposal encountered FIERCE OPPOSITION." (no article needed -- "opposition" is uncountable here)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "She made a compelling case to restructuring the team."', '"She made a compelling case FOR restructuring the team." (case for, not case to)', NULL, NULL, true);


-- ============================================================
-- C2 MODULE 7: Cultural References
-- ============================================================
SELECT id INTO mod_id FROM modules WHERE name = 'Cultural References' AND level_id = (SELECT id FROM levels WHERE name = 'C2');

INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES

(mod_id, 'fill_blank', 'Calling someone a "Scrooge" implies they are ________, referencing Dickens'' A Christmas Carol.', 'miserly / mean with money / stingy', NULL, NULL, true),
(mod_id, 'fill_blank', 'To describe a utopian but actually nightmarish society, English speakers often say it''s very "________". (Orwell)', 'Orwellian', NULL, NULL, true),
(mod_id, 'fill_blank', 'A "Catch-22" situation means you are stuck in a ________ that has no solution.', 'paradox / contradiction / double-bind', NULL, NULL, true),
(mod_id, 'fill_blank', 'The phrase "crossing the Rubicon" means making a ________ decision with no return.', 'final / irreversible / decisive', NULL, NULL, true),
(mod_id, 'fill_blank', 'Describing something as a "Pyrrhic victory" means the victory came at too great a ________.', 'cost / price', NULL, NULL, true),
(mod_id, 'fill_blank', 'A "Herculean task" refers to one that requires ________ effort or strength to complete.', 'enormous / extraordinary / immense', NULL, NULL, true),
(mod_id, 'fill_blank', 'To "open Pandora''s box" means to do something that causes many ________ problems.', 'unexpected / unforeseen', NULL, NULL, true),
(mod_id, 'fill_blank', 'Referring to someone as a "Machiavellian" figure implies they are cunning and ________ in pursuit of power.', 'ruthless / unscrupulous / calculating', NULL, NULL, true),

(mod_id, 'multiple_choice', 'What does "Orwellian" typically describe?',
  'A society with authoritarian surveillance and propaganda',
  '["An optimistic and egalitarian society", "A society with authoritarian surveillance and propaganda", "A peaceful rural community", "A technologically advanced utopia"]',
  1, true),
(mod_id, 'multiple_choice', 'A "Catch-22" situation is best described as:',
  'A paradox where solving one part of a problem creates or worsens another',
  '["A simple problem with an obvious solution", "A lucky coincidence", "A paradox where solving one part of a problem creates or worsens another", "A strict military rule"]',
  2, true),
(mod_id, 'multiple_choice', '"Crossing the Rubicon" originates from:',
  'Julius Caesar''s irreversible military advance into Rome',
  '["A Greek myth about the underworld", "Julius Caesar''s irreversible military advance into Rome", "A Shakespeare play about fate", "A medieval European battle"]',
  1, true),
(mod_id, 'multiple_choice', 'What does "a Pyrrhic victory" mean?',
  'A win that costs more than it is worth',
  '["An unexpected comeback win", "A win that costs more than it is worth", "A decisive and overwhelming victory", "A victory achieved through deception"]',
  1, true),
(mod_id, 'multiple_choice', '"Machiavellian" behaviour refers to someone who is:',
  'Cunning and willing to use deception to gain power',
  '["Idealistic and principled", "Passive and indecisive", "Cunning and willing to use deception to gain power", "Generous and community-minded"]',
  2, true),
(mod_id, 'multiple_choice', 'The idiom "open Pandora''s box" comes from:',
  'Greek mythology',
  '["Roman law", "Greek mythology", "Shakespearean drama", "The Bible"]',
  1, true),

(mod_id, 'error_correction', 'Correct the usage: "She''s such a Scrooge -- she always spends money generously."', 'Contradiction -- Scrooge means MISERLY. Correct: "She''s no Scrooge -- she always spends money generously." or "She''s such a Scrooge -- she never spends money on anyone."', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the usage: "The election result was a Pyrrhic victory -- they won easily and at minimal cost."', 'Contradicts the meaning -- a Pyrrhic victory involves GREAT COST. Correct: "The election result was a Pyrrhic victory -- they won, but the campaign left the party broke and divided."', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "Opening Pandora''s box, the solution solved all the problems at once."', 'Opposite of meaning -- opening Pandora''s box CAUSES problems. Correct: "Opening Pandora''s box, the decision unleashed a wave of unforeseen complications."', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the usage: "A Herculean effort" used to describe minimal work.', '"Herculean" means requiring ENORMOUS effort. Do not use it for trivial tasks. Replace with: "It took little effort" or reserve "Herculean" for genuinely massive challenges.', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "The manager''s Machiavellian approach involved being honest and transparent at all costs."', 'Contradiction -- Machiavellian implies CUNNING and DECEPTION. Correct: "The manager''s transparent approach built genuine trust." or describe actual scheming behaviour.', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the usage: "It was a Catch-22: he could apply for the loan once he had a job, or keep his current job."', 'Not a Catch-22 -- he has options. A true Catch-22 is: "He needed experience to get the job, but needed the job to get experience." Revise accordingly.', NULL, NULL, true);


-- ============================================================
-- C2 MODULE 8: Speed & Automaticity
-- ============================================================
SELECT id INTO mod_id FROM modules WHERE name = 'Speed & Automaticity' AND level_id = (SELECT id FROM levels WHERE name = 'C2');

INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES

(mod_id, 'fill_blank', 'Complete naturally: "I hate to ________ it to you, but the project has been cancelled." (deliver bad news)', 'break', NULL, NULL, true),
(mod_id, 'fill_blank', 'Complete naturally: "Let''s not ________ around the bush -- what''s the real issue?" (be direct)', 'beat', NULL, NULL, true),
(mod_id, 'fill_blank', 'Complete naturally: "She really hit the ________ running on her first week." (started with great energy)', 'ground', NULL, NULL, true),
(mod_id, 'fill_blank', 'Complete naturally: "That idea has ________ written all over it." (is bound to fail)', 'failure', NULL, NULL, true),
(mod_id, 'fill_blank', 'Complete naturally: "We''ll cross that ________ when we come to it." (deal with problems as they arise)', 'bridge', NULL, NULL, true),
(mod_id, 'fill_blank', 'Complete naturally: "He managed to keep all the ________ in the air despite the chaos." (handle many things at once)', 'balls', NULL, NULL, true),
(mod_id, 'fill_blank', 'Complete naturally: "The new hire hit it ________ with the whole team immediately." (got along well)', 'off', NULL, NULL, true),
(mod_id, 'fill_blank', 'Complete naturally: "The decision was a no-________." (an obvious choice)', 'brainer', NULL, NULL, true),

(mod_id, 'multiple_choice', 'A fluent C2 speaker is distinguished by their ability to:',
  'Use language accurately and automatically without conscious deliberation',
  '["Use only formal language at all times", "Avoid all idioms and fixed expressions", "Use language accurately and automatically without conscious deliberation", "Translate mentally from their first language"]',
  2, true),
(mod_id, 'multiple_choice', '"That''s the thing about deadlines -- they have a way of sneaking up on you." The phrase "have a way of" means:',
  'Tend to happen or behave in a particular manner',
  '["Are capable of", "Tend to happen or behave in a particular manner", "Are designed to", "Have been known to, once"]',
  1, true),
(mod_id, 'multiple_choice', 'Complete the fixed expression: "I wouldn''t say no to ________."',
  'An offer or something desirable (the expression signals acceptance)',
  '["A strong disagreement", "An offer or something desirable (the expression signals acceptance)", "A refusal", "A correction"]',
  1, true),
(mod_id, 'multiple_choice', '"It goes with the territory." This expression means:',
  'It is an expected part of a role or situation',
  '["It is geographically relevant", "It is an expected part of a role or situation", "It comes with a physical location", "It is unavoidable due to legal reasons"]',
  1, true),
(mod_id, 'multiple_choice', 'Which is an example of automatic idiomatic use at C2 level?',
  'Using "on the tip of my tongue" naturally when forgetting a word',
  '["Translating an idiom directly from your first language", "Using on the tip of my tongue naturally when forgetting a word", "Avoiding idioms to sound more formal", "Looking up idioms before using them"]',
  1, true),
(mod_id, 'multiple_choice', '"A stitch in time saves nine" advises:',
  'Dealing with a problem early prevents it from becoming worse',
  '["Nine stitches are always better than one", "Dealing with a problem early prevents it from becoming worse", "Sewing is a useful life skill", "Time management is about quantity"]',
  1, true),

(mod_id, 'error_correction', 'Correct the idiom: "Let''s not beat around the branches."', '"Let''s not beat around THE BUSH." (fixed idiom -- not "branches")', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the expression: "She hit the floor running from day one."', '"She hit THE GROUND running from day one." (fixed expression -- hit the ground running)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "It was a no-minded decision."', '"It was a NO-BRAINER." (fixed expression -- no-brainer, not no-minded)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the expression: "We''ll cross that road when we come to it."', '"We''ll cross that BRIDGE when we come to it." (fixed idiom -- bridge, not road)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "I hate to break it for you, but the plan failed."', '"I hate to break it TO you, but the plan failed." (break it to someone -- correct preposition)', NULL, NULL, true),
(mod_id, 'error_correction', 'Correct the error: "He kept all the plates in the air during the restructure."', '"He kept all the BALLS in the air during the restructure." (juggling metaphor uses balls, not plates -- though "keep plates spinning" is also valid; mixing the two metaphors is the error)', NULL, NULL, true);

END $$;

-- ============================================================
-- UPDATE total_cards for all C1 and C2 modules
-- ============================================================
UPDATE modules m
SET total_cards = (
  SELECT COUNT(*) FROM cards c WHERE c.module_id = m.id
)
WHERE m.level_id IN (
  SELECT id FROM levels WHERE name IN ('C1', 'C2')
);
