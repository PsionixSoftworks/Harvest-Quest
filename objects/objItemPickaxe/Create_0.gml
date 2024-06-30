/// @description Initialize the pickaxe item.
// Inherit the parent event
event_inherited();

// Create each variant of the pickaxe here:
pickaxe_wooden			= new ItemPickaxe("Wooden Pickaxe", 0, ITEM_TYPE.ITEM_TYPE_PICKAXE, 1, 50, 50);

// Set the item_index to the first item declared for now:
item_index				= pickaxe_wooden;
