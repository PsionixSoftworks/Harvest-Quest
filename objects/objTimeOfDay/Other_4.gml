/// @description Insert description here
// You can write your code in this editor
if (time_of_day >= 21600 && time_of_day < 64800)
{
	if (!audio_is_playing(sndEffectDaytimeAmbience))
	{
		audio_play_sound(sndEffectDaytimeAmbience, 1, true);
	}
}
else
{
	if (!audio_is_playing(sndEffectNighttimeAmbience))
	{
		audio_play_sound(sndEffectNighttimeAmbience, 1, true);
	}
}
