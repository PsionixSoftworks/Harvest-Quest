/// @description Insert description here
// Inherit the parent event
event_inherited();

crop_strawberry			= new CropStrawberry();
crop_index				= crop_strawberry;

// Set the max growth stage for this crop (in number of days):
crop_set_growth_stage_max(crop_index, irandom_range(3, 4.5));
