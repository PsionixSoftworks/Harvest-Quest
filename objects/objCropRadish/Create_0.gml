/// @description Initialize the radish crop.
// Inherit the parent event
event_inherited();

// Create each variant of the radish here (if multiple):
crop_radish					= new CropRadish();

// Set the crop_index to the first crop declared for now:
crop_index					= crop_radish;

// Set the max growth stage for this crop (in number of days):
crop_set_growth_stage_max(crop_index, irandom_range(2.2, 7));
