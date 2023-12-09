global._room_complete = new IOCache(function() { return false });

function room_complete(_room = room) {
	var is_complete = room_is_complete(_room);
	if !is_complete {
		global.room_completers.for_each_object(function(inst) {
			inst.on_room_complete()
		})
	}
	global._room_complete.set(_room, true);
}

function room_is_complete(_room = room) {
	return global._room_complete.get(_room)
}