/// @description Draw the text

if progress > 0 {
	var gap = 32, _x = camera_width/2, _y = lerp(camera_height/2, camera_height, .6), w = camera_width/1.5;
	if !is_prompt {
		var to_draw = string_copy(lines[text_progress], 1, progress);
		var c = c_black
		draw_text_ext_color(_x, _y, to_draw, gap, w, c, c, c, c, 1)
		c = c_white
		draw_text_ext_color(_x - 2, _y - 2, to_draw, gap, w, c, c, c, c, 1)
	}
	else {
		for (var i = 0; i < array_length(lines); i++) {
			var to_draw = string_copy(lines[i], 1, progress);
			if i == selected_option + 1 {
				to_draw = ">  " + to_draw
			}
			var c = c_black
			draw_text_ext_color(_x, _y, to_draw, gap, w, c, c, c, c, 1)
			c = c_white
			draw_text_ext_color(_x - 2, _y - 2, to_draw, gap, w, c, c, c, c, 1)
			_y += string_height_ext(to_draw, gap, w)
		}
	}
}