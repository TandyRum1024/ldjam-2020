/// entity_place_meeting(_x, _y, _inst)
// #args _x, _y, _inst
var _bbox_w = abs(bbox_right - bbox_left), _bbox_h = abs(bbox_bottom - bbox_top);
var _room_w = oMap.roomW, _room_h = oMap.roomH;
/*
var _touch = place_meeting(_x, _y, oTile);
// Check for left
_touch |= (_x > _room_w - _bbox_w) && place_meeting(_x - _room_w, _y, oTile);
// Check for right
_touch |= (_x < _bbox_w) && place_meeting(_x + _room_w, _y, oTile);
// Check for up
_touch |= (_y > _room_h - _bbox_h) && place_meeting(_x, _y + _room_h, oTile);
// Check for down
_touch |= (_y < _bbox_h) && place_meeting(_x, _y - _room_h, oTile);
return _touch;
*/
return  place_meeting(argument0, argument1, argument2) ||
        ((argument0 > _room_w - _bbox_w) && place_meeting(argument0 - _room_w, argument1, argument2)) || 
        ((argument0 < _bbox_w) && place_meeting(argument0 + _room_w, argument1, argument2)) ||
        ((argument1 > _room_h - _bbox_h) && place_meeting(argument0, argument1 - _room_h, argument2)) ||
        ((argument1 < _bbox_h) && place_meeting(argument0, argument1 + _room_h, argument2));
