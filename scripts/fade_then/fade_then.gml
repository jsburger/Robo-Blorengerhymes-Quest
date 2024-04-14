/// @param {Function} callback
function fade_then(callback, args = undefined){
	with instance_create(0, 0, FadeThen) {
		self.callback = callback
		callback_args = args
	}
}