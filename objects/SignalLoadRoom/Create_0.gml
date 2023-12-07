/// @description 
// Inherit the parent event
event_inherited();

on_room_load = function() {
	if signal_can_emit(self, output_type, last_value, true) {
		signal_emit(channel, true)
		signal_post_emit()
	}
}