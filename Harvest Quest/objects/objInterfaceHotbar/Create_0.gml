/// @description Initialize the Hotbar interface.
// Positional variables:
xoffset			= (camera_get_view_width(view_camera[0]) / 2) - (sprite_get_width(sprInterfaceHotbar) / 2);
yoffset			= 180 - 32;

// Other variables:
selected_slot	= 0;
slot_count		= 9;
slot_list		= ds_list_create();
active			= false;

// Active timer:
alarm[0]		= 1;

// Set the 9 slots to their default values:
for (var i = 0; i < slot_count; i++)
{
	ds_list_set(slot_list, i, NULL);
}

// TESTING ONLY!:
/*
ds_list_set(slot_list, 0, ITEM_TYPE.ITEM_TYPE_WATERING_CAN);
ds_list_set(slot_list, 1, ITEM_TYPE.ITEM_TYPE_SWORD);
ds_list_set(slot_list, 2, ITEM_TYPE.ITEM_TYPE_PICKAXE);
ds_list_set(slot_list, 3, ITEM_TYPE.ITEM_TYPE_AXE);
ds_list_set(slot_list, 4, ITEM_TYPE.ITEM_TYPE_HOE);
ds_list_set(slot_list, 5, ITEM_TYPE.ITEM_TYPE_FISHING_ROD);
*/