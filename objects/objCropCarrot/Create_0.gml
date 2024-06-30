/// @description Insert description here
// Inherit the parent event
event_inherited();

crop_carrot			= new CropCarrot();
crop_index			= crop_carrot;

// Set the max growth stage for this crop (in number of days):
crop_set_growth_stage_max(crop_index, irandom_range(5, 8));

crop_index.age = 112;
