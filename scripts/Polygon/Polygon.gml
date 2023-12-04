
/// @param [{Struct.Point}]
function Polygon() constructor {
	var args;
	if is_array(argument[0]) {
		args = argument[0]
	}
	else {
		arguments_pack
	}
	points = args;
	point_count = array_length(args)
	midpoint = new Point(0, 0)
	
	var xref = variable_get_hash("x"),
		yref = variable_get_hash("y");
	for (var i = 0; i < point_count; i++) {
		midpoint.x += struct_get_from_hash(points[i], xref)
		midpoint.y += struct_get_from_hash(points[i], yref)
	}
	midpoint.x /= point_count;
	midpoint.y /= point_count;
	
	translation_x = 0;
	translation_y = 0;
	
	/*
	segments = array_create(point_count)
	//Connect all points together into vectors
	for (var i = 0; i < point_count; i++) {
		segments[i] = points[i].to_segment(points[(i + 1) mod point_count])
	}
	*/

	function translate(xoffset, yoffset) {
		translation_x += xoffset;
		translation_y += yoffset;
		var xref = variable_get_hash("x"),
			yref = variable_get_hash("y");
		for (var i = 0; i < point_count; i++) {
			struct_set_from_hash(points[i], xref, struct_get_from_hash(points[i], xref) + xoffset)
			struct_set_from_hash(points[i], yref, struct_get_from_hash(points[i], yref) + yoffset)
		}
		struct_set_from_hash(midpoint, xref, struct_get_from_hash(midpoint, xref) + xoffset)
		struct_set_from_hash(midpoint, yref, struct_get_from_hash(midpoint, yref) + yoffset)
	}
	
	function translate_to(xpos, ypos) {
		translate(xpos - translation_x, ypos - translation_y)
	}

	function contains(_x, _y) {
		if point_count == 4 return point_in_rectangle(_x, _y, points[0].x, points[0].y, points[2].x, points[2].y)
		return point_in_triangle(_x, _y, points[0].x, points[0].y, points[1].x, points[1].y, points[2].x, points[2].y)
	}
	
	static draw = function(thickness, color) {
		for (var i = 0; i < point_count; i++) {
			var np = points[(i + 1) mod point_count];
			draw_line_width_color(points[i].x, points[i].y, np.x, np.y, thickness, color, color)
		}
	}

}

function instance_polygon(inst) {
	//var a = [],
	//	xc = (inst.bbox_left + inst.bbox_right)/2,
	//	yc = (inst.bbox_bottom + inst.bbox_top)/2,
	//	width = (inst.bbox_right - inst.bbox_left)/2,
	//	height = (inst.bbox_bottom - inst.bbox_top)/2;
	//for (var i = 0; i < 8; i++) {
	//	array_push(a, new Point(xc + lengthdir_x(width, i * 45), yc + lengthdir_y(height, i * 45)))
	//}
	//return new Polygon(a)
	
	var l = min(inst.hspeed, 0) * 0,
		r = max(inst.hspeed, 0) * 0,
		t = min(inst.vspeed, 0) * 0,
		b = max(inst.vspeed, 0) * 0;
	var _y = (inst.bbox_top + inst.bbox_bottom)/2
	//return new Polygon(
	//	new Point(inst.x, inst.bbox_top),
	//	new Point(inst.bbox_left, _y),
	//	new Point(inst.x, inst.bbox_bottom),
	//	new Point(inst.bbox_right, _y)
	//)
	return new Polygon(
		new Point(inst.bbox_left + l, inst.bbox_top + t),
		new Point(inst.bbox_left + l, inst.bbox_bottom + b),
		new Point(inst.bbox_right + r, inst.bbox_bottom + b),
		new Point(inst.bbox_right + r, inst.bbox_top + t)
	)
}