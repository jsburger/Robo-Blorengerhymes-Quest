__createShadowSpace()

function __createShadowSpace() {
	var surface = surface_create(256, 16);
	surface_set_target(surface)
	draw_clear_alpha(c_black, 0)
	
	
	shader_set(shaderShadowSpaceGenerate)
	
	var _c = shader_get_uniform(shaderShadowSpaceGenerate, "color_count"),
		t = shader_get_sampler_index(shaderShadowSpaceGenerate, "pal"),
		sprite = sprPalette;
	
	texture_set_stage(t, sprite_get_texture(sprite, 0))
	shader_set_uniform_f(_c, sprite_get_height(sprite))
	
	
	draw_sprite(sprLUT, 0, 0, 0)
	
	surface_reset_target()
	shader_reset()
	
	global.sprShadows = sprite_create_from_surface(surface, 0, 0, 256, 16, false, false, 0, 0);
	//surface_free(surface)
	//surface_save(surface, "C:/Users/dizzy/Desktop/roboblors quest/" + "ColorMap.png")
}

// Instances will draw above shadows of their layer, and draw shadows at their layer
// So an instance at ACTOR will emit shadows below ACTOR and above FLOOR
enum SHADOWMASK {
	MIN,
	FLOOR,
	ACTOR,
	WALL,
	TOP,
	_max
}

function set_fog(col) {
	gpu_set_fog(true, col, 0, 0)
}
function disable_fog() {
	gpu_set_fog(false, 0, 0, 0)
}

function set_flash(value) {
	static lastFlash = undefined;
	static uniform = shader_get_uniform(shaderInstanceShadows, "Flashing");
	value = (value >= 0.5);
	if (value != lastFlash) {
		shader_set_uniform_i(uniform, value)
		lastFlash = value
	}
}

/// @param {Enum.SHADOWMASK} masklevel
function draw_set_shadow_mask(masklevel) {
	static lastMask = undefined;
	var uniform = shader_get_uniform(shaderInstanceShadows, "ShadowMaskValue");
	if (masklevel != lastMask) or true {
		shader_set_uniform_f(uniform, get_shadow_mask_value(masklevel))
		lastMask = masklevel
	}
}

function get_shadow_mask_value(masklevel) {
	static values = memoize_array(SHADOWMASK._max,
		function(i) {
			return (i + 1)/(SHADOWMASK._max)
		})
	return values[masklevel]
}

/// Get the color for drawing shadows at a given level
function get_shadow_base_color(masklevel) {
	static _colors = memoize_array(SHADOWMASK._max,
		function(i) {
			return merge_color(c_black, c_white, (i + 1)/(SHADOWMASK._max + 1))
		})
	return _colors[masklevel]
}


function UniformBind(shader, uniform_name) constructor {
	lastValue = undefined;
	uniform = shader_get_uniform(shader, uniform_name);
	
	static set = function(value) {
		if (value != lastValue) {
			shader_set_uniform_f(uniform, value)
			lastValue = value
		}
	}
}