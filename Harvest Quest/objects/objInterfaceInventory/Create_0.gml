/// @description Create the inventory interface
// Declare instance variables:
inventory_list			= ds_list_create();
tab_index				= 0;
tab_count				= 8;
xoffset					= (camera_get_view_width(view_camera[0]) / 2) - (sprite_get_width(sprInterfaceInventory) / 2);
yoffset					= 0;
active					= false;

// Declare local variables:
var _num_slots_x, _num_slots_y;
	_num_slots_x = 9;
	_num_slots_y = 3;

// Iterate through each of the slots and assign it null:
for (var i = 0; i < _num_slots_x * _num_slots_y; i++)
{
	ds_list_set(inventory_list, i, NULL);
}
