/// @description 

// Inherit the parent event
event_inherited();

game_object_exit
if can_interact && has_interaction && !instance_exists(Textbox) {
	draw_sprite(sprInteract, get_animation_frame(3), x, y - 50)	
}