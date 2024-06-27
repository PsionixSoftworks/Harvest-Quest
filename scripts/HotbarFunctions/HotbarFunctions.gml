function hotbar_get_item_icon(_item)
{
	if (_item.item_type == ITEM_TYPE.ITEM_TYPE_SWORD)
		return sprItemSword;
	if (_item.item_type == ITEM_TYPE.ITEM_TYPE_PICKAXE)
		return sprItemPickaxe;
	if (_item.item_type == ITEM_TYPE.ITEM_TYPE_AXE)
		return sprItemAxe;
	if (_item.item_type == ITEM_TYPE.ITEM_TYPE_HOE)
		return sprItemHoe;
	if (_item.item_type == ITEM_TYPE.ITEM_TYPE_WATERING_CAN)
		return sprItemWateringCan;
	if (_item.item_type == ITEM_TYPE.ITEM_TYPE_FISHING_ROD)
		return sprItemFishingRod;
	if (_item.item_type == ITEM_TYPE.ITEM_TYPE_SEEDS)
		return sprItemSeedCrop;
	if (_item.item_type == ITEM_TYPE.ITEM_TYPE_CROPS)
		return sprItemCrop;
	return -1;
}

function hotbar_get_item_id(_item)
{
	if (_item != NULL)
		return _item.item_id;
	return -1;
}
