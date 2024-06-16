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
		
		// Check if there is a grabbed item being held: 
		if (grabbed_item != noone)
		{
			// Set it to the mouse coords and make the original invisible (so we don't have two):
			grabbed_item.x = _mx - 8;
			grabbed_item.y = _my - 8;
			grabbed_item.visible = false;
			
			// Then draw it at the specified coordinates:
			draw_sprite(grabbed_item.sprite_index, image_index, grabbed_item.x, grabbed_item.y);
		}
		
		// Now we must iterate through each of the slots:
		for (var j = 0; j < inventory_slots_y; j++)
		{
			for (var i = 0; i < inventory_slots_x; i++)
			{
				// Get the item index:
				var _item = inventory_list[| j * inventory_slots_x + i];
				
				// Check if an item exists in the inventory slots:
				if (_item != NULL)
				{
					// Get the sprite index:
					var _sprindex = inventory_get_item_icon(_item);
					if (_sprindex != -1)
					{
						draw_sprite(_sprindex, image_index, xoffset + (i * 21) + 97, yoffset + (j * 22) + 63);
					}
				}
				
				// And check if the mouse or touch is over a slot after the item so this appears over the item:
				if (_mx > xoffset + (i * 21) + 97 && _mx < xoffset + (i * 21) + 113 && _my > yoffset + (j * 22) + 63 && _my < yoffset + (j * 22) + 79)
				{
					// If so, we ned to draw the cursor over the corresponding slot:
					draw_sprite_ext(sprInterfaceCursor, 1, xoffset + (i * 21) + 97, yoffset + (j * 22) + 63, 1, 1, 0, c_white, 0.5);
				}
			}
		}
	}
}
