/// @description Update darkness
pause_check_exit

if dark != dark_goal {
	var dif = dark_goal - dark;
	dark += clamp(dif, -1 / dark_time, 1 / dark_time)
}

if instance_exists(Player) {
	var hour = time_get_hour();
	if hour != last_hour {
		if irandom(3) == 0 && global.sound_music == -1{
			sound_play_music(music_get(), -1, true)
		}
		last_hour = hour
	}
}