/// @description Find the player's state.
function player_find_state(_state)
{
	// Check if we're in "normal" state:
	if (_state == PLAYER_STATE.PLAYER_STATE_NORMAL)
		entity_state_execute(player_state_normal);
	
	// Check if we're in "pickaxe" state:
	if (_state == PLAYER_STATE.PLAYER_STATE_PICKAXE)
		entity_state_execute(player_state_pickaxe);
	
	// Check if we're in "axe" state:
	if (_state == PLAYER_STATE.PLAYER_STATE_AXE)
		entity_state_execute(player_state_axe)
	
	// Check if we're in "watering" state:
	if (_state == PLAYER_STATE.PLAYER_STATE_WATERING)
		entity_state_execute(player_state_watering);
	
	// Check if we're in "hoe" state:
	if (_state == PLAYER_STATE.PLAYER_STATE_HOE)
		entity_state_execute(player_state_hoe);
		
	// Check if we're in "fishing" state:
	if (_state == PLAYER_STATE.PLAYER_STATE_FISHING)
		entity_state_execute(player_state_fishing);
}

/// @description Handle the "normal" player state.
function player_state_normal()
{
	// Set the xspeed and yspeed to our key mapping:
	xspeed = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * spd;
	yspeed = (keyboard_check(ord("S")) - keyboard_check(ord("W"))) * spd;
	
	// Implement sprinting (temporary system):
	if (stamina > 0.5)
	{
		// Set speed based on whether or not the user is holding the shift key:
		spd = keyboard_check(vk_lshift) ? max_run_speed : max_walk_speed;
	}
	else
	{
		// Set the speed to the walk speed regardless:
		spd = max_walk_speed;
	}
	
	// Check if we're running:
	if (spd > max_walk_speed)
	{
		// Decrement stamina:
		stamina -= 0.5;
	}
	else
	{
		// Increment stamina:
		stamina += 0.25;
	}
	
	// Check for horizontal movement:
	if (xspeed == 0)
	{
		// Check for vertical movement:
		if (yspeed < 0)
		{
			// Face the player up:
			facing = "Up";
		}
		else if (yspeed > 0)
		{
			// Face the player down:
			facing = "Down";
		}
	}
	// This time, check for vertical movement first:
	else if (yspeed == 0)
	{
		// Check for horizontal movement:
		if (xspeed < 0)
		{
			// Face the player left:
			facing = "Left";
		}
		else if (xspeed > 0)
		{
			// Face the player right:
			facing = "Right";
		}
	}
	
	// Set the image speed relative to motion:
	image_speed = ((xspeed != 0 || yspeed != 0) ? (1 * spd) : 0);
	
	// Reset the image index when the Player stops moving:
	if (xspeed == 0 && yspeed == 0)
		image_index = 0;
	
	// Check if the <E> (action) key is pressed:
	if (keyboard_check_pressed(ord("E")))
	{
		// Check if there is an item under the player's feet:
		var _inst1 = instance_place(x, y, objItem);
		if (instance_exists(_inst1))
		{
			// So now we have to find the next available slot. So find the inventory:
			var _inst2 = instance_find(objInterfaceInventory, 0);
			if (instance_exists(_inst2))
			{
				// Iterate through the slots:
				for (var i = 0; i < _inst2.inventory_slots_x * _inst2.inventory_slots_y; i++)
				{
					// Check which slot is empty:
					if (_inst2.inventory_slots[| i] == NULL)
					{
						// Add the item to the slot:
						_inst2.inventory_slots[| i] = _inst1.item_index;
						
						// Stop iterating:
						i = _inst2.inventory_slots_y * _inst2.inventory_slots_x;
						
						// Destroy the item on the floor:
						instance_destroy(_inst1);
					}
				}
			}
		}
		
		// Check if there is a crop at the player's feet:
		//var _crop = instance_place(x, y, objCrop);
		//var _crop_index = _crop.crop_index;
		//if (instance_exists(_crop) && crop_get_age(_crop_index) >= 10)
		//{
		//	// Now find the hotbar this time. We want to add the crops to the hotbar:
		//	var _inst = instance_find(objInterfaceInventory, 0);
		//	if (instance_exists(_inst))
		//	{
		//		if (_inst.hotbar_slots[| _inst.selected_slot] == NULL)
		//		{
		//			var _item = noone;
		//			_item = instance_create_layer(0, 0, "Instances", objItemCrop);
		//			_inst.hotbar_slots[| _inst.selected_slot] = _item.item_index;
		//			instance_destroy(_inst);
		//			instance_destroy(_item);
		//		}
		//	}
		//}
	}
	
	// Next, we need to handle the inventory. Let's see if it's in the world:
	var _inst;
		_inst = instance_find(objInterfaceInventory, 0);
	if (!instance_exists(_inst))
	{
		// Handle the error:
		_inst = instance_create_layer(0, 0, "Instances", objInterfaceInventory);
		show_debug_message("[Warning]: The inventory could not be found. Creating instead...");
	}
	else
	{
		// Since it can be found, let's find the size of the hotbar:
		var _size = ds_list_size(_inst.hotbar_slots);
		
		//Next, iterate through the hotbar slots:
		for (var i = 0; i < _size; i++)
		{
			// Check what item exists at the hotbar slot:
			var _item = _inst.hotbar_slots[| _inst.selected_slot];
			
			// Check if the slot has an item in it:
			if (_item != NULL)
			{
				// Listen for left mouse click:
				if (device_mouse_check_button(0, mb_left))
				{
					// Find the hotbar:
					var _hotbar = instance_find(objInterfaceHotbar, 0);
					if (_hotbar == noone)
						return;
					
					// Get mouse positions:
					var _mx, _my;
						_mx = device_mouse_x_to_gui(0);
						_my = device_mouse_y_to_gui(0);
					
					// We need to make sure the mouse isn't over the hotbar when we click
					// so hotbar slots can be selected with the mouse or touch:
					if (_mx > _hotbar.xoffset && _mx < _hotbar.xoffset + 208 && _my > _hotbar.yoffset)
					{
						// But we don't handle that here, so just return:
						return;
					}
					else
					{
						// Check if the item is a sword:
						if (_item.item_type == ITEM_TYPE.ITEM_TYPE_SWORD)
						{
							// TODO: Fill this in later...
						}
	
						// Check if the item is a pickaxe:
						if (_item.item_type == ITEM_TYPE.ITEM_TYPE_PICKAXE)
						{
							// Stop movement and switch to the pickaxe state:
							xspeed = 0;
							yspeed = 0;
							action = "Pickaxe";
							state = PLAYER_STATE.PLAYER_STATE_PICKAXE;
						}
	
						// Check if the item is an axe:
						if (_item.item_type == ITEM_TYPE.ITEM_TYPE_AXE)
						{
							// Stop movement and switch to the axe state:
							xspeed = 0;
							yspeed = 0;
							action = "Axe";
							state = PLAYER_STATE.PLAYER_STATE_AXE;
						}
	
						// Check if the item is a hoe:
						if (_item.item_type == ITEM_TYPE.ITEM_TYPE_HOE)
						{
							// We want to check if the left mouse button (or touch) is released
							// for this item. Otherwise it will spam when you hold it like the axe
							// and pickaxe:
							if (lmb_released)
							{
								// Stop movement and switch to the hoe state:
								xspeed = 0;
								yspeed = 0;
								action = "Hoe";
								state = PLAYER_STATE.PLAYER_STATE_HOE;
								lmb_released = false;
							}
						}
	
						// Check if the item is a watering can:
						if (_item.item_type == ITEM_TYPE.ITEM_TYPE_WATERING_CAN)
						{
							// We want to check if the left mouse button (or touch) is released
							// for this item. Otherwise it will spam when you hold it like the axe
							// and pickaxe:
							if (lmb_released)
							{
								// Check if we have water in the can:
								if (hotbar_get_item_durability(_item) > 0)
								{
									// Stop movement and switch to the watering state:
									xspeed = 0;
									yspeed = 0;
									action = "Watering";
									if (mouse_x > x)
										facing = "Right";
									else if (mouse_x < x)
										facing = "Left";
									
									hotbar_item_take_damage(_item, 1);
									state = PLAYER_STATE.PLAYER_STATE_WATERING;
									lmb_released = false;
								}
							}
						}
						
						// Check if the item is a seed packet:
						if (_item.item_type == ITEM_TYPE.ITEM_TYPE_SEEDS)
						{
							// We want to check if the left mouse button (or touch) is released
							// for this item. Otherwise it will spam when you hold it like the axe
							// and pickaxe:
							if (lmb_released)
							{
								// Get grid coordinates:
								var _xx, _yy;
									_xx = floor(mouse_x / grid_w) * grid_w;
									_yy = floor(mouse_y / grid_h) * grid_h;
								
								// Initialize the crop instance:
								var _crop_inst = noone;
								
								// Plant a seed wherever the mouse it and decrement one from the count:
								var _layer_id, _map_id, _tile_data;
									_layer_id = layer_get_id("Tiles_1");
									_map_id = layer_tilemap_get_id(_layer_id);
									_tile_data = tilemap_get_at_pixel(_map_id, _xx, _yy);
								if (_tile_data == 132)
								{
									var _crop_id = hotbar_get_item_id(_item);
									if (!collision_rectangle(_xx, _yy, _xx + grid_w, _yy + grid_h, objCrop, false, true))
									{
										crop_place_at(_xx, _yy, _crop_id);
										_item.item_count--;
										lmb_released = false;
									}
								}
							}
						}
					}
				}
				else if (device_mouse_check_button_released(0, mb_left))
				{
					// The mouse (or touch) was released:
					lmb_released = true;
				}
			}
		}
	}
}

