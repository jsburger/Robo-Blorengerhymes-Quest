/// @description 

if progress == 0 {
	GameCont.change_room(target_room)
}

progress += 1/60;


if progress >= 1 {
	GameCont.finish_transition()
	instance_destroy()
}

