// Feather disable GM2023
enum COLLISIONS {
	HIGH,
	LOW,
	WALKING
}

function collision_type_collides_with_tile(collision_type, tiletype) {
	switch collision_type {
		case COLLISIONS.LOW:
			return (tiletype == TILETYPE.WALL || tiletype == TILETYPE.LOW_WALL)
		case COLLISIONS.HIGH:
			return tiletype == TILETYPE.WALL;
		case COLLISIONS.WALKING:
			return tiletype > TILETYPE.NONE
	}
}

function collision_type_needs_instance(collision_type) {
	static values = [false, true, true];
	return values[collision_type]
}

function CollisionInfo() constructor {
	is_tile = false;
	is_instance = false;
	tile = -1;
	instance = noone;
	side = SIDE.LEFT;
	
	/// @ignore
	/// @returns {Struct.CollisionInfo}
	static set_tile = function(_tile) {
		is_tile = true;
		tile = _tile
		return self
	}
	/// @ignore
	/// @returns {Struct.CollisionInfo}
	static set_instance = function(_instance) {
		instance = _instance
		is_instance = true;
		return self;
	}
}

/// Checks the collision tileset for colliding tiles
function collision_at(type) {
	static last_room = undefined;
	static tilemap = undefined;
	if (last_room != room) {
		last_room = room
		tilemap = layer_tilemap_get_id("Collision");
	}
	
	if collision_type_needs_instance(type) {
		if place_meeting(x, y, global.solids.contents) return true
	}
	if place_meeting(x, y, tilemap) {
		var _x = bbox_left, _y = bbox_top;
		repeat(ceil((bbox_right - bbox_left)/TileWidth)) {
			repeat(ceil((bbox_bottom - bbox_top)/TileWidth)) {
				if collision_type_collides_with_tile(type, tile_get_type(getTileAt(_x, _y))) return true
				_y += TileWidth
				_y = min(bbox_bottom, _y)
			}
			_x += TileWidth
			_x = min(bbox_right, _x)
		}
	}
	return false
}

