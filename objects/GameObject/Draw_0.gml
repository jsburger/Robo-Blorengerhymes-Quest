/// @description Draw with flash if enabled
if flash > 0 set_flash(true)
draw_self()
if flash > 0 set_flash(false)
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true)