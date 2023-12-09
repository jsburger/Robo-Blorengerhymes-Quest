/// @description 
visible = false;

has_emitted = false;
last_value = starting_value

serializable_init

can_serialize = true;
should_serialize = function() {
	return array_contains(output_type, OutType.ONCE_EVER)
}
serializer.add_layer(
	function() {
		return {
			has_emitted
		}
	}
)