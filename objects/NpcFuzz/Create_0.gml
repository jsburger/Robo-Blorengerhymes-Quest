/// @description 

// Inherit the parent event
event_inherited();

spr_talk = sprNpcFuzzTalk
set_shadow(shdHaniwa, 0, 22)

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