/// @description Initialize the hoe item.
// Inherit the parent event
event_inherited();

// Create each variant of the hoe here:
hoe_wooden = new ItemHoe("Wooden Hoe", 0, ITEM_TYPE.ITEM_TYPE_HOE, 50, 50);

// Set the item_index to the first item declared for now:
item_index = hoe_wooden;
