/// @description Draw the item as it has been setup.
// Make sure item_index exists:
if (item_index != -1)
{
	// If so, get the id of the item:
	var _item_id = item_get_id(item_index);
	
	// Draw the sprite with the item id:
	draw_sprite(sprite_index, _item_id, x, y);
	
	// Check if the item is breakable:
	if (item_is_breakable(item_index))
	{
		// Get the item durability:
		var _hp, _hp_max;
			_hp		= item_get_durability(item_index);
			_hp_max	= item_get_durabilty_max(item_index);
		
		// Check if the item is damaged:
		if (_hp < _hp_max)
		{
			// Get the damage percentage:
			var _dmg = (_hp / _hp_max) * 100;
			
			// Get the min and max colors:
			var _mincol, _maxcol;
				_mincol = (item_index.item_type == ITEM_TYPE.ITEM_TYPE_WATERING_CAN) ? $FF7F00 : c_red;
				_maxcol = (item_index.item_type == ITEM_TYPE.ITEM_TYPE_WATERING_CAN) ? $FF7F00 : c_green;
			
			// Draw the healthbar over the item:
			draw_healthbar(x, y + 12, x + 16, y + 13, _dmg, c_black, _mincol, _maxcol, 0, true, false);
		}
	}
	
	// Check if the item is stackable:
	if (item_is_stackable(item_index))
	{
		// Get the item count:
		var _item_count	= item_get_count(item_index);
		
		// Check if the count is larger than 1:
		if (_item_count > 1)
		{
			// Draw a little number over the item to indicate how many there are:
			draw_set_halign(fa_center);
			draw_text_shadowed(x + 12, y + 8, _item_count);
			draw_set_halign(fa_left)
		}
	}
}
