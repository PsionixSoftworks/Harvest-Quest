/// @description Handle seasonal changes on room start.
// Find the season manager:
var _season_mgr = instance_find(objSeasonManager, 0);
if (instance_exists(_season_mgr))
{
	// Set the season index:
	season_index = global.current_season;
}
