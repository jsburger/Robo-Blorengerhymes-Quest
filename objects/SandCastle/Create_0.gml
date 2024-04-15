/// @description 

// Inherit the parent event
event_inherited();
built = false
image_index = 0
image_speed = 0


can_serialize = true;
serializer.add_layer(
	function() {
		return {
			built
		}
	},
	function(data) {
		vars_apply(data)
		if built {
			image_index = 1
		}
	}
)

on_item = function(item) {
	if !built {
		if item == ITEMS.BUCKET {
			say_line(noone, "What a delightful day to build a sand castle!", function() {
				consume_item(ITEMS.BUCKET)
				sound_play(sndDig)
				fade_then(function() {
					image_index = 1
					built = true
					with StarfishSpawner spawn()
					say_text_nonblocking(noone, 2 sec, "How serene.")
				})
			})
		}
	}
}

on_interact = function() {
	if !built {
		say_line(noone, "A pile of sand on the beach, how quaint.")
	}
	else {
		say_line(noone, "Your castle stands strong.")
	}
}