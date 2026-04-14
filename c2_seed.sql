-- ============================================================
-- SEED: C2 Cards — All 8 Modules (160 cards)
-- Mix: fill_blank, multiple_choice, error_correction
-- Run AFTER levels & modules are seeded
-- ============================================================

DO $$
DECLARE
  mod1 UUID; -- Stylistic Variation
  mod2 UUID; -- Advanced Idioms & Fixed Expressions
  mod3 UUID; -- Pragmatics
  mod4 UUID; -- Intonation & Stress
  mod5 UUID; -- Hedging & Vagueness
  mod6 UUID; -- Advanced Collocations
  mod7 UUID; -- Cultural References
  mod8 UUID; -- Speed & Automaticity
BEGIN

SELECT id INTO mod1 FROM modules WHERE name = 'Stylistic Variation';
SELECT id INTO mod2 FROM modules WHERE name = 'Advanced Idioms & Fixed Expressions';
SELECT id INTO mod3 FROM modules WHERE name = 'Pragmatics';
SELECT id INTO mod4 FROM modules WHERE name = 'Intonation & Stress';
SELECT id INTO mod5 FROM modules WHERE name = 'Hedging & Vagueness';
SELECT id INTO mod6 FROM modules WHERE name = 'Advanced Collocations';
SELECT id INTO mod7 FROM modules WHERE name = 'Cultural References';
SELECT id INTO mod8 FROM modules WHERE name = 'Speed & Automaticity';

-- ============================================================
-- MODULE 1: Stylistic Variation (20 cards)
-- ============================================================

-- fill_blank (8)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(mod1, 'fill_blank', 'Journalistic style favors short, punchy sentences. Rewrite this sentence in journalistic style: "The government has announced that it will be implementing new economic policies." → "Government ___ new economic policies."', 'unveils', true),
(mod1, 'fill_blank', 'Academic writing avoids contractions. The informal "don''t" becomes ___ in formal academic prose.', 'do not', true),
(mod1, 'fill_blank', 'In poetic style, the inversion "Never ___ I seen such beauty" is used for emphasis.', 'have', true),
(mod1, 'fill_blank', 'Casual register uses "gonna" while formal writing uses "___ ___".', 'going to', true),
(mod1, 'fill_blank', 'Academic style: "The results ___ that further investigation is warranted." (suggest → formal 3rd person)', 'suggest', true),
(mod1, 'fill_blank', 'Journalistic passive: "Three suspects ___ arrested last night." emphasizes the event, not the actor.', 'were', true),
(mod1, 'fill_blank', 'In casual speech, "I reckon" means "I ___" in neutral register.', 'think', true),
(mod1, 'fill_blank', 'Poetic style often uses archaic forms: "thou ___" instead of "you are".', 'art', true);

-- multiple_choice (7)
INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES
(mod1, 'multiple_choice', 'Which sentence uses the most appropriate academic register?',
 'The data indicate a significant correlation between variables.',
 '["The data shows things are connected.", "The data indicate a significant correlation between variables.", "Basically the numbers prove they''re linked.", "You can see the data backs this up."]'::jsonb, 1, true),

(mod1, 'multiple_choice', 'A journalist writing a headline about an economic crisis would most likely use:',
 'Markets plunge as recession fears mount',
 '["The financial markets have experienced a significant downward trajectory amid growing recessionary concerns.", "Markets plunge as recession fears mount", "Things are getting really bad financially.", "Economists are worried about a potential recession scenario."]'::jsonb, 1, true),

(mod1, 'multiple_choice', 'Which is the correct casual equivalent of "I am in complete agreement with your proposal"?',
 'I''m totally on board with your idea.',
 '["I concur with the aforementioned proposal.", "I''m totally on board with your idea.", "Your proposal has been duly noted.", "Agreement is hereby expressed."]'::jsonb, 1, true),

(mod1, 'multiple_choice', 'In formal writing, which phrase best replaces "because of"?',
 'owing to',
 '["due to the fact that is wrong here", "owing to", "cos of", "on account that"]'::jsonb, 1, true),

(mod1, 'multiple_choice', 'Which sentence demonstrates poetic inversion correctly?',
 'Softly falls the evening rain.',
 '["The evening rain falls softly.", "Softly falls the evening rain.", "Evening rain falls softly.", "The rain, it falls so softly."]'::jsonb, 1, true),

(mod1, 'multiple_choice', 'Which is appropriate for a formal business email?',
 'I am writing to enquire about the status of my application.',
 '["Hey, just checking on my application?", "Wanted to know where my application''s at.", "I am writing to enquire about the status of my application.", "Any update on my app?"]'::jsonb, 2, true),

(mod1, 'multiple_choice', 'Which version uses journalistic style correctly?',
 'PM vows to cut taxes amid inflation surge.',
 '["The Prime Minister has vowed that taxes shall be cut.", "PM vows to cut taxes amid inflation surge.", "It was announced by the PM that tax cuts would occur.", "The PM, in a recent statement, mentioned tax reductions."]'::jsonb, 1, true);

