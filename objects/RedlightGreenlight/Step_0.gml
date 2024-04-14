/// @description 
pause_check_exit

if fade_progress < 1 && fading {
	fade_progress += .025;
	if fade_progress >= 1 {
		if starting {
			fading = false
			fade_progress = 0
			starting = false
			with Player {
				is_visible = false;
				other.player_pauser = active.modify().set(false)
				other.player_x = x
				other.player_y = y;
				x = (other.x + NpcBibby.x)/2
				y = other.y 
			}
			
			alarm[0] = redlight_time()
			var m = 64;
			with instance_create(x, y - m, RGRunner) {
				is_player = true;
				sprite_index = sprPlayerNewWalk1
			}
			with instance_create(x, y + m, RGRunner) {
				image_alpha = 0
				stop_running()
			}
		}
		if ending {
			fading = false
			fade_progress = 0
			ending = false
			if player_pauser != undefined {
				player_pauser.clear()
			}
			with Player {
				x = other.player_x
				y = other.player_y
				is_visible = true
			}
			with RGRunner instance_destroy()
		}
	}
}