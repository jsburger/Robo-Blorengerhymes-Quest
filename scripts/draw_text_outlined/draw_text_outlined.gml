function draw_text_outlined(_x, _y, str, sep, w, color = c_white, alpha = 1){
	var c = c_black
	draw_text_ext_color(_x - 2, _y, str, sep, w, c, c, c, c, 1)
	draw_text_ext_color(_x + 2, _y, str, sep, w, c, c, c, c, 1)
	draw_text_ext_color(_x, _y - 2, str, sep, w, c, c, c, c, 1)
	draw_text_ext_color(_x, _y + 2, str, sep, w, c, c, c, c, 1)
	c = color
	draw_text_ext_color(_x, _y, str, sep, w, c, c, c, c, 1)
}