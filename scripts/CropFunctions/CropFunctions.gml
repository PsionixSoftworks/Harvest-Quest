/// @description The crop constructor. Creates a new crop type.
/// @param _name The name of the crop.
/// @param _id The id of the crop.
/// @param _type The type of crop.
function Crop(_name, _id, _type) constructor
{
	// Declare all of the item properties:
	crop_name			= _name;
	crop_id				= _id;
	crop_type			= _type;
	age					= 0;
	growth_rate			= 0;
	growth_stage		= 0;
	growth_stage_max	= 0;
	wet					= false;
}

/// @description The carrot crop constructor. Inherits from the crop constructor.
function CropCarrot() : Crop("Carrot", 0, CROP_TYPE.CROP_TYPE_CARROT) constructor
{
}

/// @description The tomaato crop constructor. Inherits from the crop constructor.
function CropTomato() : Crop("Tomato", 1, CROP_TYPE.CROP_TYPE_TOMATO) constructor
{
}

/// @description The strawberry crop constructor. Inherits from the crop constructor.
function CropStrawberry() : Crop("Strawberry", 2, CROP_TYPE.CROP_TYPE_STRAWBERRY) constructor
{
}

/// @description The pumpkin crop constructor. Inherits from the crop constructor.
function CropPumpkin() : Crop("Pumpkin", 3, CROP_TYPE.CROP_TYPE_PUMPKIN) constructor
{
}

/// @description The corn crop constructor. Inherits from the crop constructor.
function CropCorn() : Crop("Corn", 4, CROP_TYPE.CROP_TYPE_CORN) constructor
{
}

/// @description The potato crop constructor. Inherits from the crop constructor.
function CropPotato() : Crop("Potato", 5, CROP_TYPE.CROP_TYPE_POTATO) constructor
{
}

/// @description The watermelon crop constructor. Inherits from the crop constructor.
function CropWatermelon() : Crop("Watermelon", 6, CROP_TYPE.CROP_TYPE_WATERMELON) constructor
{
}

/// @description The radish crop constructor. Inherits from the crop constructor.
function CropRadish() : Crop("Radish", 7, CROP_TYPE.CROP_TYPE_RADISH) constructor
{
}

/// @description The lettuce crop constructor. Inherits from the crop constructor.
function CropLettuce() : Crop("Lettuce", 8, CROP_TYPE.CROP_TYPE_LETTUCE) constructor
{
}

/// @description The wheat crop constructor. Inherits from the crop constructor.
function CropWheat() : Crop("Wheat", 9, CROP_TYPE.CROP_TYPE_WHEAT) constructor
{
}

/// @description The eggplant crop constructor. Inherits from the crop constructor.
function CropEggplant() : Crop("Eggplant", 10, CROP_TYPE.CROP_TYPE_EGGPLANT) constructor
{
}

/// @description Place a crop at the x and y positions.
/// @param _x The x coordinate.
/// @param _y The y coordinate.
/// @param _crop_id The id of the crop to be placed.
function crop_place_at(_x, _y, _crop_id)
{
	// Make sure the crop is not undefined:
	if (_crop_id != undefined)
	{
		// Declare local variables:
		var _inst, _layer;
			_inst = noone;
			_layer = find_valid_instance_layer("Instances");
		
		// Check if the crop id is a carrot:
		if (_crop_id == 0)
		{
			// If so, place a carrot crop:
			_inst = instance_create_layer(_x, _y, _layer, objCropCarrot);
		}
		// Check if the crop id is a tomato:
		else if (_crop_id == 1)
		{
			// If so, place a tomato crop:
			_inst = instance_create_layer(_x, _y, _layer, objCropTomato);
		}
		// Check if the crop id is a strawberry:
		else if (_crop_id == 2)
		{
			// If so, place a strawberry crop:
			_inst = instance_create_layer(_x, _y, _layer, objCropStrawberry);
		}
		// Check if the crop id is a pumpkin:
		else if (_crop_id == 3)
		{
			// If so, place a pumpkin crop:
			_inst = instance_create_layer(_x, _y, _layer, objCropPumpkin);
		}
		// Check if the crop id is corn:
		else if (_crop_id == 4)
		{
			// If so, place a corn crop:
			_inst = instance_create_layer(_x, _y, _layer, objCropCorn);
		}
		// Check if the crop id is a potato:
		else if (_crop_id == 5)
		{
			// If so, place a potato crop:
			_inst = instance_create_layer(_x, _y, _layer, objCropPotato);
		}
		// Check if the crop id is a watermelon:
		else if (_crop_id == 6)
		{
			// If so, place a watermelon crop:
			_inst = instance_create_layer(_x, _y, _layer, objCropWatermelon);
		}
		// Check if the crop id is a radish:
		else if (_crop_id == 7)
		{
			// If so, place a radish crop:
			_inst = instance_create_layer(_x, _y, _layer, objCropRadish);
		}
		// Check if the crop id is lettuce:
		else if (_crop_id == 8)
		{
			// If so, place a lettuce crop:
			_inst = instance_create_layer(_x, _y, _layer, objCropLettuce);
		}
		// Check if the crop id is wheat:
		else if (_crop_id == 9)
		{
			// If so, place a wheat crop:
			_inst = instance_create_layer(_x, _y, _layer, objCropWheat);
		}
		// Check if the crop id is eggplant:
		else if (_crop_id == 10)
		{
			// If so, place an eggplant crop:
			_inst = instance_create_layer(_x, _y, _layer, objCropEggplant);
		}
		// Add the new crop to our crop data list and return it:
		ds_list_add(crop_data, _inst.crop_index);
		return _inst;
	}
	// Otherwise, return noone:
	return noone;
}

