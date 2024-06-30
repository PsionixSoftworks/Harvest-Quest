/// @description Handle game end.
// Check if the crop data structure has been destroyed before trying to destroy it:
if (ds_exists(crop_data, ds_type_list))
	ds_list_destroy(crop_data);
