function Crop(_name, _id, _type) constructor
{
	crop_name		= _name;
	crop_id			= _id;
	crop_type		= _type;
	
	age								= 0;
	growth_rate						= 0;
	growth_stage					= 0;
	growth_stage_max				= 0;
	wet								= false;
}

function CropCarrot() : Crop("Carrot", 0, CROP_TYPE.CROP_TYPE_CARROT) constructor
{
}

function CropTomato() : Crop("Tomato", 1, CROP_TYPE.CROP_TYPE_TOMATO) constructor
{
}

function CropStrawberry() : Crop("Strawberry", 2, CROP_TYPE.CROP_TYPE_STRAWBERRY) constructor
{
}

function CropPumpkin() : Crop("Pumpkin", 3, CROP_TYPE.CROP_TYPE_PUMPKIN) constructor
{
}

function CropCorn() : Crop("Corn", 4, CROP_TYPE.CROP_TYPE_CORN) constructor
{
}

function CropPotato() : Crop("Potato", 5, CROP_TYPE.CROP_TYPE_POTATO) constructor
{
}

function CropWatermelon() : Crop("Watermelon", 6, CROP_TYPE.CROP_TYPE_WATERMELON) constructor
{
}

function CropRadish() : Crop("Radish", 7, CROP_TYPE.CROP_TYPE_RADISH) constructor
{
}

function CropLettuce() : Crop("Lettuce", 8, CROP_TYPE.CROP_TYPE_LETTUCE) constructor
{
}

function CropWheat() : Crop("Wheat", 9, CROP_TYPE.CROP_TYPE_WHEAT) constructor
{
}

function CropEggplant() : Crop("Eggplant", 10, CROP_TYPE.CROP_TYPE_EGGPLANT) constructor
{
}

function crop_place_at(_x, _y, _crop_id)
{
	if (_crop_id != undefined)
	{
		var _inst, _layer;
			_inst = noone;
			_layer = layer_get_id("Instances");
		if (_crop_id == 0)
			_inst = instance_create_layer(_x, _y, _layer, objCropCarrot);
		else if (_crop_id == 1)
			_inst = instance_create_layer(_x, _y, _layer, objCropTomato);
		else if (_crop_id == 2)
			_inst = instance_create_layer(_x, _y, _layer, objCropStrawberry);
		else if (_crop_id == 3)
			_inst = instance_create_layer(_x, _y, _layer, objCropPumpkin);
		else if (_crop_id == 4)
			_inst = instance_create_layer(_x, _y, _layer, objCropCorn);
		else if (_crop_id == 5)
			_inst = instance_create_layer(_x, _y, _layer, objCropPotato);
		else if (_crop_id == 6)
			_inst = instance_create_layer(_x, _y, _layer, objCropWatermelon);
		else if (_crop_id == 7)
			_inst = instance_create_layer(_x, _y, _layer, objCropRadish);
		else if (_crop_id == 8)
			_inst = instance_create_layer(_x, _y, _layer, objCropLettuce);
		else if (_crop_id == 9)
			_inst = instance_create_layer(_x, _y, _layer, objCropWheat);
		else if (_crop_id == 10)
			_inst = instance_create_layer(_x, _y, _layer, objCropEggplant);
		ds_list_add(crop_data, _inst.crop_index);
		return _inst;
	}
	return noone;
}

function crop_get_name(_crop)
{
	if (_crop != noone)
		return _crop.crop_name;
	return "<UNDEFINED>";
}

function crop_get_id(_crop)
{
	if (_crop != noone)
		return _crop.crop_id;
	return -1;
}

function crop_get_type(_crop)
{
	if (_crop != noone)
		return _crop.crop_type;
	return -1;
}

function crop_get_age(_crop)
{
	if (_crop != noone)
		return _crop.age;
	return 0;
}

function crop_get_growth_rate(_crop)
{
	if (_crop != noone)
		return _crop.growth_rate;
	return 0;
}

function crop_get_growth_stage(_crop)
{
	if (_crop != noone)
		return _crop.growth_stage;
	return 0;
}

function crop_get_growth_stage_max(_crop)
{
	if (_crop != noone)
		return _crop.growth_stage_max;
	return 0;
}

function crop_is_fully_grown(_crop)
{
	if (_crop != noone)
		return (_crop.growth_stage == _crop.growth_stage_max);
	return false;
}

function crop_is_wet(_crop)
{
	if (_crop !=  noone)
		return _crop.wet;
	return false;
}

function crop_age_up(_crop)
{
	if (_crop != noone)
		_crop.age++;
}

function crop_set_growth_rate(_crop, _x)
{
	if (_crop != noone)
		growth_rate = _x;
}

function crop_set_growth_stage(_crop, _x)
{
	if (_crop != noone)
		growth_stage =_x;
}

function crop_set_growth_stage_max(_crop, _x)
{
	if (_crop != noone)
		growth_stage_max =_x;
}

function crop_set_wet(_crop, _x)
{
	if (_crop != noone)
		wet = _x;
}
