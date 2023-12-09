/// @description 
enum DoorType {
	OPEN,
	PUZZLE,
	LOCKED,
	BOSS_LOCKED
}

// Inherit the parent event
event_inherited();

zlayer += .64

is_visible = true;
transit_direction = 90;

is_open = new Modifiable(true)

on_open = function() {};
on_close = function() {};
is_open.on_change(function(value) {
	if value {
		on_open()
	}
	else {
		on_close()
	}
})

locked = false
if type != DoorType.OPEN {
	is_open.set(false)
	if type != DoorType.PUZZLE {
		locked = true;
	}
}

on_signal_received = function(value) {
	if type == DoorType.PUZZLE {
		if (value) is_open.set(true)
		else if (can_be_closed) is_open.set(false)
	}
}

serializable_init
should_serialize = function() {
	return type > DoorType.PUZZLE;
}
serializer.add_layer(function() {
		return {
			locked
		}
	},
	function(struct) {
		vars_apply(struct)
		if (type > DoorType.PUZZLE) {
			if !locked is_open.set(true)
		}
	}
)