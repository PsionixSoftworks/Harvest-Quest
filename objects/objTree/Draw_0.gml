/// @description Draw the tree in its current state.
// Check if the tree can be harvested:
if (can_be_harvested)
{
	// Now check if the tree has been harvested:
	if (harvested)
	{
		// Check if the stump has a sprite:
		if (stump_sprite != -1)
		{
			// Just draw the stump in its place:
			draw_sprite(stump_sprite, image_index, x, y);
		}
	}
	else
	{
		// Check if the tree has a sprite:
		if (tree_sprite != -1)
		{
			// Draw the tree sprite in its season index:
			draw_sprite(tree_sprite, season_index, x, y);
		}
	}
	
	// Check if the tree has been harvested (so we only show the healthbar if it's damaged, and not harvested):
	if (!harvested)
	{
		// Next, check if the tree has been damaged:
		if (hp < hp_max)
		{
			// If it has, display a healthbar above it:
			draw_healthbar(x - 8, y - 17, x + 8, y - 16, (hp / hp_max) * 100, $222222, c_red, c_green, 0, true, false);
		}
	}
}
