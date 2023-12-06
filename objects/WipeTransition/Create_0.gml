/// @description 

// Inherit the parent event
event_inherited();

surface = _GameCapture.get_current_surface();

progress = 0;

with RoomEntrance if target_room == other.target_room {
	other.image_angle = round(image_angle/90) * 90
}

