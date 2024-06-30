/// @description Initialize the crop item.
// Inherit the parent event
event_inherited();

// Create each variant of the crop item here:
crop_carrot			= new ItemCrop("Carrot",		0, ITEM_TYPE.ITEM_TYPE_CROPS);
crop_tomato			= new ItemCrop("Tomato",		1, ITEM_TYPE.ITEM_TYPE_CROPS);
crop_strawberry		= new ItemCrop("Strawberry",	2, ITEM_TYPE.ITEM_TYPE_CROPS);
crop_pumpkin		= new ItemCrop("Pumpkin",		3, ITEM_TYPE.ITEM_TYPE_CROPS);
crop_corn			= new ItemCrop("Corn",			4, ITEM_TYPE.ITEM_TYPE_CROPS);
crop_potato			= new ItemCrop("Potato",		5, ITEM_TYPE.ITEM_TYPE_CROPS);
crop_watermelon		= new ItemCrop("Watermelon",	6, ITEM_TYPE.ITEM_TYPE_CROPS);
crop_radish			= new ItemCrop("Radish",		7, ITEM_TYPE.ITEM_TYPE_CROPS);
crop_lettuce		= new ItemCrop("Lettuce",		8, ITEM_TYPE.ITEM_TYPE_CROPS);
crop_wheat			= new ItemCrop("Wheat",			9, ITEM_TYPE.ITEM_TYPE_CROPS);
crop_eggplant		= new ItemCrop("Eggplant",		10, ITEM_TYPE.ITEM_TYPE_CROPS);

// Set the item_index to the first item declared for now:
item_index			= crop_carrot;
