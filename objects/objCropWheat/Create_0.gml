/// @description Initialize the wheat crop.
// Inherit the parent event
event_inherited();

// Create each variant of the wheat here (if multiple):
crop_wheat					= new CropWheat();

// Set the crop_index to the first crop declared for now:
crop_index					= crop_wheat;

// Set the max growth stage for this crop (in number of days):
crop_set_growth_stage_max(crop_index, irandom_range(10, 13));
