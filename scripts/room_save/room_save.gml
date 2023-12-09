global._roomcache = new Cache();
global._extradata = [];

function room_save() {
	var cache = global._roomcache;
	var save = [];
	var context = {save};
	global.serializable_objects.for_each_object(method(context, function(i) {
		if i.can_serialize && i.should_serialize() && !i.persistent {
			var data = [i.id, i.serializer.write()];
			array_push(save, data)
		}
	}))
	cache.set(room, array_concat(save, global._extradata))
	global._extradata = [];
}

function room_load() {
	var cache = global._roomcache;
	if cache.has(room) {
		var a = cache.get(room);
		for (var i = 0, l = array_length(a); i < l; i++) {
			var data = a[i][1],
				_id = a[i][0];
			
			if instance_exists(_id) {
				_id.serializer.read(data)
			}
		}
	}
}

/// Manually serialize an instance. To be used before destroying something that needs info saved.
function remember_me() {
	if can_serialize && should_serialize() && !persistent {
		var a = global._extradata;
		var index = array_find_index(a, function(element) {
			return element[0] == id
		})
		if index == -1 array_push(a, [id, serializer.write()])
		else a[index] = [id, serializer.write()]
	}
}