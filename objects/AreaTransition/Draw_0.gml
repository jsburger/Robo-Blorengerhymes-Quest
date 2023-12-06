/// @description 

draw_self()

draw_set_color(c_black)
if bbox_left >= camera_x {
	draw_rectangle(camera_x, camera_y, bbox_left, camera_bottom, false)
}
if bbox_right <= camera_right {
	draw_rectangle(bbox_right, camera_y, camera_right, camera_bottom, false)
}
if bbox_top >= camera_y {
	draw_rectangle(bbox_left, camera_y, bbox_right, bbox_top, false)
}
if bbox_bottom <= camera_bottom {
	draw_rectangle(bbox_left, bbox_bottom, bbox_right, camera_bottom, false)
}

draw_set_color(c_white)