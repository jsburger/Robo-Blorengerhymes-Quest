/// @description 
// Inherit the parent event
event_inherited();

on_room_load = function() {
	if signal_can_emit(self, output_type, last_value, signal_value) {
		signal_emit(channel, signal_value)
		signal_post_emit()
	}
}