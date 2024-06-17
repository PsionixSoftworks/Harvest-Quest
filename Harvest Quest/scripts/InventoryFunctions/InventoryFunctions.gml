function inventory_get_item_icon(_item)
{
	if (_item.item_type == ITEM_TYPE.ITEM_TYPE_SWORD)
		return sprItemSword;
	else if (_item.item_type == ITEM_TYPE.ITEM_TYPE_PICKAXE)
		return sprItemPickaxe;
	else if (_item.item_type == ITEM_TYPE.ITEM_TYPE_AXE)
		return sprItemAxe;
	else if (_item.item_type == ITEM_TYPE.ITEM_TYPE_HOE)
		return sprItemHoe;
	else if (_item.item_type == ITEM_TYPE.ITEM_TYPE_WATERING_CAN)
		return sprItemWateringCan;
	else if (_item.item_type == ITEM_TYPE.ITEM_TYPE_FISHING_ROD)
		return sprItemFishingRod;
	return -1;
}

function inventory_get_item_id(_item)
{
	if (_item != NULL)
		return _item.item_id;
	return -1;
}

function inventory_item_is_breakable(_item)
{
	if (_item != NULL)
		return _item.breakable;
	return false;
}
