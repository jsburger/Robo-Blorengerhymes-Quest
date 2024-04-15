/// @description 

// Inherit the parent event
event_inherited();

buried = false;
image_index = 0

set_light(160, .5)

schedule(2, function() {
	GameCont.dark_goal = 1
})

current_item = 0

on_item = function(item) {
	if global.buried_item == ITEMS.FISH {
		say_line(self, "Let the poor thing rest.")
	}
	else {
		if !buried {
			current_item = item
			say_line(self, "This looks like a good place to bury something...", function() {
				say_prompt(self, string("Bury your {0}?", item_get_name(current_item)), ["Yes", "No"],
					[function() {
						remove_item(current_item)
						global.buried_item = current_item
						go_buried(true)
						sound_play(sndDig)
						
						if global.buried_item == ITEMS.FISH {
							with Player action_cooldown = 5 sec;
							with LoopySpawner spawn()
						}
					},
					pass]
				)
			})
		
		}
		else {
			say_text(self, "There's already something in the hole.")
		}
	}
}

pass = function() {}

on_interact = function() {
	if global.buried_item == ITEMS.FISH {
		say_line(self, "Let the poor thing rest.")
	}
	else {
		if !buried {
			say_line(self, "This looks like a good place to bury something.")
		}
		else {
			say_prompt(self, "Nothing has grown... dig up your item?", ["Yes", "No"],[
				function() {
					go_buried(false)
					give_item(global.buried_item)
					global.buried_item = -1
					sound_play(sndDig)
				},
				pass
			])
		}
	}
}

go_buried = function(v) {
	buried = v
	if buried image_index = 1
	else image_index = 0
}

can_serialize = true;
serializer.add_layer(function() {
	return {
		buried
	}
},
function(data) {
	go_buried(data.buried)
})