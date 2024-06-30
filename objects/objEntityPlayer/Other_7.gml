/// @description Trigger animation end
// check what state we were last in:
if (state != PLAYER_STATE.PLAYER_STATE_NORMAL)
{
	// Reset the frame and animation speed to 0, set the action back to walk, and switch back to normal state:
	image_index = 0;
	image_speed = 0;
	action = "Walk";
	state = PLAYER_STATE.PLAYER_STATE_NORMAL;
}
