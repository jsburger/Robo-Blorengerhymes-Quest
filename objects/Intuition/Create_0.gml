/// @description 

event_inherited()
set_shadow(shdPot)

does_wall_collision = false

can_serialize = true;
dead = false

sprite_index = choose(sprIntution1, sprIntution2, sprIntution3)
zfriction = 0;

serializer.add_layer(function() {
	return {
		dead,
		sprite_index
	}
},
function(data) {
	if data.dead {
		instance_destroy()
	}
	else {
		sprite_index = data.sprite_index
	}
})

get_sound = function() {
	static last_one = 0;
	static values = [sndPickup01, sndPickup02, sndPickup03, sndPickup04];
	last_one = (last_one + 1) mod array_length(values)
	return values[last_one]
}