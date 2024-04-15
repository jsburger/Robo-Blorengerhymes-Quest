/// @description 
if !touching {
	touching = true;
	if global.sound_music != -1 last_music = global.last_music;
	if global.last_music == last_music last_music = -1
	sound_play_music(music)
}