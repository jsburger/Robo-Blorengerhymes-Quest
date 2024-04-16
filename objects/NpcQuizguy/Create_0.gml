/// @description 

// Inherit the parent event
event_inherited();

spr_talk = sprNpcNerdTalk

set_shadow(shdPlayer, -1, 32)

on_talked_to = function() {
	question = 0
	correct_answers = 0
	say_text(self, "Well, you look quite dumb!", function() {
		say_prompt(self, "Shall we put that to the test?", ["Yeah alright", "Nah"],
			[function () {
				sound_play_music(musQuiz)
				say_line(self, ["Then we shall begin!", "Question one;"], function() {
					get_next_question()
				})
			},
			function() {
				say_line(self, "Hmm. Suit yourself.")
			}]
		)
	})
}

question = 0
correct_answers = 0

get_next_question = function() {
	switch question {
		case 0:
			say_prompt(self, "What are you currently seaching for?",
				["Gibbleglobs", "Globbletops", "Globulobs"],
				[incorrect, correct, incorrect])
			return;
		case 1:
			say_prompt(self, "What is 37 + 55?",
				["92", "85", "99"],
				[correct, incorrect, incorrect]
			)
			return;
		case 2:
			say_prompt(self, "Which direction do rivers flow?",
				["North", "Left", "Downhill"],
				[incorrect, incorrect, correct]
			)
			return;
		case 3:
			say_text(self, ["And that's all!", "The results are in, you are..."], function() {
				if correct_answers == 3 {
					say_text(self, "A true genius! I can't believe it!", function() {
						if item_should_spawn(ITEMS.BUCKET) {
							say_text(self, "Take this as a prize!", function() {
								give_item(ITEMS.BUCKET)
								quiz_end()
							})
						}
						else {
							say_text(self, "Though, it's not as impressive as the first time.", quiz_end)
						}
					})
				}
				else if correct_answers == 0 {
					say_text(self, "An utter moron! I can't believe you didn't get a single one right!", function() {
						quiz_end()
						with BrainSpawner spawn()
					})
				}
				else {
					say_text(self, "A simpleton, though I'll let you try again if you'd like.", quiz_end)
				}
			})
			return
	}
}

correct = function() {
	question += 1
	correct_answers += 1
	say_text(self, "Correct!", function() {
		get_next_question()
	})
}
incorrect = function() {
	question += 1
	say_text(self, "Incorrect!", function() {
		get_next_question()
	})
}

quiz_end = function() {
	stop_music()
}