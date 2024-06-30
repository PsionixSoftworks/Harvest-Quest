/// @description Initialize the watering can item.
// Inherit the parent event:
event_inherited();

// Create each variant of the watering can here:
watering_can			= new ItemWateringCan("Watering Can", 0, ITEM_TYPE.ITEM_TYPE_WATERING_CAN, 24, 24);

// Set the item_index to the first item declared for now:
item_index				= watering_can;
