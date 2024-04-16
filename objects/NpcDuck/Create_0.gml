/// @description 

// Inherit the parent event
event_inherited();

spr_talk = sprNpcDuckTalk
set_shadow(shdPlayer, 6, 12)
on_talked_to = function() {
	
	say_prompt(self, "Do you like me?", ["Yes", "No"],
		[function() {
			say_text(self, "Yippee!!!")
		},
		function () {
			say_text(self, "GRAAAAHHH!!!!")
		}]
	)
}