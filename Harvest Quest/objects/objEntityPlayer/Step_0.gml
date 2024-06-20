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
}

// Check if the enter key is pressed:
if (keyboard_check_pressed(vk_enter))
{
	// Find the inventory:
	var _inst = instance_find(objInterfaceInventory, 0);
	if (instance_exists(_inst))
	{
		_inst.active = !_inst.active;
	}
}

// Windows only:
if (os_type == os_windows)
{
	// Find the hotbar (again...):
	var _inst;
		_inst = instance_find(objInterfaceInventory, 0);
	if (instance_exists(_inst))
	{
		// Check if the user is scrolling the mouse wheel down:
		if (mouse_wheel_down())
		{
			if (_inst.selected_slot < _inst.hotbar_slot_count - 1)
				_inst.selected_slot++;
			else
				_inst.selected_slot = 0;
		}
		else if (mouse_wheel_up())
		{
			if (_inst.selected_slot > 0)
				_inst.selected_slot--;
			else
				_inst.selected_slot = _inst.hotbar_slot_count - 1;
		}
	}
}
