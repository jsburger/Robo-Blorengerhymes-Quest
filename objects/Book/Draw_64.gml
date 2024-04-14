/// @description 

draw_self()
if sprite_index != sprBook exit

var animal = global._animals[page],
	found = animal_found(page);

draw_set_halign(fa_left)
draw_set_valign(fa_top)

var _x = x - sprite_get_xoffset(sprite_index),
	_y = y - sprite_get_yoffset(sprite_index);
	
	
	// Uses coordinates directly from the sprite.
var picture_x = _x + 180,
	picture_y = _y + 300;

if !found set_fog(c_black)
draw_sprite(animal.sprite, found ? sprite_get_animation_frame(animal.sprite) : 0, picture_x, picture_y)
if !found disable_fog()

var name_x = _x + 390,
	name_y = _y + 195;

var text_width = 210;

draw_text_ext_simple(name_x, name_y, animal.name, 32, text_width, c_black)

var text = found ? animal.desc : animal.hint;

var text_y = name_y + 48;
draw_text_ext_simple(name_x, text_y, text, 32, text_width, c_black)

draw_set_halign(fa_center)
draw_set_valign(fa_middle)