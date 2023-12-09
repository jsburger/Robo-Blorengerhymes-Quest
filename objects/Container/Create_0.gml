/// @description item

// Inherit the parent event
event_inherited();

//item = undefined;
has_dropped = false;


can_serialize = true;
should_serialize = function() {
	return drops_once;
}
serializer.add_layer(
	function() {
		return {
			has_dropped
		}
	}
)