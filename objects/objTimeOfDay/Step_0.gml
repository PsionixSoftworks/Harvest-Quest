/// @description Insert description here
// You can write your code in this editor
time_of_day += time_scale;
if (time_of_day > 86400)
{
	time_of_day = 0;
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
