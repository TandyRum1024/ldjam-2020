#define file_json_load
/// file_json_load(_filename)
/*
    Loads JSON files into a new map and returns it
*/
var _filename = argument0;

var _map = undefined, _success = true;
var _FILE = file_text_load_all(_filename);
if (_FILE != "")
{
    _map = json_decode(_FILE);
    if (_map == -1)
        _success = false;
}

if (!_success)
{
    _map = ds_map_create();
    debug_log("file_json_load> FILE `", _filename, "` IS EMPTY?");
}

return _map;

#define file_json_load_into
/// file_json_load_into(_filename, _map)
/*
    Loads JSON files into a previously existing map (and returns it)
*/
var _filename = argument0, _map = argument1;

var _map = undefined, _success = true;
var _FILE = file_text_load_all(_filename);
if (_FILE != "")
{
    _map = json_decode(_FILE);
    if (_map == -1)
        _success = false;
    else
    {
        ds_map_copy(_map, _temp);
        ds_map_destroy(_temp);
    }
}

if (!_success)
{
    _map = ds_map_create();
    debug_log("file_json_load> FILE `", _filename, "` IS EMPTY?");
}

return _map;