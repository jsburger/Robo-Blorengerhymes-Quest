
enum PlayerSprite {
	IDLE,
	WALK,
	INTERACT,
	
	_MAX
}
#macro ps PlayerSprite
enum SPRITETYPE {
	FULL, //8 direction
	HALF, //5 direction w/flip
	SINGLE //1 w/flip
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

_register_player_sprite(ps.IDLE, ST.SINGLE, "NewIdle")
_register_player_sprite(ps.WALK, ST.SINGLE, "NewWalk")
_register_player_sprite(ps.INTERACT, ST.SINGLE, "NewAction")

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
