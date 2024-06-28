/// @description Insert description here
// You can write your code in this editor
if (room == global.farm_room)
{	
	for (var i = 0; i < ds_list_size(crop_data); i++)
	{
		var _inst = crop_data[| i];
		if (!instance_exists(_inst))
		{
			show_debug_message("The crop doesn't exist anymore!");
			//var _crop = crop_data[| i].crop_index;
			//crop_place_at(_inst.x, _inst.y, _crop.crop_id);
		}
	}
}
