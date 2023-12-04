
global.Dev = false;
#macro dev global.Dev

#macro current_frame global.CurrentFrame

// Named this so that you can type pce and get it in autofill
#macro pause_check_exit if (global.paused) exit
// Use this in game objects, keyword goe
#macro game_object_exit if (global.paused || !active.get()) exit

//Turns arguments into a local array named args
#macro arguments_pack var args = array_create(argument_count); for (var i = 0; i < argument_count; ++i) {args[i] = argument[i]}

// Time
#macro sec * 60
// 10 sprite fps * 60 fps = 6 frames per sprite frame
#macro spriteframes * 6

//Functions
#macro trace show_debug_message

#macro z_gravity 1

//Camera shorthand
#macro camera_x camera_get_view_x(view_camera[0])
#macro camera_y camera_get_view_y(view_camera[0])
#macro camera_width camera_get_view_width(view_camera[0])
#macro camera_height camera_get_view_height(view_camera[0])
#macro camera_center_x (camera_x + camera_width/2)
#macro camera_center_y (camera_y + camera_height/2)
#macro camera_right (camera_x + camera_width)
#macro camera_bottom (camera_y + camera_height)

//Event enum
enum EVENT {
	CANCEL,
	PROCEED
}