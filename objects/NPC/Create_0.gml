/// @description 

// Inherit the parent event
event_inherited();

has_been_spoken_to = false;

spr_idle = sprite_index
spr_talk = sprite_index

talk = function() {
	sprite_index = spr_talk;
	image_index = 0
}

on_talked_to = function() {}
on_interact = function() {
	talk()
	on_talked_to()
}