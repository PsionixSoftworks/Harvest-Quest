/// @description Update the ore rocks
// Check if this ore has been hit (to prevent more than one hit per frame):
if (hit)
{
	// Make sure the hit timer is greater than 0:
	if (hit_timer > 0)
	{
		// If so, decrement by one:
		hit_timer--;
	}
	else
	{
		// Reset variables:
		hit_timer	= game_get_speed(gamespeed_fps) / 10;
		hit			= false;
		xoffset		= 0;
		yoffset		= 0;
	}
}

// Check if the HP of this ore is less than or equal to 0:
if (hp <= 0)
{
	// Destroy it. Later we'll add items the player can collect:
	instance_destroy();
}
