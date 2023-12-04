/// @description 

// Inherit the parent event
event_inherited();

	friction = .25

	is_visible = false;
	wall_collision_type = COLLISIONS.HIGH
	
	held_time = 0;
	held_height = 0;
	held_height_max = 30;
	held_rise_time = 1;
	
	holder = noone;
	tracks = true;
	
	instance = noone;
	instance_z = 0;
	active_modifier = undefined;
	
	is_flying = true;
	
	/// @self InstanceGrabber
	/// @param {Id.Instance} held_instance Instance to grab
	/// @param {Id.Instance} holder Instance that will hold it
	bind = function(held_instance, holder) {
		instance   = held_instance;
		instance_z = held_instance.z;
		mask_index = held_instance.mask_index;
		active_modifier = held_instance.active.modify().set(false);
		
		self.holder = holder
		
		is_held = true
	}
	
	toss = function() {
		if instance_exists(holder) {
			z = max(holder.z + held_height, z)
		}
		holder = noone;
		
		is_held = false;
		is_thrown = true;
	}
	
	release = function() {
		if instance_exists(instance) {
			instance.is_held = false;
			instance.is_thrown = false;
		}
		instance_destroy()
	}