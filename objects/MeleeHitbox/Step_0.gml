/// @description 
game_object_exit
if (!instance_exists(creator)) {
	instance_destroy()
	exit
}
if !creator.active.get() exit

if active_frames > 0 {
	active_frames -= 1
	
	if tracking {
		if tracking_x == undefined {
			tracking_x = target.x;
			tracking_y = target.y;
		}
		x += target.x - tracking_x;
		y += target.y - tracking_y;
		tracking_x = target.x;
		tracking_y = target.y;
	}
}
else {
	instance_destroy()
}