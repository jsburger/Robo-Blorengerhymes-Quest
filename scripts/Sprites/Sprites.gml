
enum PlayerSprite {
	IDLE,
	WALK,
	HOLD,
	HOLD_WALK,
	PUNCH_START,
	PUNCH,
	HURT,
	KNOCKBACK,
	PICKUP,
	THROW,
	
	_MAX
}
#macro ps PlayerSprite
enum SPRITETYPE {
	FULL,
	HALF,
	SINGLE
}
#macro ST SPRITETYPE

global.playersprites = array_create(PlayerSprite._MAX);

function _register_player_sprite(spriteState, sprite_type, suffix) {
	global.playersprites[spriteState] = new DirectionalSprite("sprPlayer" + suffix, sprite_type)
}
function load_directional_sprite_array(spritename, sprite_type) {
	var count = 1;
	if sprite_type == SPRITETYPE.FULL count = 8
	if sprite_type == SPRITETYPE.HALF count = 5
	var array = [];
	for (var n = 1; n <= count; n++) {
		array_push(array, asset_get_index(spritename + string(n)))
	}
	return array
}

_register_player_sprite(ps.IDLE, ST.HALF, "Idle")
_register_player_sprite(ps.WALK, ST.HALF, "Walk")
_register_player_sprite(ps.HOLD, ST.FULL, "Hold")
_register_player_sprite(ps.HOLD_WALK, ST.FULL, "HoldWalk")
_register_player_sprite(ps.PUNCH_START, ST.HALF, "PunchStart")
_register_player_sprite(ps.PUNCH, ST.HALF, "Punch")
_register_player_sprite(ps.HURT, ST.SINGLE, "Hurt")
_register_player_sprite(ps.KNOCKBACK, ST.HALF, "Knockback")
_register_player_sprite(ps.PICKUP, ST.SINGLE, "Pickup")
_register_player_sprite(ps.THROW, ST.FULL, "Throw")

function directional_sprite_index(dir, sprite_type) {
	switch sprite_type {
		case(ST.HALF): 
			var dif = abs(angle_difference(dir, 270));
			return floor((dif/45) + .5)
		case(ST.FULL):
			var dif = -angle_difference(dir, 270);
			if dif < 0 dif += 360;
			return clamp(floor((dif/45) + .5), 0, 7)
		case (ST.SINGLE):
			return 0
	}
}

function directional_sprite_flip(dir, sprite_type) {
	switch sprite_type {
		case(ST.HALF):
			var dif = abs(angle_difference(dir, 180));
			if dif >= 112.5 return -1;
			return 1;
		case(ST.FULL):
			return 1
		case(ST.SINGLE):
			if sign(lengthdir_x(1, dir)) > 0 return -1
			return 1
	}
}

function DirectionalSprite(BaseSpriteName, SpriteType) constructor {
	type = SpriteType
	sprites = load_directional_sprite_array(BaseSpriteName, type);
	
	static get_sprite = function(dir) {
		return sprites[directional_sprite_index(dir, type)]
	}
	static get_flip = function(dir) {
		return directional_sprite_flip(dir, type)
	}
}
