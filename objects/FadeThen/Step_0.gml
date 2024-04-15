/// @description 
if !holding {
	if !out progress += .025;
	else progress -= .025;
}
if progress > 1 {
	if !has_held {
		holding = true
		hold_time += 1
	}
	if hold_time > .5 sec {
		has_held = true
		holding = false
		hold_time = 0
		if callback != undefined {
			if callback_args != undefined {
				callback(callback_args)
			}
			else callback()
		}
		out = true;
	}
	//instance_destroy()
}
if out && progress <= 0 {
	instance_destroy()
}
global.time_pause = true