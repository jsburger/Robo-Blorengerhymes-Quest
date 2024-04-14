/// @description 
pause_check_exit

global.time_pause = true
if image_xscale < 1 {
	image_xscale += .001
	image_xscale *= 1.05
	if image_xscale > 1 {
		image_xscale = 1
	}
	image_yscale = image_xscale
}
else {
	progress += 1 
	if progress > 1 sec {
		image_alpha -= .01
		image_xscale += .01
		image_yscale -= .01
	}
	if image_alpha <= 0 {
		if animal != -1 {
			with Player {
				state_change(PlayerStates.IDLE)
			}
			game_pause(animal)
		}
		instance_destroy()
	}
}

