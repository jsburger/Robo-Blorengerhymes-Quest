global.paused = false;

function game_pause() {
	global.paused = true;
	pause_instances()
}

function game_unpause() {
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