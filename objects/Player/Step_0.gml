/// @description 
game_object_exit

#region Controls

	if (can_walk.get()) {
		var _x = button_check(inputs.right) - button_check(inputs.left),
			_y = button_check(inputs.down) - button_check(inputs.up);
		if (_x != 0 || _y != 0) {
			motion_add(point_direction(0, 0, _x, _y), acceleration + friction)
		}
	}
	
	speed = clamp(speed, -maxspeed.get(), maxspeed.get())
	
	if button_pressed(inputs.attack) {
		attack_buffer = attack_buffer_max
	}
	else {
		if attack_buffer > 0 {
			attack_buffer -= 1;
		}
	}
	
	if (action_cooldown <= 0) {
		// Attack
		if (can_attack && attack_buffer > 0) {
			state_change(PlayerStates.ATTACKING)
			set_sprite(ps.PUNCH_START)
			action_cooldown = 10
		}
		// Grabbing and Throwing
		if (can_grab && button_pressed(inputs.pickup)) {
			// Throw instance
			if instance_exists(grabbed_instance) {
				set_sprite(ps.THROW)
				//Throw instance
				with grab_instance_throw(self, grabbed_instance) {
					motion_add(other.facing, other.thrown_object_speed)
				}
				grabbed_instance = noone
				speed = 0
			}
			else {				
				//Pick up instance
				var grabbables = array_filter(instance_place_mask_list(mskGrab, x, y, GameObject, facing),
					function (inst) {
						return inst.is_grabbable()
					});
				var target = noone;
				if array_length(grabbables) > 0 {
					target = array_least_mapped(grabbables,
						function(inst) {
							return point_distance(x, y, inst.x, inst.y)
						})
				}
				if instance_exists(target) {
					grabbed_instance = grab_instance(self, target)
					grabbed_instance.held_height_max = carry_height
					set_sprite(ps.PICKUP)
					state_change(PlayerStates.HOLDING)
					
					walk_modifier.set(false) //Gets reset later using animation
					speed = 0
					action_cooldown = 2 spriteframes
				}
				
			}
			
		}
	}
	else {
		action_cooldown -= 1
	}
	
	if (state == PlayerStates.ATTACKING) {
		attack_time += 1
		if attack_time > attack_startup && !button_check(inputs.attack) {
			if sprite_state == ps.PUNCH_START {
				image_index = image_number
			}
		}
		if attack_time > attack_min_charge && ((attack_time mod 15) == 0) {
			walk_modifier.set(true)
			maxspeed.modify_for(15).multiply(.5)
			if z == zmin {
				zspeed = 3
			}
		}
	}
	
	if (state == PlayerStates.HOLDING && sprite_state != ps.THROW) {
		if !instance_exists(grabbed_instance) {
			state_change(PlayerStates.IDLE)
		}
	}

#endregion

#region Push logic
	if push_cancel > 0 {
		push_cancel -= 1;
		if push_cancel <= 0 {
			push_time = 0
		}
	}
#endregion

#region Control sprite, this should probably go last
	if (speed == 0) {
		if (sprite_state == ps.WALK) {
			set_sprite(ps.IDLE)
		}
		else if (sprite_state == ps.HOLD_WALK) {
			set_sprite(ps.HOLD)
		}
	}
	if (can_walk.get() && speed > 0) {
		if (sprite_state == ps.IDLE) {
			set_sprite(ps.WALK)
		}
		else if (sprite_state == ps.HOLD) {
			set_sprite(ps.HOLD_WALK)
		}
	}
	update_sprite()
	
#endregion