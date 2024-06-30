/// @description Initialize the lettuce crop.
// Inherit the parent event
event_inherited();

// Create each variant of the lettuce here (if multiple):
crop_lettuce				= new CropLettuce();

// Set the crop_index to the first crop declared for now:
crop_index					= crop_lettuce;

// Set the max growth stage for this crop (in number of days):
crop_set_growth_stage_max(crop_index, irandom_range(4.5, 5.5));
