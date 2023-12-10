/// @description 
// Inherit the parent event
event_inherited();

#region Generic
	team = TEAMS.ENEMY
#endregion

#region Sprites
	
	spr_idle = sprite_index
	spr_draw = spr_idle
	spr_walk = undefined
	spr_hurt = undefined
	
	function setup_sprites(sprite_struct) {
		vars_apply(sprite_struct) // I'll add directional filters later
		spr_draw = spr_idle
	}
	function set_sprite(spr, force = false) {
		if spr == undefined exit
		if (spr_draw != spr || force) {
			spr_draw = spr
			image_index = 0
		}
		update_sprite()
	}
	
	can_flip = true
	update_sprite = function() {
		if sprite_index != spr_draw {
			sprite_index = spr_draw
		}
		
		if can_flip && abs(hspeed) > .3 {
			flip = sign(hspeed)
		}
	}
	
	/// Given spr_draw, can spr_hurt replace this animation?
	hurt_can_override = function(sprite) {
		switch (sprite) {
			case spr_idle:
			case spr_walk:
			case spr_hurt:
				return true;
			default:
				return false;
		}
	}
	
	on_hurt = function(source) {
		if hurt_can_override(spr_draw) && spr_hurt != undefined {
			set_sprite(spr_hurt, true)
		}
	}
	
#endregion

#region Behavior
	maxspeed = new Modifiable(4);
	acceleration = .5;
	friction = .3;
	
	chase_time = 0;

#endregion