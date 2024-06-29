/// @description Insert description here
// Make sure the inventory is NOT active:
if (!active)
{
	// Get the mouse positions in the world:
	var _mx, _my;
		_mx = floor(mouse_x / grid_w) * grid_w;
		_my = floor(mouse_y / grid_h) * grid_h;
	
	// Get the item in the selected hotbar slot:
	var _item = hotbar_get_item_type(hotbar_slots[| selected_slot]);
	
	// Check if the watering can is selected:
	if (_item == ITEM_TYPE.ITEM_TYPE_WATERING_CAN)
	{
		// Draw a little rectangle within the grid:
		draw_rectangle(_mx, _my, _mx + grid_w, _my + grid_h, true);
	}
}
