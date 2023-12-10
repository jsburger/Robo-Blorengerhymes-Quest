/// @description 
game_object_exit
if (!instance_exists(creator)) {
	instance_destroy()
	exit
}
if !creator.active.get() exit

if active_frames > 0 {
	active_frames -= 1
}
else {
	instance_destroy()
}