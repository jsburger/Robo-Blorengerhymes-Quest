/// @description 
pause_check_exit

if touching {
	if !place_meeting(x, y, Player) {
		if last_music != -1 {
			sound_play_music(last_music)
			last_music = -1
		}
		else {
			sound_fade_out(global.sound_music)
		}
		touching = false
	}
}