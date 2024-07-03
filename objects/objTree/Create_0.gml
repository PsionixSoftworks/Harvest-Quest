/// @description Initialize the tree parent.
// Declare instance variables:
can_be_harvested		= false;
hp_max					= 10;
hp						= hp_max;
hit						= false;
hit_timer				= game_get_speed(gamespeed_fps) / 10;
harvested				= false;
season_index			= global.current_season;
tree_sprite				= sprite_index;
stump_sprite			= -1;

// Declare built-in variables:
depth					= -y;
