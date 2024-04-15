function hud_can_draw(){
	return !instance_exists(Transition) && !global.paused
}