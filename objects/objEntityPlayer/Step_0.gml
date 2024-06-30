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

// Declare local variables:
var _inst;
	_inst = instance_find(objInterfaceInventory, 0);

// Check if the enter key is pressed:
if (keyboard_check_pressed(vk_enter))
{
	// Check if the inventory exists:
	if (instance_exists(_inst))
	{
		// Toggle the inventory and player's active flag:
		_inst.active = !_inst.active;
		active = !_inst.active;
	}
}

// Windows only!:
if (os_type == os_windows)
{
	// Check if the inventory exists:
	if (instance_exists(_inst))
	{
		// Check if the user is scrolling the mouse wheel down:
		if (mouse_wheel_down())
		{
			// Check if the selected slot is less than the maximum number of slots:
			if (_inst.selected_slot < _inst.hotbar_slot_count - 1)
			{
				// If so, increment by 1:
				_inst.selected_slot++;
			}
			else
			{
				// Otherwise set it back to 0:
				_inst.selected_slot = 0;
			}
		}
		// Check if the user is scrolling the mouse wheel up:
		else if (mouse_wheel_up())
		{
			// Check if the selected slot is greater than 0:
			if (_inst.selected_slot > 0)
			{
				// If so, decrement by 1:
				_inst.selected_slot--;
			}
			else
			{
				// Otherwise set it to the last slot again:
				_inst.selected_slot = _inst.hotbar_slot_count - 1;
			}
		}
	}
}
