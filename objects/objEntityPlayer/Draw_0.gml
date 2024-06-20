/// @description Draw the player's appearance
// For now, just draw the player without anything. The accessories aren't added yet:
draw_self();

// Draw the pickaxe sprite when using it in the state:
if (state == PLAYER_STATE.PLAYER_STATE_PICKAXE)
{
	var _sprindex = asset_get_index("sprPickaxeWood" + string(facing));
	draw_sprite(_sprindex, image_index, x, y);
}
