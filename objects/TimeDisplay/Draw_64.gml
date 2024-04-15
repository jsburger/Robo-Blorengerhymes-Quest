/// @description draw self

if hud_can_draw() {
	draw_self()
	draw_numbers(x, y, time_get_display_hour(), c_white, 2, 1)
}