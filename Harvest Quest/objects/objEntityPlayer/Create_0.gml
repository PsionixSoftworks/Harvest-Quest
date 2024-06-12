/// @description Initialize the Player entity.
// Setup movement variables:
xspeed			= 0;
yspeed			= 0;
maxWalkSpeed	= 1;
maxRunSpeed		= maxWalkSpeed * 2;
spd				= maxWalkSpeed;
facing			= "Down";
action			= "Walk";

// Setup state machine:
state			= PlayerState.PLAYER_STATE_NORMAL;

// Other variables:
active			= false;
alarm[0]		= room_speed / 2;
image_index		= 0;
image_speed		= 0;
depth			= -y;

// Create the camera for the player:
instance_create_layer(x, y, "Instances", objCamera);
