/// @description Initialize the strawberry crop.
// Inherit the parent event
event_inherited();

// Create each variant of the strawberry here (if multiple):
crop_strawberry			= new CropStrawberry();

// Set the crop_index to the first crop declared for now:
crop_index				= crop_strawberry;

// Set the max growth stage for this crop (in number of days):
crop_set_growth_stage_max(crop_index, irandom_range(3, 4.5));
