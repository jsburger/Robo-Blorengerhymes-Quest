enum OutType {
	ONCE,
	ONCE_EVER,
	STEP,
	WHEN_TRUE,
	WHEN_FALSE,
	ON_CHANGE
}
enum RunType {
	ALWAYS,
	ROOM_CLEARED,
	NOT_ROOM_CLEARED
}

function signal_emit(channel, value) {
	var instances = global.signal_receivers.instances();
	for (var i = 0, l = array_length(instances); i < l; i++) {
		if instances[i].channel == channel {
			instances[i].on_signal_received(value)
		}
	}
}
/// @self Signal
function signal_post_emit() {
	has_emitted = true;
	
}

function signal_can_emit(signal, output_type, lastValue, emitValue) {
	switch (signal.run_if) {
		case(RunType.ALWAYS): break
		case(RunType.ROOM_CLEARED): if room_is_complete() break else return false;
		case(RunType.NOT_ROOM_CLEARED): if room_is_complete() return false else break;
	}
	if !is_array(output_type) output_type = [output_type]
	for (var i = 0; i < array_length(output_type); i++) {
		var result = outtype_resolve(signal, output_type[i], lastValue, emitValue)
		if !result return false
	}
	return true
}

/// @ignore
function outtype_resolve(signal, out_type, lastValue, emitValue) {
	switch(out_type) {
		case OutType.ONCE:
		case OutType.ONCE_EVER:
			return !signal.has_emitted;
		case OutType.STEP:
			return true;
		case OutType.WHEN_TRUE:
			return bool(emitValue)
		case OutType.WHEN_FALSE:
			return !bool(emitValue)
		case OutType.ON_CHANGE:
			return lastValue != emitValue
	}
}