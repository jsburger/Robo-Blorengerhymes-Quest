/// @description 
game_object_exit

if chase_time > 0 && can_walk.get() {
	chase_time -= 1;
	motion_add(point_direction(x, y, Player.x, Player.y), acceleration + friction)
}

speed = clamp(speed, -maxspeed.get(), maxspeed.get())

if (speed > 0 && can_walk.get()) {
	if spr_draw == spr_idle {
		set_sprite(spr_walk)
	}
}
if (spr_draw == spr_walk && speed <= 0) {
	set_sprite(spr_idle)
}

