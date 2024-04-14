/// @description 

gc_offset = _GC_OFFSET.TRANSITION
depth = GameCont.depth - gc_offset

is_green = true;
rage = 0;

is_active = false;
player_won = false;
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
	}
}

start_game = function() {
	player_won = false
	is_active = true
	with Player {
		other.player_pauser = active.modify().set(false)
	}
	fade_then(function() {
		with Player {
			is_visible = false;
			other.player_x = x
			other.player_y = y;
			x = (other.x + NpcBibby.x)/2
			y = other.y 
		}
			
		var m = 64;
		with instance_create(x, y - m, RGRunner) {
			is_player = true;
			can_run = false
			sprite_index = sprPlayerNewWalk1
			set_shadow(shdPlayer, 0, 12)
		}
		with instance_create(x, y + m, RGRunner) {
			image_alpha = 0
			stop_running()
		}
		
		schedule(1 sec, function() {
			start_race()
		})
	})
}

start_race = function() {
	alarm[0] = redlight_time()
	var bibby;
	rage = 0
	with RGRunner can_run = true
	with NpcBibby bibby = self
	say_text_nonblocking(bibby, .5 sec, "Go!")
	go_green()
}

end_game = function() {

	fade_then(function() {
		is_active = false
		if player_pauser != undefined {
			player_pauser.clear()
		}
		with Player {
			x = other.player_x
			y = other.player_y
			is_visible = true
		}
		if player_won {
			player_won = false
			with DanzoSpawner spawn()
		}
		with RGRunner instance_destroy()
	})
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
		player_won = true
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