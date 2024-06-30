// Make sure we have objHarvestQuest so we can initialize the game properly:
if (!instance_exists(objHarvestQuest))
{
	print_error("Harvest Quest instance is missing from rmInit. Aborting...");
	game_end(-1);
}
