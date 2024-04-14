/// @description 
if sprite_index == spr_talk {
	if !instance_exists(Textbox) || Textbox.can_proceed{
		sprite_index = spr_idle
	}
}