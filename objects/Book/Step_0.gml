/// @description 

if crawl > 0 {
	crawl -= 20
	y -= 20
}
if crawl <= 0 {
	if button_pressed(inputs.right) && page < (ANIMALS._MAX - 1) {
		turn_right()
	}
	if button_pressed(inputs.left) && page > (0) {
		turn_left()
	}
	
	if want_page != -1 {
		if want_page != page && sprite_index == sprBook {
			if want_page > page turn_right()
			else turn_left()
		}
		if want_page == page want_page = -1
	}
}

if its_time_to_go {
	death += 1;
	y += 50
	if death > .5 sec {
		instance_destroy()
		game_really_unpause()
	}
}