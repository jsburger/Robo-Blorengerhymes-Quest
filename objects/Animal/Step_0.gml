/// @description 
game_object_exit

if collecting {
	collect_time += 1
	global.time_pause = true;
}
else if image_alpha < .8 {
	image_alpha += .005
}
if collecting {
	if collect_time < 25 {
		image_xscale += .01;
		image_yscale += .01;
		y -= .5
	}
	else if collect_time < 240 {
		collect_dist *= .99
		collect_angle += 3;
		x = lerp(Player.x + lengthdir_x(collect_dist, collect_angle), x, .9)
		y = lerp(Player.y + lengthdir_y(collect_dist, collect_angle), y, .9)
		image_xscale *= .99
		image_yscale *= .99
		image_alpha *= .99
		if collect_time = 120 {
			with Player {
				state_change(PlayerStates.GRINNING)
			}
			with instance_create(camera_width/2, camera_height/2, CatchText) {
				animal = other.animal
			}
		}
	}
	else {
		with instance_create(Player.x, Player.y, Effect) {
			sprite_index = sprImpact
			zlayer = -1
		}
		instance_destroy()
	}
}