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
global.last_music = -1;
global.music_follower = -1
global.sound_ambience = -1
global.last_ambience = -1
global.ambience_follower = -1
add_reset_hook(function() {
	stop_music()
	stop_ambience()
})

//Give sound to play as music. If you provide a followup sound, it will loop that after the first one is done.
//Otherwise, the given sound will loop.
function sound_play_music(sound, followup = -1, dont_loop_tho = false) {
	if sound == global.last_music
		exit
	sound_fade_out(global.sound_music)
	var loop = dont_loop_tho ? false : (followup == -1 ? true: false);
	var a = audio_play_sound(sound, 1, loop, 0);
	audio_sound_gain(a, 1, 1000)
	global.sound_music = a;
	global.music_follower = followup
	global.last_music = sound
}

function sound_play_ambience(sound, followup = -1) {
	if sound == global.last_ambience
		exit
	sound_fade_out(global.sound_ambience)
	var a = audio_play_sound(sound, 1, followup == -1 ? true : false, 0);
	audio_sound_gain(a, 1, 1000)
	global.sound_ambience = a;
	global.ambience_follower = followup
	global.last_ambience = sound;
}

//Just stops the music
function stop_music() {
	sound_fade_out(global.sound_music)
	global.sound_music = -1
	global.music_follower = -1
	global.last_music = -1
}
function stop_ambience() {
	sound_fade_out(global.sound_ambience)
	global.sound_ambience= -1
	global.ambience_follower = -1
	global.last_ambience = -1
}

function music_get() {
	var hour = time_get_hour();
	if hour >= 7 && hour < 18 return musDay;
	return musNight;
}

function sound_fade_out(sound_instance) {
	if sound_instance != -1 {
		audio_sound_gain(sound_instance, 0, 1000)
		schedule(1 sec, function(snd) {
			if audio_is_playing(snd)
				audio_stop_sound(snd)
		}, [sound_instance])
	}
}