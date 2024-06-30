/// @description Handle <1> key.
// Check if the 0x0 room exists:
if (room_exists(rmOverworld0x0))
{
	// check if we're in the 0x0 overworld room already:
	if (room != rmOverworld0x0)
	{
		// If not, go to it, otherwise do nothing:
		room_goto(rmOverworld0x0);
	}
}
