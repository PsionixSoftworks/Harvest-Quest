/// @description Initialize the entire game.
// Check if we've initialized the game yet or not:
if (!initialized)
{
	// Check what room we're in:
	if (room == rmInit)
	{	
		// We need to adjust the GUI layer to the screen size for things to render properly:
		var _w, _h;
			_w = camera_get_view_width(view_camera[0]);
			_h = camera_get_view_height(view_camera[0]);
		display_set_gui_size(_w, _h);
		
		// Set the game's font:
		draw_set_font(fntGameText);

		// And finally, raandomize the game seed (pun intended):
		randomize();
		
		// This is temporary! Later, when the game is more polished, 
		// this will only be triggered from the title screen:
		game_state = GAME_STATE.GAME_STATE_PLAY;
		if (room_exists(global.start_room))
		{
			room_goto(global.start_room);
		}
	}
	
	// Tell the game we're initialized:
	initialized			= true;
}

// Check if we are now in the start room (will change based on last save):
if (room == global.start_room)
{
	// Check to make sure all instances we need are present:
	check_instances();
}
