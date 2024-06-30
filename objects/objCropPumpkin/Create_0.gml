/// @description Initialize the pumpkin crop.
// Inherit the parent event
event_inherited();

// Create each variant of the pumpkin here (if multiple):
crop_pumpkin				= new CropPumpkin();

// Set the crop_index to the first crop declared for now:
crop_index					= crop_pumpkin;

// Set the max growth stage for this crop (in number of days):
crop_set_growth_stage_max(crop_index, irandom_range(9, 10));
