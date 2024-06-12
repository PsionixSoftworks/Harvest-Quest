/// @description Draw the Hotbar on the screen
// Check if the interface is active:
if (active)
{
	// Draw it at on the screen at the center:
	draw_sprite_ext(sprInterfaceHotbar, image_index, xoffset, yoffset, 1, 1, 0, c_white, 1.0);
	
	// Next, we need to draw the items in the slots. So let's iterate through the slots:
	for (var i = 0; i < slot_count; i++)
	{
		// Next, we need to check what is in each slot. It should be non-null:
		var _item = ds_list_find_value(slot_list, i);
		if (_item != NULL)
		{
			var _sprindex = hotbar_get_item_icon(_item);
			if (_sprindex != -1)
			{
				draw_sprite_ext(_sprindex, 0, xoffset + (i * 22) + 8, yoffset + 9, 1, 1, 0, c_white, 1.0);
			}
		}
	}
	
	// Next, we need to draw in the cursor icon over the slots:
	draw_sprite_ext(sprInterfaceHotbarCursor, image_index, xoffset + (selected_slot * 22) + 8, yoffset + 9, 1, 1, 0, c_white, 0.5);
}
