/// @description 

page = 0
want_page = -1;


its_time_to_go = false
death = 0
crawl = 600
y += crawl

turn_right = function() {
	page += 1
	sprite_index = sprBookFlipRight
	image_index = 0
}

turn_left = function() {
	page -= 1
	sprite_index = sprBookFlipLeft
	image_index = 0
}