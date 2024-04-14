/// @description 

if button_pressed(inputs.right) && page < (ANIMALS._MAX - 1) {
	page += 1
	sprite_index = sprBookFlipRight
	image_index = 0
}

if button_pressed(inputs.left) && page > (0) {
	page -= 1
	sprite_index = sprBookFlipLeft
	image_index = 0
}