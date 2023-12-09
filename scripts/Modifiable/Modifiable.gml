enum OPERATIONS {
	PASS,
	SET,
	ADD,
	MULTIPLY
}

function Modifiable(startingValue) constructor {
	value = startingValue;
	modifiers = [];
	out_value = value;
	
	dirty = false;
	
	has_listener = false;
	listeners = new CallStack();
	
	is_boolean = is_bool(startingValue);
	
	/// @pure
	static get = function() {
		validate()
		return out_value;
	}
	
	static set = function(input) {
		value = input;
		dirty = true;
		validate()
		return self;
	}
	
	/// @pure
	static modify = function() {
		dirty = true;
		var _modifier = new Modifier(self);
		array_push(modifiers, weak_ref_create(_modifier))
		return _modifier
	}
	
	/// @pure
	/// Creates a temporary modifier that lasts for Time frames
	static modify_for = function(time) {
		var modifier = modify(),
			struct = {time, modifier};
		array_push(__modifiable_step.structs, struct)
		return modifier
	}
	
	/// @param {Function} callback
	/// Call this function when value updates
	static on_change = function(callback) {
		has_listener = true
		listeners.add_function(callback)
	}
	
	#region Internals
	static check_dirty = function() {
		//if dirty return true;
		for (var i = 0; i < array_length(modifiers); i++) {
			var kill = true;
			if weak_ref_alive(modifiers[i]) {
				if modifiers[i].ref.dirty {
					dirty = true;
				}
				kill = modifiers[i].ref.dead
			}
			if kill {
				array_delete(modifiers, i, 1);
				i--
				dirty = true
			}
		}
		return dirty
	}
	
	static validate = function() {
		var old_value = out_value;
		if check_dirty() {
			var _value = value;
			for (var i = 0; i < array_length(modifiers); i++) {
				_value = modifiers[i].ref.apply(_value)
			}
			dirty = false;
			out_value = _value;
			if is_boolean {
				out_value = bool(out_value)
			}
			if (has_listener && out_value != old_value) {
				listeners.call(out_value)
			}
		}
	}
	#endregion
}

/// @ignore
function __modifiable_step() {
	static structs = [];
	for (var i = 0; i < array_length(structs); i++) {
		structs[i].time -= 1;
		if structs[i].time <= 0 {
			structs[i].modifier.clear()
			delete structs[i]
			array_delete(structs, i, 1)
			i--
		}
	}
}

#region Modifiers
	/// @param {Struct.Modifiable} _source
	function Modifier(_source) constructor {
		operation = OPERATIONS.PASS
		value = undefined;
		dirty = true;
		dead = false;
		
		source = weak_ref_create(_source);
		
		static apply = function(input) {
			dirty = false;
			switch (operation) {
				case(OPERATIONS.PASS):
					return input;
				case(OPERATIONS.SET):
					return value;
				case(OPERATIONS.ADD):
					return input + value;
				case(OPERATIONS.MULTIPLY):
					return input * value;
			}
		}

		static change = function(_operation, _value) {
			if (_operation != operation || _value != value) {
				dirty = true
			}
			operation = _operation
			value = _value;
			if dirty || dead {
				if weak_ref_alive(source) {
					source.ref.validate()
				}
			}
			return self
		}
		
		static set = function(_value) {
			return change(OPERATIONS.SET, _value);
		}
		
		static add = function(_value) {
			return change(OPERATIONS.ADD, _value);
		}
		
		static multiply = function(_value) {
			return change(OPERATIONS.MULTIPLY, _value);
		}
		
		/// @desc Removes this modifier from the source
		static clear = function() {
			dead = true
			change(OPERATIONS.PASS, 0)
			return self
		}
		
		/// @desc Disables this modifier without removing it
		static disable = function() {
			return change(OPERATIONS.PASS, value)
		}
		
	}
	#endregion