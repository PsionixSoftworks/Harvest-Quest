/// @description Initialize the Hotbar interface.
// Positional variables:
xoffset			= (camera_get_view_width(view_camera[0]) / 3) + (sprite_get_width(sprInterfaceHotbar) / 3);
yoffset			= 320;

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

// Set the first slot to be the pickaxe:
ds_list_set(slot_list, 0, ItemTypes.ITEM_TYPE_PICKAXE);
