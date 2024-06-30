/// @description Insert description here
// You can write your code in this editor
time_of_day += time_scale;
if (time_of_day > 86400)
{
	time_of_day = 0;
	
	if (ds_exists(crop_data, ds_type_list))
	{
		var _size = ds_list_size(crop_data);
		if (_size > 0)
		{
			for (var i = 0; i < _size; i++)
			{
				if (crop_is_wet(crop_data[| i]))
					crop_age_up(crop_data[| i]);
			}
		}
	}
}

// Check if it's day time:
daytime = ((time_of_day >= 21600) && (time_of_day < 64800));
if (daytime)
{
	if (!audio_is_playing(sndEffectDaytimeAmbience))
	{
		audio_sound_gain(sndEffectDaytimeAmbience, 1, 1000);
	}
	else if (audio_is_playing(sndEffectNighttimeAmbience))
	{
		audio_sound_gain(sndEffectNighttimeAmbience, 0, 1000);
	}
}
else
{
	if (!audio_is_playing(sndEffectNighttimeAmbience))
	{
		audio_sound_gain(sndEffectNighttimeAmbience, 1, 1000);
	}
	else if (audio_is_playing(sndEffectDaytimeAmbience))
	{
		audio_sound_gain(sndEffectDaytimeAmbience, 0, 1000);
	}
}

if (audio_sound_get_gain(sndEffectDaytimeAmbience) > 0)
{
	if (!audio_is_playing(sndEffectDaytimeAmbience))
		audio_play_sound(sndEffectDaytimeAmbience, 100, true);
}
else
{
	audio_stop_sound(sndEffectDaytimeAmbience);
}

if (audio_sound_get_gain(sndEffectNighttimeAmbience) > 0)
{
	if (!audio_is_playing(sndEffectNighttimeAmbience))
		audio_play_sound(sndEffectNighttimeAmbience, 100, true);
}
else
{
	audio_stop_sound(sndEffectNighttimeAmbience);
}

seconds = time_of_day mod 60;
minutes = time_of_day div 60 mod 60;
hours = time_of_day div 60 div 60 mod 24;
days += time_of_day div 86400;

var _time = time_of_day / 86400;
key_previous	= min(floor(_time * number_of_key_times), number_of_key_times - 1);
key_next		= (key_previous + 1) mod number_of_key_times;

var _lerp_amt = (_time - key_previous / number_of_key_times) * number_of_key_times;

color_mix = [
	lerp(color[key_previous, 0], color[key_next, 0], _lerp_amt),
	lerp(color[key_previous, 1], color[key_next, 1], _lerp_amt),
	lerp(color[key_previous, 2], color[key_next, 2], _lerp_amt)
];

modifier_mix = [
	lerp(modifier[key_previous, 0], modifier[key_next, 0], _lerp_amt),
	lerp(modifier[key_previous, 1], modifier[key_next, 1], _lerp_amt),
	lerp(modifier[key_previous, 2], modifier[key_next, 2], _lerp_amt)
];
