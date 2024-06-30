/// @description Insert description here
// You can write your code in this editor
if (crop_index != noone)
{
	var _growth_stage, _wet;
		_growth_stage = crop_get_growth_stage(crop_index);
		_wet = crop_is_wet(crop_index);
	draw_sprite(sprite_index, _growth_stage + (_wet * 6), x, y);
}
