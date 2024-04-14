/// @description 

gc_offset = _GC_OFFSET.TRANSITION
depth = GameCont.depth - gc_offset

is_green = true;

fade_progress = 0
fading = false
starting = true;
ending = false
player_pauser = undefined;
player_x = 0;
player_y = 0;

go_green = function() {
	is_green = true
	with NpcBibby {
		sprite_index = sprNpcBibbyIdleBack
	}
	with RGRunner {
		if !is_player {
			start_running()
		}
		else {
			can_run = true
		}
	}
}
go_red = function() {
	is_green = false
	with NpcBibby {
		sprite_index = spr_idle
	}
	with RGRunner {
		if !is_player {
			stop_running()
		}
		else {
			
		}
	}
}

start_game = function() {
	fading = true
	starting = true
	
}

end_game = function() {
	fading = true
	starting = false
	ending = true
}

redlight_time = function() {
	var t = irandom_range(2, 4) sec
	with RGRunner if !is_player {
		schedule(irandom_range(t/2, t - 1), function() {
			stop_running()
		})
	}
	return t;
}


i_won = function(runner) {
	with RGRunner {
		stop_running()
		can_run = false
	}
	alarm[0] = -1
	var bibby;
	with NpcBibby bibby = self
	if runner.is_player {
		say_text(bibby, ["You caught me!"], function() {
			end_game()
		})
	}
	else {
		say_text(bibby, "Hey, great work funny guy!", function() {
			end_game()
		})
	}
}