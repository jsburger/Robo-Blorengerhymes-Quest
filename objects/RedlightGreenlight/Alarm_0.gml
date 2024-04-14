/// @description 

go_red()

var bibby;
with NpcBibby bibby = self
say_text_nonblocking(bibby, random_range(1, 1.5) sec, "Red light!", function() {
	go_green()
	alarm[0] = redlight_time()
	say_text_nonblocking(noone, .5 sec, "Green light!")
})
