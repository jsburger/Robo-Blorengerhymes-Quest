/// @description 
pause_check_exit

if !is_green {
	with RGRunner if is_player && speed > 0 {
		other.rage += 1
	}
	if rage > 60 {
		with RGRunner {
			can_run = false
			stop_running()
		}
		rage = 0
		alarm[0] = -1
		with Textbox instance_destroy()
		say_text(instance_get(NpcBibby), "I caught you! You lose!", function() {
			end_game()
		})
	}
}

if is_active global.time_pause = true