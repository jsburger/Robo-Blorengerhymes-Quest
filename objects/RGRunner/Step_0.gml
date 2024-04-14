/// @description 
game_object_exit
if is_player {
	if can_run && button_check(inputs.right) {
		if !running start_running()
	}
	else {
		if running stop_running()
	}
}

if image_alpha < .8 {
	image_alpha += .005
}
if can_run && instance_exists(RedlightGreenlight) {
	if x > NpcBibby.bbox_left {
		RedlightGreenlight.i_won(self)
	}
}