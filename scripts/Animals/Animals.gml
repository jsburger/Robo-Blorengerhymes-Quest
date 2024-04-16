global._animals = array_create(ANIMALS._MAX)
global._has_animal = array_create(ANIMALS._MAX, false);

add_reset_hook(function() {
	global._has_animal = array_create(ANIMALS._MAX, false);
})

function register_animal(animal, sprite, sound, name, hint, desc) {
	global._animals[animal] = {
		animal,
		name,
		sound,
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
	LOOPY, //Tutorial guy
	ALAN,
	DANZO,
	BOOGER,
	JUMPSCARE,
	BLOCKY,
	FOOT,
	MUSHROOM,
	FROG,
	MOTH,
	BRAIN,
	STARFISH,
	EVIL,
	HUMAN,
	
	_MAX
}

register_animal(ANIMALS.ALAN, sprAlanIdle, sndCreatureAlan,
	"Alan",
	"His name is Alan!",
	"Alan loves to bounce and bob around having a good time.")
register_animal(ANIMALS.DANZO, sprDanzoIdle, sndCreatureDanzo,
	"Danzo",
	"Drawn to fierce competition.",
	"Danzo appears to absolutely hate losing.")
register_animal(ANIMALS.BOOGER, sprBoogerIdle, sndCreatureBooger,
	"Booger",
	"Likes to share snacks",
	"Booger!")
register_animal(ANIMALS.JUMPSCARE, sprJumpscareIdle, sndCreatureJumpscare,
	"Fish",
	"Found in horrible dark places.",
	"Yuck!")
register_animal(ANIMALS.BLOCKY, sprBlockyIdle, sndCreatureStarfish, //TEMP
	"Blocky", 
	"Finish something incomplete.", 
	"Bricky...")
register_animal(ANIMALS.FOOT, sprFootIdle, sndCreatureBigfoot,
	"Bigfoot",
	"Treadmill",
	"Stinky...")
register_animal(ANIMALS.MUSHROOM, sprMushroomIdle, sndCreatureMoth, //TEMP
	"Horace",
	"He could be anywhere...",
	"You found him!")
register_animal(ANIMALS.LOOPY, sprLoopyIdle, sndCreaturePhone, //TEMP
	"Loopy", //Tutorial
	"weeeweeweweww",
	"He's funny.")
register_animal(ANIMALS.FROG, sprFrogIdle, sndCreatureFrog,
	"Froggy",
	"Has a fascination with life.",
	"Poor fishy...")
register_animal(ANIMALS.MOTH, sprMothmanIdle, sndCreatureMoth,
	"Moth",
	"Lives in the dark, likes lights",
	"mothy")
register_animal(ANIMALS.BRAIN, sprBrainIdle, sndCreatureBrain,
	"Brain", 
	"You stupid", 
	"21")
register_animal(ANIMALS.STARFISH, sprStarfishIdle, sndCreatureStarfish,
	"Starfish", 
	"Likes water",
	"patric")
register_animal(ANIMALS.EVIL, sprEvilIdle, sndEvilLaugh,
	"Evil",
	"Do something evil.",
	"A foul creature, with wicked intent")
register_animal(ANIMALS.HUMAN, sprEvilIdle, sndDoor, //TEMP
	"Human",
	"Human hint",
	"Human description")

function animal_found(animal) {
	return global._has_animal[animal]
}

function animal_collect(animal) {
	global._has_animal[animal] = true
}

