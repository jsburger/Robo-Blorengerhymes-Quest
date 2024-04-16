/// @description 

// Inherit the parent event
event_inherited();

spr_talk = sprNpcDutchessIdle
set_shadow(shdHaniwa, 0, 0)

on_talked_to = function() {
	
	say_text(self, ["I'm just sitting here.", "I'm just enjoying my time here at the beach."])
}