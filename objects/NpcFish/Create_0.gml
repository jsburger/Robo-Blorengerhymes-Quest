/// @description 

// Inherit the parent event
event_inherited();

spr_talk = sprNpcFishTalk

on_talked_to = function() {
	
	say_text(self, "yippee!!!")
	
}