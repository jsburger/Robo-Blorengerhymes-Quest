
function melee_attack_create(_damage, _direction, _force, _mask, _creator, _tracks = true, _x = x, _y = y) {
	with instance_create_depth(_x, _y, depth, MeleeHitbox) {
		creator = _creator
		tracking = _tracks
		if tracking {
			tracking_x = _creator.x
			tracking_y = _creator.y
		}
		damage = _damage
		knockback_force = _force
		image_angle = _direction;
		
		mask_index = _mask
	}
}