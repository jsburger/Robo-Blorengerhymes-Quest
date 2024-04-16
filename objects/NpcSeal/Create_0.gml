/// @description 

// Inherit the parent event
event_inherited();

spr_talk = sprNpcSealTalk
set_shadow(shdHaniwa, 0, 0)

on_talked_to = function() {
	say_line(self, ["I love fish.", "Nobody likes fish like I do..."])
}

on_item = function(item) {
    if item == ITEMS.FISH {
        say_line(self, ["Why are you carrying that around?", "You're supposed to bury dead things, y'know."])
    }else
	reject_item()
}