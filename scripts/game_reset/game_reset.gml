function add_reset_hook(func) {
	static hooks = [];
	array_push(hooks, func)
}

function game_reset(){
	array_foreach(add_reset_hook.hooks, function(i){i()})
	game_restart()
}