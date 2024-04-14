/// @description 

// Inherit the parent event
event_inherited();

item = image_index

on_interact = function() {
	give_item(item)
	instance_destroy()
}


if !item_should_spawn(item) {
	instance_destroy()
}