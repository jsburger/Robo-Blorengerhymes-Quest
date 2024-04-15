/// @description 

// Inherit the parent event
event_inherited();

item = image_index
image_speed = 0

on_interact = function() {
	give_item(item)
	sound_play(sndItem)
	instance_destroy()
}


if !item_should_spawn(item) {
	instance_destroy()
}