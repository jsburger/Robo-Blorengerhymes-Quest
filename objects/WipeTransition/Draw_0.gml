/// @description 

var screensize = point_distance(0, 0, camera_width, camera_height),
	sx = camera_width/screensize,
	sy = camera_height/screensize,
	length = screensize * dot_product(sx, sy, lengthdir_x(1, image_angle), lengthdir_y(1, image_angle));
if abs(angle_difference(image_angle, point_direction(0, 0, sx, sy))) > 90 length *= -1
var _x = camera_x + lengthdir_x(length * (1 - progress), image_angle),
	_y = camera_y + lengthdir_y(length * (1 - progress), image_angle);
	

draw_surface(_GameCapture.current_surface, _x, _y)
draw_surface(surface, _x - lengthdir_x(length, image_angle), _y - lengthdir_y(length, image_angle))

