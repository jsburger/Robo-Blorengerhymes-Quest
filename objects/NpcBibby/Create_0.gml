/// @description 

// Inherit the parent event
event_inherited();

spr_talk = sprNpcBibbyTalk

on_talked_to = function() {
	say_text(self, "Hi, I'm Bibby!", function() {
		say_prompt(self, "Wanna play redlight greenlight?", ["Sure", "No!"], [
			function() {
				say_text(self, "Yippee!!!", function() {
					with RedlightGreenlight {
						start_game()
					}
				})
			},
			function() {
				say_text(self, "Awwww man! You're no fun!", undefined)
			}
		])
	})
	
}