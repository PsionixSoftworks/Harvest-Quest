/// @description Update the crops based on age.
// Check if the crop_index exists:
if (crop_index != noone)
{
	// Declare local variables:
	var _age, _growth_stage, _growth_stage_max;
		_age = crop_get_age(crop_index);
		_growth_stage_max = crop_get_growth_stage_max(crop_index);
		
	// Check if the max growth stage is greater than 0 (to avoid division by zero error):
	if (_growth_stage_max != 0)
	{
		// If so, update the growth stage:
		_growth_stage = (_age / _growth_stage_max) * 5;
	}
	else
	{
		// Otherwise set the growth stage to zero:
		_growth_stage = 0;
	}
	
	// Set the crop index's grwoth stage (with a maximum of number of frames):
	crop_set_growth_stage(crop_index, min(_growth_stage, 5));
}
