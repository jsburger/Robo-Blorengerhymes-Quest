/// @description 
game_object_exit

if !can_transit {
	if !place_meeting(x, y, Player) {
		can_transit = true
	}
}


