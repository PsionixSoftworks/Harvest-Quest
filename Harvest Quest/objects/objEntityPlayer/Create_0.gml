/// @description Initialize the Player entity.
// Setup speed variables:
xspeed			= 0;
yspeed			= 0;
maxWalkSpeed	= 1;
maxRunSpeed		= maxWalkSpeed * 2;
spd				= maxWalkSpeed;

// Setup state machine:
state			= PlayerState.PLAYER_STATE_NORMAL;
