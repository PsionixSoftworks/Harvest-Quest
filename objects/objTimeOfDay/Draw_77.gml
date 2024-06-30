/// @description Insert description here
// You can write your code in this editor
var _view_w, _view_h;
	_view_w = camera_get_view_width(view_camera[0]);
	_view_h = camera_get_view_height(view_camera[0]);

shader_set(shader_index);
shader_set_uniform_f_array(u_col, color_mix);
shader_set_uniform_f_array(u_modifier, modifier_mix);
draw_surface_stretched(application_surface, 0, 0, display_get_width(), display_get_height());
shader_reset();
