function draw_numbers(_x, _y, number, bgColor, maxLength, scale = 1) {
	var numberString = string(number)
	var gap = 48 * scale;
	_x += gap * (maxLength - string_length(numberString))
	for (var i = 1; i <= string_length(numberString); i++) {
		draw_sprite_ext(sprNumbers, get_number_index(string_char_at(numberString, i)), _x + (gap * (i - 1)), _y,
			scale, scale, 0, c_white, 1)
	}
}

function get_number_index(str) {
	switch(str) {
		case "k": return 10
		case "-": return 11
		default: return floor(real(str))
	}
}
