/// @description Insert description here
// You can write your code in this editor
if (DEVELOPER_MODE)
{
	var _size = ds_list_size(crop_data);
	if (_size > 0)
	{
		show_debug_message("==================================================================================================================================================");
		for (var i = 0; i < _size; i++)
		{
			show_debug_message("Crop Data: " + string(crop_data[| i]));
		}
		show_debug_message("Room Has Crops: " + string(room_has_crops));
	}
}
