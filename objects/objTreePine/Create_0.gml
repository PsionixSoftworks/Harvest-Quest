/// @description Create the pine tree.
// Inherit the parent event:
event_inherited();

// Declare instance variables:
can_be_harvested		= true;
hp_max					= 10;
hp						= hp_max;
hit						= false;
hit_timer				= game_get_speed(gamespeed_fps) / 10;
harvested				= false;
