/// @description 

// Inherit the parent event
event_inherited();

spr_talk = sprNpcFuzzTalk
set_shadow(shdHaniwa, 0, 22)

on_talked_to = function() {
	say_line(self, ["Yeah, I think I saw a Gloggletop!", "I took one of his toys!", "It was really heavy so I'm using it to train!"])
}

on_item = function(item) {
	if item == ITEMS.DUMBELL {
		say_line(self, ["Say, that looks awful heavy!", "Let's trade!"], function() {
			consume_item(ITEMS.DUMBELL)
			give_item(ITEMS.BRICK)
		})
	}
	else if item == ITEMS.BRICK {
		say_line(self, "No thanks, I love this new toy!")
	}
	else reject_item()
}

reject_item = function() {
	say_line(self, "I've already got enough to carry!")
}