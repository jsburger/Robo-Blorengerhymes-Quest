/// @description collect

if collecting = false {
	collecting = true;
	collect_dist = point_distance(x, y, other.x, other.y)
	collect_angle = point_direction(other.x, other.y, x, y)
	
	animal_collect(animal)
	
	if global.sound_ambience != -1 {
		audio_sound_gain(global.sound_ambience, 0, 1000)
		schedule(8.31 sec, function() {
			audio_sound_gain(global.sound_ambience, 1, 1000)
		})
	}
	if global.sound_music != -1 {
		audio_sound_gain(global.sound_music, 0, 1000)
		schedule(8.31 sec, function() {
			audio_sound_gain(global.sound_music, 1, 1000)
		})
	}
	sound_play(sndCapture)
}
