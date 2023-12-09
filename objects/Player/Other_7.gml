/// @description 
switch (sprite_state) {
	case (ps.PUNCH_START):
		if !button_check(inputs.attack) {
			walk_modifier.set(false)
			set_sprite(ps.PUNCH)
			var launch = 5;
			if attack_time > attack_min_charge {
				launch = 20
				maxspeed.modify_for(10).set(launch)
			}
			attack_time = 0
			motion_add(round(facing/45) * 45, launch)
		}
		break
	case(ps.PICKUP):
		set_sprite(ps.HOLD)
		walk_modifier.set(true)
		break
	case(ps.PUNCH):
	case(ps.THROW):
		state_change(PlayerStates.IDLE)
		break
	case(ps.HURT):
		set_sprite(ps.IDLE)
		break
	default:
		break
}

