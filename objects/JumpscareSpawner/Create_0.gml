/// @description 

// Inherit the parent event
event_inherited();

animal = ANIMALS.JUMPSCARE
create_animal = function() {
	with _create_animal() {
		image_alpha = 1
		sound_play(sndJumpscare)
	}
}