function format_time(_num)
{
	if (_num < 10)
		return "0" + string(_num);
	return _num;
}

function set_time_of_day_color(_r, _g, _b, _contrast=1, _saturation=1, _brightness=1, _pop_strength=0, _pop_threshold=0)
{
	var i = 0;
	if (color[0, 0] == undefined)
	{
		i = 0;
	}
	else
	{
		i = array_length(color);
	}
	
	color[i, 0] = _r / 255.0;
	color[i, 1] = _g / 255.0;
	color[i, 2] = _b / 255.0;
	
	modifier[i, 0] = _contrast;
	modifier[i, 1] = _saturation;
	modifier[i, 2] = _brightness;
	modifier[i, 3] = _pop_strength;
	modifier[i, 4] = _pop_threshold;
}
