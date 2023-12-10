/// @description 
game_object_exit
if instance_exists(creator) && creator.active.get() {
	if melee_can_hit(creator, other) {
		melee_hit(creator, other, damage, default_to(kb_direction, image_angle), kb_force)
	}
}

