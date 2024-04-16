/// @description 
say_text(noone, [													  
"Stay focused, my friend. This isn't a joke.\n You know very well that our company's broke.",

"We're sending you out with that book that you found,\n across the vast plains, over cities and towns,\n to the ends of the Earth, to the Farwaythian mounds,\non the highest peak there your ship will set down.",

"Once there, you will search for these 'Globbletop' guys.\n We hear that they're varied, some with big, awful eyes,\n and some that will sing out with shrill, awful cries.\n If you find even one, it'd be quite the prize,\n but usually everyone traveling there dies.",

"No one here thinks that these creatures exist,\n but maybe you'll find them if you can persist.\n So good luck, dear Merle! Let your research now shine!\n Our foundation's life is, too, on the line..."
], function() {
	sound_play(sndBookPage01)
	fade_then(function() {
		image_alpha = 0
		room_goto_REAL(RoomStartBedroom, AreaTransition)
		
		})
})
sound_play(sndBookPage03)