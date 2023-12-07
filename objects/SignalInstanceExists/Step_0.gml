/// @description 
pause_check_exit

var value = get_value();
if signal_can_emit(self, output_type, last_value, value) {
	signal_emit(chanel, value)
	signal_post_emit()
}
last_value = value