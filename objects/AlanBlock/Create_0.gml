/// @description 

// Inherit the parent event
event_inherited();

image_speed = 0;

get_letter = function() {
	static values = ["A", "N", "L", "F"]
	return values[image_index]
}

can_serialize = true;
should_serialize = function() {
	if instance_exists(AlanSpawner) {
		return AlanSpawner.solved
	}
	return false;
}
serializer.add_layer(function() {
	return {
		x,
		y,
		pushable
	}
})