/// @description Initialize the carrot crop.
// Inherit the parent event
event_inherited();

// Create each variant of the carrot here (if multiple):
crop_carrot			= new CropCarrot();

// Set the crop_index to the first crop declared for now:
crop_index			= crop_carrot;

// Set the max growth stage for this crop (in number of days):
crop_set_growth_stage_max(crop_index, irandom_range(5, 8));
