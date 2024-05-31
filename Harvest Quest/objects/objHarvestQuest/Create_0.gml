/// @description Initialize the entire game.
// Setup the game:
game_state = GameState.GAME_STATE_MENU;
global.start_room = rmTest_01;

// Check what room we're in:
if (room == rmInit)
{
	// This is temporary! Later, when the game is more polished, 
	// this will only be triggered from the title screen:
	game_state = GameState.GAME_STATE_PLAY;
	room_goto(global.start_room);
}
