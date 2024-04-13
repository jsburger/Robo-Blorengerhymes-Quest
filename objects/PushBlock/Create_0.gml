/// @description Add try_push

// Inherit the parent event
event_inherited();

pushing = false;
push_location = new Point(x, y)
push_speed = 4;
pushable = true;

/// @param {Enum.SIDE} from_side
try_push = function(from_side) {
	if !pushing && pushable {
		var location = get_push_location(side_get_opposite(from_side));
		if position_meeting(location.x, location.y, PushBlockZone) {
			if !place_meeting_solid(location.x, location.y) {
				start_push(location)
				return true
			}
		}
	}
	return false
}

start_push = function(to_point) {
	pushing = true;
	push_location = to_point;
}
stop_push = function() {
	pushing = false;
}

get_push_location = function(side) {
	var dir = side_get_direction(side), length = 64;
	return new Point(x + lengthdir_x(length, dir), y + lengthdir_y(length, dir))
}