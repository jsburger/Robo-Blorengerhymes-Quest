/// @description 
trace("GameCont")

if instance_number(GameCont) > 1 {
	instance_destroy()
	exit
}

DepthGrid = ds_grid_create(2, 1);

surfaces = []
repeat(2) {
	array_push(surfaces, surface_create(room_width, room_height))
}

dark = 0
dark_goal = 0
dark_time = 1 sec