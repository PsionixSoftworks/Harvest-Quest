/// @description Initialize the Player entity.
// Setup movement variables:
xspeed			= 0;
yspeed			= 0;
max_walk_speed	= 1;
max_run_speed	= max_walk_speed * 2;
spd				= max_walk_speed;
facing			= "Down";
action			= "Walk";

// Setup state machine:
state			= PLAYER_STATE.PLAYER_STATE_NORMAL;

// Other variables:
active			= false;
lmb_released	= true;
alarm[0]		= game_get_speed(gamespeed_fps) / 2;
image_index		= 0;
image_speed		= 0;
depth			= -y;

// Create the camera for the player:
instance_create_layer(x, y, "Instances", objCamera);
