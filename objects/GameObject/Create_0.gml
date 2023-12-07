/// @description Common variables

#region Z Axis
	z         = 0;
	zmin      = 0; // If z < zmin, increase z
	zspeed    = 0;
	zfriction = z_gravity;
	zlayer    = 0;
	canz = true; // set to false if you dont want an object to run z axis code
#endregion

#region Depth Sorting
	visible = false;
	is_visible = true; //Custom replacement for visible

	get_depth = function(Inst = self){
		return Inst.y + Inst.z -(Inst.zlayer * 100);
	}

#endregion

#region Visuals
	flash = 0
	flip = 1; // Multiply xscale by this before drawing
#endregion

#region Shadows
	has_shadow = false;
	spr_shadow = undefined;
	spr_shadow_y = 0;
	spr_shadow_x = 0;
	function set_shadow(sprite, _x = 0, _y = 0) {
		has_shadow = (sprite != undefined);
		spr_shadow = sprite;
		spr_shadow_x = _x;
		spr_shadow_y = _y;
	}
	
	shadow_layer = SHADOWMASK.ACTOR
#endregion

#region Pausing and Active
	active = new Modifiable(true);
	
	paused_vars = undefined
	paused_alarms = array_create(12, -1)
	has_paused_at_least_once = false
	
	on_pause = new CallStack(function() {
		// Save motion and animation
		paused_vars = vars_steal(global.default_vars)
		// Disable alarms
		for (var i = 0; i < 12; i++) {
			if alarm_get(i) >= 0 {
				paused_alarms[i] = alarm_get(i)
				alarm_set(i, -1)
			}
		}
	})
	on_unpause = new CallStack(function() {
		// Reapply motion
		vars_apply(paused_vars)
		// Reapply alarms
		for (var i = 0; i < 12; i++) {
			if paused_alarms[i] > -1 {
				alarm_set(i, paused_alarms[i])
			}
		}
	})
	
	active.on_change(function(activated) {
		if activated {
			if has_paused_at_least_once {
				on_unpause.call()
			}
		}
		else {
			on_pause.call()
			has_paused_at_least_once = true
		}
	})
	
	//Used to disable instances during pausing
	pause_modifier = active.modify().disable()
	
	// Called upon room start by GameCont
	setup = new CallStack();
#endregion

#region Collision
	// Controls normal collision like not going into walls or solids
	does_wall_collision = true;
	// Controls what tiles this collides with
	wall_collision_type = COLLISIONS.WALKING;
	
	// Not sure why I copied this one yet. It was in my notes though.
	is_flying = false;
	
	// Note: this can be called up to twice a frame, due to colliding with a corner
	/// Called when colliding with walls, return EVENT.CANCEL to prevent normal collision behavior.
	/// Returning PROCEED is optional.
	/// @param {Struct.CollisionInfo} info
	/// @returns {Enum.EVENT}
	on_wall = function(info) {
		return EVENT.PROCEED;
	}
#endregion

#region Grabbing
	is_grabbable = function() {
		return false;
	}
	
	is_held = false;
	is_thrown = false;
	is_hold_persistent = false;
	
	on_throw_land = function() {
		
	}
#endregion

#region Serialization
	can_serialize = false
	
	should_serialize = function() {
		return true
	}
	to_struct = function() {
		return {
			x,
			y
		}
	}
	from_struct = function(struct) {
		vars_apply(struct)
	}
#endregion