function hud_can_draw(){
	return !instance_exists(AreaTransition) && !global.paused
}