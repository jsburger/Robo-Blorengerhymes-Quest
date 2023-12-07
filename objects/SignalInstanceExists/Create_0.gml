/// @description 


// Inherit the parent event
event_inherited();

get_value = function() {
	if inverted {
		return !instance_exists(search_object)
	}
	return instance_exists(search_object)
}

if starting_value == undefined {
	last_value = get_value()
}