-- error_correction (5)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(mod1, 'error_correction', 'Find and correct the register error: "The committee has decided to gonna review all submitted proposals."', '"going to" — never mix formal auxiliary "going to" with slang "gonna" in formal writing.', true),
(mod1, 'error_correction', 'Correct the academic style error: "The study shows that people don''t like working overtime."', 'Replace "don''t" with "do not" — academic writing avoids contractions.', true),
(mod1, 'error_correction', 'Correct the journalistic headline: "The Government Is Going To Be Implementing New Reforms Soon"', '"Government to implement new reforms" — headlines use infinitive for future, remove auxiliary clutter.', true),
(mod1, 'error_correction', 'Correct the error: "In casual speech, one must utilize appropriate vernacular." What is wrong here?', 'Register mismatch — "utilize appropriate vernacular" is overly formal for a sentence about casual speech. Use: "In casual talk, you should use the right words."', true),
(mod1, 'error_correction', 'Correct the poetic inversion error: "Never I have seen such grace."', '"Never have I seen such grace." — inversion requires auxiliary before subject: Never + aux + subject.', true);

-- ============================================================
-- MODULE 2: Advanced Idioms & Fixed Expressions (20 cards)
-- ============================================================

-- fill_blank (8)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(mod2, 'fill_blank', '"The new policy is a ___ in the dark" — an attempt made without clear information or direction.', 'shot', true),
(mod2, 'fill_blank', '"She burned the ___ at both ends" — she exhausted herself by working too hard for too long.', 'candle', true),
(mod2, 'fill_blank', '"Don''t let the cat out of the ___" — don''t reveal a secret.', 'bag', true),
(mod2, 'fill_blank', '"The project is back on ___" — it has returned to the correct plan or schedule.', 'track', true),
(mod2, 'fill_blank', '"He bit off more than he could ___" — he took on more responsibility than he could handle.', 'chew', true),
(mod2, 'fill_blank', '"That decision will come back to ___ you" — it will cause problems for you later.', 'haunt', true),
(mod2, 'fill_blank', '"We need to get the ball ___" — we need to start the process or activity.', 'rolling', true),
(mod2, 'fill_blank', '"She has a ___ for detail" — she is very skilled at noticing small details.', 'eye', true);

-- multiple_choice (7)
INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES
(mod2, 'multiple_choice', 'What does "to sit on the fence" mean?',
 'To avoid taking a side or making a decision',
 '["To relax outdoors", "To avoid taking a side or making a decision", "To feel anxious", "To be excluded from a group"]'::jsonb, 1, true),

(mod2, 'multiple_choice', 'Which idiom means to finally understand something after a long time?',
 'The penny dropped',
 '["Burn bridges", "The penny dropped", "Hit the nail on the head", "Jump the gun"]'::jsonb, 1, true),

(mod2, 'multiple_choice', '"To go back to square one" means:',
 'To start again from the beginning',
 '["To return to a familiar place", "To start again from the beginning", "To reconsider a decision", "To admit a mistake"]'::jsonb, 1, true),

(mod2, 'multiple_choice', 'Which sentence uses "under the weather" correctly?',
 'I''m feeling a bit under the weather — I think I''m coming down with something.',
 '["The flight was delayed under the weather.", "I''m feeling a bit under the weather — I think I''m coming down with something.", "She works best under the weather.", "They argued under the weather all afternoon."]'::jsonb, 1, true),

(mod2, 'multiple_choice', '"To pull someone''s leg" means:',
 'To joke or tease someone',
 '["To physically trip someone", "To ask for help", "To joke or tease someone", "To insult someone indirectly"]'::jsonb, 2, true),

(mod2, 'multiple_choice', 'Which idiom means to make a problem worse?',
 'Add fuel to the fire',
 '["Beat around the bush", "Add fuel to the fire", "Cut to the chase", "Miss the boat"]'::jsonb, 1, true),

(mod2, 'multiple_choice', '"Once in a blue moon" means:',
 'Very rarely',
 '["Every night", "During a full moon", "Very rarely", "Once a month"]'::jsonb, 2, true);

