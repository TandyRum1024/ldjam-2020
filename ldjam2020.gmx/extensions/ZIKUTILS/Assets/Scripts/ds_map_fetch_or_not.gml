/// ds_map_fetch_or_not(_map, _key, _default)
/*
    Wrapper for ds_map's fetch function.
    returns the value of ds_map's key if exists, and returns the default value otherwise.
*/
var _map = argument0, _key = argument1, _default = argument2;

var _val = _map[? _key];
if (_val != undefined)
    return _val;
else
    return _default;
