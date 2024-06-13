function hotbar_get_item_icon(_item)
{
	if (_item == ItemTypes.ITEM_TYPE_WATERING_CAN)
		return sprItemWateringCan;
	if (_item == ItemTypes.ITEM_TYPE_SWORD)
		return sprItemSword;
	if (_item == ItemTypes.ITEM_TYPE_PICKAXE)
		return sprItemPickaxe;
	if (_item == ItemTypes.ITEM_TYPE_AXE)
		return sprItemAxe;
	if (_item == ItemTypes.ITEM_TYPE_HOE)
		return sprItemHoe;
	if (_item == ItemTypes.ITEM_TYPE_FISHING_ROD)
		return sprItemFishingRod;
	return -1;
}