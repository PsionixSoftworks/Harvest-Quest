/// @description Insert description here
// You can write your code in this editor
if (crop_index != NULL)
{
	var _age, _wet;
		_age = crop_get_age(crop_index);
		_wet = crop_is_wet(crop_index);
	draw_sprite(sprite_index, _age + (_wet * 6), x, y);
}
