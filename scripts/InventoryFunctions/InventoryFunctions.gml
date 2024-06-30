/// @description Get the sprite of the inventory item.
/// @param _item The item index of the inventory item.
/// @returns Sprite index or -1
function inventory_get_item_icon(_item)
{
	// Make sure the item is non-null:
	if (_item.item_type != NULL)
	{
		// If so, return the item sprite:
		return item_type_to_spr[_item.item_type];
	}
	// Otherwise, return failure:
	return -1;
}

/// @description Get the name of the inventory item.
/// @param _item The item index of the inventory item.
/// @returns String
function inventory_get_item_name(_item)
{
	// Make sure the item is non-null:
	if (_item != NULL)
	{
		// If so, return the item name:
		return _item.item_name;
	}
	// Otherwise, return undefined string:
	return "<UNDEFINED>";
}

/// @description Get the id of the inventory item.
/// @param _item The item index of the inventory item.
/// @returns Real
function inventory_get_item_id(_item)
{
	// Make sure the item is non-null:
	if (_item != NULL)
	{
		// If so, return the item id:
		return _item.item_id;
	}
	// Otherwise, return failure:
	return -1;
}

/// @description Get the type of the inventory item.
/// @param _item The item index of the inventory item.
/// @returns Real
function inventory_get_item_type(_item)
{
	// Make sure the item is non-null:
	if (_item != NULL)
	{
		// If so, return the item type:
		return _item.item_type;
	}
	// Otherwise, return null:
	return NULL;
}

/// @description Get the damage output of the inventory item.
/// @param _item The item index of the inventory item.
/// @returns Real
function inventory_get_item_damage_output(_item)
{
	// Make sure the item is non-null:
	if (_item != NULL)
	{
		// If so, return the item's damage output:
		return _item.damage_output;
	}
	// Otherwise, return null:
	return NULL;
}

/// @description Get the durability of the inventory item.
/// @param _item The item index of the inventory item.
/// @returns Real
function inventory_get_item_durability(_item)
{
	// Make sure the item is non-null:
	if (_item != NULL)
	{
		// If so, return the item durability:
		return _item.durability;
	}
	// Otherwise, return failure:
	return -1;
}

/// @description Get the maximum durability of the inventory item.
/// @param _item The item index of the inventory item.
/// @returns Real
function inventory_get_item_durability_max(_item)
{
	// Make sure the item is non-null:
	if (_item != NULL)
	{
		// If so, return the maximum durability:
		return _item.durability_max;
	}
	// Otherwise, return failure:
	return -1;
}

/// @description Get the count of the inventory item.
/// @param _item The item index of the inventory item.
/// @returns Real
function inventory_get_item_count(_item)
{
	// Make sure the item is non-null:
	if (_item != NULL && _item.stackable)
	{
		// If so, return the item count:
		return _item.item_count;
	}
	// Otherwise, return null:
	return NULL;
}

/// @description Get whether the inventory item is breakable or not.
/// @param _item The item index of the hotbar item.
/// @returns Boolean
function inventory_item_is_breakable(_item)
{
	// Make sure the item is non-null:
	if (_item != NULL)
	{
		// If so, return whether the item is breakable or not:
		return _item.breakable;
	}
	// Otherwise, return false:
	return false;
}

/// @description Get whether the hotbar item is stackable or not.
/// @param _item The item index of the hotbar item.
/// @returns Boolean
function inventory_item_is_stackable(_item)
{
	// Make sure the item is non-null:
	if (_item != NULL)
	{
		// If so, return whether the item is stackable or not:
		return _item.stackable;
	}
	// Otherwise, return false:
	return false;
}
