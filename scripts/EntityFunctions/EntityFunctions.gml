/// @description Execute the entity's state machine state.
/// @param {Function} _state The state to execute.
function entity_state_execute(_state)
{
	// Make sure the state is valid:
	if (_state != undefined)
	{
		// If so, execute it:
		script_execute(_state);
	}
}
