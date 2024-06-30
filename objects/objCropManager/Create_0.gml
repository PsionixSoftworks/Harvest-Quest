/// @description Create and initialize the crop manager.
// Declare global variables:
globalvar grid_w, grid_h, crop_data;
grid_w					= 16;							// The grid width needs to be the same width as the tiles.
grid_h					= 16;							// The grid height needs to be the same height as the tiles.
crop_data				= ds_list_create();				// For storing, manipulating, and saving the crops.

// Declare instance variables:
room_has_crops			= false;						// Flag for whether or not a room has crops. If so, it allows us to clear crop data to avoid duplicate entries in the list.
