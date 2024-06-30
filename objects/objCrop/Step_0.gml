/// @description Insert description here
// You can write your code in this editor
if (crop_index != noone)
{
	var _age, _growth_stage, _growth_stage_max;
		_age = crop_get_age(crop_index);
		_growth_stage_max = crop_get_growth_stage_max(crop_index);
	if (_growth_stage_max != 0)
		_growth_stage = (_age / _growth_stage_max) * 5;
	else
		_growth_stage = 0;
	crop_set_growth_stage(crop_index, min(_growth_stage, 5));
}
