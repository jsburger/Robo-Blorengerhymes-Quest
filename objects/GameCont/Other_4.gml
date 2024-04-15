/// @description Room start stuff
layer = layer_get_id("Instances")

var inst = global.relative_to_gamecont.instances()
for (var i = 0; i < array_length(inst); i++) {
	inst[i].depth = get_gc_depth(inst[i].gc_offset)
}

if layer_exists("Collision") layer_set_visible(layer_get_id("Collision"), false)

cam_setup()

room_load()
if last_room != -1 {
	with RoomEntrance if target_room == other.last_room {
		with Player {
			var _x = x, _y = y;
			x = other.x
			y = other.y
			if instance_exists(grabbed_instance) {
				grabbed_instance.x += x - _x
				grabbed_instance.y += y - _y
				grabbed_instance.instance.x = grabbed_instance.x
				grabbed_instance.instance.y = grabbed_instance.y
			}
		}
	}
}

global.room_loaders.for_each_object(function(inst) {
	inst.on_room_load()
})

if instance_exists(IndoorsFlag) {
	sound_play_ambience(sndAmbientIndoors)
}
else {
	sound_play_ambience(sndAmbientOutdoors)
}

if instance_exists(Transition) {
	pause_instances()
}