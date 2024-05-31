/// @func player_find_state(state);
function player_find_state(_state)
{
	// Check if we're in "normal" state:
	if (_state == PlayerState.PLAYER_STATE_NORMAL)
		script_execute(player_state_normal);
}

/// @func player_state_normal(void);
function player_state_normal()
{
	// Set the xspeed and yspeed to our key mapping:
	xspeed = (keyboard_check(vk_right) - keyboard_check(vk_left))	* spd;
	yspeed = (keyboard_check(vk_down) - keyboard_check(vk_up))		* spd;
	
	// Move x and y relative to the xspeed and yspeed:
	x += xspeed;
	y += yspeed;
	
	// Check for horizontal movement:
	if (xspeed == 0)
	{
		// Check for vertical movement:
		if (yspeed < 0)
		{
			sprite_index = sprChar1WalkUp;
		}
		else if (yspeed > 0)
		{
			sprite_index = sprChar1WalkDown;
		}
	}
	// This time, check for vertical movement first:
	else if (yspeed == 0)
	{
		// Check for horizontal movement:
		if (xspeed < 0)
		{
			sprite_index = sprChar1WalkLeft;
		}
		else if (xspeed > 0)
		{
			sprite_index = sprChar1WalkRight;
		}
	}
	
	// Set the image speed relative to motion:
	image_speed = ((xspeed != 0 || yspeed != 0) ? (1 * spd) : 0);
	
	// Reset the image index when the Player stops moving:
	if (xspeed == 0 && yspeed == 0)
		image_index = 0;
}
