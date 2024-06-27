function Crop(_name, _id, _type) constructor
{
	crop_name		= _name;
	crop_id			= _id;
	crop_type		= _type;
	
	age								= 0;
	growth_rate						= 0;
	growth_stage					= 0;
	growth_stage_max				= 0;
	fully_grown						= false;
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

function crop_get_name(_crop)
{
	if (_crop != NULL)
		return _crop.crop_name;
	return "<UNDEFINED>";
}

function crop_get_id(_crop)
{
	if (_crop != NULL)
		return _crop.crop_id;
	return -1;
}

function crop_get_type(_crop)
{
	if (_crop != NULL)
		return _crop.crop_type;
	return -1;
}

function crop_get_age(_crop)
{
	if (_crop != NULL)
		return _crop.age;
	return 0;
}

function crop_get_growth_rate(_crop)
{
	if (_crop != NULL)
		return _crop.growth_rate;
	return 0;
}

function crop_get_growth_stage(_crop)
{
	if (_crop != NULL)
		return _crop.growth_stage;
	return 0;
}

function crop_get_growth_stage_max(_crop)
{
	if (_crop != NULL)
		return _crop.growth_stage_max;
	return 0;
}

function crop_is_fully_grown(_crop)
{
	if (_crop != NULL)
		return _crop.fully_grown;
	return false;
}

function crop_is_wet(_crop)
{
	if (_crop !=  NULL)
		return _crop.wet;
	return false;
}

function crop_age_up(_crop)
{
	if (_crop != NULL)
		_crop.age++;
}
