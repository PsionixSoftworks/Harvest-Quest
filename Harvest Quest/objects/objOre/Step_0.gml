/// @description Update the ore rocks
// Check if this ore has been hit (to prevent more than one hit per frame):
if (hit)
{
	if (hit_timer > 0)
	{
		hit_timer--;
	}
	else
	{
		hit_timer	= room_speed / 10;
		hit			= false;
		xoffset		= 0;
		yoffset		= 0;
	}
}

// Check if the HP of this ore is less than or equal to 0:
if (hp <= 0)
{
	// Destroy it:
	instance_destroy();
}
