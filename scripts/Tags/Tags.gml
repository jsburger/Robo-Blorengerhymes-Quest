
// Feather disable GM2043
// Feather disable GM1041
global.solids = new TaggedObjects("Solid")
//global.projectile_blockers = new TaggedObjects("StopsProjectiles")
global.clickable_objects = new TaggedObjects("Clickable")
global.pausable_objects = new TaggedObjects("Pausable")
global.relative_to_gamecont = new TaggedObjects("GC Relative")
global.signal_receivers = new TaggedObjects("Signal Receiver")
global.room_loaders = new TaggedObjects("Room Load Listener")
global.room_starters = new TaggedObjects("Room Start Listener")

function TaggedObjects(_tag) constructor {
    tag = _tag;
    contents = [];
    populate();
    
    static populate = function() {
        var assets = tag_get_asset_ids(tag, asset_object);
        
        //Filter out child objects whos parents already have the tag, to avoid repeated code execution.
        for (var p = 0; p < array_length(assets); p++) {
            for (var _colors = 0; _colors < array_length(assets); _colors++) {
                if (object_is_ancestor(assets[_colors], assets[p])) {
                    //Remove child object
                    array_delete(assets, _colors, 1)
                    //Move p and c back one, to account for the array getting shorter
                    if p >= _colors p -= 1
                    _colors -= 1
                }
            }
        }
		
		contents = assets
		
    }

	static for_each_object = function(callback) {
		for (var i = 0, l = array_length(contents); i < l; i++) {
			with contents[i] callback(self)
		}
	}

	static instances = function() {
		var a = [];
		for(var i = 0, l = array_length(contents); i < l; i++) {
			with contents[i] array_push(a, self)
		}
		return a;
	}
	
	static pos_meeting = function(_x, _y) {
		return position_meeting(_x, _y, contents)
	}
	
	static _place_meeting = function(_x, _y, caller) {
		with caller {
			return place_meeting(_x, _y, other.contents)
		}
		return false
	}
}

function place_free_tagged(_x, _y) {
	return !place_meeting(_x, _y, global.projectile_blockers.contents)
}

function place_free_bounce(_x, _y){
	var is_place_free = false;
	if !place_free_tagged(_x + hspeed, _y){hspeed *= -1; is_place_free = true}
	if !place_free_tagged(_x, _y + vspeed){vspeed *= -1; is_place_free = true}
	return is_place_free;
}

function solid_at(_x, _y) {
	return position_meeting(_x, _y, global.solids.contents)
}

function proj_block_at(_x, _y) {
	return position_meeting(_x, _y, global.projectile_blockers.contents)
}

function place_meeting_solid(_x, _y) {
	return place_meeting(_x, _y, global.solids.contents)
}

function turret_can_see(x1, y1, x2, y2) {
	var p = collision_line(x1, y1, x2, y2, global.projectile_blockers.contents, true, false)
	return !instance_exists(p);
	
}