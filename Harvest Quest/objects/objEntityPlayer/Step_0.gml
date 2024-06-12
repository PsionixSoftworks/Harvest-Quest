/// @description Update the Player based on state.
// Check if the player is active:
if (active)
{
	// Now we move this here and change it to asset_get_index so 
	// the player's action and state both affect the sprite:
	sprite_index = asset_get_index("sprChar1" + string(action) + string(facing));
	
	// Check what state the Player is in:
	player_find_state(state);
	
	// Handle collisions (temporary system):
	player_handle_collision();
	
	// Next, we need to handle the hotbar. Let's see if it's in the world:
	var _inst;
		_inst = instance_find(objInterfaceHotbar, 0);
	if (!instance_exists(_inst))
	{
		// Handle the error:
		_inst = instance_create_layer(0, 0, "Instances", objInterfaceHotbar);
		show_debug_message("[Warning]: The hotbar could not be found. Creating instead...");
	}
	else
	{
		// Since it can be found, let's find the size of the hotbar:
		var _size = ds_list_size(_inst.slot_list);
		
		//Next, iterate through the hotbar slots:
		for (var i = 0; i < _size; i++)
		{
			// Check what item exists at the hotbar slot:
			var _item = _inst.slot_list[| _inst.selected_slot];
			
			// Check if the slot has an item in it:
			if (_item != NULL)
			{
				// Listen for left mouse click:
				if (device_mouse_check_button(0, mb_left))
				{
					// Check if the item is a sword:
					if (_item == ItemTypes.ITEM_TYPE_SWORD)
					{
		
					}
	
					// Check if the item is a pickaxe:
					if (_item == ItemTypes.ITEM_TYPE_PICKAXE)
					{
						// Stop movement and switch to the pickaxe state:
						xspeed = 0;
						yspeed = 0;
						action = "Pickaxe";
						state = PlayerState.PLAYER_STATE_PICKAXE;
					}
	
					// Check if the item is a pickaxe:
					if (_item == ItemTypes.ITEM_TYPE_AXE)
					{
		
					}
	
					// Check if the item is a pickaxe:
					if (_item == ItemTypes.ITEM_TYPE_HOE)
					{
		
					}
	
					// Check if the item is a pickaxe:
					if (_item == ItemTypes.ITEM_TYPE_WATERING_CAN)
					{
		
					}
				}
			}
		}
	}
}

// Windows only:
if (os_type == os_windows)
{
	// Find the hotbar (again...):
	var _inst;
		_inst = instance_find(objInterfaceHotbar, 0);
	if (instance_exists(_inst))
	{
		// Check if the user is scrolling the mouse wheel down:
		if (mouse_wheel_down())
		{
			if (_inst.selected_slot < _inst.slot_count - 1)
				_inst.selected_slot++;
			else
				_inst.selected_slot = 0;
		}
		else if (mouse_wheel_up())
		{
			if (_inst.selected_slot > 0)
				_inst.selected_slot--;
			else
				_inst.selected_slot = _inst.slot_count - 1;
		}
	}
}