/// @description Handle the "sword" player state.
function player_state_sword()
{
	// TODO: Fill this in later...
}

/// @description Handle the "pickaxe" player state.
function player_state_pickaxe()
{
	sprite_index = asset_get_index("sprChar1Pickaxe" + string(facing));
	image_speed = 1;
	
	// Set this here for code consistency:
	var _inst, _hotbar, _item;
	
	// Declare local variables:
	_hotbar = instance_find(objInterfaceInventory, 0);
	_item	= _hotbar.hotbar_slots[| _hotbar.selected_slot];
	
	// Find an ore when the player is facing down:
	_inst = instance_place(x, y + 4, objOre);
	if (_inst != noone)
	{
		// Check if we're facing down:
		if (facing == "Down")
		{
			// Hit the rock each time the player's subimaage reaches the end:
			if (image_index >= image_number - 1)
			{
				if (!_inst.hit)
				{
					_inst.hp--;
					_inst.hit = true;
					_inst.yoffset = 1;
					hotbar_item_take_damage(_item);
				}
			}
		}
	}
	
	// Find an ore when the player is facing up:
	_inst = instance_place(x, y - 4, objOre);
	if (_inst != noone)
	{
		// Check if we're facing down:
		if (facing == "Up")
		{
			// Hit the rock each time the player's subimaage reaches the end:
			if (image_index >= image_number - 1)
			{
				if (!_inst.hit)
				{
					_inst.hp--;
					_inst.hit = true;
					_inst.yoffset = -1;
					hotbar_item_take_damage(_item);
				}
			}
		}
	}
	
	// Find an ore when the player is facing right:
	_inst = instance_place(x + 4, y, objOre);
	if (_inst != noone)
	{
		// Check if we're facing down:
		if (facing == "Right")
		{
			// Hit the rock each time the player's subimaage reaches the end:
			if (image_index >= image_number - 1)
			{
				if (!_inst.hit)
				{
					_inst.hp--;
					_inst.hit = true;
					_inst.xoffset = 1;
					_inst.yoffset = 1;
					hotbar_item_take_damage(_item);
				}
			}
		}
	}
	
	// Find an ore when the player is facing left:
	_inst = instance_place(x - 4, y, objOre);
	if (_inst != noone)
	{
		// Check if we're facing down:
		if (facing == "Left")
		{
			// Hit the rock each time the player's subimaage reaches the end:
			if (image_index >= image_number - 1)
			{
				if (!_inst.hit)
				{
					_inst.hp--;
					_inst.hit = true;
					_inst.xoffset = -1;
					_inst.yoffset = 1;
					hotbar_item_take_damage(_item);
				}
			}
		}
	}
}

