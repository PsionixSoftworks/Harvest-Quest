/// @description Insert description here
// You can write your code in this editor
time_of_day += time_scale;
if (time_of_day > 86400)
{
	time_of_day = 0;
	days++;
}

seconds = time_of_day mod 60;
minutes = time_of_day div 60 mod 60;
hours = time_of_day div 60 div 60 mod 24;
