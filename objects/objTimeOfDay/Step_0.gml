/// @description Update the time of day and time based events.
// Increment the time of day:
time_of_day += time_scale;

// Make sure we don't overflow on the time of day:
if (time_of_day > 86400)
{
	// Reset it back to zero if we do:
	time_of_day = 0;
	
	// Okay, now to handle crops. Remember how in objCropManager I said we'd need this data structure
	// for storing, manipulating, and saving the crops? Well here, we need it to manipulate the crops
	// and keep the data for the to simulate persistence. Check if the data structure exists:
	if (ds_exists(crop_data, ds_type_list))
	{
		// Now we only want to iterate through the crop data structure if the size is greater than zero,
		// otherwose, we can ignore it:
		var _size = ds_list_size(crop_data);
		if (_size > 0)
		{
			// Iterate through if we have data stored in the crop data structure:
			for (var i = 0; i < _size; i++)
			{
				// Crops will only grow if they're wet, so let's check if they are:
				if (crop_is_wet(crop_data[| i]))
				{
					// Then, at the end of each day, they will age up:
					crop_age_up(crop_data[| i]);
				}
			}
		}
	}
}

// Check if it's day time:
daytime = ((time_of_day >= 21600) && (time_of_day < 64800));
if (daytime)
{
	// Check if the daytime ambience is already playing:
	if (!audio_is_playing(sndEffectDaytimeAmbience))
	{
		// If not, let's fade it into existance:
		audio_sound_gain(sndEffectDaytimeAmbience, 1, 1000);
	}
	// Otherwise, check for night ambience:
	else if (audio_is_playing(sndEffectNighttimeAmbience))
	{
		// fade it out until it stops because it's daytime:
		audio_sound_gain(sndEffectNighttimeAmbience, 0, 1000);
	}
}
else
{
	// Here, we have to do this check again because we want to check for the night time:
	if (!audio_is_playing(sndEffectNighttimeAmbience))
	{
		// Gain audio volume for the crickets:
		audio_sound_gain(sndEffectNighttimeAmbience, 1, 1000);
	}
	// We have to check if the birds are still chirping because it's night time:
	else if (audio_is_playing(sndEffectDaytimeAmbience))
	{
		// If so, fade it out until it stops because it's night time:
		audio_sound_gain(sndEffectDaytimeAmbience, 0, 1000);
	}
}

// Check if the gain volume is greater than 0 (daytime):
if (audio_sound_get_gain(sndEffectDaytimeAmbience) > 0)
{
	// If so, we still need to check if it's playing or we'll get overlap of the sound:
	if (!audio_is_playing(sndEffectDaytimeAmbience))
	{
		// If it's not already playing, play it:
		audio_play_sound(sndEffectDaytimeAmbience, 100, true);
	}
}
else
{
	// If it's nighttime, stop the birds so the crickets can live in peace:
	audio_stop_sound(sndEffectDaytimeAmbience);
}

// Check if the gain volume is greater than 0 (nighttime):
if (audio_sound_get_gain(sndEffectNighttimeAmbience) > 0)
{
	// If so, we still need to check if it's playing or we'll get overlap of the sound:
	if (!audio_is_playing(sndEffectNighttimeAmbience))
	{
		// If it's not already playing, play it:
		audio_play_sound(sndEffectNighttimeAmbience, 100, true);
	}
}
else
{
	// If it's daytime, stop the crickets so the birds can live in peace:
	audio_stop_sound(sndEffectNighttimeAmbience);
}

// This controls the passage of time based on the time of day variable:
seconds = time_of_day mod 60;
minutes = time_of_day div 60 mod 60;
hours = time_of_day div 60 div 60 mod 24;
days += time_of_day div 86400;

// Get time for the shader. We need a value from 0-1 so we need to divide it by the max value:
var _time = time_of_day / 86400;

// The "keys" are essentially key frames for the time of day colors:
key_previous	= min(floor(_time * number_of_key_times), number_of_key_times - 1);
key_next		= (key_previous + 1) mod number_of_key_times;

// Used to interpolate the colors from dawn until dusk:
var _lerp_amt = (_time - key_previous / number_of_key_times) * number_of_key_times;

// Get the colors mixed:
color_mix = [
	lerp(color[key_previous, 0], color[key_next, 0], _lerp_amt),
	lerp(color[key_previous, 1], color[key_next, 1], _lerp_amt),
	lerp(color[key_previous, 2], color[key_next, 2], _lerp_amt)
];

// The modifier is all of the other properties in the shader:
modifier_mix = [
	lerp(modifier[key_previous, 0], modifier[key_next, 0], _lerp_amt),
	lerp(modifier[key_previous, 1], modifier[key_next, 1], _lerp_amt),
	lerp(modifier[key_previous, 2], modifier[key_next, 2], _lerp_amt)
];
