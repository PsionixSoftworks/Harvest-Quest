/// @description Initialize the Hotbar interface.
// Declare instance variables:
xoffset					= (camera_get_view_width(view_camera[0]) / 2) - (sprite_get_width(sprInterfaceHotbar) / 2);
yoffset					= 180 - 32;
active					= false;

// Declare built-in variables:
alarm[0]				= 1;							// Active timer.
