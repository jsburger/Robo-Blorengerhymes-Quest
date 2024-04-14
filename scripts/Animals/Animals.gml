global._animals = array_create(ANIMALS._MAX)
global._has_animal = array_create(ANIMALS._MAX, false);

add_reset_hook(function() {
	global._has_animal = array_create(ANIMALS._MAX, false);
})

function register_animal(animal, name, sprite, hint, desc) {
	global._animals[animal] = {
		animal,
		name,
		sprite,
		hint,
		desc
	}
}

function animal_get(animal) {
	return global._animals[animal]
}

function animal_should_spawn(animal) {
	with Animal if self.animal == animal return false;
	if animal_found(animal) return false;
	return true;
}

enum ANIMALS {
	ALAN,
	DANZO,
	BOOGER,
	FISH,
	BLOCKY,
	
	_MAX
}

register_animal(ANIMALS.ALAN, "Alan", sprAlanIdle, "His name is Alan!", "Alan loves to bounce and bob around having a good time.")
register_animal(ANIMALS.DANZO, "Danzo", sprDanzoIdle, "Drawn to fierce competition.", "Danzo appears to absolutely hate losing.")
register_animal(ANIMALS.BOOGER, "Booger", sprBoogerIdle, "Likes to share snacks", "Booger!")
register_animal(ANIMALS.FISH, "Fish", sprJumpscareIdle, "Found in horrible dark places.", "Yuck!")
register_animal(ANIMALS.BLOCKY, "Blocky", sprBlockyIdle, "Finish something incomplete.", "Bricky...")

function animal_found(animal) {
	return global._has_animal[animal]
}

function animal_collect(animal) {
	global._has_animal[animal] = true
}

