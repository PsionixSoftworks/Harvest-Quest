/// @description The item constructor. Creates a new item.
/// @param _name The name of the item.
/// @param _id The id of the item.
/// @param _type The type of item.
function Item(_name, _id, _type) constructor
{
	// Declare all of the item properties:
	item_name		= _name;
	item_id			= _id;
	item_type		= _type;
	item_count		= 1;
	durability		= -1;
	durability_max	= -1;
	damage_output	= 0;
	breakable		= false;
	stackable		= false;
}

/// @description The sword item constructor. Inherits from the item contructor.
/// @param _name The name of the item.
/// @param _id The id of the item.
/// @param _type The type of item.
/// @param _damage The damage output of the weapon.
/// @param _hp The number of hitpoints left before the item breaks.
/// @param _hp_max The number of hitpoints it takes to break.
function ItemSword(_name, _id, _type, _damage, _hp, _hp_max) : Item(_name, _id, _type) constructor
{
	// Update the item properties with new values:
	damage_output	= _damage;
	durability		= _hp;
	durability_max	= _hp_max;
	breakable		= true;
}

/// @description The pickaxe item constructor. Inherits from the item contructor.
/// @param _name The name of the item.
/// @param _id The id of the item.
/// @param _type The type of item.
/// @param _damage The damage output of the tool (for ores).
/// @param _hp The number of hitpoints left before the item breaks.
/// @param _hp_max The number of hitpoints it takes to break.
function ItemPickaxe(_name, _id, _type, _damage, _hp, _hp_max) : Item(_name, _id, _type) constructor
{
	// Update the item properties with new values:
	damage_output	= _damage;
	durability		= _hp;
	durability_max	= _hp_max;
	breakable		= true;
}

/// @description The axe item constructor. Inherits from the item contructor.
/// @param _name The name of the item.
/// @param _id The id of the item.
/// @param _type The type of item.
/// @param _damage The damage output of the tool (for trees).
/// @param _hp The number of hitpoints left before the item breaks.
/// @param _hp_max The number of hitpoints it takes to break.
function ItemAxe(_name, _id, _type, _damage, _hp, _hp_max) : Item(_name, _id, _type) constructor
{
	// Update the item properties with new values:
	damage_output	= _damage;
	durability		= _hp;
	durability_max	= _hp_max;
	breakable		= true;
}

/// @description The hoe item constructor. Inherits from the item contructor.
/// @param _name The name of the item.
/// @param _id The id of the item.
/// @param _type The type of item.
/// @param _hp The number of hitpoints left before the item breaks.
/// @param _hp_max The number of hitpoints it takes to break.
function ItemHoe(_name, _id, _type, _hp, _hp_max) : Item(_name, _id, _type) constructor
{
	// Update the item properties with new values:
	durability		= _hp;
	durability_max	= _hp_max;
	breakable		= true;
}

/// @description The watering can item constructor. Inherits from the item contructor.
/// @param _name The name of the item.
/// @param _id The id of the item.
/// @param _type The type of item.
/// @param _water_amt The number of uses left before the water runs out.
/// @param _water_amt_max The number of uses it takes to empty.
function ItemWateringCan(_name, _id, _type, _water_amt, _water_amt_max) : Item(_name, _id, _type) constructor
{
	// Update the item properties with new values:
	durability		= _water_amt;
	durability_max	= _water_amt_max;
	breakable		= true;
}

/// @description The fishing rod item constructor. Inherits from the item contructor.
/// @param _name The name of the item.
/// @param _id The id of the item.
/// @param _type The type of item.
/// @param _hp The number of hitpoints left before the item breaks.
/// @param _hp_max The number of hitpoints it takes to break.
function ItemFishingRod(_name, _id, _type, _hp, _hp_max) : Item(_name, _id, _type) constructor
{
	// Update the item properties with new values:
	durability		= _hp;
	durability_max	= _hp_max;
	breakable		= true;
}

