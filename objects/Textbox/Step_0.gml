/// @description 

if !is_prompt {
	if progress < string_length(lines[text_progress]) {
		progress += .75
	}
	else {
		can_proceed = true
		if !blocking && duration > 0 {
			duration -= 1
		}
		if button_pressed(inputs.proceed) || (!blocking && duration <= 0) {
			duration = start_duration
			progress = 0
			can_proceed = false
			text_progress++
			if text_progress >= array_length(lines) {
				if callback != undefined callback()
				instance_destroy(self)
			}
			else {
				if instance_exists(initiator) && variable_instance_exists(initiator, "talk") {
					initiator.talk()
				}
			}
		}
	}
}
else {
	var l = 0, linecount = array_length(lines);
	for (var i = 0; i < linecount; ++i) {
		l = max(l, string_length(lines[i]))
	}
	if progress < l {
		progress += .75
	}
	else {
		can_proceed = true
		if button_pressed(inputs.up) {
			selected_option -= 1;
			if selected_option == -1 {
				selected_option = linecount - 2
			}
		}
		if button_pressed(inputs.down) {
			selected_option += 1;
			if selected_option >= linecount - 1 {
				selected_option = 0
			}
		}
		if button_pressed(inputs.proceed) {
			if is_array(callback) {
				if callback[selected_option] != undefined {
					callback[selected_option]()
					instance_destroy(self)
				}
			}
		}
	}
}

global.time_pause = true;