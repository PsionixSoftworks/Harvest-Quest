/// @description Draw the crops.
// Check if the crop_index exists:
if (crop_index != noone)
{
	// Declare local variables:
	var _growth_stage, _wet;
		_growth_stage = crop_get_growth_stage(crop_index);
		_wet = crop_is_wet(crop_index);
		
	// Draw the crop as it appears based on growth stage and wetness:
	draw_sprite(sprite_index, _growth_stage + (_wet * 6), x, y);
}
