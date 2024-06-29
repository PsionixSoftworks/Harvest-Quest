/// @description Manage crops at the start of the room.
// Declare local variables:
var _count, _inst, i;
_count	= instance_number(objCrop);
_inst	= noone;

//// Iterate through the number of instances:
//for (i = 0; i < _count; i++)
//{
//	// Find each crop:
//	_inst = instance_find(objCrop, i);
	
//	// Make sure they exist:
//	if (instance_exists(_inst))
//	{
//		// Get the size of the crop_data list:
//		var _size = ds_list_size(crop_data);
		
//		// Check if we have stuff in there:
//		if (_size > 0)
//		{
//			// Pass along each of the crop's properties:
//			_inst.crop_index = crop_data[| i];
//		}
//	}
//}

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
