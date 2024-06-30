/// @description Initialize the corn crop.
// Inherit the parent event
event_inherited();

// Create each variant of the corn here (if multiple):
crop_corn					= new CropCorn();

// Set the crop_index to the first crop declared for now:
crop_index					= crop_corn;

// Set the max growth stage for this crop (in number of days):
crop_set_growth_stage_max(crop_index, irandom_range(6, 10));
