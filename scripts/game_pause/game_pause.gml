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
	with GameObject {
		pause_modifier.set(false);
	}
}
function unpause_instances() {
	with GameObject {
		pause_modifier.disable();
	}
}