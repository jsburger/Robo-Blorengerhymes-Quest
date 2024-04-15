enum ITEMS {
	BRICK,
	DUMBELL,
	FISH,
	BUCKET,
	GLOVE,
	
	_MAX
}

global.items = [];
global.consumed_items = []
global.buried_item = -1;
global.selected_item = 0
add_reset_hook(function() {
	global.items = []
	global.selected_item = 0
	global.consumed_items = []
	global.buried_item = -1
})

function has_item(item) {
	return array_contains(global.items, item)
}

function give_item(item) {
	array_push(global.items, item)
	with Player with instance_create(x, y, ItemPickupDisplay) {
		image_index = item
	}
}

function item_should_spawn(item) {
	if has_item(item) return false
	if array_contains(global.consumed_items, item) return false 
	if item == global.buried_item return false
	return true
}

function consume_item(item) {
	if has_item(item) {
		array_push(global.consumed_items, item)
		array_delete(global.items, array_find(global.items, item), 1)
	}
}

function remove_item(item) {
	if has_item(item)
		array_delete(global.items, array_find(global.items, item), 1)
}

function item_get_name(item) {
	static values = ["Brick", "Dumbell", "Fish", "Bucket", "Boxing Glove"];
	return values[item]
}

function item_current() {
	if array_length(global.items) <= 0 return -1
	return global.items[global.selected_item]
}