/// @description 
game_object_exit

if falling {
	x = Pit.x
	y = Pit.y
	
	if current_frame mod 12 == 0 {
		image_angle += random_range(36, 64)
		image_blend = merge_color(image_blend, c_blue, .2)
		image_blend = merge_color(image_blend, c_black, .2)
		image_xscale *= .7
		image_yscale = image_xscale
	}
	if image_xscale <= .001 {
		canonically_dead = true
		with EvilSpawner spawn()
		remember_me()
		instance_destroy()
	}
}