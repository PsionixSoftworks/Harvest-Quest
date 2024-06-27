function Item(_name, _id, _type) constructor
{
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

function ItemSword(_name, _id, _type, _damage, _hp, _hp_max) : Item(_name, _id, _type) constructor
{
	damage_output	= _damage;
	durability		= _hp;
	durability_max	= _hp_max;
	breakable		= true;
}

function ItemPickaxe(_name, _id, _type, _damage, _hp, _hp_max) : Item(_name, _id, _type) constructor
{
	damage_output	= _damage;
	durability		= _hp;
	durability_max	= _hp_max;
	breakable		= true;
}

function ItemAxe(_name, _id, _type, _damage, _hp, _hp_max) : Item(_name, _id, _type) constructor
{
	damage_output	= _damage;
	durability		= _hp;
	durability_max	= _hp_max;
	breakable		= true;
}

function ItemHoe(_name, _id, _type, _hp, _hp_max) : Item(_name, _id, _type) constructor
{
	durability		= _hp;
	durability_max	= _hp_max;
	breakable		= true;
}

function ItemWateringCan(_name, _id, _type, _water_amt, _water_amt_max) : Item(_name, _id, _type) constructor
{
	durability		= _water_amt;
	durability_max	= _water_amt_max;
	breakable		= true;
}

function ItemFishingRod(_name, _id, _type, _hp, _hp_max) : Item(_name, _id, _type) constructor
{
	durability		= _hp;
	durability_max	= _hp_max;
	breakable		= true;
}

function ItemSeeds(_name, _id, _type, _count=1) : Item(_name, _id, _type) constructor
{
	item_count		= _count;
	stackable		= true;
}

function ItemCrop(_name, _id, _type, _count=1) : Item(_name, _id, _type) constructor
{
	item_count		= _count;
	stackable		= true;
}

function item_get_name(_item)
{
	if (_item != undefined)
		return _item.item_name;
	return "<UNDEFINED>";
}

function item_get_id(_item)
{
	if (_item != undefined)
		return _item.item_id;
	return NULL;
}

function item_get_type(_item)
{
	if (_item != undefined)
		return _item.item_type;
	return NULL;
}

function item_get_damage_output(_item)
{
	if (_item != undefined)
		return _item.damage_output;
	return 0;
}

function item_get_durability(_item)
{
	if (_item != undefined)
		return _item.durability;
	return -1;
}

function item_get_durabilty_max(_item)
{
	if (_item != undefined)
		return _item.durability_max;
	return -1;
}

function item_get_count(_item)
{
	if (_item != undefined)
		return _item.item_count;
	return 0;
}

function item_is_breakable(_item)
{
	if (_item != undefined)
		return _item.breakable;
	return false;
}

function item_is_stackable(_item)
{
	if (_item != undefined)
		return _item.stackable;
	return false;
}

function item_set_stack_count(_item, _size)
{
	if (_item != undefined && _item.stackable)
		_item.item_count = _size;
	else
		_item.item_count = 1;
}
