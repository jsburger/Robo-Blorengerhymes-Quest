global._roomcache = new Cache();

function room_save() {
	var cache = global._roomcache;
	var save = [];
	with GameObject if can_serialize && should_serialize() && !persistent {
		var struct = to_struct();
		struct.__id = id
		array_push(save, struct)
	}
	cache.set(room, save)
}

function room_load() {
	var cache = global._roomcache;
	if cache.has(room) {
		var a = cache.get(room);
		for (var i = 0, l = array_length(a); i < l; i++) {
			var struct = a[i],
				_id = struct.__id;
			
			if instance_exists(_id) {
				struct_remove(struct, "__id")
				_id.from_struct(struct)
			}
			struct.__id = _id
		}
	}
}