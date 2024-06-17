/// @description Update the inventory system
// Check if active:
if (active)
{
	// If so, we need to get the mouse position on the GUI layer:
	var _mx, _my;
		_mx = device_mouse_x_to_gui(0);
		_my = device_mouse_y_to_gui(0);
	
	// Check if the user is clicking on or touching one of the tabs:
	if (device_mouse_check_button_pressed(0, mb_left))
	{		
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
		
		// Check if we are in the inventory tab:
		if (tab_index == 0)
		{
			// Iterate through the inventory slots:
			for (var j = 0; j < inventory_slots_y; j++)
			{
				for (var i = 0; i < inventory_slots_x; i++)
				{
					// Check if the mouse or touch is over a slot:
					if (_mx > xoffset + (i * 21) + 97 && _mx < xoffset + (i * 21) + 113 && _my > yoffset + (j * 22) + 63 && _my < yoffset + (j * 22) + 79)
					{
						// Store the item in a variable:
						var _item = inventory_list[| j * inventory_slots_x + i];
						
						// Now check if there is an item in the slot:
						if (_item != NULL)
						{
							var _inst, _idx;
								_inst = noone;
								_idx = j * inventory_slots_x + i;
							if (_item.item_type == ITEM_TYPE.ITEM_TYPE_SWORD)
							{
								_inst = instance_create_layer(mouse_x, mouse_y, "Instances", objItemSword);
								grabbed_item = _inst;
								inventory_list[| _idx] = NULL;
								last_slot = _idx;
							}
							else if (_item.item_type == ITEM_TYPE.ITEM_TYPE_PICKAXE)
							{
								_inst = instance_create_layer(mouse_x, mouse_y, "Instances", objItemPickaxe);
								grabbed_item = _inst;
								inventory_list[| _idx] = NULL;
								last_slot = _idx;
							}
							else if (_item.item_type == ITEM_TYPE.ITEM_TYPE_AXE)
							{
								_inst = instance_create_layer(mouse_x, mouse_y, "Instances", objItemAxe);
								grabbed_item = _inst;
								inventory_list[| _idx] = NULL;
								last_slot = _idx;
							}
							else if (_item.item_type == ITEM_TYPE.ITEM_TYPE_HOE)
							{
								_inst = instance_create_layer(mouse_x, mouse_y, "Instances", objItemHoe);
								grabbed_item = _inst;
								inventory_list[| _idx] = NULL;
								last_slot = _idx;
							}
							else if (_item.item_type == ITEM_TYPE.ITEM_TYPE_WATERING_CAN)
							{
								_inst = instance_create_layer(mouse_x, mouse_y, "Instances", objItemWateringCan);
								grabbed_item = _inst;
								inventory_list[| _idx] = NULL;
								last_slot = _idx;
							}
							else if (_item.item_type == ITEM_TYPE.ITEM_TYPE_FISHING_ROD)
							{
								_inst = instance_create_layer(mouse_x, mouse_y, "Instances", objItemFishingRod);
								grabbed_item = _inst;
								inventory_list[| _idx] = NULL;
								last_slot = _idx;
							}
						}
					}
				}
			}
		}
	}
	else if (device_mouse_check_button_released(0, mb_left))
	{
		if (tab_index == 0)
		{
			for (var j = 0; j < inventory_slots_y; j++)
			{
				for (var i = 0 ; i < inventory_slots_x; i++)
				{
					if (_mx > xoffset + (i * 21) + 97 && _mx < xoffset + (i * 21) + 113 && _my > yoffset + (j * 22) + 63 && _my < yoffset + (j * 22) + 79)
					{
						// Check if the item is valid:
						if (grabbed_item != noone)
						{
							// Check if the slot is empty:
							if (inventory_list[| j * inventory_slots_x + i] == NULL)
							{
								// Put the item in the slot the cursor is over:
								inventory_list[| j * inventory_slots_x + i] = grabbed_item.item_index;
								instance_destroy(grabbed_item);
								grabbed_item = noone;
							}
							else
							{
								// Put the item back in the last slot it was taken from:
								inventory_list[| last_slot] = grabbed_item.item_index;
								instance_destroy(grabbed_item);
								grabbed_item = noone;
							}
						}
					}
				} // TODO: Figure out how to put the item back in the last slot if the cursor isn't over it.
			}
		}
	}
}
