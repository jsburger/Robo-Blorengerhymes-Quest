/// @description 
gc_offset = _GC_OFFSET.TEXT

depth = GameCont.depth - gc_offset

is_prompt = false;
blocking = true;
duration = 0
start_duration = 0
callback = undefined;
lines = []
progress = 0
text_progress = 0
can_proceed = false;
initiator = noone;

selected_option = 0;