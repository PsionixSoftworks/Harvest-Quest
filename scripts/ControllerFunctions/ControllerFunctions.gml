/// @description Checks to see if all persistent/important instances have been loaded
function check_instances()
{
	// Declare local variables:
	var _crop_mgr, _timeofday, _player, _camera, _inventory, _hotbar, _layer;
		_crop_mgr	= instance_find(objCropManager,			0);
		_timeofday	= instance_find(objTimeOfDay,			0);
		_player		= instance_find(objEntityPlayer,		0);
		_camera		= instance_find(objCamera,				0);
		_inventory	= instance_find(objInterfaceInventory,	0);
		_hotbar		= instance_find(objInterfaceHotbar,		0);
		_layer		= find_valid_instance_layer("Instances");
	
	// Check if the crop manager has been placed in the room:
	if (!instance_exists(_crop_mgr))
	{
		print_warn("No valid crop manager in scene. Creating a new one.");
		_crop_mgr		= instance_create_layer(0, 0, _layer, objCropManager);
	}
	
	// Check if the time of day has been placed in the room:
	if (!instance_exists(_timeofday))
	{
		print_warn("No valid time of day instance in scene. Creating a new one.");
		_timeofday		= instance_create_layer(0, 0, _layer, objTimeOfDay);
	}
	
	// Check if the player has been placed in the room:
	if (!instance_exists(_player))
	{
		print_warn("No valid player instance in scene. Creating a new one.");
		_player			= instance_create_layer(room_width / 2, room_height / 2, _layer, objEntityPlayer);
	}
	
	// Check if the camera object has been placed in the room:
	if (!instance_exists(_camera))
	{
		print_warn("No valid camera in scene. Creating a new one.");
		_camera			= instance_create_layer(_player.x, _player.y, _layer, objCamera);
	}
	
	// Check if the inventory interface has been placed in the room:
	if (!instance_exists(_inventory))
	{
		print_warn("No valid inventory instance in scene. Creating a new one.");
		_inventory		= instance_create_layer(0, 0, _layer, objInterfaceInventory);
	}
	
	// Check if the hotbar interface has been placed in the room:
	if (!instance_exists(_hotbar))
	{
		print_warn("No valid hotbar interface in scene. Creating a new one.");
		_hotbar			= instance_create_layer(0, 0, _layer, objInterfaceHotbar);
	}
}
