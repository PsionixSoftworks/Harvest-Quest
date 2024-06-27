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
			var _sprindex = inventory_get_item_icon(grabbed_item.item_index);
			if (_sprindex != -1)
			{
				var _item_id = item_get_id(grabbed_item.item_index);
				draw_sprite(_sprindex, _item_id, grabbed_item.x, grabbed_item.y);
			}
		}
		
		// Now we must iterate through each of the slots:
		for (var j = 0; j < inventory_slots_y; j++)
		{
			for (var i = 0; i < inventory_slots_x; i++)
			{
				// Get the item index:
				var _item = inventory_slots[| j * inventory_slots_x + i];
				
				// Check if an item exists in the inventory slots:
				if (_item != NULL)
				{
					// Get the sprite index:
					var _sprindex	= inventory_get_item_icon(_item);
					var _item_id	= inventory_get_item_id(_item);
					if (_sprindex != -1)
					{
						var	_xx = xoffset + (i * 21) + 97;
						var	_yy = yoffset + (j * 22) + 63;
						draw_sprite(_sprindex, _item_id, _xx, _yy);
						
						// Check if the item is breakable:
						if (inventory_item_is_breakable(_item))
						{
							// Check if it has been damaged:
							if (_item.durability < _item.durability_max)
							{
								// Get the healthbar percent:
								var _percent = (_item.durability / _item.durability_max) * 100;
								
								// Draw a healthbar over the item:
								draw_healthbar(_xx + 1, _yy + 12, _xx + 14, _yy + 13, _percent, c_black, c_red, c_green, 0, true, false);
							}
						}
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

// Find the hotbar instance:
var _inst = instance_find(objInterfaceHotbar, 0);
if (!instance_exists(_inst))
	return;

// The hotbar needs to be rendered regardless of the inventory's active flag. All items in it will need to be rendered:
for (var i = 0; i < hotbar_slot_count; i++)
{
	// Next, we need to check what is in each slot. It should be non-null:
	var _item = hotbar_slots[| i];
	if (_item != NULL)
	{
		var _sprindex = hotbar_get_item_icon(_item);
		if (_sprindex != -1)
		{
			var _item_id = hotbar_get_item_id(_item);
			draw_sprite_ext(_sprindex, _item_id, _inst.xoffset + (i * 22) + 8, _inst.yoffset + 9, 1, 1, 0, c_white, 1.0);
		}
	}
}
