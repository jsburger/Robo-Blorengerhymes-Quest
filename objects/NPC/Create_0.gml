/// @description 

// Inherit the parent event
event_inherited();

has_been_spoken_to = false;

set_shadow(shdPlayer, 0, 14)

spr_idle = sprite_index
spr_talk = sprite_index

talk = function() {
	sprite_index = spr_talk;
	image_index = 0
}

on_talked_to = function() {}
on_interact = function() {
	talk()
	sound_play(sound_pool("sndTalk"))
	on_talked_to()
}

on_item = function(item) {
	reject_item()
}

reject_item = function() {
	say_text(self, "Huh?")
}