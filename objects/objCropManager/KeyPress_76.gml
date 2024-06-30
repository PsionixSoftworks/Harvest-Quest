/// @description Handle <L> key press.
// heck if we're in developer mode:
if (DEVELOPER_MODE)
{
	// Get the size of the crop data list:
	var _size = ds_list_size(crop_data);
	if (_size > 0)
	{
		// Pad the console so we can read it easier:
		show_debug_message("==================================================================================================================================================");
		
		// Iterate though the list up to the size:
		for (var i = 0; i < _size; i++)
		{
			// Print out all of the crops and their properties:
			show_debug_message("Crop Data: " + string(crop_data[| i]));
		}
	}
}
