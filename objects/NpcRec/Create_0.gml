/// @description 

// Inherit the parent event
event_inherited();

spr_talk = sprNpcRecTalk

on_talked_to = function() {
	say_text(self, "Welcome to the Rec. Center.")
}