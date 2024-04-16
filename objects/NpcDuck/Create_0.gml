/// @description 

// Inherit the parent event
event_inherited();

spr_talk = sprNpcDuckTalk
set_shadow(shdPlayer, 6, 12)
on_talked_to = function() {
	
	say_prompt(self, "Say, do you like me?", ["Yes", "No"],
		[function() {
			say_text(self, "Say, you're nice!", function() {
				if item_should_spawn(ITEMS.GLOVE) {
					say_line(self, "You can have this, since you're so sweet!", function() {
						give_item(ITEMS.GLOVE)
					})
				}
			})
		},
		function () {
			say_text(self, "Well, suit yourself.")
		}]
	)
}