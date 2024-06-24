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
	else if (_item.item_type == ITEM_TYPE.ITEM_TYPE_SEEDS)
		return sprItemSeedCrop;
	else if (_item.item_type == ITEM_TYPE.ITEM_TYPE_CROPS)
		return sprItemCrop;
	return -1;
}

function inventory_get_item_name(_item)
{
	if (_item != NULL)
		return _item.item_name;
	return "";
}

function inventory_get_item_id(_item)
{
	if (_item != NULL)
		return _item.item_id;
	return -1;
}

function inventory_get_item_type(_item)
{
	if (_item != NULL)
		return _item.item_type;
	return NULL;
}

function inventory_get_item_damage_output(_item)
{
	if (_item != NULL)
		return _item.damage_output;
	return 0;
}

function inventory_get_item_durability(_item)
{
	if (_item != NULL)
		return _item.durability;
	return -1;
}

function inventory_get_item_durability_max(_item)
{
	if (_item != NULL)
		return _item.durability_max;
	return -1;
}

function inventory_get_item_count(_item)
{
	if (_item != NULL)
		return _item.item_count;
	return 0;
}

function inventory_item_is_breakable(_item)
{
	if (_item != NULL)
		return _item.breakable;
	return false;
}

function inventory_item_is_stackable(_item)
{
	if (_item != NULL)
		return _item.stackable;
	return false;
}
