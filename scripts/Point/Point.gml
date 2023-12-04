
function Point(_x, _y) constructor {
	x = _x
	y = _y


	#region Math

		/// @pure
		/// Returns a new point with the other point added
		static plus = function(point) {
			return new Point(x + point.x, y + point.y)
		}
		
		/// @pure
		static minus = function(point) {
			return new Point(x - point.x, y - point.y);
		}
		/// @pure
		static distance_to = function(point) {
			return point_distance(x, y, point.x, point.y)
		}
		/// @pure
		static cross = function(point) {
			return (x * point.y) - (y * point.x)
		}
		/// @pure
		static length = function() {
			return point_distance(0, 0, x, y)
		}
		/// @pure
		static dir = function() {
			return point_direction(0, 0, x, y)
		}
		

	#endregion

	#region Vector Conversion

		///// Returns a vector with this point as the end point and 0, 0 as the origin
		//static to_vector = function() {
		//	return new Vector(0, 0, x, y)
		//}
		///// Takes a point and makes a vector with the two points as endpoints.
		///// This point is A and the given point is B.
		//static to_segment = function(point) {
		//	var n = new Vector(x, y, point.x, point.y)
		//	return n
		//}
		//static to_segment_p = function(_x, _y) {
		//	return new Vector(x, y, _x, _y)
		//}

	#endregion

	/// @param {Struct.Vector} vec
	static projected_on = function(vec) {
		var l = vec.length(),
			p = vec.absolute(),
			q = self.minus(vec.a);
		return vec.interp(clamp(dot_product(p.x/l, p.y/l, q.x/l, q.y/l), 0, 1))
	}

	static blend = function(point, t) {
		return new Point(lerp(x, point.x, t), lerp(y, point.y, t))
	}


	static draw = function(radius = 4, color = c_black, outline = false) {
		draw_circle_color(x, y, radius, color, color, outline)
	}

}