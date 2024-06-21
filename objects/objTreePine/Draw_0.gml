/// @description Draw the tree
// Check if the tree has been harvested:
if (!harvested)
{
	// If not, draw the tree itself:
	draw_sprite(sprite_index, image_index, x, y);
	
	// Check the season:
	if (global.current_season == SEASONS.WINTER)
	{
		// If the season is winter, we need to draw the snow (this will change to a sprite later):
		draw_sprite(sprTreePineSnow, image_index, x, y);
	}
}
else
{
	// Draw the tree stump in its place (I know the color is off, but the artist didn't make stumps 
	// for all trees, let alone seasons...):
	draw_sprite(sprTreePineStump, image_index, x, y);
}

// Check if the tree has been harvested (so we only show the healthbar if it's damaged, and not harvested):
if (!harvested)
{
	// Next, check if the tree has been damaged:
	if (hp < hp_max)
	{
		// If it has, display a healthbar above it:
		draw_healthbar(x - 8, y - 17, x + 8, y - 16, (hp / hp_max) * 100, c_black, c_red, c_green, 0, true, false);
	}
}
