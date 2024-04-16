/// @description 

// Inherit the parent event
event_inherited();

spr_talk = sprNpcAnemoneTalk
set_shadow(shdPlayer, 0, 6)

on_talked_to = function() {
	
	say_prompt(self, "Do you like me?", ["Yes", "No"],
		[function() {
			say_text(self, "yippee!!!")
		},
		function () {
			say_text(self, "GRAAAAHHH!!!!")
		}]
	)
}