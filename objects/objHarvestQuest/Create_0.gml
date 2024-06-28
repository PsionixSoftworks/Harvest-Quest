/// @description Initialize the entire game.
// Setup the game:
game_state				= GAME_STATE.GAME_STATE_MENU;
global.start_room		= rmTest01;
global.farm_room		= rmTest01;
global.current_season	= SEASONS.SPRING;

// Check what room we're in:
if (room == rmInit)
{
	// This is temporary! Later, when the game is more polished, 
	// this will only be triggered from the title screen:
	game_state = GAME_STATE.GAME_STATE_PLAY;
	room_goto(global.start_room);
}

// We need to adjust the GUI layer to the screen size for things to render properly:
var _w, _h;
	_w = camera_get_view_width(view_camera[0]);
	_h = camera_get_view_height(view_camera[0]);
display_set_gui_size(_w, _h);

// Set the game's font:
draw_set_font(fntGameText);