/// @self GameObject
function doWallCollision(type = COLLISIONS.LOW) {
	#macro TileWidth 64
	
	#region broken new code :(
	//if (speed != 0) {
	//	var collider = instance_polygon(self)
	//	for (var _x = bbox_left; true; _x += TileWidth) {
	//		_x = min(_x, bbox_right)
			
	//		for (var _y = bbox_top; true; _y += TileWidth) {
	//			_y = min(_y, bbox_bottom)
				
	//			var cx = (_x div TileWidth) * TileWidth,
	//				cy = (_y div TileWidth) * TileWidth;
					
	//			if check(_x, _y) {
	//				//trace(1)
	//				var shape = tile_get_collision_shape(getTileAt(_x, _y));
	//				if (shape != undefined) {
	//					shape.translate_to((_x div TileWidth) * TileWidth, (_y div TileWidth) * TileWidth)
	//					//shape.draw(1, c_red)
	//					collision_test_3(collider, shape);
	//					if (collider.translation_x != 0 || collider.translation_y != 0) {
	//						x += collider.translation_x
	//						y += collider.translation_y
	//						_x += collider.translation_x
	//						_y += collider.translation_y
	//						motion_add(point_direction(0, 0, collider.translation_x, collider.translation_y), point_distance(0, 0, collider.translation_x, collider.translation_y)/2)
	//						collider.translation_x = 0
	//						collider.translation_y = 0
	//					}
	//				}
	//			}
	//			//draw_rectangle(cx, cy, cx + TileWidth, cy + TileWidth, true)
	//			//draw_text(cx, cy, string(tile_get_type(getTileAt(_x, _y))))
				
	//			if (_y >= bbox_bottom) break;
	//		}
	//		if (_x >= bbox_right) break;
	//	}
		
	//	delete collider
	//}
	#endregion
	
	#region old code that works :)
	
	if (hspeed != 0) {
		var xValue = hspeed > 0 ? bbox_right : bbox_left,
			moveTo = 0,
			collisionInfo = undefined;
		//Instance collision
		if collision_type_needs_instance(type) {
			var inst = collision_rectangle(xValue + hspeed, bbox_top + 1, xValue + 1 + hspeed, bbox_bottom - 1, global.solids.contents, true, true);
			//var inst = instance_place(x, y, global.solids.contents);
			if instance_exists(inst) && inst.active.get() {
				collisionInfo = new CollisionInfo().set_instance(inst)
				moveTo = hspeed > 0 ? inst.bbox_left : inst.bbox_right;
			}
		}
		//Tile Collision
		var tileOffset = hspeed > 0 ? 0 : 1;
		for (var i = bbox_top + 1; true; i += TileWidth) {
			var yCheck = clamp(i, bbox_top + 1, bbox_bottom - 1),
				xCheck = xValue + hspeed,
				tile = tile_get_type(getTileAt(xCheck, yCheck));
			
			if (collision_type_collides_with_tile(type, tile)) {
				var temp = ((xCheck div TileWidth) + tileOffset) * TileWidth,
					pass = true;
				if collisionInfo != undefined {
					if hspeed > 0 {
						pass = temp > moveTo
					}
					else {
						pass = temp < moveTo
					}
				}
				if pass {
					moveTo = temp
					collisionInfo = new CollisionInfo().set_tile(tile)
				}
				break
			}
			if i >= bbox_bottom - 1 break
		}
		
		if collisionInfo != undefined {
			var dif = abs(x - xprevious) * 2
			x += clamp(moveTo - xValue, -dif, dif)
			collisionInfo.side = hspeed > 0 ? SIDE.LEFT : SIDE.RIGHT
			if on_wall(collisionInfo) != EVENT.CANCEL {
				hspeed = 0
			}
		}
		
	}
	
	if (vspeed != 0) {
		var yValue = vspeed > 0 ? bbox_bottom : bbox_top,
			moveTo = 0,
			collisionInfo = undefined;
		
		//Instance collision
		if collision_type_needs_instance(type) {
			var inst = collision_rectangle(bbox_left + 1, yValue + vspeed, bbox_right - 1, yValue + 1 + vspeed, global.solids.contents, true, true);
			if instance_exists(inst) && inst.active.get() {
				collisionInfo = new CollisionInfo().set_instance(inst)
				moveTo = vspeed > 0 ? inst.bbox_top : inst.bbox_bottom;
			}
		}
		//Tile Collision
		var tileOffset = vspeed > 0 ? 0 : 1;
		for (var i = bbox_left + 1; true; i += TileWidth) {
			var xCheck = clamp(i, bbox_left + 1, bbox_right - 1),
				yCheck = yValue + vspeed,
				tile = tile_get_type(getTileAt(xCheck, yCheck));
			
			if (collision_type_collides_with_tile(type, tile)) {
				var temp = ((yCheck div TileWidth) + tileOffset) * TileWidth,
					pass = true;
				if collisionInfo != undefined {
					if vspeed > 0 {
						pass = temp > moveTo
					}
					else {
						pass = temp < moveTo
					}
				}
				if pass {
					moveTo = temp
					collisionInfo = new CollisionInfo().set_tile(tile)
				}
				break
			}
			if i >= bbox_right - 1 break
		}
		
		if collisionInfo != undefined {
			var dif = abs(yprevious - y) * 2;
			y += clamp(moveTo - yValue, -dif, dif)
			collisionInfo.side = vspeed > 0 ? SIDE.TOP : SIDE.BOTTOM
			if on_wall(collisionInfo) != EVENT.CANCEL {
				vspeed = 0
			}
		}
	}
	
	#endregion
}
#region Sides
enum SIDE {
	LEFT,
	TOP,
	RIGHT,
	BOTTOM
}

function side_is_horizontal(side) {
	return (side % 2) == 0
}

function side_is_vertical(side) {
	return !side_is_horizontal(side)
}
/// @param {enum.SIDE} side
function side_get_direction(side) {
	static dirs = [180, 90, 0, 270];
	return dirs[side]
}

function side_get_opposite(side) {
	return (side + 2) mod 4
}

#endregion
#region Tile stuff
function getTileAt(x, y) {
	static last_room = undefined;
	static tilemap = undefined;
	if (last_room != room) {
		last_room = room
		tilemap = layer_tilemap_get_id("Collision");
	}
	return tilemap_get_at_pixel(tilemap, x, y)
}

enum TILETYPE {
	NONE,
	PIT,
	RESERVED0,
	RESERVED1,
	RESERVED2,
	// Shaped tiles start here
	WALL,
	LOW_WALL
}

enum TILESHAPE {
	FULL,
	DOWN_LEFT,
	DOWN_RIGHT,
	UP_RIGHT,
	UP_LEFT,
	
	_max
}

function tile_get_shape(tile) {
	if (tile == 0) return undefined;
	if (tile < TILESHAPE._max) {
		return TILESHAPE.FULL
	}
	return tile % TILESHAPE._max
}

