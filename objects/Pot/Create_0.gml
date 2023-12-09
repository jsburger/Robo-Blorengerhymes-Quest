/// @description
// Inherit the parent event
event_inherited();
	set_shadow(shdPot)
#region Grabbing
	is_grabbable = function() {
		return true;
	}
	
	on_throw_land = function() {
		remember_me()
		instance_destroy()
	}
	
	is_hold_persistent = true
#endregion