function Cache() constructor {
	map = ds_map_create();
	
	static get = function(key) {
		return map[? key];
	}
	
	static has = function(key) {
		return ds_map_exists(map, key);
	}
	
	static set = function(key, value) {
		map[? key] = value;
		return value;
	}
}

//Stores keys and values. Uses function to create values if not already set.
function IOCache(func) : Cache() constructor {
	maker = func
	
	static get = function(key) {
		if !has(key) {
			return set(key, maker(key))
		}
		return map[? key];
	}
}


function memoize_array(arrayLength, func) {
	var a = array_create(arrayLength);
	for (var i = 0; i < arrayLength; i++) {
		a[i] = func(i)
	}
	return a
}