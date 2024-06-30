/// @description Insert description here
// Inherit the parent event
event_inherited();

crop_pumpkin				= new CropPumpkin();
crop_index					= crop_pumpkin;

// Set the max growth stage for this crop (in number of days):
crop_set_growth_stage_max(crop_index, irandom_range(9, 10));
