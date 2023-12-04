/// @description Z axis, Flash
game_object_exit

#region Z axis
	if canz {
		if z != zmin{
			zspeed -= zfriction;
	
			if z <= zmin && zspeed < 0{
				z = zmin;
				zspeed = 0;	
			}
		}

		z = max(z + zspeed, zmin);
	}
#endregion

#region Flash
	if flash > 0 flash -= 1
#endregion