-- error_correction (5)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(mod2, 'error_correction', 'Correct the idiom: "He beat around the tree instead of just telling us the problem."', '"Beat around the bush" — not "tree". The correct idiom is "beat around the bush".', true),
(mod2, 'error_correction', 'Correct the idiom: "She spilled the seeds about the surprise party."', '"Spilled the beans" — not "seeds". The correct idiom is "spill the beans".', true),
(mod2, 'error_correction', 'Correct the idiom: "We need to hit the iron while it''s warm."', '"Strike while the iron is hot" — the correct idiom uses "strike" and "hot", not "hit" and "warm".', true),
(mod2, 'error_correction', 'Is this idiom used correctly? "He missed the boat by arriving early to the meeting." Explain.', 'Incorrect. "Missed the boat" means missed an opportunity, not being late literally. Example: "He missed the boat by not investing early."', true),
(mod2, 'error_correction', 'Correct: "Let''s not cry over spilled milk — we can''t change what already happened. Now let''s fix our mistakes and regret the past." What is contradictory here?', 'The second sentence contradicts the idiom. "Cry over spilled milk" means don''t dwell on the past — saying "regret the past" immediately after defeats the purpose.', true);

-- ============================================================
-- MODULE 3: Pragmatics (20 cards)
-- ============================================================

-- fill_blank (7)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(mod3, 'fill_blank', 'Pragmatics studies ___ meaning — what speakers actually mean beyond the literal words.', 'implied', true),
(mod3, 'fill_blank', 'When someone says "Nice haircut" sarcastically, the ___ meaning is negative even though the literal words are positive.', 'implied', true),
(mod3, 'fill_blank', 'An ___ act is a statement that performs an action, e.g. "I now pronounce you married."', 'illocutionary', true),
(mod3, 'fill_blank', '"Could you pass the salt?" is not really a question about ability — it is a polite ___.', 'request', true),
(mod3, 'fill_blank', 'The principle that speakers give enough information — neither too much nor too little — is called Grice''s Maxim of ___.', 'Quantity', true),
(mod3, 'fill_blank', 'When context determines that "I''ll get you for that" is a joke and not a threat, we are using ___ to interpret meaning.', 'pragmatics', true),
(mod3, 'fill_blank', '"Saying nothing is also a message" is a concept in pragmatics called ___ silence.', 'communicative', true);

-- multiple_choice (8)
INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES
(mod3, 'multiple_choice', 'What is the implied meaning of "It''s getting late" said by a host to a guest at midnight?',
 'You should leave now.',
 '["I am tired.", "You should leave now.", "I want to check the time.", "The party is just starting."]'::jsonb, 1, true),

(mod3, 'multiple_choice', 'Which is an example of sarcasm?',
 '"Oh great, another meeting. Just what I needed."',
 '["I love spending time with my family.", "Oh great, another meeting. Just what I needed.", "This traffic is very heavy today.", "She said she would come tomorrow."]'::jsonb, 1, true),

(mod3, 'multiple_choice', 'A speech act that changes reality by being spoken (like a judge''s ruling) is called:',
 'A performative utterance',
 '["A rhetorical question", "A speech act error", "A performative utterance", "A presupposition"]'::jsonb, 2, true),

(mod3, 'multiple_choice', 'What pragmatic strategy is being used in: "I don''t suppose you could help me with this, could you?"',
 'Negative politeness — minimizing imposition',
 '["Aggressive request", "Negative politeness — minimizing imposition", "Presupposition", "Implicature violation"]'::jsonb, 1, true),

(mod3, 'multiple_choice', 'Grice''s Cooperative Principle includes which four maxims?',
 'Quantity, Quality, Relation, Manner',
 '["Tone, Register, Formality, Brevity", "Quantity, Quality, Relation, Manner", "Clarity, Brevity, Truth, Style", "Implication, Assumption, Context, Tone"]'::jsonb, 1, true),

(mod3, 'multiple_choice', '"Every student passed the exam" implies:',
 'The speaker assumes there was an exam and students took it.',
 '["All students cheated.", "The speaker assumes there was an exam and students took it.", "Some students failed.", "The exam was very easy."]'::jsonb, 1, true),

(mod3, 'multiple_choice', 'When someone responds to "Do you know the time?" with "Yes, I do" and walks away, they are violating:',
 'Grice''s Maxim of Relation (relevance)',
 '["The rule of grammar", "Grice''s Maxim of Relation (relevance)", "Grice''s Maxim of Quality", "The turn-taking rule"]'::jsonb, 1, true),

(mod3, 'multiple_choice', '"You might want to check your work again" from a teacher most likely means:',
 'Your work has errors and you should fix them.',
 '["Your work is perfect.", "Your work has errors and you should fix them.", "Check again only if you want to.", "The teacher is unsure about the task."]'::jsonb, 1, true);

