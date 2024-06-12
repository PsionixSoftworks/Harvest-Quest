/// @description Update the camera movement
// Find the player:
var _inst = instance_find(objEntityPlayer, 0);
if (instance_exists(_inst))
{
	// Set the target to the player:
	target = _inst;
}

if (target != noone)
{
	xpos = target.x;
	ypos = target.y;
}

// Move the camera to the target smoothly:
x += (xpos - x) / 16;
y += (ypos - y) / 12;

// Now update the camera pos:
var _w, _h;
	_w = camera_get_view_width(view_camera[0]);
	_h = camera_get_view_height(view_camera[0]);

// Keep the view within bounds:
if (x < (_w / 2) + view_buffer)
	x = (_w / 2) + view_buffer;
if (x > room_width - (_w / 2) - view_buffer)
	x = room_width - (_w / 2) - view_buffer;
if (y < (_h / 2) + view_buffer)
	y = (_h / 2) + view_buffer;
if (y > room_height - (_h / 2) - view_buffer)
	y = room_height - (_h / 2) - view_buffer

// Move the camera to where it belongs:
camera_set_view_pos(view_camera[0], x - (_w / 2), y - (_h / 2));
