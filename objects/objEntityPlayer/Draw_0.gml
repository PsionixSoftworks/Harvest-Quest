/// @description Draw the player's appearance
// For now, just draw the player without anything. The accessories aren't added yet:
draw_self();

// Draw the pickaxe sprite when using it in the state:
if (state == PLAYER_STATE.PLAYER_STATE_WATERING)
{
	var _sprindex = asset_get_index("sprWateringCan" + string(facing));
	draw_sprite(_sprindex, image_index, x, y);
}
else if (state == PLAYER_STATE.PLAYER_STATE_PICKAXE)
{
	var _sprindex = asset_get_index("sprPickaxeWood" + string(facing));
	draw_sprite(_sprindex, image_index, x, y);
}
else if (state == PLAYER_STATE.PLAYER_STATE_AXE)
{
	var _sprindex = asset_get_index("sprAxeWood" + string(facing));
	draw_sprite(_sprindex, image_index, x, y);
}
else if (state == PLAYER_STATE.PLAYER_STATE_HOE)
{
	var _sprindex = asset_get_index("sprHoeWood" + string(facing));
	draw_sprite(_sprindex, image_index, x, y);
}
