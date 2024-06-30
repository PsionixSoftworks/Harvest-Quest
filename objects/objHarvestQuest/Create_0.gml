/// @description Initialize the entire game.
// You can write your code in this editor
// Declare global variables:
global.test_room		= rmTest01;						// This will be the reference to the test room.
global.start_room		= global.test_room;				// This will be the start room until release.
global.farm_room		= global.test_room;				// This will be the farm room until release.
global.current_season	= SEASONS.SPRING;				// The game always starts out in spring.

// Declare instance variables:
game_state				= GAME_STATE.GAME_STATE_MENU;	// This will change based on whether or not we are in a menu room or a playable area
initialized				= false;						// This is just for general initialization.