function tile_get_type(tile) {
	if (tile < TILESHAPE._max) {
		return tile;
	}
	return (tile div TILESHAPE._max) + TILESHAPE._max - 1
}

function tile_get_collision_shape(tile) {
	static shapes = memoize_array(TILESHAPE._max, function(shape) {
		var	p = function(_x, _y) { return new Point(_x * TileWidth, _y * TileWidth) };
		switch(shape) {
			case (TILESHAPE.FULL):
				return new Polygon(p(0, 0), p(0, 1), p(1, 1), p(1, 0))
			case (TILESHAPE.DOWN_LEFT):
				return new Polygon(p(0, 0), p(0, 1), p(1, 1))
			case (TILESHAPE.DOWN_RIGHT):
				return new Polygon(p(0, 1), p(1, 1), p(1, 0))
			case (TILESHAPE.UP_RIGHT):
				return new Polygon(p(0, 0), p(1, 1), p(1, 0))
			case (TILESHAPE.UP_LEFT):
				return new Polygon(p(0, 0), p(0, 1), p(1, 0))
		}
	})
	var shape = tile_get_shape(tile);
	if (shape != undefined) return shapes[shape];
	return undefined;
}
#endregion

#region old collision functions that dont work
/// @param {Struct.Polygon} collider Instance polygon
/// @param {Struct.Polygon} geometry Level Geometry polygon
function collision_test(collider, geometry) {
	
	var poly1 = collider,
		poly2 = geometry;
		
	for (var o = 0; o < 2; o++) {
		// Swap the polygons for a second check
		if (o == 1) {
			poly1 = geometry
			poly2 = collider
		}
		
		// Check diagonals
		for (var p = 0; p < poly1.point_count; p++) {
			var line_r1s = poly1.midpoint,
				line_r1e = poly1.points[p];
			
			var dx = 0,
				dy = 0;
			
			for (var q = 0; q < poly2.point_count; q++) {
				var line_r2s = poly2.points[q],
					line_r2e = poly2.points[(q + 1) mod poly2.point_count];
				
				var h = (line_r2e.x - line_r2s.x) * (line_r1s.y - line_r1e.y) - (line_r1s.x - line_r1e.x) * (line_r2e.y - line_r2s.y),
					t1 = ((line_r2s.y - line_r2e.y) * (line_r1s.x - line_r2s.x) + (line_r2e.x - line_r2s.x) * (line_r1s.y - line_r2s.y)) / h,
					t2 = ((line_r1s.y - line_r1e.y) * (line_r1s.x - line_r2s.x) + (line_r1e.x - line_r1s.x) * (line_r1s.y - line_r2s.y)) / h;
					
				if (t1 >= 0 && t1 < 1 && t2 >= 0 && t2 < 1) {
					dx += (1 - t1) * (line_r1e.x - line_r1s.x);
					dy += (1 - t1) * (line_r1e.y - line_r1s.y);					
				}
			}
			
			if (dx != 0 || dy != 0) {
				collider.translate(dx * (o == 0 ? -1 : 1), dy * (o == 0 ? -1 : 1))
			}
		}
	}
	
}

/// @param {Struct.Polygon} collider Instance polygon
/// @param {Struct.Polygon} geometry Level Geometry polygon
function collision_test_2(collider, geometry) {
	
	var poly1 = collider,
		poly2 = geometry,
		
		overlap = infinity;
		
	for (var o = 0; o < 2; o++) {
		// Swap the polygons for a second check
		if (o == 1) {
			poly1 = geometry
			poly2 = collider
		}
		
		// Check diagonals
		for (var a = 0; a < poly1.point_count; a++) {
			
			// Work out min and max 1D points for r1
			var b = (a + 1) % poly1.point_count,
				axisProj = {
					x: -(poly1.points[b].y - poly1.points[a].y),
					y: poly1.points[b].x - poly1.points[a].x
				},
				d = sqrt(axisProj.x * axisProj.x + axisProj.y * axisProj.y),
				min_r1 = infinity,
				max_r1 = -infinity;
			axisProj.x /= d;
			axisProj.y /= d;
			for (var p = 0; p < poly1.point_count; p++) {
				var q = (poly1.points[p].x * axisProj.x + poly1.points[p].y * axisProj.y);
				min_r1 = min(min_r1, q);
				max_r1 = max(max_r1, q);
			}
			
			// Work out min and max 1D points for r2
			var min_r2 = infinity, max_r2 = -infinity;
			for (var p = 0; p < poly2.point_count; p++) {
				var q = (poly2.points[p].x * axisProj.x + poly2.points[p].y * axisProj.y);
				min_r2 = min(min_r2, q);
				max_r2 = max(max_r2, q);
			}
			
			// Calculate actual overlap along projected axis, and store the minimum
			overlap = min(min(max_r1, max_r2) - max(min_r1, min_r2), overlap);
			
			if (!(max_r2 >= min_r1 && max_r1 >= min_r2))
				return false;
		}
	}
	// If we got here, the objects have collided, we will displace r1
	// by overlap along the vector between the two object centers
	var d = { x: geometry.midpoint.x - collider.midpoint.x, y: geometry.midpoint.y - collider.midpoint.y }
	var s = sqrt(d.x*d.x + d.y*d.y);
	collider.translate(-overlap * d.x / s, -overlap * d.x / s)
	//collider.midpoint.x -= overlap * d.x / s;
	//collider.midpoint.y -= overlap * d.y / s;
	return false;
}


