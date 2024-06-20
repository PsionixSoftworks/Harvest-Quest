/// @description Create the inventory interface
// Declare instance variables (inventory):
inventory_slots			= ds_list_create();
tab_index				= 0;
tab_count				= 8;
xoffset					= (camera_get_view_width(view_camera[0]) / 2) - (sprite_get_width(sprInterfaceInventory) / 2);
yoffset					= 0;
inventory_slots_x		= 9;
inventory_slots_y		= 3;
last_inventory_slot		= -1;
grabbed_item			= noone;
active					= false;

// Declare Instance variables (hotbar):
hotbar_slots			= ds_list_create();
hotbar_slot_count		= 9;
last_hotbar_slot		= -1;
selected_slot			= 0;

// Iterate through each of the slots and assign it null:
for (var i = 0; i < inventory_slots_x * inventory_slots_y; i++)
{
	ds_list_set(inventory_slots, i, NULL);
}

// Set the 9 slots to their default values:
for (var i = 0; i < hotbar_slot_count; i++)
{
	ds_list_set(hotbar_slots, i, NULL);
}

// This is needed so items dragged from the inventory to the hotbar will render over the hotbar:
depth					= -100;
