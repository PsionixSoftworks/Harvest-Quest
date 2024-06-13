/// @description Draw the inventory to the screen
// Check if the inventory is active:
if (active)
{
	// Draw the inventory in the center of the screen:
	draw_sprite(sprInterfaceInventory, tab_index, xoffset, yoffset);
	
	if (tab_index == 0)
	{
		// Next, draw the cursor over each of the slots. To do that, we must first get the mouse coordinates 
		// on screen:
		var _mx, _my;
			_mx = device_mouse_x_to_gui(0);
			_my = device_mouse_y_to_gui(0);
	
		// Now we must iterate through each of the slots:
		for (var j = 0; j < 3; j++)
		{
			for (var i = 0; i < 9; i++)
			{
				// And check if the mouse or touch is over a slot:
				if (_mx > xoffset + (i * 21) + 97 && _mx < xoffset + (i * 21) + 113 && _my > yoffset + (j * 22) + 63 && _my < yoffset + (j * 22) + 79)
				{
					// If so, we ned to draw the cursor over the corresponding slot:
					draw_sprite_ext(sprInterfaceCursor, 1, xoffset + (i * 21) + 97, yoffset + (j * 22) + 63, 1, 1, 0, c_white, 0.5);
				}
			}
		}
	}
}
