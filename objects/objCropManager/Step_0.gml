/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_pressed(ord("Q")))
{
	if (crop_age < 5)
		crop_age++;
}

var _size = ds_list_size(crop_data);
for (var i = 0; i < _size; i++)
{
	var _inst = ds_list_find_value(crop_data, i);
	if (instance_exists(_inst))
	{
		_inst.crop_index.age = crop_age;
	}
}
