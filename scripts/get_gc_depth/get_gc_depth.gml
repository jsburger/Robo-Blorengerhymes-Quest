function get_gc_depth(offset){
	return layer_get_depth(get_highest_layer()) - offset
}

function get_highest_layer() {
	var layers = layer_get_all();
	return array_least_mapped(layers, function(l) {
		return layer_get_depth(l)
	})
}