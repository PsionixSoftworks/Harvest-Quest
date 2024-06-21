/// @description Update the pine tree
// Check if this tree has been hit (to prevent more than one hit per frame):
if (hit)
{
	
	if (hit_timer > 0)
	{
		hit_timer--;
	}
	else
	{
		hit_timer	= game_get_speed(gamespeed_fps) / 10;
		hit			= false;
	}
}
else
{
	sprite_index = sprTreePine;
}

// Check if the HP of this ore is less than or equal to 0:
if (hp <= 0)
{
	// Tell the game this tree is harvested:
	harvested = true;
}
