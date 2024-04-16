/// @description 

// Inherit the parent event
event_inherited();

var found = true;
for (var i = 0; i < ANIMALS.HUMAN; ++i) {
    if !animal_found(i) found = false 
}
if global.intuition >= 150 || found {
	instance_destroy()
}