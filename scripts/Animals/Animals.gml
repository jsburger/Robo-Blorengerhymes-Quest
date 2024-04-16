global._animals = array_create(ANIMALS._MAX)
global._has_animal = array_create(ANIMALS._MAX, false);

add_reset_hook(function() {
	global._has_animal = array_create(ANIMALS._MAX, false);
})

global.homo = {
	animal : ANIMALS.HUMAN,
	name: "???",
	sound: sndDoor,
	sprite : sprInteract,
	hint: "Find all the others. Return to where you started.",
	desc: "???"
}

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
	if animal == ANIMALS.HUMAN && !animal_found(animal) return global.homo
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
    "Alan loves bouncing and bobbing and having a ball.")
register_animal(ANIMALS.DANZO, sprDanzoIdle, sndCreatureDanzo,
    "Danzo",
    "Summoned by the thrill of competition.",
    "Danzo appears to be a bit of a sore loser...")
register_animal(ANIMALS.BOOGER, sprBoogerIdle, sndCreatureBooger,
    "Booger",
    "Loves to share snacks.",
    "It's Booger! She's so precious and soft!")
register_animal(ANIMALS.JUMPSCARE, sprJumpscareIdle, sndCreatureJumpscare,
    "Jesse",
    "Appears suddenly when the lights go out. May take a few tries...",
    "A misunderstood Globbletop who loves to walk along the beach.")
register_animal(ANIMALS.BLOCKY, sprBlockyIdle, sndCreatureBlocky, //TEMP
    "Blocky", 
    "Complete something that's incomplete.", 
    "This square tries his best to keep up with the latest in pop music.")
register_animal(ANIMALS.FOOT, sprFootIdle, sndCreatureBigfoot,
    "Bigfoot",
    "Put your legs to work for a while.",
    "Has a real zest for life, but not for showering...")
register_animal(ANIMALS.MUSHROOM, sprMushroomIdle, sndCreatureMoth, //TEMP
    "Horace",
    "He could be anywhere...",
    "You found him!")
register_animal(ANIMALS.LOOPY, sprLoopyIdle, sndCreaturePhone, //TEMP
    "Loopy", //Tutorial
    "This Globbletop loves to read and can be attracted by books.",
    "Is empty-headed at times, meaning there's always room for more books.")
register_animal(ANIMALS.FROG, sprFrogIdle, sndCreatureFrog,
    "Froggy",
    "Fascinated by life. Emerges from hiding to mourn death.",
    "Poor fishy...")
register_animal(ANIMALS.MOTH, sprMothmanIdle, sndCreatureMoth,
    "Moth",
    "Emerges in the night. Appears to those who remain in light.",
    "Goes to great lengths to maintain his scruffy fur coat.")
register_animal(ANIMALS.BRAIN, sprBrainIdle, sndCreatureBrain,
    "Brain", 
    "Has a morbid fascination with stupidity.", 
    "He's a little mean-spirited, isn't he?.")
register_animal(ANIMALS.STARFISH, sprStarfishIdle, sndCreatureStarfish,
    "Starfish", 
    "Have a little fun on the beach.",
    "She never refuses an opportunity to try something new.")
register_animal(ANIMALS.EVIL, sprEvilIdle, sndCreatureCat,
    "Evil",
    "Do something evil.",
    "A foul creature with wicked intent.")
register_animal(ANIMALS.HUMAN, sprHomoSapienIdle, sndDoor, //TEMP
    "Homo Sapien",
    "Find all the others. Return to where you started.",
    "Went extinct in the 21st century.")

function animal_found(animal) {
	return global._has_animal[animal]
}

function animal_collect(animal) {
	global._has_animal[animal] = true
}

