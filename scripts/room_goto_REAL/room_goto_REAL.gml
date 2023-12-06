function room_goto_REAL(_room, transition) {
	if _room != room {
		with GameCont if !restoring {
			restore_point = last_room
			last_room = room;
			restore_room = room;
		}
		
		instance_create_depth(0, 0, 0, transition, {
			target_room : _room
		})
	}
}