/// @description Depth sorting

var _dg = DepthGrid,
	_amount = 0;
with GameObject if is_visible {
	_amount += 1
}
ds_grid_resize(_dg, 2, _amount);

var _y = 0;
with GameObject if is_visible {
	_dg[# 0, _y] = id;
	_dg[# 1, _y] = get_depth();
	_y++;
}
ds_grid_sort(_dg, 1, true);


//Set up surfaces
for (var i = 0; i < array_length(surfaces); i++) {
	if !surface_exists(surfaces[i]) surfaces[i] = surface_create(room_width, room_height)
	if surface_get_height(surfaces[i]) != room_height || surface_get_width(surfaces[i]) != room_width {
		surface_resize(surfaces[i], room_width, room_height)
	}
	
	surface_set_target(surfaces[i])
	draw_clear_alpha(c_black, 0)
	surface_reset_target()
}
var shadow_surf = surfaces[0],
	clone_surf = surfaces[1],
	light_surf = surfaces[2];

surface_copy(clone_surf, 0, 0, application_surface)

// Set up Shadows
surface_set_target(shadow_surf)
 {
	var a = [];
	_y = 0;
	var inst = noone;
	repeat(_amount) {
		inst = _dg[# 0, _y++];
		if inst.has_shadow array_push(a, inst)
	}
	var sorted = array_mapped_sort(a, "shadow_layer"),
		length = array_length(sorted),
		lastLayer = -1;
	for (var i = 0; i < length; i++) {
		inst = sorted[i];
		if inst.shadow_layer != lastLayer {
			lastLayer = inst.shadow_layer;
			set_fog(get_shadow_base_color(inst.shadow_layer))
		}
		draw_sprite_scaled(
			inst.spr_shadow, 0, //sprite, index
			inst.x + inst.spr_shadow_x , inst.y + inst.spr_shadow_y, //x, y
			inst.image_xscale, 1 + (inst.image_yscale - 1) / 2 //xscale, yscale
		);
	}
}
disable_fog()
surface_reset_target()

surface_set_target(light_surf)
if dark > 0 {
	with GameObject if is_visible && has_light {
		var color = merge_color(c_black, c_white, light_intensity / 2)
		draw_circle_color(x + light_x, y + light_y, light_radius, color, color, false)
	}
	with GameObject if is_visible && has_light {
		var color = merge_color(c_black, c_white, light_intensity)
		draw_circle_color(x + light_x, y + light_y, light_radius * .7, color, color, false)
	}
}
surface_reset_target()

//Set up Shader
var shader = shaderInstanceShadows;
shader_set(shaderInstanceShadows)

texture_set_stage(shader_get_sampler_index(shader, "Palette"), sprite_get_texture(global.sprShadows, 0));
texture_set_stage(shader_get_sampler_index(shader, "Shadow"), surface_get_texture(shadow_surf))
texture_set_stage(shader_get_sampler_index(shader, "Lights"), surface_get_texture(light_surf))
shader_set_uniform_f(shader_get_uniform(shader, "AmbientLight"), dark)

//if (!global.paused) {
	shader_set_uniform_f(shader_get_uniform(shader, "RelativeCoords"),
		camera_x/room_width, camera_y/room_height, camera_right/room_width, camera_bottom/room_height
	)
	shader_set_uniform_f(shader_get_uniform(shader, "ScreenSize"), camera_width, camera_height)
//}
//else {
//	// When paused, the 'screen' is bigger
//	shader_set_uniform_f(shader_get_uniform(shader, "RelativeCoords"),
//		0, 0, 1, 1
//	)
//	shader_set_uniform_f(shader_get_uniform(shader, "ScreenSize"), room_width, room_height)
//}
set_flash(false);

draw_set_shadow_mask(SHADOWMASK.FLOOR)
draw_surface(clone_surf, camera_x, camera_y)

// Draw:
_y = 0;
repeat(_amount){
	var _inst = _dg[# 0, _y];
	
	with _inst {
		// Normal draw:
		y -= z;
		image_xscale *= flip;
		draw_set_shadow_mask(shadow_layer)
		event_perform(ev_draw, ev_draw_normal);
		y += z;
		image_xscale /= flip;
	}
	_y++;
}
disable_fog()

draw_set_shadow_mask(SHADOWMASK.TOP)
// Draw End:
_y = 0;
repeat(_amount){
	var _inst = _dg[# 0, _y];
	
	with _inst {
		y -= z;
		event_perform(ev_draw, ev_draw_end);
		y += z;
	}
	
	_y++;
}
disable_fog()
shader_reset();
//draw_surface(shadow_surf, 0, 0)
