function grab_instance(grabber, target) {
	with instance_create_depth(target.x, target.y, target.depth, InstanceGrabber) {
		bind(target, grabber)
		
		return self;
	}
}

function grab_instance_throw(thrower, held_grabber) {
	held_grabber.toss()
	return held_grabber
}