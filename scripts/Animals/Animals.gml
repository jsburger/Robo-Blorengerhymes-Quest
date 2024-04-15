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
	JUMPSCARE,
	BLOCKY,
	FOOT,
	MUSHROOM,
	LOOPY,
	FROG,
	MOTH,
	BRAIN,
	STARFISH,
	
	_MAX
}

register_animal(ANIMALS.ALAN, "Alan", sprAlanIdle, "His name is Alan!", "Alan loves to bounce and bob around having a good time.")
register_animal(ANIMALS.DANZO, "Danzo", sprDanzoIdle, "Drawn to fierce competition.", "Danzo appears to absolutely hate losing.")
register_animal(ANIMALS.BOOGER, "Booger", sprBoogerIdle, "Likes to share snacks", "Booger!")
register_animal(ANIMALS.JUMPSCARE, "Fish", sprJumpscareIdle, "Found in horrible dark places.", "Yuck!")
register_animal(ANIMALS.BLOCKY, "Blocky", sprBlockyIdle, "Finish something incomplete.", "Bricky...")
register_animal(ANIMALS.FOOT, "Bigfoot", sprFootIdle, "Treadmill", "Stinky...")
register_animal(ANIMALS.MUSHROOM, "Horace", sprMushroomIdle, "He could be anywhere...", "You found him!")
register_animal(ANIMALS.LOOPY, "Loopy", sprLoopyIdle, "weeeweeweweww", "He's funny.")
register_animal(ANIMALS.FROG, "Froggy", sprLoopyIdle, "Has a fascination with life.", "Poor fishy...")
register_animal(ANIMALS.MOTH, "Moth", sprMothmanIdle, "Lives in the dark, likes lights", "mothy")
register_animal(ANIMALS.BRAIN, "Brain", sprBrainIdle, "You stupid", "21")
register_animal(ANIMALS.STARFISH, "Starfish", sprStarfishIdle, "Likes water", "patric")

function animal_found(animal) {
	return global._has_animal[animal]
}

function animal_collect(animal) {
	global._has_animal[animal] = true
}

