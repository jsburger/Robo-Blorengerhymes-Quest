/// @description 

// Inherit the parent event
event_inherited();

on_interact = function() {
	say_text(self, "A delicious array of abandoned snacks...",
		function() {
			say_prompt(self,
			"Shall you pilfer one of the packs?", ["Candy jar", "Chips bag", "Pickle jar"],
			[candy, chips, pickle]	
			)
		}
	)
}

candy = function() {
	say_text(self, "A sweet treat you find in this cabinet so neat!")
}
pickle = function() {
	say_text(self, "The sour bite of this pickle really gives you a tickle!")
}
chips = function() {
	say_text(self, ["You munch and crunch away on the little lunch!", "The sounds of your snacking echo through the house..."], function() {
		with BoogerSpawner spawn()
	})
}