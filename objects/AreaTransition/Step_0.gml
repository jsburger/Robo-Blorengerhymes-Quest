/// @description 
//pause_check_exit

x = Player.x
y = Player.y
//x = camera_center_x
//y = camera_center_y

if progress == 0 {
	pause_instances()
}

if growing {
	if waittime > 0 {
		waittime -= 1
	}
	else {
		progress -= growspeed
		if progress < .3
			image_alpha = lerp(0, 1, 3 * progress)
		if progress < 0 {
			GameCont.finish_transition()
			instance_destroy()
			exit
		}
	}
}


if shrinking {
	progress += growspeed
	if progress > 1 {
		GameCont.change_room(target_room)
		//sprite_index = sprTransitionLimestock2
		progress = 1
		shrinking = false
		waittime = 30
		growing = true;
		size *= 3
	}
}
var p = lerp(size, 0, progress);
image_xscale = p;
image_yscale = p;