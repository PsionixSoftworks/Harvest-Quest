/// @description Update the inventory system
// Check if active:
if (active)
{
	// Check if the user is clicking on or touching one of the tabs:
	if (device_mouse_check_button_pressed(0, mb_left))
	{
		// If so, we need to get the mouse position on the GUI layer:
		var _mx, _my;
			_mx = device_mouse_x_to_gui(0);
			_my = device_mouse_y_to_gui(0);
		
		// Iterate through the tabs:
		for (var i = 0; i < tab_count; i++)
		{
			// Check which tab we're clicking on:
			if (_mx > xoffset + (i * 21) + 118 && _mx < xoffset + (i * 21) + 134 && _my > yoffset + 24 && _my < yoffset + 42)
			{
				// Set the tab index to the corresponding index:
				tab_index = i;
			}
		}
	}
}
