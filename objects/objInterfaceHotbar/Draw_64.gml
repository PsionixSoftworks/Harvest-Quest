/// @description Insert description here
// Check if the interface is active:
if (active)
{
	// Draw it at on the screen at the center:
	draw_sprite_ext(sprInterfaceHotbar, image_index, xoffset, yoffset, 1, 1, 0, c_white, 1.0);
	
	// Find the inventory:
	var _inst = instance_find(objInterfaceInventory, 0);
	if (instance_exists(_inst))
	{
		// Next, we need to draw in the cursor icon over the slots:
		draw_sprite_ext(sprInterfaceCursor, 0, xoffset + (_inst.selected_slot * 22) + 8, yoffset + 9, 1, 1, 0, c_white, 0.5);
	}
}
