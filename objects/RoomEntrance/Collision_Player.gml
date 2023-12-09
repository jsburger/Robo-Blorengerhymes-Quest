/// @description 

if can_transit {
	room_goto_REAL(target_room, is_area_transition ? AreaTransition : WipeTransition)
	can_transit = false;
}


