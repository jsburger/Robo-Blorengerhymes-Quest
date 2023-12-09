function Serializer(_owner) constructor {
	writers = [];
	readers = [];
	owner = _owner;
	
	static add_layer = function(to_struct, from_struct = undefined) {
		from_struct ??= method(owner, default_reader)
		array_push(writers, to_struct)
		array_push(readers, from_struct)
	}
	
	static write = function() {
		return array_map(writers, function(i) {return i()})
	}
	static read = function(data) {
		array_foreach(data, function(element, index) {
			readers[index](element)
		})
	}
	
	/// @ignore
	static default_reader = function(struct) {
		vars_apply(struct)
	}
}