/// @description Initialize the axe item.
// Inherit the parent event
event_inherited();

// Create each variant of the axe here:
axe_wooden = new ItemAxe("Wooden Axe", 0, ITEM_TYPE.ITEM_TYPE_AXE, 1, 50, 50);

// Set the item_index to the first item declared for now:
item_index = axe_wooden;
