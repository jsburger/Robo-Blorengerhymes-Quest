/// @description 
// Inherit the parent event
event_inherited();
#region Generic
	set_shadow(shdPlayer)
	team = TEAMS.PLAYER
#endregion

#region Movement
	maxspeed = new Modifiable(5);
	acceleration = .3;
	friction = .5;
#endregion

#region Actions
	grabbed_instance = noone;

	action_cooldown = 0;
	
	attack_time = 0;
	attack_startup = 5;
	attack_min_charge = 15;
	attack_buffer_max = 5;
	attack_buffer = 0;
	
	thrown_object_speed = 24;
	carry_height = 40;
#endregion

#region Pushing Blocks
	push_time = 0
	push_cancel = 0;
	push_time_max = 20
	
	/// @param {Struct.CollisionInfo} info
	on_wall = function(info) {
		if info.is_instance {
			if instance_is(info.instance, PushBlock) {
				if (side_is_horizontal(info.side) && abs(hspeed) > abs(vspeed))
					|| (side_is_vertical(info.side) && abs(vspeed) > abs(hspeed)) {
					push_cancel = 5;
					push_time += 1;
					if push_time >= push_time_max {
						var p = info.instance.try_push(info.side)
						if p {
							push_time = 0
							return EVENT.PROCEED
						}
					}
					return EVENT.CANCEL //Prevents collision from stopping player
				}
			}
		}
		return EVENT.PROCEED
	}
#endregion

#region Combat
	hitme_init(4)
	contact_damage = 0;
	
	attack_damage = 1;
	attack_force = 4;
	attack_rebound = 4; //Knockback received after hitting something, pushes robo backwards
	attack_mask = mskPlayerPunch
#endregion

#region Sprites
	sprite_state = ps.IDLE;
	facing = direction;
	
	function set_sprite(new_state) {
		if (new_state != sprite_state) {
			sprite_state = new_state;
			image_index = 0;
		}
		update_sprite()
	}
	
	update_sprite = function() {	
		var sprite = global.playersprites[sprite_state];
		
		if (can_turn && speed > 0) {
			facing = direction
		}
		sprite_index = sprite.get_sprite(facing)
		flip = sprite.get_flip(facing)
		
	}
	
	
#endregion

#region State Machine
	enum PlayerStates {
		IDLE,
		KNOCKED_BACK,
		ATTACKING,
		HOLDING
	}
	state = PlayerStates.IDLE;
	
	can_grab = true; //Can pick up and throw items
	can_attack = true; //Can initiate attacks
	// can_walk = true; //Can control movement, Intialized in hitme
	can_turn = true; //Automatically updates facing to be direction
	
	walk_modifier = can_walk.modify().pass() //Used to disable walking by abilities
	
	function state_change(to_state) {
		if state != to_state {
			state_leave(state)
			state_enter(to_state)
		}
	}
	#region State changes
		state_enter = function(state) {
			switch state {
				case(PlayerStates.IDLE):
					can_grab = true;
					can_attack = true;
					walk_modifier.set(true);
					can_turn = true;
					set_sprite(ps.IDLE)
					break
				case(PlayerStates.KNOCKED_BACK):
					can_grab = false;
					can_attack = false;
					walk_modifier.set(false)
					can_turn = false;
					set_sprite(ps.KNOCKBACK)
					break
				case(PlayerStates.ATTACKING):
					can_grab = false;
					can_attack = true;
					walk_modifier.set(false)
					can_turn = false;
					break
				case(PlayerStates.HOLDING):
					can_grab = true;
					can_attack = false;
					walk_modifier.set(false)
					can_turn = true;
					break
			}
			self.state = state
		}
		state_leave = function(state) {
			switch state {
				case(PlayerStates.IDLE):
					break
				case(PlayerStates.KNOCKED_BACK):
					break
				case(PlayerStates.ATTACKING):
					attack_time = 0
					break
				case(PlayerStates.HOLDING):
				//if holding something, drop it
					break
			}
		}
	#endregion
	
	
#endregion

