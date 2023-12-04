/// @description Update darkness
pause_check_exit

if dark != dark_goal {
	var dif = dark_goal - dark;
	dark += clamp(dif, -1 / dark_time, 1 / dark_time)
}