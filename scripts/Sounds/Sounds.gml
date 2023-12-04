function sound_play_pitch(sound, pitch, volume = 1){
	//audio_stop_sound(sound);
	var snd = audio_play_sound(sound, 1, 0);
	audio_sound_gain(snd, volume, 0)
	audio_sound_pitch(snd, pitch);
	return snd;
}

function sound_play(sound,volume = 1) {
	var snd = audio_play_sound(sound, 1, 0)
	audio_sound_gain(snd, volume, 0)
	return snd;
}

global.sound_music = -1
global.music_follower = -1

//Give sound to play as music. If you provide a followup sound, it will loop that after the first one is done.
//Otherwise, the given sound will loop.
function sound_play_music(sound, followup = -1) {
	if global.sound_music != -1 audio_stop_sound(global.sound_music)
	var a = audio_play_sound(sound, 1, followup == -1 ? true : false);
	global.sound_music = a;
	global.music_follower = followup
	return a
}

//Just stops the music
function stop_music() {
	if global.sound_music != -1 audio_stop_sound(global.sound_music)
	global.sound_music = -1
	global.music_follower = -1
}