/// @param {Struct.Polygon} collider Instance polygon
/// @param {Struct.Polygon} geometry Level Geometry polygon
function collision_test_3(collider, geometry) {
	
	var poly1 = collider,
		poly2 = geometry;
		
	for (var o = 0; o < 2; o++) {
		// Swap the polygons for a second check
		if (o == 1) {
			poly1 = geometry
			poly2 = collider
		}
		
		for (var p = 0; p < poly1.point_count; p++) {
			var point = poly1.points[p];
			var shouldbreak = false;

			var dx = 0,
				dy = 0;

			if poly2.contains(point.x, point.y) {
				var prev = p == 0 ? (poly1.point_count - 1) : (p - 1),
					next = (p + 1) mod poly1.point_count,
					prevpoint = poly1.points[prev],
					nextpoint = poly1.points[next];
				
				var nearest = undefined,
					dist = infinity;
				for (var q = 0; q < poly2.point_count; q++) {
					var qp = poly2.points[q],
						qnext = poly2.points[(q + 1) mod poly2.point_count];
					
					
					for (var n = 0; n <= 1; n++) {
						var int = intersection(point, n == 0 ? prevpoint : nextpoint, qp, qnext);
						if int != undefined {
							//var test = nearest_point_between(point.x, point.y, qp.x, qp.y, qnext.x, qnext.y);
							var test = int;
							var _d = point_distance(point.x, point.y, test.x, test.y)
							if _d < dist && (_d > 0) {
								nearest = test
								dist = _d
							}
							
						}
					}
				}
				if nearest != undefined {
					dx += (nearest.x - point.x) * (o == 0 ? 1 : -1)
					dy += (nearest.y - point.y) * (o == 0 ? 1 : -1)
					//shouldbreak = true
				}
			}
			collider.translate(dx, dy)
			if shouldbreak break
		}
	}
}

#endregion

#region Misc point functions

/// @param {Struct.Point} a1
/// @param {Struct.Point} a2
/// @param {Struct.Point} b1
/// @param {Struct.Point} b2
function segment_bbox_check(a1, a2, b1, b2) {
	var aleft  = min(a1.x, a2.x),
		aright = max(a1.x, a2.x),
		atop   = min(a1.y, a2.y),
		abot   = max(a1.y, a2.y),
		bleft  = min(b1.x, b2.x),
		bright = max(b1.x, b2.x),
		btop   = min(b1.y, b2.y),
		bbot   = max(b1.y, b2.y);
	return (bright >= aleft && bleft <= aright)
		&& (btop <= abot && bbot >= atop);
}

/// @param {Struct.Point} a1
/// @param {Struct.Point} a2
/// @param {Struct.Point} b1
/// @param {Struct.Point} b2
/// @returns {Struct.Point, Undefined}
function segment_intersection(a1, a2, b1, b2) {
	if !segment_bbox_check(a1, a2, b1, b2) return undefined;
	
	var  h =  (b2.x - b1.x) * (a1.y - a2.y) - (a1.x - a2.x) * (b2.y - b1.y);
		//if h == 0 return a1.blend(a2, .5)
	var	t1 = ((b1.y - b2.y) * (a1.x - b1.x) + (b2.x - b1.x) * (a1.y - b1.y)) / h,
		t2 = ((a1.y - a2.y) * (a1.x - b1.x) + (a2.x - a1.x) * (a1.y - b1.y)) / h;
	
	if (t1 >= 0 && t1 < 1 && t2 >= 0 && t2 < 1) {
		return new Point(
			a1.x + (t1) * (a2.x - a1.x),
			a1.y + (t1) * (a2.y - a1.y)
		)
	}
	return undefined
}
#endregion