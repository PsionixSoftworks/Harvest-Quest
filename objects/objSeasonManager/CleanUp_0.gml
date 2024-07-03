/// @description Cleanup the season manager.
// Check if the season list still exists. If so, destroy it here:
if (ds_exists(season_list, ds_type_list))
	ds_list_destroy(season_list);
