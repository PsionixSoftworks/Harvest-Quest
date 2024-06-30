/// @description Draw the current time of day on the GUI layer.
// Draw the current time of day (24 hour clock):
draw_text(0, 0, 
	string(format_time(hours)) + ":" +
	string(format_time(minutes)) + ":" +
	string(format_time(seconds)) + "\n" +
	"Days Passed: " + string(days)
);
