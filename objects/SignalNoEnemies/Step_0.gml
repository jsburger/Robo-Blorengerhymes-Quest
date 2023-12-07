/// @description 
game_object_exit

if starting_value == undefined {
	last_value = get_value()
	starting_value = last_value
}

var value = get_value();
if signal_can_emit(self, output_type, last_value, value) {
	signal_emit(channel, value)
	signal_post_emit()
}
last_value = value
