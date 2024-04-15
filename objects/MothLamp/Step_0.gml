/// @description 
game_object_exit

var hour = time_get_hour();
if hour != last_hour {
	if hour > 20 || hour <= 5 {
		if instance_exists(Player) {
			if point_distance(x, y, Player.x, Player.y) < light_radius {
				with MothSpawner spawn()
			}
		}
	}
	last_hour = hour
}