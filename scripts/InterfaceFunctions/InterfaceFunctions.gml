function draw_text_shadowed(_x, _y, _text)
{
	draw_set_color(c_dkgray);
	draw_text(_x + 1, _y + 1, _text);
	draw_set_color(c_white);
	draw_text(_x, _y, _text);
}
