function instance_is(instance, obj) {
    return instance.object_index == obj || object_is_ancestor(instance.object_index, obj)
}