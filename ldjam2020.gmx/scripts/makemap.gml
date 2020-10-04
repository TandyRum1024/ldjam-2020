/// makemap(key_value_pair_arrays, ...)
/*
    Creates a new ds_map() and fills it with provided key-value pair and returns it
    ====
    Example use :
    tileData =  makemap(
                    makearray("name", "Fancy tile name"),
                    makearray("x", 42)
                    );
    This will result in the variable tileData to hold a newly created ds_map() with following key-value pair :
        "name": "Fancy tile name"
        "x": 42
*/
var key_value_pair_arrays = argument[0];
var _map = ds_map_create();
for (var i=0; i<argument_count; i++)
{
    var _entry = argument[i];
    ds_map_add(_map, _entry[0], _entry[1]);
}
return _map;
