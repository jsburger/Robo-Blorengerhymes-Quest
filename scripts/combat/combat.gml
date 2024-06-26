function projectile_can_hit(projectile, hitme) {
	return (
		(projectile.can_hit) &&
		(projectile.team != hitme.team || projectile.team == TEAMS.NONE || hitme.team == TEAMS.NONE) &&
		(hitme.hp > 0 && hitme.iframes <= 0) &&
		(projectile.is_flying >= hitme.is_flying) &&
		(hitme.projectile_can_hurt_me(projectile))
	)
}

function melee_can_hit(hitter, target) {
	return (
		(hitter.can_hit) &&
		(hitter.team != target.team || hitter.team == TEAMS.NONE || target.team == TEAMS.NONE) &&
		(target.hp > 0 && target.iframes <= 0) &&
		(hitter.is_flying >= target.is_flying) &&
		(target.hitme_can_hurt_me(hitter))
	)	
}

/// @ignore
function hit(source, target, damage, kb_direction = 0, kb_force = 0) {
	target.hp -= damage
	target.knockback_apply(kb_direction, kb_force)
	target.flash = max(target.flash, 7)
	target.iframes = target.iframe_count;
	target.on_hurt(source)
}

function melee_hit(source, target, damage, kb_direction = 0, kb_force = 0) {
	
	hit(source, target, damage, kb_direction, kb_force)
	source.on_melee_hit(target)
}

function projectile_hit(source, target, damage, kb_direction = 0, kb_force = 0) {	
	hit(source, target, damage, kb_direction, kb_force)
}