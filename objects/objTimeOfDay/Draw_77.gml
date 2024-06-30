/// @description Draw the altered colors to the application surface.
// Get the view size for the application surface to resize to:
var _view_w, _view_h;
	_view_w = camera_get_view_width(view_camera[0]);
	_view_h = camera_get_view_height(view_camera[0]);

// Set the shader:
shader_set(shader_index);

// Pass in the uniforms:
shader_set_uniform_f_array(u_col, color_mix);
shader_set_uniform_f_array(u_modifier, modifier_mix);

// Draw the application surface with the colors of the day/night cycle:
draw_surface_stretched(application_surface, 0, 0, display_get_width(), display_get_height());

// And reset the shader as always:
shader_reset();
