/// @description Initialize the Player entity.
// Declare instance variables:
xspeed			= 0;									// The x movement speed.
yspeed			= 0;									// The y movement speed.
max_walk_speed	= 1;									// Sets the walking speed.
max_run_speed	= max_walk_speed * 2;					// Run speed = walk speed * 2
spd				= max_walk_speed;						// Current movement speed.
facing			= "Down";								// The direction the player is facing.
action			= "Walk";								// The action the player is performing.
state			= PLAYER_STATE.PLAYER_STATE_NORMAL;		// Set the default state.
active			= false;								// Enable's/disables movement and all other actions.
enabled			= true;									// Same as active, but hides the entity as well.
lmb_released	= true;									// Used for items when the left mouse is released.

// Declare built-in variables:
alarm[0]		= game_get_speed(gamespeed_fps) / 2;	// Active timer.
image_index		= 0;									// 0th image index is idle stance.
image_speed		= 0;									// Stop the animation.
depth			= -y;									// For depth sorting based on sprite origin. Gives the illusion of 3D/depth.
