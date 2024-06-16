/// @description Create the inventory interface
// Declare instance variables:
inventory_list			= ds_list_create();
tab_index				= 0;
tab_count				= 8;
xoffset					= (camera_get_view_width(view_camera[0]) / 2) - (sprite_get_width(sprInterfaceInventory) / 2);
yoffset					= 0;
inventory_slots_x		= 9;
inventory_slots_y		= 3;
grabbed_item			= noone;
active					= false;

// Iterate through each of the slots and assign it null:
for (var i = 0; i < inventory_slots_x * inventory_slots_y; i++)
{
	ds_list_set(inventory_list, i, NULL);
}
ds_list_set(inventory_list, 5, ItemTypes.ITEM_TYPE_AXE);