/// @description Handle the "axe" player state.
function player_state_axe()
{
	sprite_index = asset_get_index("sprChar1Axe" + string(facing));
	image_speed = 1;
	
	// Set this here for code consistency:
	var _inst, _hotbar, _item;
	
	// Find a tree when the player is facing down:
	_inst	= noone;
	_hotbar = instance_find(objInterfaceInventory, 0);
	_item	= _hotbar.hotbar_slots[| _hotbar.selected_slot];
		_hotbar = instance_place(x, y + 4, objTree);
	if (_inst != noone && _inst.can_be_harvested)
	{
		// Check if we're facing down:
		if (facing == "Down")
		{
			// Hit the tree each time the player's subimaage reaches the end:
			if (image_index >= image_number - 1)
			{
				if (!_inst.hit && !_inst.harvested)
				{
					_inst.hp--;
					_inst.hit = true;
					hotbar_item_take_damage(_item);
				}
			}
		}
	}
	
	// Find a tree when the player is facing up:
	_inst = instance_place(x, y - 4, objTree);
	if (_inst != noone && _inst.can_be_harvested)
	{
		// Check if we're facing up:
		if (facing == "Up")
		{
			// Hit the tree each time the player's subimaage reaches the end:
			if (image_index >= image_number - 1)
			{
				if (!_inst.hit && !_inst.harvested)
				{
					_inst.hp--;
					_inst.hit = true;
					hotbar_item_take_damage(_item);
				}
			}
		}
	}
	
	// Find a tree when the player is facing right:
	_inst = instance_place(x + 4, y, objTree);
	if (_inst != noone && _inst.can_be_harvested)
	{
		// Check if we're facing right:
		if (facing == "Right")
		{
			// Hit the tree each time the player's subimaage reaches the end:
			if (image_index >= image_number - 1)
			{
				if (!_inst.hit && !_inst.harvested)
				{
					_inst.hp--;
					_inst.hit = true;
					hotbar_item_take_damage(_item);
				}
			}
		}
	}
	
	// Find a tree when the player is facing left:
	_inst = instance_place(x - 4, y, objTree);
	if (_inst != noone && _inst.can_be_harvested)
	{
		// Check if we're facing left:
		if (facing == "Left")
		{
			// Hit the tree each time the player's subimaage reaches the end:
			if (image_index >= image_number - 1)
			{
				if (!_inst.hit && !_inst.harvested)
				{
					_inst.hp--;
					_inst.hit = true;
					hotbar_item_take_damage(_item);
				}
			}
		}
	}
}

