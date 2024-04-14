/// Returns a random entry from an array
function array_random(Array){
	if !array_length(Array) return undefined;
	return Array[irandom(array_length(Array)-1)];
}

/// Returns a new shallow copy of the given array
function array_clone(array) {
	var a = [];
	array_copy(a, 0, array, 0, array_length(array))
	return a;
}

/// Returns the index of an item if it is in an array
function array_find(array, item) {
	for (var i = 0, l = array_length(array); i < l; i++) {
		if array[i] == item {
			return i
		}
	}
	return -1
}

/// @param {Array<Any>} array
/// @param {Function, String} mapper Function that returns a number, or a string to sort by variable
/// @desc Retuns a new array, sorted in ascending order after being mapped by the given function.
function array_mapped_sort(array, mapper, ascending = true) {
	static sorting_grid = ds_grid_create(2, 10);
	var l = array_length(array);
	ds_grid_resize(sorting_grid, 2, l);
	if is_string(mapper) {
		for(var i = 0; i < l; i++) {
			ds_grid_set(sorting_grid, 0, i, array[i])
			ds_grid_set(sorting_grid, 1, i, variable_instance_get(array[i], mapper))
		}
	}
	else {
		for(var i = 0; i < l; i++) {
			ds_grid_set(sorting_grid, 0, i, array[i])
			ds_grid_set(sorting_grid, 1, i, mapper(array[i]))
		}
	}
	
	ds_grid_sort(sorting_grid, 1, ascending)
	
	var a = array_create(l);
	for(var i = 0; i < l; i++) {
		a[i] = ds_grid_get(sorting_grid, 0, i)
	}
	return a
}


/// @param {Array<Array>} array Array of [Item, Value]
/// @description Returns the item with the least value
/// @returns {Any, Undefined}
function array_least(array) {
	var l = array_length(array);
	if l <= 0 return undefined;
	var least = array[0][0],
		_min = array[0][1];
	for (var i = 1; i < l; i++) {
		if array[i][1] < _min { 
			_min = array[i][1]
			least = array[i][0]
		}
	}
	return least;
}

/// @param {Array<Array>} array Array of [Item, Value]
/// @description Returns the item with the most value
/// @returns {Any, Undefined}
function array_most(array) {
	var l = array_length(array);
	if l <= 0 return undefined;
	var most = array[0][0],
		_max = array[0][1];
	for (var i = 1; i < l; i++) {
		if array[i][1] > _max { 
			_max = array[i][1]
			most = array[i][0]
		}
	}
	return most;
}

/// @param {Array} instances Array of instances
/// @param {Function, String} mapping Function that returns a number, or a string to sort by variable
/// @returns {Any, Undefined}
function array_least_mapped(instances, mapping) {
	var length = array_length(instances);
	//if length == 0 {
	//	//Crash the game instead of returning undefined to reduce unexpected behavior.
	//	return instances[0]
	//}
	var least = undefined,
		_min = infinity;
	if is_string(mapping) {
		for (var i = 0; i < length; i++) {
			var value = variable_instance_defget(instances[i], mapping, infinity);
			if (value < _min) {
				least = instances[i]
				_min = value
			}
		}
	}
	else {
		for (var i = 0; i < length; i++) {
			var value = mapping(instances[i]);
			if (value < _min) {
				least = instances[i]
				_min = value
			}
		}
	}
	return least
}

/// Returns default_value if value is undefined. Otherwise returns value
function default_to(value, default_value) {
	return is_undefined(value) ? default_value : value;
}

/// Draws the visible portion of a room sized surface to screen (World Space)
function draw_surface_cropped(surface, col = c_white, alpha = 1) {
	draw_surface_part_ext(surface, camera_x, camera_y, camera_width, camera_height, camera_x, camera_y, 1, 1, col, alpha)
}

/// Draws a solid rectangle with color and alpha
function draw_rectangle_simple(x1, y1, x2, y2, color = c_white, alpha = 1) {
	var a = draw_get_alpha();
	if alpha != a draw_set_alpha(alpha)
	draw_rectangle_color(x1, y1, x2, y2, color, color, color, color, false)
	if alpha != a draw_set_alpha(a)
}

/// Draws a solid rectangle with color and alpha, using width and height instead of two points.
function draw_rectangle_simple_wh(x1, y1, width, height, color = c_white, alpha = 1) {
	draw_rectangle_simple(x1, y1, x1 + width, y1 + height, color, alpha)
}

/// Draw_sprite_ext but with color and alpha
function draw_sprite_color(sprite, index, _x, _y, color, alpha = 1) {
	draw_sprite_ext(sprite, index, _x, _y, 1, 1, 0, color, alpha)
}

/// Draw_sprite_ext but with only scale
function draw_sprite_scaled(sprite, index, _x, _y, xscale, yscale) {
	draw_sprite_ext(sprite, index, _x, _y, xscale, yscale, 0, c_white, 1)
}

// Draws the outline of a sprite:
function draw_outline(SpriteIndex, ImageIndex, X, Y, OutlineWidth, OutlineColor){
	gpu_set_fog(1, OutlineColor, 0, 0);
	draw_sprite(SpriteIndex, ImageIndex, X + OutlineWidth, Y);
	draw_sprite(SpriteIndex, ImageIndex, X - OutlineWidth, Y);
	draw_sprite(SpriteIndex, ImageIndex, X, Y + OutlineWidth);
	draw_sprite(SpriteIndex, ImageIndex, X, Y - OutlineWidth);
	gpu_set_fog(0, c_white, 0, 0);
}

// Use this if you dont care about draw order:
function instance_create(X, Y, Object){
	return instance_create_layer(X, Y, "Instances", Object);
}

// Pluralizes a string:
function string_pluralize(String){
	var s1 = string_char_at(String, string_length(String)), s2 = string_copy(String, string_length(String)-2, 2), _done = false;
	switch s2{
		case "ay": case "ey": case "iy": case "oy": case "uy":
			String = String + "s";
			_done = true;
			break;
		case "fe":
			String = string_copy(String, 0, string_length(String)-2) + "ves";
			_done = true;
			break;
		case "ss": case "sh": case "ch":
			String = String + "es";
			_done = true;
			break;
		case "es":
			_done = true;
	}		
	if !_done switch s1{
		case "y":
			String = string_copy(String, 0, string_length(String)-1) + "ies";
			break;
		case "s": case "x": case "z":
			String = String + "es";
			break;
		default:
			String = String + "s";
			break;
	}
	return String;
}
// Is this point currently displayed on screen:
function point_seen(X, Y){
	var d = view_camera[0];
	return (X >= camera_get_view_x(d)
	       && X <= camera_get_view_x(d)+camera_get_view_width(d)
		   && Y >= camera_get_view_y(d)
		   && Y <= camera_get_view_y(d)+camera_get_view_height(d));
}
// Is this instance currently displayed on screen:
function instance_seen(Inst){
	var _c = view_camera[0];
	return (Inst.bbox_right  >= camera_get_view_x(_c)
	       && Inst.bbox_left   <= camera_get_view_x(_c) + camera_get_view_width(_c)
		   && Inst.bbox_top    >= camera_get_view_y(_c)
		   && Inst.bbox_bottom <= camera_get_view_y(_c) + camera_get_view_height(_c));
}