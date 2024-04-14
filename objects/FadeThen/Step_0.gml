/// @description 
progress += .025;

if progress > 1 {
	if callback != undefined {
		if callback_args != undefined {
			callback(callback_args)
		}
		else callback()
	}
	instance_destroy()
}