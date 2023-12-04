function mask_meeting(mask, _x, _y, object, rotation = 0, maskFrame = 0){
	static instance = instance_create(0, 0, MaskCollider);
	if (!instance_exists(instance)) {
		instance = instance_create(0, 0, MaskCollider)
	}
	with instance {
		sprite_index = mask
		mask_index = mask
		image_index = maskFrame
		image_angle = rotation
		return place_meeting(_x, _y, object)		
	}
}

function instance_place_mask(mask, _x, _y, object, rotation = 0, maskFrame = 0) {
	static instance = instance_create(0, 0, MaskCollider);
	if (!instance_exists(instance)) {
		instance = instance_create(0, 0, MaskCollider)
	}
	with instance {
		sprite_index = mask
		mask_index = mask
		image_index = maskFrame
		image_angle = rotation
		return instance_place(_x, _y, object)		
	}
}

function instance_place_mask_list(mask, _x, _y, object, rotation = 0, maskFrame = 0) {
	static instance = instance_create(0, 0, MaskCollider);
	if (!instance_exists(instance)) {
		instance = instance_create(0, 0, MaskCollider)
	}
	with instance {
		sprite_index = mask
		mask_index = mask
		image_index = maskFrame
		image_angle = rotation
		x = _x
		y = _y
		var a = [];
		var inst = instance_place(_x, _y, object)
		while instance_exists(inst) {
			array_push(a, inst)
			inst.x += 10000
			inst = instance_place(_x, _y, object)
		}
		for (var i = 0; i < array_length(a); i++) {
			a[i].x -= 10000
		}
		return a;
	}
}