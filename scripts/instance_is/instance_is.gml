function instance_is(instance, obj) {
	if !variable_instance_exists(instance, "object_index") return false
    return instance.object_index == obj || object_is_ancestor(instance.object_index, obj)
}