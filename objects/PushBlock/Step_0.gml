/// @description Move after being pushed
game_object_exit

if pushing {
	var dir = point_direction(x, y, push_location.x, push_location.y),
		dist = push_location.distance_to(self),
		length = min(dist, push_speed);
	x += lengthdir_x(length, dir)
	y += lengthdir_y(length, dir)
	if dist <= 0 {
		stop_push()
	}
}
