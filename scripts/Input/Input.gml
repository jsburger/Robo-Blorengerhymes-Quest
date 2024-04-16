function button_pressed(inputName) {
	return getInput(inputName, inputTypes.pressed);
}

function button_check(inputName) {
	return getInput(inputName, inputTypes.check);
}
function button_released(inputName) {
	return getInput(inputName, inputTypes.released);
}

enum inputs {
	up,
	down,
	left,
	right,
	//attack, //Punch
	pickup, //Pick up or throw
	item,   //Use item (like from inventory)
	interact,   //Talk to NPCs or use Signs
	pause,
	mouse_left,
	mouse_right,
	menu_select,
	proceed, //A
	back     //B
}

function getInput(inputName, inputType) {
	
	if instance_exists(Textbox) && !instance_is(self, Textbox) && Textbox.blocking return false
	
	var keys = [];

	switch (inputName) {
		case (inputs.up):
			keys = ["W", vk_up]
			break
		case (inputs.down):
			keys = ["S", vk_down]
			break
		case (inputs.right):
			keys = ["D", vk_right]
			break
		case (inputs.left):
			keys = ["A", vk_left]
			break
			
		case (inputs.interact):
		case (inputs.proceed):
			keys = ["I", "Z"]
			break
		case (inputs.pickup):
			keys = ["J", "C"]
			break
		case (inputs.item):
			keys = ["O", "X"]
			break
		case(inputs.back):
			keys = ["O", "X"]
			break
		
		case (inputs.pause):
			keys = [vk_escape, vk_tab];
			break;
			
		case (inputs.mouse_left):
			keys = [mb_left];
			break
		case (inputs.mouse_right):
			keys = [mb_right];
			break
		case (inputs.menu_select):
			keys = [mb_middle];
			break
			
	}
	
	for (var i = 0; i < array_length(keys); i++) {
		if check_button(keys[i], inputType) return true
	}
	return false
}

function check_button(input, inputType) {
	if is_string(input) {
		return get_key_function(ord(input), inputType)
	}
	if input == mb_left || input == mb_right || input = mb_middle {
		return get_mouse_function(input, inputType)
	}
	else return get_key_function(input, inputType)
}

function get_key_function(input, inputType) {
	switch(inputType) {
		case(inputTypes.pressed):
			return keyboard_check_pressed(input)
		case(inputTypes.check):
			return keyboard_check(input)
		case(inputTypes.released):
			return keyboard_check_released(input)
	}
}

function get_mouse_function(input, inputType) {
	switch(inputType) {
		case(inputTypes.pressed):
			return mouse_check_button_pressed(input)
		case(inputTypes.check):
			return mouse_check_button(input)
		case(inputTypes.released):
			return mouse_check_button_released(input)
	}
}

enum inputTypes {
	pressed,
	check,
	released,
}
