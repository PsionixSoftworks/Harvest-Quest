/// @description Insert description here
// Inherit the parent event
event_inherited();

crop_lettuce				= new CropLettuce();
crop_index					= crop_lettuce;

// Set the max growth stage for this crop (in number of days):
crop_set_growth_stage_max(crop_index, irandom_range(4.5, 5.5));
