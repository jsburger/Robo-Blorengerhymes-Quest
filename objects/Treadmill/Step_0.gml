/// @description 
game_object_exit

image_speed = 0
if place_meeting(x, y, Player) {
	if Player.hspeed > 0 {
		Player.x = lerp(Player.x, x, .1) - Player.hspeed
		Player.y = lerp(Player.y, y, .1) - Player.vspeed/1.5
		charge += 1;
		image_speed = 1
	}
}
if charge > 15 sec {
	with FootSpawner spawn()
}