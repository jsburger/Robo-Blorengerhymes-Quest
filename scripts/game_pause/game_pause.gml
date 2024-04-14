global.paused = false;

function game_pause(and_turn_to = -1) {
	global.paused = true;
	pause_instances()
	
	with instance_create(camera_width/2, camera_height/2, Book) {
		want_page = and_turn_to
	}
}

function game_unpause() {
	
	with Book its_time_to_go = true
}

function game_really_unpause() {
	global.paused = false;
	unpause_instances()
	
}

function pause_instances() {
	global.pausable_objects.for_each_object(function(i) {
		i.pause_modifier.set(false);
	})
	//with GameObject {
	//	pause_modifier.set(false);
	//}
}
function unpause_instances() {
	global.pausable_objects.for_each_object(function(i) {
		i.pause_modifier.set(true);
	})
	//with GameObject {
	//	pause_modifier.disable();
	//}
}