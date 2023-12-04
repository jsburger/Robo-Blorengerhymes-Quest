 // Feather disable GM2043

/// @param {Function} baseFunction
/// @desc An array of functions that you can call conveniently.
function CallStack(baseFunction = undefined) constructor {
	functions = [];
	if baseFunction != undefined {
		add_function(baseFunction)
	}
	
	/// @param {Function} func
	/// Add a function to the call stack
	static add_function = function(func) {
		array_push(functions, func)
	}
	
	/// @param {[Any]} args
	static call = function() {
		arguments_pack
		for (var i = 0, l = array_length(functions); i < l; i++) {
			method_call(functions[i], args)
		}
	}
	
	static as_function = function() {
		return method(self, call);
	}
}