/// @description draw self

if !instance_exists(Transition) && !global.paused {
	draw_rectangle_simple(bbox_left, bbox_top, bbox_right, bbox_bottom, c_black, .4)
	if global.selected_item < array_length(global.items) {
		draw_sprite(sprItems, global.selected_item, x, y)
	}
	draw_self()
}