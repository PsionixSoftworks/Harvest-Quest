/// @description Update the inventory system
// Check if active:
if (active)
{	
	// If so, we need to get the mouse position on the GUI layer:
	var _mx, _my;
		_mx = device_mouse_x_to_gui(0);
		_my = device_mouse_y_to_gui(0);
	
	// Initialize local variables:
	var _item, _hotbar;
		_item			= NULL;
		_hotbar			= noone;
	
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
						_item = inventory_slots[| j * inventory_slots_x + i];
						
						// Now check if there is an item in the slot:
						if (_item != NULL)
						{
							// Set the instance of the item and an index:
							var _inst, _idx;
								_inst = noone;
								_idx = j * inventory_slots_x + i;
								
							// Check if the item is non-null:
							if (_item.item_type != NULL)
							{
								// Get a valid instance layer:
								var _layer = find_valid_instance_layer("Instances");
								
								// Create the item (based on type) and assign its index:
								_inst = instance_create_layer(mouse_x, mouse_y, _layer, item_type_to_obj[_item.item_type]);
								_inst.item_index		= _item;
								
								// Set the grabbed item to the newly created item:
								grabbed_item			= _inst;
								
								// Clear the inventory slot:
								inventory_slots[| _idx] = NULL;
								
								// And tell the game which slot the item was picked up from:
								last_inventory_slot		= _idx;
								last_hotbar_slot		= -1;
							}
						}
					}
				}
			}
			
			// Now we must handle the hotbar. Iterate through the slots:
			for (var i = 0; i < hotbar_slot_count; i++)
			{
				// Find the hotbar instance:
				_hotbar = instance_find(objInterfaceHotbar, 0);
				if (!instance_exists(_hotbar))
					return;
				
				// Check if the mouse cursor is over a slot:
				if (_mx > _hotbar.xoffset + (i * 22) + 8 && _mx < _hotbar.xoffset + (i * 22) + 23 && _my > _hotbar.yoffset + 9 && _my < _hotbar.yoffset + 24)
				{					
					// Store the item in a variable:
					_item = hotbar_slots[| i];
				
					// Now check if there is an item in the slot:
					if (_item != NULL)
					{
						// Set the instance of the item to noone at first:
						var _inst = noone;
						
						// Check if the item type is non-null:
						if (_item.item_type != NULL)
						{
							// Create the item (based on type) and assign its index:
							_inst = instance_create_layer(mouse_x, mouse_y, "Instances", item_type_to_obj[_item.item_type]);
							_inst.item_index			= _item;
							
							// Set the grabbed item to the newly created item:
							grabbed_item				= _inst;
							
							// Clear the hotbar slot:
							hotbar_slots[| i]			= NULL;
							
							// And tell the game which slot the item was picked up from:
							last_hotbar_slot			= i;
							last_inventory_slot			= -1;
						}
					}
				}
			}
		}
	}
	// Check if the mouse button (or touch) was released:
	else if (device_mouse_check_button_released(0, mb_left))
	{
		// Check if we are in the inventory tab:
		if (tab_index == 0)
		{
			// Iterate through the inventory slots:
			for (var j = 0; j < inventory_slots_y; j++)
			{
				for (var i = 0 ; i < inventory_slots_x; i++)
				{
					// Check if the mouse cursor is over a hotbar slot:
					if (_mx > xoffset + (i * 21) + 97 && _mx < xoffset + (i * 21) + 113 && _my > yoffset + (j * 22) + 63 && _my < yoffset + (j * 22) + 79)
					{
						// Check if the item is valid:
						if (grabbed_item != noone)
						{
							// Check if the slot is empty:
							if (inventory_slots[| j * inventory_slots_x + i] == NULL)
							{
								// Put the item in the slot the cursor is over:
								inventory_slots[| j * inventory_slots_x + i] = grabbed_item.item_index;
								instance_destroy(grabbed_item);
								grabbed_item = noone;
							}
							else
							{
								// Put the item back in the last slot it was taken from:
								if (last_inventory_slot != -1)
								{
									inventory_slots[| last_inventory_slot] = grabbed_item.item_index;
									instance_destroy(grabbed_item);
									grabbed_item = noone;
								}
								else if (last_hotbar_slot != -1)
								{
									hotbar_slots[| last_hotbar_slot] = grabbed_item.item_index;
									instance_destroy(grabbed_item);
									grabbed_item = noone;
								}
							}
						}
					}
				} // TODO: Figure out how to put the item back in the last slot if the cursor isn't over it.
			}
			
			// Next, we need to be able to place an item in the hotbar for use. Let's iterate over the slots:
			for (var i = 0; i < hotbar_slot_count; i++)
			{
				// Find the hotbar instance:
				var _inst = instance_find(objInterfaceHotbar, 0);
				if (!instance_exists(_inst))
					return;
				
				// Check if the item is valid:
				if (grabbed_item != noone)
				{
					// We need to check if the item is over a slot, so let's get the mouse coords:
					if (_mx > _inst.xoffset + (i * 22) + 8 && _mx < _inst.xoffset + (i * 22) + 23 && _my > _inst.yoffset + 9 && _my < _inst.yoffset + 24)
					{
						// Check if there is an item already in the slot:
						if (hotbar_slots[| i] == NULL)
						{
							// Place the grabbed item in the slot:
							hotbar_slots[| i] = grabbed_item.item_index;
							instance_destroy(grabbed_item);
							grabbed_item = noone;
						}
						else
						{
							// Put the item back in the last slot it was taken from:
							if (last_inventory_slot != -1)
							{
								// Place the item in the last inventory slot it was picked up from:
								inventory_slots[| last_inventory_slot] = grabbed_item.item_index;
								instance_destroy(grabbed_item);
								grabbed_item = noone;
							}
							else if (last_hotbar_slot != -1)
							{
								// Place the item in the last hotbar slot it was picked up from:
								hotbar_slots[| last_hotbar_slot] = grabbed_item.item_index;
								instance_destroy(grabbed_item);
								grabbed_item = noone;
							}
						}
					}
				}
			}
		}
	}
}
else
{
	// Find the hotbar instance:
	var _inst = instance_find(objInterfaceHotbar, 0);
	if (!instance_exists(_inst))
		return;
	
	// Check if the left mouse button is pressed on a hotbar slot (only if the inventory is hidden):
	if (device_mouse_check_button_pressed(0, mb_left))
	{
		// Get the mouse position on the GUI layer:
		var _mx, _my;
			_mx = device_mouse_x_to_gui(0);
			_my = device_mouse_y_to_gui(0);
		
		// Now, iterate through the slots as we did before:
		for (var i = 0; i < 9; i++)
		{
			// We need to check if the item is over a slot, so let's get the mouse coords:
			if (_mx > _inst.xoffset + (i * 22) + 8 && _mx < _inst.xoffset + (i * 22) + 24 && _my > _inst.yoffset + 9 && _my < _inst.yoffset + 24)
			{
				// Select the slot:
				selected_slot = i;
			}
		}
	}
}

// Get the item in the selected hotbar slot:
var _item = hotbar_slots[| selected_slot];

// Check if the item is breakable:
if (hotbar_is_item_breakable(_item))
{
	// Check if the item has run out in the selected slot (as long as it isn't watering can):
	if (hotbar_get_item_durability(_item) <= 0 && hotbar_get_item_type(_item) != ITEM_TYPE.ITEM_TYPE_WATERING_CAN)
	{
		// If so, clear it:
		hotbar_clear_slot(selected_slot);
	}
}
	
// Check if the item is stackable:
if (hotbar_is_item_stackable(_item))
{
	// Check if the item stack is empty:
	if (hotbar_get_item_count(_item) <= 0)
	{
		// If so, clear it:
		hotbar_clear_slot(selected_slot);
	}
}
