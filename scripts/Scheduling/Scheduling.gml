//global.scheduling_source = time_source_create_parent(time_source_game);

function schedule(frames, callback, args = []) {
	var source = time_source_create(time_source_game, frames, time_source_units_frames, callback, args);
	time_source_start(source);
	return source;
}


//function time_source_create_parent(parentsource) {
//	var source = time_source_create(parentsource, 1000000000000000, time_source_units_seconds, nothing, [], -1);
//	time_source_start(source)
//	return source;
//}
//function nothing() {}