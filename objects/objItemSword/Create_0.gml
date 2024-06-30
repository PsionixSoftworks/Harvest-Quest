/// @description Initialize the sword item.
// Inherit the parent event:
event_inherited();

// Create each variant of the sword here:
sword_wooden		= new ItemSword("Wooden Sword", 0, ITEM_TYPE.ITEM_TYPE_SWORD, 2, 50, 50);

// Set the item_index to the first item declared for now:
item_index			= sword_wooden;