-- error_correction (5)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(mod3, 'error_correction', 'Explain the pragmatic failure: A: "Can you speak English?" B: "Yes." [conversation ends]', 'B answered the literal question (ability) but ignored the implied meaning — A was asking B to speak English or start a conversation in English.', true),
(mod3, 'error_correction', 'Spot the pragmatic error: "My boss said my presentation was interesting." The student concludes the boss loved it. Is this correct?', 'Not necessarily. "Interesting" in many contexts is a polite hedge that can imply the opposite. Context and tone determine the real meaning — this is pragmatic ambiguity.', true),
(mod3, 'error_correction', 'Is this an error? Someone says "I''m fine" in a flat, tired voice after a difficult day. A listener takes it literally. What went wrong?', 'The listener ignored paralinguistic cues (tone, body language). "I''m fine" here likely violates sincerity — pragmatically, the speaker is not fine.', true),
(mod3, 'error_correction', 'Correct the misuse: "He made a performative utterance when he said ''I think it might rain.''" Is this correct?', 'Incorrect. "I think it might rain" is a prediction, not a performative. A performative must change reality by being said — e.g. "I promise", "I declare", "You''re fired."', true),
(mod3, 'error_correction', 'A student writes: "Sarcasm always uses opposite words to express the real meaning." What is wrong with this definition?', 'Too simplistic. Sarcasm relies on context, tone, and shared knowledge — the words may not always be literal opposites. Example: "Sure, because things couldn''t get any worse" can be sarcastic without being a direct opposite.', true);

-- ============================================================
-- MODULE 4: Intonation & Stress (20 cards)
-- ============================================================

-- fill_blank (8)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(mod4, 'fill_blank', '"I didn''t say SHE took the money" (stress on SHE) implies ___ took the money.', 'someone else', true),
(mod4, 'fill_blank', '"I didn''t SAY she took the money" (stress on SAY) implies the speaker ___ it.', 'implied or suggested', true),
(mod4, 'fill_blank', 'In English, rising intonation at the end of a statement can signal ___ or uncertainty.', 'a question', true),
(mod4, 'fill_blank', '"I didn''t say she TOOK the money" implies she ___ it.', 'borrowed or received', true),
(mod4, 'fill_blank', 'Falling intonation at the end of a question typically signals a ___ question, not a yes/no question.', 'wh-', true),
(mod4, 'fill_blank', 'The word that carries the most important new information in a sentence is called the ___ stress.', 'nuclear', true),
(mod4, 'fill_blank', 'In the sentence "He LOVES coffee", the stress on LOVES implies a strong ___ to contrast with someone who doesn''t.', 'emphasis', true),
(mod4, 'fill_blank', '"Really?" said with rising intonation means you are ___. Said with flat intonation it can mean you don''t care.', 'surprised or seeking confirmation', true);

-- multiple_choice (7)
INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES
(mod4, 'multiple_choice', 'Say: "I didn''t say she took the MONEY." What does stressing MONEY imply?',
 'She took something else, not the money.',
 '["Someone else took the money.", "She didn''t take anything.", "She took something else, not the money.", "I said it, but quietly."]'::jsonb, 2, true),

(mod4, 'multiple_choice', 'Which version expresses disbelief most strongly through stress?',
 'You actually DID that?',
 '["You actually did THAT?", "YOU actually did that?", "You actually DID that?", "You ACTUALLY did that?"]'::jsonb, 2, true),

(mod4, 'multiple_choice', 'A student says "You''re coming to the party?" with rising intonation. This most likely means:',
 'The speaker is surprised or confirming unexpected information.',
 '["It is a command.", "The speaker is surprised or confirming unexpected information.", "The speaker is excited.", "It is a formal question."]'::jsonb, 1, true),

(mod4, 'multiple_choice', 'Which sentence uses contrastive stress correctly?',
 'I said I wanted TEA, not coffee.',
 '["I SAID I wanted tea, not coffee.", "I said I wanted TEA, not coffee.", "I said I WANTED tea, not coffee.", "I said I wanted tea, NOT coffee."]'::jsonb, 1, true),

(mod4, 'multiple_choice', 'In English, tonic stress falls on:',
 'The word carrying the most important or new information',
 '["Always the last word", "Always the subject", "The word carrying the most important or new information", "Always the verb"]'::jsonb, 2, true),

(mod4, 'multiple_choice', 'Saying "Oh, fantastic" with a flat, slow delivery most likely conveys:',
 'Sarcasm or lack of enthusiasm',
 '["Genuine excitement", "A formal compliment", "Sarcasm or lack of enthusiasm", "Polite agreement"]'::jsonb, 2, true),

(mod4, 'multiple_choice', '"She told ME" vs "SHE told me" — what changes with the shift in stress?',
 'The focus shifts from who was told to who did the telling.',
 '["Nothing — they mean the same.", "The tense changes.", "The focus shifts from who was told to who did the telling.", "The sentence becomes a question."]'::jsonb, 2, true);

