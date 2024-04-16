/// @description 
event_inherited()

if irandom(19) == 0 sprite_index = sprTransitionLimestock2
//sprite_index = sprTransitionLimestock
size = 20
image_xscale = size
image_yscale = size

shrinking = true;
growing = false;
waittime = -1;

progress = 0;
growspeed = .0175

set_position = function() {
	if instance_exists(Player) {
		x = Player.x
		y = Player.y
	}
	//x = camera_center_x
	//y = camera_center_y
	x = lerp(x, camera_center_x, 1 * (1 - progress))
	y = lerp(y, camera_center_y, 1 * (1 - progress))
}

set_position()