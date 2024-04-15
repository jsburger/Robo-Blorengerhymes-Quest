/// @description 

if instance_number(GameCont) > 1 {
	instance_destroy()
	exit
}

trace("Total intuition: " + string(get_total_intuition()))

DepthGrid = ds_grid_create(2, 1);

surfaces = []
repeat(3) {
	array_push(surfaces, surface_create(room_width, room_height))
}
last_hour = 8

dark = 0
dark_goal = 0
dark_time = 2

restoring = false; // If game over and need to put player on previous entrance
restore_point = -1;
last_room = -1;
restore_room = -1;

has_centered_window = false

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

cam_width = 1024
cam_height = 768

cam_setup = function() {
	camera_destroy(view_camera[0])
	view_enabled = true;
	view_visible[0] = true;
	room_set_viewport(room, 0, true, 0, 0, cam_width, cam_height)
	view_camera[0] = camera_create_view(
		0, 0,
		cam_width, cam_height,
		0, Player,
		-1, -1,
		cam_width/2,
		cam_height/2
	)
	window_set_size(cam_width, cam_height)
	if !has_centered_window {
		window_center()
		has_centered_window = true
	}
	display_set_gui_size(cam_width, cam_height)
	surface_resize(application_surface, cam_width, cam_height)
}

cam_setup()