-- error_correction (5)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(mod4, 'error_correction', 'A student claims: "Stress in English is random and doesn''t change meaning." Correct this.', 'Incorrect. Stress is systematic and meaning-bearing. "I didn''t say SHE took it" vs "I didn''t say she TOOK it" carry different implications.', true),
(mod4, 'error_correction', 'Correct the explanation: "Rising intonation always means it''s a question in English."', 'Oversimplification. Rising intonation can signal questions, uncertainty, or a list continuation. Falling intonation can also occur in yes/no questions with a confrontational tone.', true),
(mod4, 'error_correction', 'A student stresses every word equally when reading aloud: "I WANT TO GO TO THE STORE." What is the error?', 'English uses stress-timed rhythm — content words (want, store) receive stress; function words (to, the) are reduced. Equal stress sounds unnatural and robotic.', true),
(mod4, 'error_correction', 'Is there an error in this transcription? Speaker: "You''re REALLY going to do that?" — described as "expressing approval."', 'The description is wrong. Depending on context, stress on REALLY often signals disbelief, sarcasm, or incredulity — not approval.', true),
(mod4, 'error_correction', 'Correct: "Nuclear stress always falls on the last word of a sentence."', 'Not always. Nuclear stress falls on the most important or focused word, which can appear anywhere in the sentence depending on context and contrast.', true);

-- ============================================================
-- MODULE 5: Hedging & Vagueness (20 cards)
-- ============================================================

-- fill_blank (8)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(mod5, 'fill_blank', '"The results are ___ accurate" — use a hedging word to show uncertainty without saying "maybe".', 'roughly', true),
(mod5, 'fill_blank', '"She''s ___ of a perfectionist" — using vagueness to soften a personality description.', 'sort', true),
(mod5, 'fill_blank', '"There were ___ 200 people at the event" — approximation hedge.', 'around', true),
(mod5, 'fill_blank', '"This approach tends to ___ produce better results" — academic hedge for general tendency.', 'generally', true),
(mod5, 'fill_blank', '"The deadline is ___ the end of the month" — vague time expression.', 'around', true),
(mod5, 'fill_blank', '"___ speaking, the project is on track" — used to signal an approximation or general overview.', 'Broadly', true),
(mod5, 'fill_blank', '"He''s not exactly the most organized person" is an example of ___ — saying something negative indirectly.', 'understatement', true),
(mod5, 'fill_blank', '"It would ___ appear that the data was misread" — formal hedge used in academic writing.', 'seem', true);

-- multiple_choice (7)
INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES
(mod5, 'multiple_choice', 'Which sentence uses hedging appropriately in academic writing?',
 'The findings suggest that stress may contribute to poor sleep quality.',
 '["Stress definitely causes poor sleep always.", "The findings suggest that stress may contribute to poor sleep quality.", "Obviously, stress ruins sleep.", "We guess stress might possibly perhaps affect sleep."]'::jsonb, 1, true),

(mod5, 'multiple_choice', 'Which phrase is a vague approximator?',
 'more or less',
 '["absolutely", "precisely", "more or less", "certainly"]'::jsonb, 2, true),

(mod5, 'multiple_choice', 'Why do native speakers hedge with "kind of" or "sort of"?',
 'To soften statements and avoid sounding too direct or absolute',
 '["To show they don''t know English well", "To be rude", "To soften statements and avoid sounding too direct or absolute", "To sound more academic"]'::jsonb, 2, true),

(mod5, 'multiple_choice', 'Which sentence over-hedges (is too vague to be useful)?',
 'It might possibly be somewhat related to perhaps some kind of issue.',
 '["The data may indicate a trend.", "Results were approximately 30% higher.", "It might possibly be somewhat related to perhaps some kind of issue.", "This could potentially be significant."]'::jsonb, 2, true),

(mod5, 'multiple_choice', 'In academic writing, which hedge is most appropriate?',
 'The evidence appears to support this hypothesis.',
 '["The evidence totally proves this.", "I think this is probably right, maybe.", "The evidence appears to support this hypothesis.", "Obviously this hypothesis is correct."]'::jsonb, 2, true),

(mod5, 'multiple_choice', '"Roughly speaking, we saved about 20% on costs" — why is this double hedging acceptable here?',
 'In casual or spoken contexts, combining "roughly speaking" + "about" is natural for approximations.',
 '["It is never acceptable.", "It makes the claim stronger.", "In casual or spoken contexts, combining hedges is natural for approximations.", "It is only acceptable in academic writing."]'::jsonb, 2, true),

(mod5, 'multiple_choice', 'Which sentence uses understatement as a form of vagueness?',
 '"The presentation wasn''t exactly his finest work."',
 '["His presentation was terrible.", "The presentation wasn''t exactly his finest work.", "The presentation was somewhat imperfect.", "The presentation was below average."]'::jsonb, 1, true);

