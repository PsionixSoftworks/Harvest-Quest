/// @description Create the inventory interface
// Declare instance variables (inventory):
inventory_slots			= ds_list_create();
tab_index				= 0;
tab_count				= 8;
xoffset					= (camera_get_view_width(view_camera[0]) / 2) - (sprite_get_width(sprInterfaceInventory) / 2);
yoffset					= 0;
inventory_slots_x		= 9;
inventory_slots_y		= 3;
last_inventory_slot		= -1;
grabbed_item			= noone;
active					= false;
item_type_to_obj[256]	= -1;
item_type_to_spr[256]	= -1;

// Declare Instance variables (hotbar):
hotbar_slots			= ds_list_create();
hotbar_slot_count		= 9;
last_hotbar_slot		= -1;
selected_slot			= 0;

// Iterate through each of the slots and assign it null:
for (var i = 0; i < inventory_slots_x * inventory_slots_y; i++)
{
	ds_list_set(inventory_slots, i, NULL);
}

// Set the 9 slots to their default values:
for (var i = 0; i < hotbar_slot_count; i++)
{
	ds_list_set(hotbar_slots, i, NULL);
}

// Set each item type to corresponding instance:
item_type_to_obj[ITEM_TYPE.ITEM_TYPE_WATERING_CAN]		= objItemWateringCan;
item_type_to_obj[ITEM_TYPE.ITEM_TYPE_SWORD]				= objItemSword;
item_type_to_obj[ITEM_TYPE.ITEM_TYPE_PICKAXE]			= objItemPickaxe;
item_type_to_obj[ITEM_TYPE.ITEM_TYPE_AXE]				= objItemAxe;
item_type_to_obj[ITEM_TYPE.ITEM_TYPE_HOE]				= objItemHoe;
item_type_to_obj[ITEM_TYPE.ITEM_TYPE_FISHING_ROD]		= objItemFishingRod;
item_type_to_obj[ITEM_TYPE.ITEM_TYPE_SEEDS]				= objItemSeed;
item_type_to_obj[ITEM_TYPE.ITEM_TYPE_CROPS]				= objItemCrop;

// Set each item type to corresponding sprite:
item_type_to_spr[ITEM_TYPE.ITEM_TYPE_WATERING_CAN]		= sprItemWateringCan;
item_type_to_spr[ITEM_TYPE.ITEM_TYPE_SWORD]				= sprItemSword;
item_type_to_spr[ITEM_TYPE.ITEM_TYPE_PICKAXE]			= sprItemPickaxe;
item_type_to_spr[ITEM_TYPE.ITEM_TYPE_AXE]				= sprItemAxe;
item_type_to_spr[ITEM_TYPE.ITEM_TYPE_HOE]				= sprItemHoe;
item_type_to_spr[ITEM_TYPE.ITEM_TYPE_FISHING_ROD]		= sprItemFishingRod;
item_type_to_spr[ITEM_TYPE.ITEM_TYPE_SEEDS]				= sprItemSeedCrop;
item_type_to_spr[ITEM_TYPE.ITEM_TYPE_CROPS]				= sprItemCrop;

// This is needed so items dragged from the inventory to the hotbar will render over the hotbar:
depth					= -100;
