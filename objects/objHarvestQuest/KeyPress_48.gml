/// @description Handle <0> key.
// Check if the testroom exists (hint: in release mode, it will be -1):
if (room_exists(global.test_room))
{
	// check if we're in the test room already:
	if (room != global.test_room)
	{
		// If not, go to it, otherwise do nothing:
		room_goto(global.test_room);
	}
}
