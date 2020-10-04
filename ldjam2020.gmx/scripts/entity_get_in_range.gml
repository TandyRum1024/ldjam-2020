/// entity_get_in_range(_x, _y, _radius, _object)
var _x = argument0, _y = argument1, _radius = argument2, _object = argument3;
var _room_w = oMap.roomW, _room_h = oMap.roomH;
var _insts = -1, _idx = 0;
with (_object)
{
    var _dist = min(point_distance(_x, _y, x, y), point_distance(_x + _room_w, _y, x, y), point_distance(_x, _y + _room_h, x, y), point_distance(_x - _room_w, _y, x, y), point_distance(_x, _y - _room_h, x, y));
    if (_dist < _radius)
    {
        _insts[_idx++] = id;
    }
}

return _insts;
