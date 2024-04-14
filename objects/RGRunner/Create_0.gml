/// @description 

// Inherit the parent event
event_inherited();

is_player = false;
run_speed = 1.5;
flip = -1
image_speed = 0
running = false;
can_run = true;

start_running = function() {
	if !can_run exit
	hspeed = run_speed
	running = true
	image_speed = 1
}
stop_running = function() {
	speed = 0
	image_speed = 0
	running = false
}