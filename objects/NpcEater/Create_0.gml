/// @description 

// Inherit the parent event
event_inherited();

spr_talk = sprNpcHungryTalk
convinced = false
set_shadow(shdPlayer, 4, -10)

on_talked_to = function() {
	if !convinced {
		say_prompt(self, "Globbletops? Never seen one before, never heard of one, what's more!",
			["Are you sure?", "Hmm... alright..."],
			[function() {
				say_prompt(self, "Uhhhh, well. Maybe I saw one around here...",
					["Where?", "I'll go look for it then!"], [
						function() {
							say_prompt(self, "Uh, yeah.... I'm not sure...",
								["Out with it!", "Hey, take it easy!"],
								[
									resign,
									see_you_later
								])
						},
						see_you_later
					])
				},
				see_you_later
			]
		)
	}
	else {
		say_text(self, "Hey, I don't feel like talking no more...")
	}
}

see_you_later = function() {
	say_text(self, "Haha, yeah, see you around then...")
}

resign = function() {
	say_text(self, ["Alright, you got me.", "I found one earlier...", "Here it is..."], function() {
		fade_then(function() {
			become_normal()
			with HoraceSpawner spawn()
		})
	})
}

reject_item = function() {
	if !convinced say_text(self, "Huh? What is that? I can't really see it right now.")
	else say_text(self, "Oh, well, I don't really care anymore.")
}

can_serialize = true
serializer.add_layer(function() {
	return {
		convinced
	}
},
	function(data) {
		vars_apply(data)
		if convinced become_normal()
	}
)

become_normal = function() {
	convinced = true
	sprite_index = sprNpcHungryIdle2
	spr_idle = sprite_index
	spr_talk = sprite_index
}