/// @description Draws shadowed text at the x and y position.
/// @param _x The x position
/// @param _y the y position
/// @param _text The text to be displayed with a shadow.
function draw_text_shadowed(_x, _y, _text)
{
	// Set the shadow color:
	draw_set_color(c_dkgray);
	
	// Draw the shadowed text first:
	draw_text(_x + 1, _y + 1, _text);
	
	// Reset the color back to white:
	draw_set_color(c_white);
	
	// And draw the text in its rightful place:
	draw_text(_x, _y, _text);
}
