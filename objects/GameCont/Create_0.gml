/// @description 

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

restoring = false; // If game over and need to put player on previous entrance
restore_point = -1;
last_room = -1;
restore_room = -1;

change_room = function(target_room) {
	if target_room != room {
		if !restoring {
			restore_point = last_room
			last_room = room;
			restore_room = room;
		}
		room_save()
		room_goto(target_room)
	}
}

finish_transition = function() {
	unpause_instances()
	global.room_starters.for_each_object(function(i) {i.on_room_start()})
	with GameObject setup.call();
}