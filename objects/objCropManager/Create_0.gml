/// @description Create and initialize the crop manager.
// Declare the grid width and height:
globalvar grid_w, grid_h;
grid_w					= 16;
grid_h					= 16;

// Declare the crop data structure:
globalvar crop_data;
crop_data				= ds_list_create();

// Flag to check if we need to clear the crop data structure upon entering a room:
room_has_crops			= false;