/// @description Handle the "watering" player state.
function player_state_watering()
{
	sprite_index = asset_get_index("sprChar1Watering" + string(facing));
	image_speed = 1;
	
	// Get the grid square the mouse cursor is in:
	var _mx, _my;
		_mx = floor(mouse_x / grid_w) * grid_w;
		_my = floor(mouse_y / grid_h) * grid_h;
	
	// Check if there's a crop where we clicked:
	var _crop = collision_rectangle(_mx, _my, _mx + grid_w, _my + grid_h, objCrop, true, true);
	if (_crop != noone)
	{
		// Find the inventory:
		var _inst = instance_find(objInterfaceInventory, 0);
		if (instance_exists(_inst))
		{
			// Get watering can water amount:
			var _item = _inst.hotbar_slots[| _inst.selected_slot];
			var _water_amt = hotbar_get_item_durability(_item);
			if (_water_amt > 0 && point_distance(x, y, _crop.x, _crop.y) <= 32)
			{
				crop_set_wet(_crop.crop_index, true);
			}
		}
	}
}

/// @description Handle the "hoe" player state.
function player_state_hoe()
{
	sprite_index = asset_get_index("sprChar1Hoe" + string(facing));
	image_speed = 1;
}

/// @description Handle the "fishing" player state.
function player_state_fishing()
{
	// TODO: Fill this in later...
}

/// @description Handle the player's collision (will later move to the entity parent).
function player_handle_collision()
{
	// Check if there's a horizontal collision:
	if (place_meeting(x + xspeed, y, objSolid))
	{
		// If so, move right up to the solid:
		while (!place_meeting(x + sign(xspeed), y, objSolid))
		{
			// Move at increments of -1, 0, or 1 (see sign function in the documentation):
			x += sign(xspeed);
		}
		// Stop horizontal movement:
		xspeed = 0;
	}
	// Move as long as there's no collision:
	x += xspeed;
	
	// Check if there's a vertical collision:
	if (place_meeting(x, y + yspeed, objSolid))
	{
		// If so, move right up to the solid:
		while (!place_meeting(x, y + sign(yspeed), objSolid))
		{
			// Move at increments of -1, 0, or 1 (see sign function in the documentation):
			y += sign(yspeed);
		}
		// Stop vertical movement:
		yspeed = 0;
	}
	// Move as long as there's no collision:
	y += yspeed;
}
