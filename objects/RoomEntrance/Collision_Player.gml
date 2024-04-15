/// @description 

if can_transit {
	with Player is_visible = false
	schedule(1, function() {
		room_goto_REAL(target_room, is_area_transition ? AreaTransition : WipeTransition)
		Player.is_visible = true
	})
	can_transit = false;
	if is_area_transition sound_play(sndDoor)
}


