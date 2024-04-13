/// @description 

solved = false;

serializable_init

should_serialize = function() {
	return solved
}
serializer.add_layer(function() {
	return {solved}
})