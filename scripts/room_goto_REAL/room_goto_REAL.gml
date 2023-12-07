function room_goto_REAL(_room, transition) {
	if _room != room {		
		instance_create_depth(0, 0, 0, transition, {
			target_room : _room
		})
	}
}