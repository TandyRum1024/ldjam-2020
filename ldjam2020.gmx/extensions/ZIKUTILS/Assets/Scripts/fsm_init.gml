#define fsm_init
/// Initializes FSM
fsmStateMap        = ds_map_create(); // FSM's state map
fsmStateMapDestroy = true;
fsmStateCurrent = ""; // current state
fsmStateNext    = "default"; // next state
fsmStatePrev    = ""; // previous state
fsmStateCtr     = 0; // frames elapsed since state switch
fsmStateInit    = false; // state first frame flag (true : first frame, false : otherwise)

// variables that holds cached values
fsmStateCurrentScript = makearray(undefined, undefined); // current script (fetched from fsmStateMap)

#define fsm_destroy
/// Destroys FSM
// Delete map if already exists
if (fsmStateMapDestroy && ds_exists(fsmStateMap, ds_type_map))
    ds_map_destroy(fsmStateMap);

#define fsm_add_state
/// fsm_add_state(_state, _script, ?_exit_script = undefined)
/// Adds state in the FSM system
var _state = argument[0], _script = argument[1];
var _exit_script; if (argument_count > 2) _exit_script = argument[2]; else _exit_script = undefined;
fsmStateMap[? _state] = makearray(_script, _exit_script);

#define fsm_add_state_to_statemap
/// fsm_add_state(_statemap, _state, _script, ?_exit_script = undefined)
/// Adds state in the given state map
var _statemap = argument[0], _state = argument[1], _script = argument[2];
var _exit_script; if (argument_count > 3) _exit_script = argument[3]; else _exit_script = undefined;
_statemap[? _state] = makearray(_script, _exit_script);

#define fsm_assign_statemap
/// fsm_assign_statemap(_map, _destroy_flag = false)
/// Assigns the states map from given map
var _map = argument[0];
var _destroy_flag; if (argument_count > 1) _destroy_flag = argument[1]; else _destroy_flag = false;

// Delete map if already exists
if (ds_exists(fsmStateMap, ds_type_map))
    ds_map_destroy(fsmStateMap);

// Assign manp
fsmStateMap = _map;

// Set destroy flag
fsmStateMapDestroy = _destroy_flag;

#define fsm_switch
/// fsm_switch(_state)
/// Request state switch for FSM
var _state = argument0;
fsmStateNext = _state;

// (debug machine go <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>)
// debug_emit_message(string_build(object_get_name(object_index), ">FSMSTATESWITCH REQ"));

#define fsm_update
/// Updates FSM system

// Check for state switch
if (fsmStateCurrent != fsmStateNext)
{
    fsmStatePrev    = fsmStateCurrent;
    fsmStateCurrent = fsmStateNext;
    fsmStateInit    = true;
    fsmStateCtr     = 0;
    
    // Run the exit script
    if (is_array(fsmStateCurrentScript) && fsmStateCurrentScript[1] != undefined && script_exists(fsmStateCurrentScript[1]))
    {
        script_execute(fsmStateCurrentScript[1]);
    }
    
    // Fetch current script
    fsmStateCurrentScript = fsmStateMap[? fsmStateCurrent];
    
    // Check if the script exists
    if (fsmStateCurrentScript == undefined || !is_array(fsmStateCurrentScript) || !script_exists(fsmStateCurrentScript[0]))
    {
        debug_emit_message("!!] fsm_update > state `" + fsmStateCurrent + "` is undefined!");
        fsmStateCurrentScript = makearray(undefined, undefined);
    }
}

// Run the script
if (fsmStateCurrentScript[0] != undefined)
{
    script_execute(fsmStateCurrentScript[0]);
}

// Update the state counter
fsmStateCtr += global.phyTimescale;
fsmStateInit = false;