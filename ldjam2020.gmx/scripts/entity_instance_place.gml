/// entity_instance_place(_x, _y, _inst)
var _bbox_w = abs(bbox_right - bbox_left), _bbox_h = abs(bbox_bottom - bbox_top);
var _room_w = oMap.roomW, _room_h = oMap.roomH;

var _inst = instance_place(argument0, argument1, argument2);
if (_inst == noone && (argument0 > _room_w - _bbox_w))
    _inst = instance_place(argument0 - _room_w, argument1, argument2);
if (_inst == noone && (argument0 < _bbox_w))
    _inst = instance_place(argument0 + _room_w, argument1, argument2);
if (_inst == noone && (argument1 > _room_h - _bbox_h))
    _inst = instance_place(argument0, argument1 - _room_h, argument2);
if (_inst == noone && (argument1 < _bbox_h))
    _inst = instance_place(argument0, argument1 + _room_h, argument2);

return _inst;