-- error_correction (5)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(mod5, 'error_correction', 'Correct the over-confident academic claim: "This study proves that social media destroys mental health in teenagers."', '"This study suggests that social media may negatively impact mental health in teenagers." — Academic writing requires hedging; "proves" and "destroys" are too absolute.', true),
(mod5, 'error_correction', 'Is this appropriate? A doctor says: "You sort of have a fracture in your leg." What is the problem?', 'Inappropriate context for vagueness. Medical diagnoses require precision — hedging here could mislead the patient. Vagueness is inappropriate when clarity is critical.', true),
(mod5, 'error_correction', 'Correct the redundant hedging in academic writing: "It could perhaps possibly be argued that maybe stress is somewhat linked to burnout."', 'Over-hedged. Use: "It could be argued that stress is linked to burnout." — One or two hedges are sufficient; stacking them weakens credibility.', true),
(mod5, 'error_correction', 'A student writes: "More or less around approximately 50 students attended." What is wrong?', 'Triple redundancy — "more or less", "around", and "approximately" all mean the same thing. Use one: "Approximately 50 students attended."', true),
(mod5, 'error_correction', 'Correct: "Hedging shows that the writer is unsure and unconfident." Is this accurate?', 'Not quite. In academic and professional writing, hedging shows intellectual honesty and precision — it signals awareness of limitations, not weakness or uncertainty.', true);

-- ============================================================
-- MODULE 6: Advanced Collocations (20 cards)
-- ============================================================

-- fill_blank (8)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(mod6, 'fill_blank', 'We ___ a decision, not "do" or "take" one. (correct verb collocate)', 'make', true),
(mod6, 'fill_blank', 'You ___ a habit, not "make" or "do" one.', 'break', true),
(mod6, 'fill_blank', 'She ___ a conclusion after reviewing the data. (correct verb collocate)', 'drew', true),
(mod6, 'fill_blank', 'They ___ an agreement after hours of negotiation.', 'reached', true),
(mod6, 'fill_blank', 'He ___ a risk by launching the product early. (correct collocate)', 'took', true),
(mod6, 'fill_blank', 'The company ___ bankruptcy last quarter. (correct collocate)', 'filed for', true),
(mod6, 'fill_blank', 'We need to ___ progress on this project. (not "do progress")', 'make', true),
(mod6, 'fill_blank', '"___ attention to detail" is the correct collocation — not "give" or "do".', 'Pay', true);

-- multiple_choice (7)
INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES
(mod6, 'multiple_choice', 'Which is the correct collocation?',
 'make an effort',
 '["do an effort", "make an effort", "take an effort", "have an effort"]'::jsonb, 1, true),

(mod6, 'multiple_choice', 'Which verb collocates correctly with "responsibility"?',
 'take',
 '["make", "do", "take", "have"]'::jsonb, 2, true),

(mod6, 'multiple_choice', 'Which is correct?',
 'commit a crime',
 '["make a crime", "do a crime", "commit a crime", "perform a crime"]'::jsonb, 2, true),

(mod6, 'multiple_choice', 'Which collocation is INCORRECT?',
 'make research',
 '["conduct research", "carry out research", "make research", "do research"]'::jsonb, 2, true),

(mod6, 'multiple_choice', 'Which is the correct collocation with "damage"?',
 'cause damage',
 '["make damage", "do damage (only informal)", "cause damage", "Both B and C are acceptable"]'::jsonb, 3, true),

(mod6, 'multiple_choice', 'Choose the correct sentence:',
 'She gave a speech at the conference.',
 '["She made a speech at the conference.", "She told a speech at the conference.", "She gave a speech at the conference.", "She did a speech at the conference."]'::jsonb, 2, true),

(mod6, 'multiple_choice', 'Which collocates correctly with "influence"?',
 'have a strong influence',
 '["make a strong influence", "do a strong influence", "take a strong influence", "have a strong influence"]'::jsonb, 3, true);

-- error_correction (5)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(mod6, 'error_correction', 'Correct the collocation error: "We need to do a decision before Friday."', '"Make a decision" — the correct verb collocate is "make", not "do".', true),
(mod6, 'error_correction', 'Correct: "The team made a research on user behavior."', '"Conducted research" or "carried out research" — "make research" is incorrect. Research uses "do", "conduct", or "carry out".', true),
(mod6, 'error_correction', 'Correct: "She took a conclusion from the data."', '"Drew a conclusion" — the correct collocation is "draw a conclusion", not "take".', true),
(mod6, 'error_correction', 'Correct: "He did a great performance in the play."', '"Gave a great performance" — the correct collocation is "give a performance".', true),
(mod6, 'error_correction', 'Correct: "They made an agreement after the meeting."', '"Reached an agreement" — not "made". "Make an agreement" is sometimes used colloquially but "reach an agreement" is the standard collocation.', true);

-- ============================================================
-- MODULE 7: Cultural References (20 cards)
-- ============================================================

