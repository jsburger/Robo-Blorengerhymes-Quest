/// @description 

go_red()

var bibby;
with NpcBibby bibby = self
say_text_nonblocking(bibby, 1 sec, "Red light!", function() {
	go_green()
	alarm[0] = redlight_time()
})
