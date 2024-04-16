/// @description 
serializable_init

has_spawned = false
animal = ANIMALS.ALAN
spawn = function() {
	if animal_should_spawn(animal) {
		has_spawned = true
		with create_animal() {
			image_alpha = 0
			animal = other.animal
		}
		schedule(.5 sec, function() {
			sound_play(animal_get(animal).sound)
		})
	}
}

create_animal = function() {
	with instance_create(x, y, Animal) {
		animal = other.animal
		sprite_index = animal_get(animal).sprite
		
		return self
	}
}

_create_animal = create_animal

can_serialize = true;
should_serialize = function() {
	return has_spawned;
}
serializer.add_layer(function() {
	return {
		has_spawned
	}
},
function(vars){
	vars_apply(vars)
	if has_spawned {
		spawn()
	}
})