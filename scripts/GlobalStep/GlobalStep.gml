
global.game_source = time_source_create(time_source_game, 1, time_source_units_frames, game_step, [], -1, time_source_expire_nearest);
global.step_source = time_source_create(time_source_global, 1, time_source_units_frames, global_step, [], -1, time_source_expire_nearest);
time_source_start(global.step_source)
time_source_start(global.game_source)

global.fast_forward = false
//randomize()

global.CurrentFrame = 0
global.IsRunningInTimeSource = false;
#macro is_timesource global.IsRunningInTimeSource

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(Limestock)


//Runs every frame that the game isn't paused.
function game_step() {
	global.CurrentFrame += 1
	__modifiable_step()
}
//Runs every frame.
function global_step() {
	
	if !instance_exists(GameCont) && !global.paused {
		instance_create_layer(0, 0, "Instances", GameCont)
	}


	if (global.music_follower != -1 && (global.sound_music != -1) && !audio_is_playing(global.sound_music)) {
		sound_play_music(global.music_follower, -1)
	}
	
	is_timesource = true;
	
	Clickables_Step()

	// Pausing:
	if button_pressed(inputs.pause) {
		if !global.paused {
			game_pause()
		}
		else {
			game_unpause()
			
		}
	}
	
	Tickables_Step()
	
	is_timesource = false;
}