-- fill_blank (7)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(mod7, 'fill_blank', '"That''s very ___ of you" — said sarcastically to someone acting superior, referencing Orwell''s Animal Farm: "All animals are equal but some are more equal than ___."', 'others', true),
(mod7, 'fill_blank', 'Calling someone a "Romeo" implies they are very ___, referencing Shakespeare''s romantic hero.', 'romantic', true),
(mod7, 'fill_blank', '"Big ___" is a cultural reference to a surveillance state, from George Orwell''s novel 1984.', 'Brother', true),
(mod7, 'fill_blank', '"A ___ situation" refers to a dilemma where all options cause harm — from Joseph Heller''s novel.', 'Catch-22', true),
(mod7, 'fill_blank', '"You''re opening a real Pandora''s ___" means you are starting something that will cause many unforeseen problems.', 'box', true),
(mod7, 'fill_blank', 'Calling a plan someone''s "___ heel" means it is their one critical ___, from Greek mythology.', 'Achilles / weakness', true),
(mod7, 'fill_blank', '"Burning your ___" means to permanently cut off the possibility of going back — a military metaphor from Julius Caesar.', 'bridges', true);

-- multiple_choice (8)
INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES
(mod7, 'multiple_choice', 'Someone is called a "Scrooge." What does this imply culturally?',
 'They are very miserly and unwilling to spend money.',
 '["They are generous and kind.", "They are very miserly and unwilling to spend money.", "They are a hard worker.", "They are very old."]'::jsonb, 1, true),

(mod7, 'multiple_choice', 'What does "a Pyrrhic victory" mean?',
 'A victory that costs so much it is not worth winning.',
 '["A quick and decisive victory", "A victory that costs so much it is not worth winning", "A comeback after a defeat", "A surprising underdog victory"]'::jsonb, 1, true),

(mod7, 'multiple_choice', '"Don''t be such a Luddite" in modern usage means:',
 'Stop resisting new technology.',
 '["Stop being lazy", "Stop resisting new technology", "Stop being so traditional in your values", "Stop working so hard"]'::jsonb, 1, true),

(mod7, 'multiple_choice', '"That''s your Waterloo" is a cultural reference meaning:',
 'You are about to face your decisive defeat.',
 '["You will travel to Belgium.", "You have finally achieved success.", "You are about to face your decisive defeat.", "You made a great strategic move."]'::jsonb, 2, true),

(mod7, 'multiple_choice', 'To "cross the Rubicon" means:',
 'To make an irreversible, bold decision',
 '["To travel by river", "To make an irreversible, bold decision", "To betray a trusted ally", "To take a long, difficult journey"]'::jsonb, 1, true),

(mod7, 'multiple_choice', 'Describing someone as a "Jekyll and Hyde" personality means:',
 'They have two very different sides to their character.',
 '["They are unpredictable in their work.", "They have two very different sides to their character.", "They are very creative.", "They are good at acting."]'::jsonb, 1, true),

(mod7, 'multiple_choice', '"The elephant in the room" means:',
 'An obvious problem that everyone is avoiding discussing.',
 '["A large, uncomfortable chair", "An obvious problem that everyone is avoiding discussing", "A surprising guest", "Something that takes up too much space"]'::jsonb, 1, true),

(mod7, 'multiple_choice', 'Someone "playing Sherlock" in conversation means they are:',
 'Analyzing details very carefully to find the truth.',
 '["Pretending to know more than they do", "Being secretive", "Analyzing details very carefully to find the truth", "Acting in a dramatic way"]'::jsonb, 2, true);

-- error_correction (5)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(mod7, 'error_correction', 'A student says "He''s a real Don Quixote — very practical and gets things done." Is this correct?', 'Incorrect. Don Quixote is a symbol of impractical idealism and chasing impossible dreams — the opposite of "practical and gets things done."', true),
(mod7, 'error_correction', 'Correct the usage: "It was a Pyrrhic victory — they won easily and lost nothing."', 'Contradiction. A Pyrrhic victory means the cost of winning was so high it feels like a defeat. "Won easily and lost nothing" describes the opposite.', true),
(mod7, 'error_correction', 'A student uses "Catch-22" to mean "a lucky break." Is this correct?', 'Incorrect. A Catch-22 is a paradoxical no-win situation — any action you take creates a problem that prevents you from solving the original problem.', true),
(mod7, 'error_correction', 'Correct: "Calling something someone''s Achilles heel means they are very strong in that area."', 'Incorrect. An Achilles heel is a person''s critical vulnerability or weakness — the one area where they are vulnerable despite overall strength.', true),
(mod7, 'error_correction', 'A student says "He crossed the Rubicon, but then changed his mind and went back." What is the error?', '"Crossing the Rubicon" means making a point of no return — going back is impossible by definition. The sentence contradicts the meaning of the phrase.', true);

-- ============================================================
-- MODULE 8: Speed & Automaticity (20 cards)
-- ============================================================

