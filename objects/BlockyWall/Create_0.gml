/// @description 

// Inherit the parent event
event_inherited();

can_serialize = true;
fixed = false;
image_speed = 0

serializer.add_layer(
	function() {
		return {
			fixed
		}
	},
	function(data) {
		vars_apply(data)
		if fixed image_index = 1
	}
)

on_item = function(item) {
	if item == ITEMS.BRICK {
		consume_item(item)
		with BlockySpawner spawn()
		image_index = 1
		fixed = true
	}
}

on_interact = function() {
	if !fixed {
		say_text(self, "It's missing a brick, what a dastardly trick!")
	}
	else {
		say_text(self, "You've set things right, what a wonderful delight!")
	}
}