/// @description 

gc_offset = _GC_OFFSET.CAPTURE

depth = get_gc_depth(gc_offset)

current_surface = surface_create(camera_width, camera_height);

get_current_surface = function() {
	var surf = surface_create(camera_width, camera_height);
	surface_copy(surf, 0, 0, current_surface)
	return surf
}