/// @description 

// Inherit the parent event
event_inherited();

spr_talk = sprNpcFallerTalk
falling = false
canonically_dead = false


can_interact = function() {
	return !falling
}

on_talked_to = function() {
	say_line(self, "Flogglenots? Ask me about them later, I'm lookin' at this pit.")
}

on_item = function(item) {
	if item == ITEMS.GLOVE {
		consume_item(item)
		x = Pit.x
		y = Pit.y
		say_text_nonblocking(noone, 1 sec, "Huh?", function() {
			sprite_index = sprNpcFallerFalling
			spr_idle = sprite_index 
			image_index = 0
			falling = true
			schedule(.15 sec, function() {
				sound_play(sndFall)
			})
		})
	}
	else reject_item()
}

reject_item = function() {
	say_line(self, "Hold on, I don't need to see that, I'm lookin' at this pit.")
}

can_serialize = true

serializer.add_layer(function() {
	return {canonically_dead}
},
function(data) {
	vars_apply(data)
	if canonically_dead instance_destroy()
})
