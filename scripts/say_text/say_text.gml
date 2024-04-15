function say_text(initiator, lines, callback = undefined) {
	if !is_array(lines) lines = [lines]
	with instance_create_depth(0, 0, 0, Textbox) {
		self.lines = lines 
		self.callback = callback
		self.initiator = initiator
	}
	if instance_exists(initiator) && variable_instance_exists(initiator, "talk") initiator.talk()
}

#macro say_line say_text

function say_text_nonblocking(initiator, duration, lines, callback = undefined) {
	if !is_array(lines) lines = [lines]
	with instance_create_depth(0, 0, 0, Textbox) {
		self.lines = lines 
		self.callback = callback
		self.initiator = initiator
		blocking = false;
		self.duration = duration
		self.start_duration = duration
	}
	if instance_exists(initiator) && variable_instance_exists(initiator, "talk") initiator.talk()
}

function say_prompt(initiator, prompt, options, callbacks) {
	with instance_create_depth(0, 0, 0, Textbox) {
		is_prompt = true
		var a = array_clone(options)
		array_insert(a, 0, prompt)
		self.lines = a
		self.callback = callbacks
		self.initiator = initiator
	}
	if instance_exists(initiator) && variable_instance_exists(initiator, "talk") initiator.talk()
}