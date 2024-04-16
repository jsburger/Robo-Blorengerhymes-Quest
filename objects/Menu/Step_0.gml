/// @description 
if !started && image_alpha < 1 {
	image_alpha += .005
}
if started && image_alpha > 0 {
	image_alpha -= .01
	if image_alpha <= 0 {
		room_goto(RoomLetter)
	}
}

if button_pressed(inputs.proceed) && !started{
	started = true
		sound_fade_out(global.sound_music)
		schedule(4 sec, function() {
			stop_music()
		})
	sound_play(sndBlip01)
}