/// @description 
delay -= 1;
if delay <= 0 {
	instance_destroy()
	say_line(noone, [
		"And so, it seems, your work is done.\n That's all of the Globbletops found. You won!",

		"You'll make your way home with your nose in the air,\n knowing you've gone places others won't dare.",

		"But...",

		"Spare a thought now for the things that come next.\n What will you do with this book and its text?",

		"Though your hard work will represent glory for some,\n you should always remember the place it came from.",
	], function() {
		schedule(5 sec, function() {
			game_end()
		})
	})
}