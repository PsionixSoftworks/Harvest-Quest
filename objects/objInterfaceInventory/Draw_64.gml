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
			
			// Get the sprite index of the item:
			var _sprindex = inventory_get_item_icon(grabbed_item.item_index);
			if (_sprindex != -1)
			{
				// Get the item id of the grabbed item:
				var _item_id = item_get_id(grabbed_item.item_index);
				
				// Draw the item and its id:
				draw_sprite(_sprindex, _item_id, grabbed_item.x, grabbed_item.y);
				
				// Check if the item is breakable:
				if (item_is_breakable(grabbed_item.item_index))
				{
					// Get the item durability:
					var _hp, _hp_max;
						_hp		= item_get_durability(grabbed_item.item_index);
						_hp_max	= item_get_durabilty_max(grabbed_item.item_index);
					
					// Check if the item is damaged:
					if (_hp < _hp_max)
					{
						// Get the damage percentage:
						var _dmg = (_hp / _hp_max) * 100;
			
						// Get the min and max colors:
						var _mincol, _maxcol;
							_mincol = (grabbed_item.item_index.item_type == ITEM_TYPE.ITEM_TYPE_WATERING_CAN) ? $FF7F00 : c_red;
							_maxcol = (grabbed_item.item_index.item_type == ITEM_TYPE.ITEM_TYPE_WATERING_CAN) ? $FF7F00 : c_green;
			
						// Draw the healthbar over the item:
						draw_healthbar(grabbed_item.x + 1, grabbed_item.y + 12, grabbed_item.x + 14, grabbed_item.y + 13, _dmg, c_black, _mincol, _maxcol, 0, true, false);
					}
				}
				
				// Check if the item is stackable:
				if (item_is_stackable(grabbed_item.item_index))
				{
					// Get the item count:
					var _item_count	= item_get_count(grabbed_item.item_index);
		
					// Check if the count is larger than 1:
					if (_item_count > 1)
					{
						// Draw a little number over the item to indicate how many there are:
						draw_set_halign(fa_center);
						draw_text_shadowed(grabbed_item.x + 12, grabbed_item.y + 8, _item_count);
						draw_set_halign(fa_left)
					}
				}
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
						// Find the x and y position:
						var	_xx = xoffset + (i * 21) + 97;
						var	_yy = yoffset + (j * 22) + 63;
						
						// Draw it at those coordinates:
						draw_sprite(_sprindex, _item_id, _xx, _yy);
						
						// Check if the item is breakable:
						if (inventory_item_is_breakable(_item))
						{
							// Check if it has been damaged:
							if (_item.durability < _item.durability_max)
							{
								// Get the healthbar percent:
								var _dmg = (_item.durability / _item.durability_max) * 100;
								
								// Get the min and max colors:
								var _mincol, _maxcol;
									_mincol = (_item.item_type == ITEM_TYPE.ITEM_TYPE_WATERING_CAN) ? $FF7F00 : c_red;
									_maxcol = (_item.item_type == ITEM_TYPE.ITEM_TYPE_WATERING_CAN) ? $FF7F00 : c_green;
								
								// Draw a healthbar over the item:
								draw_healthbar(_xx + 1, _yy + 12, _xx + 14, _yy + 13, _dmg, c_black, _mincol, _maxcol, 0, true, false);
							}
						}
						
						// Check if the item is stackable:
						if (inventory_item_is_stackable(_item))
						{
							// Get the item count:
							var _item_count = inventory_get_item_count(_item);
							
							// Check if the stack count is larger than 1:
							if (_item_count > 1)
							{
								// Draw a little number over the item:
								draw_set_halign(fa_center);
								draw_text_shadowed(_xx + 12, _yy + 8, _item_count);
								draw_set_halign(fa_left);
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
			
			// Check if the item is breakable:
			if (hotbar_is_item_breakable(_item))
			{
				// Check if it has been damaged:
				if (_item.durability < _item.durability_max)
				{
					// Get the healthbar percent:
					var _dmg = (_item.durability / _item.durability_max) * 100;
					
					// Get the min and max colors:
					var _mincol, _maxcol;
						_mincol = (_item.item_type == ITEM_TYPE.ITEM_TYPE_WATERING_CAN) ? $FF7F00 : c_red;
						_maxcol = (_item.item_type == ITEM_TYPE.ITEM_TYPE_WATERING_CAN) ? $FF7F00 : c_green;
					
					// Draw a healthbar over the item:
					draw_healthbar(_inst.xoffset + (i * 22) + 9, _inst.yoffset + 21, _inst.xoffset + (i * 22) + 22, _inst.yoffset + 22, _dmg, c_black, _mincol, _maxcol, 0, true, false);
				}
			}
			
			// Check if the item is stackable:
			if (hotbar_is_item_stackable(_item))
			{
				// Get the item count:
				var _item_count = inventory_get_item_count(_item);
							
				// Check if the stack count is larger than 1:
				if (_item_count > 1)
				{
					// Draw a little number over the item:
					draw_set_halign(fa_center);
					draw_text_shadowed(_inst.xoffset + (i * 22) + 20, _inst.yoffset + 17, _item_count);
					draw_set_halign(fa_left);
				}
			}
		}
	}
}
