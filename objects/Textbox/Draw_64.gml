/// @description Draw the text

if progress > 0 {
	var gap = 32, _x = camera_width/2, _y = lerp(camera_height/2, camera_height, .6), w = camera_width/1.5;
	if !is_prompt {
		var to_draw = string_copy(lines[text_progress], 1, progress);
		draw_text_outlined(_x, _y, to_draw, gap, w)
	}
	else {
		for (var i = 0; i < array_length(lines); i++) {
			var to_draw = string_copy(lines[i], 1, progress);
			if i == selected_option + 1 {
				to_draw = ">  " + to_draw
			}
			draw_text_outlined(_x, _y, to_draw, gap, w)
			_y += string_height_ext(to_draw, gap, w)
		}
	}
}