-- fill_blank (8)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(mod8, 'fill_blank', 'Fast natural speech: "I''m gonna" is the reduced form of "___ ___".', 'going to', true),
(mod8, 'fill_blank', '"Whatcha doin''?" is the natural fast-speech reduction of "___ ___ ___?"', 'What are you doing', true),
(mod8, 'fill_blank', '"Dunno" is the informal contracted form of "___ ___".', 'don''t know', true),
(mod8, 'fill_blank', '"Shoulda" is the spoken reduction of "___ ___".', 'should have', true),
(mod8, 'fill_blank', '"Wanna" is the spoken reduction of "___ ___".', 'want to', true),
(mod8, 'fill_blank', '"Lemme" is the spoken reduction of "___ ___".', 'let me', true),
(mod8, 'fill_blank', '"Innit?" at the end of a British English sentence functions as a universal ___ tag.', 'question', true),
(mod8, 'fill_blank', '"Kinda" is the informal reduction of "___ ___".', 'kind of', true);

-- multiple_choice (7)
INSERT INTO cards (module_id, type, question, answer, options, correct_index, is_system) VALUES
(mod8, 'multiple_choice', 'In fast natural speech, "Did you eat?" often sounds like:',
 '"Didja eat?"',
 '["Did-you-eat?", "Didja eat?", "Did you ate?", "Have you eaten?"]'::jsonb, 1, true),

(mod8, 'multiple_choice', 'Which sentence best represents automatic grammar use (no conscious effort required at C2)?',
 'The speaker produced complex clauses fluidly without pausing to think.',
 '["The speaker carefully thought about each tense before speaking.", "The speaker produced complex clauses fluidly without pausing to think.", "The speaker used simple sentences to avoid mistakes.", "The speaker translated mentally from their native language."]'::jsonb, 1, true),

(mod8, 'multiple_choice', '"Could''ve" is a contraction of:',
 'could have',
 '["could of", "could have", "could be", "could we"]'::jsonb, 1, true),

(mod8, 'multiple_choice', 'At C2 level, automaticity means:',
 'Grammar and vocabulary are retrieved without conscious thought, allowing focus on meaning.',
 '["You never make mistakes.", "Grammar and vocabulary are retrieved without conscious thought, allowing focus on meaning.", "You speak very quickly.", "You no longer need to learn new words."]'::jsonb, 1, true),

(mod8, 'multiple_choice', 'In natural fast speech, "want to" is often reduced to "wanna" except before:',
 'A noun subject in indirect questions: "I want to know" ≠ "I wanna know"... but "Who do you want to win?" cannot become "wanna win" because "want to" is separated from the infinitive.',
 '["any adjective", "plural nouns", "a noun subject in indirect questions", "passive voice"]'::jsonb, 2, true),

(mod8, 'multiple_choice', 'Which is an example of chunked language — processing whole phrases rather than individual words?',
 '"As far as I''m concerned" produced instantly as a unit.',
 '["Saying each word of a sentence with a pause between them.", "As far as I''m concerned produced instantly as a unit.", "Memorizing verb conjugation tables.", "Translating idioms word by word."]'::jsonb, 1, true),

(mod8, 'multiple_choice', '"Couldna" or "couldn''t have" — which is standard written form and which is spoken reduction?',
 '"Couldn''t have" is written; "couldn''t''ve" or "couldna" is spoken reduction.',
 '["Both are equally formal.", "Couldn''t have is written; couldn''t''ve or couldna is spoken reduction.", "Neither is standard English.", "Couldna is formal; couldn''t have is slang."]'::jsonb, 1, true);

-- error_correction (5)
INSERT INTO cards (module_id, type, question, answer, is_system) VALUES
(mod8, 'error_correction', 'Correct the common written error: "I should of told you earlier."', '"Should have" — "of" is a phonetic misspelling of the contracted "have" in "should''ve". Always write "should have" in formal text.', true),
(mod8, 'error_correction', 'A student writes in a formal essay: "The results kinda suggest the hypothesis was wrong." What is the error?', '"Kinda" is informal spoken reduction. In formal writing, use "somewhat" or "appear to" — e.g. "The results somewhat suggest the hypothesis was incorrect."', true),
(mod8, 'error_correction', 'A student claims: "C2 speakers never use reduced forms — they always speak with perfect full forms." Correct this.', 'Incorrect. Native-like C2 speakers use reduced forms naturally (gonna, wanna, dunno) in casual speech. Avoiding all reductions makes speech sound unnatural and robotic.', true),
(mod8, 'error_correction', 'Correct the spelling error in this sentence: "I could of done it better if I tried."', '"Could have done it" — "could of" is never grammatically correct. It is a phonetic error. Always write "could have" or "could''ve".', true),
(mod8, 'error_correction', 'A student says: "Automaticity means speaking fast." Is this correct?', 'Not exactly. Automaticity means processing language without conscious effort — this often results in natural pace, but speed alone does not indicate automaticity. A slow, fluent speaker can have full automaticity.', true);

-- ============================================================
-- UPDATE total_cards COUNT
-- ============================================================
UPDATE modules SET total_cards = 20 WHERE id IN (mod1, mod2, mod3, mod4, mod5, mod6, mod7, mod8);

END $$;