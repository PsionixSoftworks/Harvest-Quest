/// @description Create the ore parent
// Initialize instance variables:
hp_max					= 0;							// Number4 of hits to destroy.
hp						= 0;							// Current hits remaining.
hit						= false;						// Has it been hit yet?
hit_timer				= game_get_speed(gamespeed_fps) / 10;
xoffset					= 0;							// Used for when the rock is hit on the x-axis.
yoffset					= 0;							// Used for when the rock is hit on the y-axis.

// Initialize built-in variables:
depth					= -y;
