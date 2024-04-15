/// @description 

// Inherit the parent event
event_inherited();

if bbox_right > room_width {
	x += room_width - bbox_right
}

if bbox_left < 0 {
	x += - bbox_left
}

if bbox_top < 0 {
	y += - bbox_top
}

if bbox_bottom > room_height {
	y += room_height - bbox_bottom
}