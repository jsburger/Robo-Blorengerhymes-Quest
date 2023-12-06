/// @description 

if active {
	room_goto_REAL(target_room, is_area_transition ? AreaTransition : WipeTransition)
	active = false;
}


