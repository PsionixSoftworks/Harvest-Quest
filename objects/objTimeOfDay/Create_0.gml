/// @description Initialize the time of day.
// Declare instance variables:
time_of_day				= 43200;						// Time of day is any number between 0 and 86400.
seconds					= 0;							// The number of seconds passed.
minutes					= 0;							// The number of minutes passed.
hours					= 0;							// The number of hours passed.
days					= 0;							// The number of days passed.
time_scale				= 1;							// The time scale in secods per game second.
daytime					= true;							// Used for the ambient sounds.
shader_index			= shDayNight;					// The shader index we're using.
u_col					= shader_get_uniform(shader_index, "col");
u_modifier				= shader_get_uniform(shader_index, "modifier");
color[0, 0]				= -1;
color_mix				= -1;
modifier_mix			= -1;
modifier				= -1;
key_previous			= -1;
key_next				= -1;

// Disable drawing the application surface until we're ready to use it:
application_surface_draw_enable(false);

// Set the time of day colors so it looks organic and real:
set_time_of_day_color(10, 70, 200,		0.7, 0.6, 0.0,		5.5, 0.67);		// Midnight
set_time_of_day_color(10, 80, 220,		0.8, 0.9, 0.0,		2.0, 0.75);		// Late Night
set_time_of_day_color(220, 200, 175,	1.1, 1.3, 0.05,		0.8, 0.8);		// Dawn
set_time_of_day_color(245, 235, 190,	1.1, 1.1, 0.1,		0.0, 1.0);		// Morning
set_time_of_day_color(255, 250, 230,	1.3, 0.9, 0.15,		0.0, 1.0);		// Noon
set_time_of_day_color(215, 150, 200,	1.4, 1.1, 0.15,		0.0, 1.0);		// Late Afternoon
set_time_of_day_color(10, 80, 220,		0.9, 0.9, 0.0,		2.0, 0.75);		// Dusk

// Set the number of key frames for the time of day:
number_of_key_times		= array_length(color);

// So crickets don't start chirping at game start:
audio_sound_gain(sndEffectNighttimeAmbience, 0, 0);