/// @description The seed item constructor. Inherits from the item contructor.
/// @param _name The name of the item.
/// @param _id The id of the item.
/// @param _type The type of item.
/// @param _count (optional) The number of seeds in the stack.
function ItemSeeds(_name, _id, _type, _count=real(1)) : Item(_name, _id, _type) constructor
{
	// Update the item properties with new values:
	item_count		= _count;
	stackable		= true;
}

/// @description The crop item constructor. Inherits from the item contructor.
/// @param _name The name of the item.
/// @param _id The id of the item.
/// @param _type The type of item.
/// @param _count (optional) The number of seeds in the stack.
function ItemCrop(_name, _id, _type, _count=real(1)) : Item(_name, _id, _type) constructor
{
	// Update the item properties with new values:
	item_count		= _count;
	stackable		= true;
}

/// @description Get the name of the item.
/// @param _item The item index of the item.
/// @returns String
function item_get_name(_item)
{
	// Make sure the item is not undefined:
	if (_item != undefined)
	{
		// If so, return the item name:
		return _item.item_name;
	}
	// Otherwise, return undefined string:
	return "<UNDEFINED>";
}

/// @description Get the id of the item.
/// @param _item The item index of the item.
/// @returns Real
function item_get_id(_item)
{
	// Make sure the item is not undefined:
	if (_item != undefined)
	{
		// If so, return the item id:
		return _item.item_id;
	}
	// Otherwise, return null:
	return NULL;
}

/// @description Get the type of the item.
/// @param _item The item index of the item.
/// @returns Real
function item_get_type(_item)
{
	// Make sure the item is not undefined:
	if (_item != undefined)
	{
		// If so, return the item type:
		return _item.item_type;
	}
	// Otherwise, return null:
	return NULL;
}

/// @description Get the damage output of the item.
/// @param _item The item index of the item.
/// @returns Real
function item_get_damage_output(_item)
{
	// Make sure the item is not undefined:
	if (_item != undefined)
	{
		// If so, return the damage output:
		return _item.damage_output;
	}
	// Otherwise, return zero:
	return 0;
}

/// @description Get the durability of the item.
/// @param _item The item index of the item.
/// @returns Real
function item_get_durability(_item)
{
	// Make sure the item is not undefined and is breakable:
	if (_item != undefined && _item.breakable)
	{
		// If so, return the item durability:
		return _item.durability;
	}
	// Otherwise, return failure:
	return -1;
}

/// @description Get the maximum durability of the item.
/// @param _item The item index of the item.
/// @returns Real
function item_get_durabilty_max(_item)
{
	// Make sure the item is not undefined and is breakable:
	if (_item != undefined && _item.breakable)
	{
		// If so, return the maximum item durability:
		return _item.durability_max;
	}
	// Otherwise, return failure:
	return -1;
}

/// @description Get the count of the item.
/// @param _item The item index of the item.
/// @returns Real
function item_get_count(_item)
{
	// Make sure the item is not undefined and is stackable:
	if (_item != undefined && _item.stackable)
	{
		// Return the item count:
		return _item.item_count;
	}
	// Otherwise, return zero:
	return 0;
}

/// @description Get whether the item is breakable or not.
/// @param _item The item index of the+ item.
/// @returns Boolean
function item_is_breakable(_item)
{
	// Make sure the item is not undefined:
	if (_item != undefined)
	{
		// If so, return whether the item is breakable or not:
		return _item.breakable;
	}
	// Otherwise, return false:
	return false;
}

/// @description Get whether the item is stackable or not.
/// @param _item The item index of the+ item.
/// @returns Boolean
function item_is_stackable(_item)
{
	// Make sure the item is not undefined:
	if (_item != undefined)
	{
		// If so, return whether the item is stackable or not:
		return _item.stackable;
	}
	// Otherwise, return false:
	return false;
}

/// @description Set the stack count of a stackable item.
/// @param _item The item to set.
/// @param _size The stack size.
function item_set_stack_count(_item, _size)
{
	// Make sure the item is not undefined and is stackable:
	if (_item != undefined && _item.stackable)
	{
		// If so, set the item count to the size:
		_item.item_count = _size;
	}
	else
	{
		// Otherwise, set the count to 1:
		_item.item_count = 1;
	}
}
