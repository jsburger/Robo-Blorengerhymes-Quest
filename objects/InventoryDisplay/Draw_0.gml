if hud_can_draw() {
	draw_rectangle_simple(bbox_left, bbox_top, bbox_right, bbox_bottom, c_black, .4 * image_alpha)
	var i = item_current()
	if i != -1 {
		draw_sprite_ext(sprItems, i, x, y, 1, 1, 0, c_white, image_alpha)
	}
	draw_self()
}