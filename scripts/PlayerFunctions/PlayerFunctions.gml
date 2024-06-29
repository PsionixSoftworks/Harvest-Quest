/// @func player_find_state(state);
function player_find_state(_state)
{
	// Check if we're in "normal" state:
	if (_state == PLAYER_STATE.PLAYER_STATE_NORMAL)
		script_execute(player_state_normal);
	
	// Check if we're in "pickaxe" state:
	if (_state == PLAYER_STATE.PLAYER_STATE_PICKAXE)
		script_execute(player_state_pickaxe);
	
	// Check if we're in "axe" state:
	if (_state == PLAYER_STATE.PLAYER_STATE_AXE)
		script_execute(player_state_axe)
	
	// Check if we're in "watering" state:
	if (_state == PLAYER_STATE.PLAYER_STATE_WATERING)
		script_execute(player_state_watering);
	
	// Check if we're in "hoe" state:
	if (_state == PLAYER_STATE.PLAYER_STATE_HOE)
		script_execute(player_state_hoe);
		
	// Check if we're in "fishing" state:
	if (_state == PLAYER_STATE.PLAYER_STATE_FISHING)
		script_execute(player_state_fishing);
}

/// @func player_state_normal(void);
function player_state_normal()
{
	// Set the xspeed and yspeed to our key mapping:
	xspeed = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * spd;
	yspeed = (keyboard_check(ord("S")) - keyboard_check(ord("W"))) * spd;
	
	// Check for horizontal movement:
	if (xspeed == 0)
	{
		// Check for vertical movement:
		if (yspeed < 0)
		{
			facing = "Up";
		}
		else if (yspeed > 0)
		{
			facing = "Down";
		}
	}
	// This time, check for vertical movement first:
	else if (yspeed == 0)
	{
		// Check for horizontal movement:
		if (xspeed < 0)
		{
			facing = "Left";
		}
		else if (xspeed > 0)
		{
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
								var _crop_id = hotbar_get_item_id(_item);
								crop_place_at(_xx, _yy, _crop_id);
								_item.item_count--;
								lmb_released = false;
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

/// @func player_state_sword(void);
function player_state_sword()
{
	// TODO: Fill this in later...
}

/// @func player_state_pickaxe(void);
function player_state_pickaxe()
{
	sprite_index = asset_get_index("sprChar1Pickaxe" + string(facing));
	image_speed = 1;
	
	// Find an ore when the player is facing down:
	var _inst = instance_place(x, y + 1, objOre);
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
				}
			}
		}
	}
	
	// Find an ore when the player is facing up:
	_inst = instance_place(x, y - 1, objOre);
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
				}
			}
		}
	}
	
	// Find an ore when the player is facing right:
	_inst = instance_place(x + 1, y, objOre);
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
				}
			}
		}
	}
	
	// Find an ore when the player is facing left:
	_inst = instance_place(x - 1, y, objOre);
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
				}
			}
		}
	}
}

/// @func player_state_axe(void);
function player_state_axe()
{
	sprite_index = asset_get_index("sprChar1Axe" + string(facing));
	image_speed = 1;
	
	// Set this here for code consistency:
	var _inst = noone;
	
	// Find a tree when the player is facing down:
	_inst = instance_place(x, y + 1, objTree);
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
				}
			}
		}
	}
	
	// Find a tree when the player is facing up:
	_inst = instance_place(x, y - 1, objTree);
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
				}
			}
		}
	}
	
	// Find a tree when the player is facing right:
	_inst = instance_place(x + 1, y, objTree);
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
				}
			}
		}
	}
	
	// Find a tree when the player is facing left:
	_inst = instance_place(x - 1, y, objTree);
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
				}
			}
		}
	}
}

/// @func player_state_watering(void);
function player_state_watering()
{
	sprite_index = asset_get_index("sprChar1Watering" + string(facing));
	image_speed = 1;
	
	// Get the grid square the mouse cursor is in:
	var _mx, _my;
		_mx = floor(mouse_x / grid_w) * grid_w;
		_my = floor(mouse_y / grid_h) * grid_h;
	
	// Check if there's a crop where we clicked:
	var _crop = collision_rectangle(_mx, _my, _mx + grid_w, _my + grid_h, objCrop, false, true);
	if (_crop != noone)
	{
		// Find the inventory:
		var _inst = instance_find(objInterfaceInventory, 0);
		if (instance_exists(_inst))
		{
			// Get watering can water amount:
			var _item = _inst.hotbar_slots[| _inst.selected_slot];
			var _water_amt = hotbar_get_item_durability(_item);
			if (_water_amt > 0)
			{
				crop_set_wet(_crop, true);
			}
		}
	}
}

/// @func player_state_hoe(void);
function player_state_hoe()
{
	sprite_index = asset_get_index("sprChar1Hoe" + string(facing));
	image_speed = 1;
}

/// @func player_state_fishing(void);
function player_state_fishing()
{
	// TODO: Fill this in later...
}

/// @func player_handle_collision(void);
function player_handle_collision()
{
	if (place_meeting(x + xspeed, y, objSolid))
	{
		while (!place_meeting(x + sign(xspeed), y, objSolid))
		{
			x += sign(xspeed);
		}
		xspeed = 0;
	}
	x += xspeed;
	
	if (place_meeting(x, y + yspeed, objSolid))
	{
		while (!place_meeting(x, y + sign(yspeed), objSolid))
		{
			y += sign(yspeed);
		}
		yspeed = 0;
	}
	y += yspeed;
}
