/// @description 
enum TEAMS {
	PLAYER,
	ENEMY,
	NONE
}
// Inherit the parent event
event_inherited();

team = TEAMS.NONE

hp = 1;
maxhp = 1;
iframes = 0;

can_walk = new Modifiable(true).accumulator_min()

knockback = {
	direction: 0,
	force: 0,
	resist: 0,
	is_strong: false,
	walk_modifier: can_walk.modify().pass(),
	
}
knockback_apply = function(dir, spd, strong) {
	if knockback.is_strong && !strong exit
	knockback.speed = max(spd * (1 - knockback.resist), knockback.speed);
	knockback.direction = dir;
	knockback.is_strong = strong
	if knockback.is_strong knockback.walk_modifier.set(false)
}
knockback_step = function() {
	
}


can_projectile_hurt_me = function(proj) {
	return true
}

can_hitme_hurt_me = function(hitter) {
	return true
}

on_melee_hit = function(target) {
	
}

on_hurt = function(hitter) {
	
}