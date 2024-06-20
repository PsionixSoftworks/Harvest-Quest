/// @description Trigger animation end
// check what state we were last in:
if (state == PLAYER_STATE.PLAYER_STATE_PICKAXE)
{
	image_index = 0;
	image_speed = 0;
	action = "Walk";
	state = PLAYER_STATE.PLAYER_STATE_NORMAL;
}
