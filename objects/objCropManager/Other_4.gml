/// @description Manage crops at the start of the room.
// Declare local variables:
var _count, _inst, i;
_count	= instance_number(objCrop);
_inst	= noone;

// Check if the room has crops in it:
room_has_crops = instance_number(objCrop) > 0;

// If it does, we need to clear it so we don't wind up with duplicate entries:
if (room_has_crops)
	ds_list_clear(crop_data);

// Iterate through again:
for (i = 0; i < _count; i++)
{
	// Find each crop again:
	_inst = instance_find(objCrop, i);
	
	// Make sure they exist... Again...:
	if (instance_exists(_inst))
	{
		// But this time we need to add them to the list:
		ds_list_add(crop_data, _inst.crop_index);
	}
}
