/// @description 

// Inherit the parent event
event_inherited();

image_speed = 0
lit = true;
on_interact = function () {
	image_index = lit
	lit = !lit
	GameCont.dark_goal = !lit
	sound_play(lit ? sndSwitch01 : sndSwitch02)
	if !lit && room == RoomJumpscare {
		if irandom(20) == 0 {
			with JumpscareSpawner spawn()
		}
	}
}