/// @description Initialize the tree parent.
// Declare instance variables:
season_list				= ds_list_create();
can_be_harvested		= false;

// Declare built-in variables:
depth					= -y;

// Set the season names based on the enum value:
ds_list_add(season_list, "Spring");
ds_list_add(season_list, "Summer");
ds_list_add(season_list, "Autumn");
ds_list_add(season_list, "Winter");
