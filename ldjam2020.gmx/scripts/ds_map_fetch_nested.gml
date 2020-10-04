/// ds_map_fetch_nested(_map, _default = undefined, ...)
/*
    For fetching values from nested ds_map()
*/
var _map = argument[0];
var _default; if (argument_count > 1) _default = argument[1]; else _default = undefined;

var _value = _map[? argument[2]];
if (_value == undefined)
    return _default;

for (var i=3; i<argument_count; i++)
    _value = _value[? argument[i]];

if (_value == undefined)
    return _default;

return _value;
