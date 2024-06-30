/// @description Initialize the potato crop.
// Inherit the parent event
event_inherited();

// Create each variant of the potato here (if multiple):
crop_potato					= new CropPotato();

// Set the crop_index to the first crop declared for now:
crop_index					= crop_potato;

// Set the max growth stage for this crop (in number of days):
crop_set_growth_stage_max(crop_index, irandom_range(9, 12));
