/// @description collect

if collecting = false {
	collecting = true;
	collect_dist = point_distance(x, y, other.x, other.y)
	collect_angle = point_direction(other.x, other.y, x, y)
	
	animal_collect(animal)
}
