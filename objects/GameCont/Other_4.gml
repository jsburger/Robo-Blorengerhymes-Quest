/// @description Correct depth after changing rooms
layer = layer_get_id("Instances")

var inst = global.relative_to_gamecont.instances()
for (var i = 0; i < array_length(inst); i++) {
	inst[i].depth = GameCont.depth - inst[i].gc_offset
}

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
if instance_exists(Transition) {
	pause_instances()
}