/// @description Get the name of the crop.
/// @param _crop The crop index of the crop.
/// @returns String
function crop_get_name(_crop)
{
	// Make sure the crop exists:
	if (_crop != noone)
	{
		// If so, return the crop name:
		return _crop.crop_name;
	}
	// Otherwise, return undefined string:
	return "<UNDEFINED>";
}

/// @description Get the id of the crop.
/// @param _crop The crop index of the crop.
/// @returns Real
function crop_get_id(_crop)
{
	// Make sure the crop exists:
	if (_crop != noone)
	{
		// If so, return the crop id:
		return _crop.crop_id;
	}
	// Otherwise, return failure:
	return -1;
}

/// @description Get the type of the crop.
/// @param _crop The crop index of the crop.
/// @returns Real
function crop_get_type(_crop)
{
	// Make sure the crop exists:
	if (_crop != noone)
	{
		// If so, return the crop type:
		return _crop.crop_type;
	}
	// Otherwise, return failure:
	return -1;
}

/// @description Get the age of the crop (in days).
/// @param _crop The crop index of the crop.
/// @returns Real
function crop_get_age(_crop)
{
	// Make sure the crop exists:
	if (_crop != noone)
	{
		// If so, return the crop age:
		return _crop.age;
	}
	// Otherwise, return zero:
	return 0;
}

/// @description Get the growth rate of the crop.
/// @param _crop The crop index of the crop.
/// @returns Real
function crop_get_growth_rate(_crop)
{
	// Make sure the crop exists:
	if (_crop != noone)
	{
		// If so, return the crop growth rate:
		return _crop.growth_rate;
	}
	// Otherwise, return zero:
	return 0;
}

/// @description Get the grwoth stage of the crop.
/// @param _crop The crop index of the crop.
/// @returns Real
function crop_get_growth_stage(_crop)
{
	// Make sure the crop exists:
	if (_crop != noone)
	{
		// If so, return the crop growth stage:
		return _crop.growth_stage;
	}
	// Otherwise, return zero:
	return 0;
}

/// @description Get the maximum growth stage of the crop.
/// @param _crop The crop index of the crop.
/// @returns Real
function crop_get_growth_stage_max(_crop)
{
	// Make sure the crop exists:
	if (_crop != noone)
	{
		// If so, return the crop maximum growth stage:
		return _crop.growth_stage_max;
	}
	// Otherwise, return zero:
	return 0;
}

/// @description Get whether the crop is fully grown or not.
/// @param _crop The crop index of the crop.
/// @returns Boolean
function crop_is_fully_grown(_crop)
{
	// Make sure the crop exists:
	if (_crop != noone)
	{
		// If so, return the whether the crop is fully grown:
		return (_crop.growth_stage == _crop.growth_stage_max);
	}
	// Otherwise, return false:
	return false;
}

/// @description Get whether the crop is wet or not.
/// @param _crop The crop index of the crop.
/// @returns Real
function crop_is_wet(_crop)
{
	// Make sure the crop exists:
	if (_crop !=  noone)
	{
		// If so, return whether the crop is wet or not:
		return _crop.wet;
	}
	// Otherwise, return false:
	return false;
}

/// @description Age up the crop by one day.
/// @param _crop The crop index of the crop.
/// @returns N/A
function crop_age_up(_crop)
{
	// Make sure the crop exists:
	if (_crop != noone)
	{
		// Age the crop up by one day:
		_crop.age++;
	}
}

/// @description Set the growth rate of the crop.
/// @param _crop The crop index of the crop.
/// @param _x The growth rate of the crop.
/// @returns Real
function crop_set_growth_rate(_crop, _x)
{
	// Make sure the crop exists:
	if (_crop != noone)
	{
		// Set the crop growth rate:
		_crop.growth_rate = _x;
	}
}

/// @description Set the growth stage of the crop.
/// @param _crop The crop index of the crop.
/// @param _x The growth stage of the crop.
/// @returns Real
function crop_set_growth_stage(_crop, _x)
{
	// Make sure the crop exists:
	if (_crop != noone)
	{
		// Set the crop growth stage:
		_crop.growth_stage =_x;
	}
}

/// @description Set the maximum growth stage of the crop.
/// @param _crop The crop index of the crop.
/// @param _x The maximum growth stage of the crop.
/// @returns Real
function crop_set_growth_stage_max(_crop, _x)
{
	// Make sure the crop exists:
	if (_crop != noone)
	{
		// Set the maximum crop growth stage:
		_crop.growth_stage_max =_x;
	}
}

/// @description Set the crop wet.
/// @param _crop The crop index of the crop.
/// @param _x Whether the crop is wet or not.
/// @returns Real
function crop_set_wet(_crop, _x)
{
	// Make sure the crop exists:
	if (_crop != noone)
	{
		// Set the crop to wet or not:
		_crop.wet = _x;
	}
}
