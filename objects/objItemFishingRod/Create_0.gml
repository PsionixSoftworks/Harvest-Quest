/// @description Initialize the fishing rod item.
// Inherit the parent event
event_inherited();

// Create each variant of the fishing rod here:
fishing_rod = new ItemFishingRod("Fishing Rod", 0, ITEM_TYPE.ITEM_TYPE_FISHING_ROD, 45, 45);

// Set the item_index to the first item declared for now:
item_index = fishing_rod;
