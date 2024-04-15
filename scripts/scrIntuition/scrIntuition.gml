global.intuition = 0;
add_reset_hook(function() {
	global.intuition = 0;
})

/// Returns the amount of intuition placed in every room
function get_total_intuition() {
	var rooms = asset_get_ids(asset_room);
	var total = 0;
	for (var i = 0; i < array_length(rooms); i++) {
		var info = room_get_info(rooms[i], false, true, false, false, false);
		for (var o = 0; o < array_length(info.instances); o++) {
			if info.instances[o].object_index == "Intuition" total += 1
		}
	}
	return total
}