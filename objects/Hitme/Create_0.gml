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
iframe_count = 10;

function hitme_init(_hp) {
	maxhp = _hp
	hp = maxhp
}

can_walk = new Modifiable(true).accumulator_min()

knockback = {
	direction: 0,
	speed: 0,
	resist: 0
	
}
knockback_apply = function(dir, spd) {
	knockback.speed = max(spd * (1 - knockback.resist), knockback.speed);
	knockback.direction = dir;
}
knockback_step = function() {
	if knockback.speed > 0 {
		var _x = lengthdir_x(knockback.speed, knockback.direction),
			_y = lengthdir_y(knockback.speed, knockback.direction);
		x += _x
		y += _y
		if collision_at(wall_collision_type) {
			knockback.speed = 0
			x -= _x
			y -= _y
			exit
		}
		knockback.speed = max(knockback.speed - .2, 0)
	}
}

can_hit = true;
contact_damage = 0;

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