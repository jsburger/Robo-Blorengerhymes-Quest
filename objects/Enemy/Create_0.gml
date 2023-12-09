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
	function set_sprite(spr) {
		if spr_draw != spr {
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
	
#endregion