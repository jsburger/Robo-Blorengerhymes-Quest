/// @description 
// Inherit the parent event
event_inherited();

last_spawn = noone;
on_signal_received = function(value) {
	if value {
		if only_one_at_a_time && instance_exists(last_spawn) {
			exit
		}
		last_spawn = instance_create_layer(x, y, "Instances", object)
	}
}