/// @description Print an info log.
/// @param _msg The message to print.
/// @returns N/A
function print_info(_msg)
{
	// Print the info to the consoole with the "[INFO]:" prefix:
	show_debug_message("[INFO]: " + string(_msg));
}

/// @description Print a warning log.
/// @param _msg The message to print.
/// @returns N/A
function print_warn(_msg)
{
	// Print the info to the consoole with the "[WARNING]:" prefix:
	show_debug_message("[WARNING]: " + string(_msg));
}

/// @description Print an error log.
/// @param _msg The message to print.
/// @returns N/A
function print_error(_msg)
{
	// Print the info to the consoole with the "[ERROR]:" prefix and end the game with exit code -1:
	show_debug_message("[ERROR]: " + string(_msg));
	game_end(-1);
}

/// @description Format the time string.
/// @param _num The number to convert to XX or 0X if it's less than 10.
/// @returns Real. The formatted number.
function format_time(_num)
{
	// Check if the number is less than 10:
	if (_num < 10)
	{
		// If so, put a zero in front of it until it reaches 10:
		return "0" + string(_num);
	}
	// Return the (unformatted) number as a string:
	return string(_num);
}

/// @description Sets the colors of the different times of day.
/// @param _r The value of the red color (0-255).
/// @param _g The value of the green color (0-255).
/// @param _b The value of the blue color (0-255).
/// @param _contrast (optional) The contrast of the colors.
/// @param _saturation (optional) The saturation of the colors.
/// @param _brightness (optional) The brightness or value of the colors.
/// @param _pop_strength (optional) The amount colors "pop" when it gets dark.
/// @param _pop_threshold (optional) The threshold of the pop value.
/// @returns N/A
function set_time_of_day_color(_r, _g, _b, _contrast=1, _saturation=1, _brightness=1, _pop_strength=0, _pop_threshold=0)
{
	// Declare local variables:
	var i = 0;
	
	// Check if the color array is undefined:
	if (color[0, 0] == undefined)
	{
		// If so, set the index (i) to zero:
		i = 0;
	}
	else
	{
		// Otherwise, set it to the length of the array:
		i = array_length(color);
	}
	
	// Set the RGB colors:
	color[i, 0] = _r / 255.0;
	color[i, 1] = _g / 255.0;
	color[i, 2] = _b / 255.0;
	
	// Set the modifiers for a more appealing look:
	modifier[i, 0] = _contrast;
	modifier[i, 1] = _saturation;
	modifier[i, 2] = _brightness;
	modifier[i, 3] = _pop_strength;
	modifier[i, 4] = _pop_threshold;
}

/// @description Look for a valid instance layer by name. If it doesn't exist, create it.
/// @param _layer_name The name of the later to assign.
/// @returns String. The name of the layer.
function find_valid_instance_layer(_layer_name)
{
	// Check if the layer exists:
	if (!layer_exists(layer_get_id(_layer_name)))
	{
		// If not, let's create a temporary one named "Instances":
		_layer_name = layer_create(0, "Instances");
	}
	// Return the layer name to the caller:
	return _layer_name;
}
