/// @description 
game_object_exit
if contact_damage > 0 {
	if melee_can_hit(self, other) {
		melee_hit(self, other, contact_damage, point_direction(x, y, other.x, other.y), 6)
	}
}

