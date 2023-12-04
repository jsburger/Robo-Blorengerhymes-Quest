/*
function Vector(x1, y1, x2, y2) constructor {
	a = new Point(x1, y1)
	b = new Point(x2, y2)

	__absolute = -1
	__midpoint = undefined

	static length = function() {
		return point_distance(a.x, a.y, b.x, b.y)
	}
	static dir = function() {
		return point_direction(a.x, a.y, b.x, b.y)
	}

	/// Return B relative to A.
	function absolute() {
		if __absolute == -1 {
			__absolute = b.minus(a)
		}
		return __absolute;
	}

	/// @param {Struct.Vector} vec
	function dot(vec) {
		var _a = absolute(), _b = vec.absolute();
		return dot_product(_a.x, _a.y, _b.x, _b.y)
	}

	/// @param {Struct.Vector} vec
	/// Projects this vector's endpoint (relative to its starting point) onto another vector
	/// Assumes that the vectors start at the same position. Idk how you'd do a projection otherwise.
	function projected_on(vec) {
		var l = vec.length(),
			p = vec.absolute(),
			q = absolute();
		return vec.interp(clamp(dot_product(p.x/l, p.y/l, q.x/l, q.y/l), 0, 1));
	}


	/// Assumes that the point is aligned with the segments direction.
	function contains_point(point) {
		var p = absolute(),
			q = point.minus(a);
		if p.cross(q) != 0 return false

		var dd = dot_product(p.x, p.y, p.x, p.y),
			pd = dot_product(p.x, p.y, q.x, q.y);

		if (dd == pd) || (pd > 0 && pd < dd) {
			return true
		}
		return false;


		//var l = length(),
		//	p = absolute(),
		//	q = point.minus(a),
		//	_c = dot_product(p.x/l, p.y/l, q.x/l, q.y/l);
		//return (_c >= 0 && _c <= 1)
	}

	/// @param {Struct.Vector} vec
	function is_aligned_with(vec) {
		var p = absolute(),
			q = vec.absolute();
		return abs(dot_product_normalized(p.x, p.y, q.x, q.y)) == 1
	}

	/// @param {Struct.Vector} vec
	function get_intersection(vec) {
		//if !is_aligned_with(vec) return undefined
		var p1 = -1;
		if contains_point(vec.a) {
			p1 = vec.a;
		}
		if vec.contains_point(a) {
			if (p1 != -1) {
				return p1.to_segment(a)
			}
			else p1 = a
		}
		if contains_point(vec.b) {
			if (p1 != -1) {
				return p1.to_segment(vec.b)
			}
			else p1 = vec.b
		}
		if p1 == -1 return undefined
		if vec.contains_point(b) {
			return p1.to_segment(b)
		}

		return undefined;
	}

	/// @returns {Struct.Point}
	function interp(t) {
		return new Point(lerp(a.x, b.x, t), lerp(a.y, b.y, t))
	}

	/// @returns {Struct.Point}
	static midpoint = function() {
		if __midpoint == undefined {
			__midpoint = interp(.5)
		}
		return __midpoint
	}


	static draw = function(thickness = 2, color = c_black, color2 = color) {
		draw_line_width_color(a.x, a.y, b.x, b.y, thickness, color, color2)
	}
}

/// @param {Real} _x
/// @param {Real} _y
/// @param {Struct.Vector} vector
function nearest_point_on_segment(_x, _y, vector) {
	return nearest_point_between(_x, _y, vector.a.x, vector.a.y, vector.b.x, vector.b.y);
}

*/

function nearest_point_between(_x, _y, x1, y1, x2, y2) {
	var l = point_distance(x1, y1, x2, y2),
		ax = _x - x1,
		ay = _y - y1,
		bx = x2 - x1,
		by = y2 - y1,
		dot = clamp(dot_product(ax/l, ay/l, bx/l, by/l), 0, 1);
	return new Point(lerp(x1, x2, dot), lerp(y1, y2, dot))
}
