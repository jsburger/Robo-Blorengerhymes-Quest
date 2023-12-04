/// @description Manage held instance
game_object_exit

if (held_height != held_height_max) {
	held_height += (held_height_max / held_rise_time)
}

if !instance_exists(holder) {
	is_held = false
}

if is_held {
	held_time += 1
	z = holder.z + held_height
	zspeed = 0
	
	if (tracks) {
		var dir = round((holder.facing/45) - 2) * 45,
			xoff = lengthdir_x(22, dir),
			yoff = lengthdir_y(0, dir);
		x = holder.x + holder.hspeed + xoff
		y = holder.y + holder.vspeed + yoff
	}
}

if instance_exists(instance) {
	instance.z = instance_z + z + (instance.bbox_bottom - instance.y)
	instance.x = x
	instance.y = y
	
	instance.is_held = is_held;
	instance.is_thrown = is_thrown;
}
else {
	instance_destroy()
	exit
}

if !is_held {
	if z <= zmin {
		instance.on_throw_land();
		release()
	}
}