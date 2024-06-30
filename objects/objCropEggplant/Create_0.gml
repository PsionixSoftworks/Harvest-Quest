/// @description Initialize the eggplant crop.
// Inherit the parent event
event_inherited();

// Create each variant of the eggplant here (if multiple):
crop_eggplant				= new CropEggplant();

// Set the crop_index to the first crop declared for now:
crop_index					= crop_eggplant;

// Set the max growth stage for this crop (in number of days):
crop_set_growth_stage_max(crop_index, irandom_range(6.5, 13));
