/// @description Draw the ore
// First, draw the ore itself:
draw_sprite(sprite_index, image_index, x + xoffset, y + yoffset);

// Next, check if the ore has been damaged:
if (hp < hp_max)
{
	// If it has, display a healthbar above it:
	draw_healthbar(x - 8, y - 17, x + 8, y - 16, (hp / hp_max) * 100, c_black, c_red, c_green, 0, true, false);
}
