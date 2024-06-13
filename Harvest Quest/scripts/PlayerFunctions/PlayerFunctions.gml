/// @func player_find_state(state);
function player_find_state(_state)
{
	// Check if we're in "normal" state:
	if (_state == PlayerState.PLAYER_STATE_NORMAL)
		script_execute(player_state_normal);
	
	// Check if we're in "pickaxe" state:
	if (_state == PlayerState.PLAYER_STATE_PICKAXE)
		script_execute(player_state_pickaxe);
	
	// Check if we're in "axe" state:
	if (_state == PlayerState.PLAYER_STATE_AXE)
		script_execute(player_state_axe)
	
	// Check if we're in "watering" state:
	if (_state == PlayerState.PLAYER_STATE_WATERING)
		script_execute(player_state_watering);
	
	// Check if we're in "hoe" state:
	if (_state == PlayerState.PLAYER_STATE_HOE)
		script_execute(player_state_hoe);
		
	// Check if we're in "fishing" state:
	if (_state == PlayerState.PLAYER_STATE_FISHING)
		script_execute(player_state_fishing);
}

/// @func player_state_normal(void);
function player_state_normal()
{
	// Set the xspeed and yspeed to our key mapping:
	xspeed = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * spd;
	yspeed = (keyboard_check(ord("S")) - keyboard_check(ord("W"))) * spd;
	
	// Check for horizontal movement:
	if (xspeed == 0)
	{
		// Check for vertical movement:
		if (yspeed < 0)
		{
			facing = "Up";
		}
		else if (yspeed > 0)
		{
			facing = "Down";
		}
	}
	// This time, check for vertical movement first:
	else if (yspeed == 0)
	{
		// Check for horizontal movement:
		if (xspeed < 0)
		{
			facing = "Left";
		}
		else if (xspeed > 0)
		{
			facing = "Right";
		}
	}
	
	// Set the image speed relative to motion:
	image_speed = ((xspeed != 0 || yspeed != 0) ? (1 * spd) : 0);
	
	// Reset the image index when the Player stops moving:
	if (xspeed == 0 && yspeed == 0)
		image_index = 0;
}

/// @func player_state_sword(void);
function player_state_sword()
{
	// TODO: Fill this in later...
}

/// @func player_state_pickaxe(void);
function player_state_pickaxe()
{
	sprite_index = asset_get_index("sprChar1Pickaxe" + string(facing));
	image_speed = 1;
	
	// Find an ore when the player is facing down:
	var _inst = instance_place(x, y + 1, objOre);
	if (_inst != noone)
	{
		// Check if we're facing down:
		if (facing == "Down")
		{
			// Hit the rock each time the player's subimaage reaches the end:
			if (image_index >= image_number - 1)
			{
				if (!_inst.hit)
				{
					_inst.hp--;
					_inst.hit = true;
					_inst.yoffset = 1;
				}
			}
		}
	}
	
	// Find an ore when the player is facing up:
	var _inst = instance_place(x, y - 1, objOre);
	if (_inst != noone)
	{
		// Check if we're facing down:
		if (facing == "Up")
		{
			// Hit the rock each time the player's subimaage reaches the end:
			if (image_index >= image_number - 1)
			{
				if (!_inst.hit)
				{
					_inst.hp--;
					_inst.hit = true;
					_inst.yoffset = -1;
				}
			}
		}
	}
	
	// Find an ore when the player is facing right:
	var _inst = instance_place(x + 1, y, objOre);
	if (_inst != noone)
	{
		// Check if we're facing down:
		if (facing == "Right")
		{
			// Hit the rock each time the player's subimaage reaches the end:
			if (image_index >= image_number - 1)
			{
				if (!_inst.hit)
				{
					_inst.hp--;
					_inst.hit = true;
					_inst.xoffset = 1;
					_inst.yoffset = 1;
				}
			}
		}
	}
	
	// Find an ore when the player is facing left:
	var _inst = instance_place(x - 1, y, objOre);
	if (_inst != noone)
	{
		// Check if we're facing down:
		if (facing == "Left")
		{
			// Hit the rock each time the player's subimaage reaches the end:
			if (image_index >= image_number - 1)
			{
				if (!_inst.hit)
				{
					_inst.hp--;
					_inst.hit = true;
					_inst.xoffset = -1;
					_inst.yoffset = 1;
				}
			}
		}
	}
}

/// @func player_state_axe(void);
function player_state_axe()
{
	// TODO: Fill this in later...
}

/// @func player_state_watering(void);
function player_state_watering()
{
	// TODO: Fill this in later...
}

/// @func player_state_hoe(void);
function player_state_hoe()
{
	// TODO: Fill this in later...
}

/// @func player_state_fishing(void);
function player_state_fishing()
{
	// TODO: Fill this in later...
}

/// @func player_handle_collision(void);
function player_handle_collision()
{
	if (place_meeting(x + xspeed, y, objSolid))
	{
		while (!place_meeting(x + sign(xspeed), y, objSolid))
		{
			x += sign(xspeed);
		}
		xspeed = 0;
	}
	x += xspeed;
	
	if (place_meeting(x, y + yspeed, objSolid))
	{
		while (!place_meeting(x, y + sign(yspeed), objSolid))
		{
			y += sign(yspeed);
		}
		yspeed = 0;
	}
	y += yspeed;
}
