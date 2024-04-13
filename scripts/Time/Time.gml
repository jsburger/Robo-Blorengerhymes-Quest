global.time = 0;
global.time_max = 6 minutes

global.time_pause = 0;

function __time_step() {
	static was_outdoors = true;
	
	if instance_exists(GameCont) {
		if instance_exists(IndoorsFlag) {
			if was_outdoors {
				was_outdoors = false;
				GameCont.dark_goal = 0;
			}
		}
		else {
			was_outdoors = true
			var channel = animcurve_get_channel(curveDaylight, "curve1"),
				value = animcurve_channel_evaluate(channel, global.time/global.time_max)
			GameCont.dark_goal = value
		}
	}
	
	
	if global.time_pause <= 0 {
		global.time += 1;
		if global.time > global.time_max {
			global.time = 0
		}
	}
	else {
		global.time_pause -= 1;
	}
}