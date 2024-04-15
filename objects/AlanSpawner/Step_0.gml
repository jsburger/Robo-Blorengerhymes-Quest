/// @description 
pause_check_exit

if solved exit

var a = [];
with AlanBlock {
	if get_letter() != "F" {
		array_push(a, self)
	}
}
var sorted = array_mapped_sort(a, "x")
var last_x = sorted[0].x,
	last_y = sorted[0].y;
var found = true;
for (var i = 1; i < array_length(sorted); i++) {
	var _x = sorted[i].x,
		_y = sorted[i].y;
	if (abs(_x - last_x) > 70) //Check for gaps
		|| (_x == last_x) //Verticality
		|| (_y != last_y) //Verticality again
	{
		found = false
		break
	}
	last_x = _x
}
if found {
	var str = ""
	for(var i = 0; i < array_length(sorted); i++) {
		str += sorted[i].get_letter()
	}
	if str != "ALAN" found = false
	if str == "ANAL" && !farted{
		farted = true;
		sound_play(sndFoghorn)
	}
}

if found {
	solved = true
	with AlanBlock {
		pushable = false
	}
	for(var i = 0; i < array_length(sorted); i++) {
		schedule(1 + i * 12, function(inst) {
			instance_create_layer(inst.x, inst.y, layer, Effect, {sprite_index: sprBang})
			inst.flash = 8
		}, [sorted[i]])
	}
	schedule(32, function() {
		spawn()
	})
		
}