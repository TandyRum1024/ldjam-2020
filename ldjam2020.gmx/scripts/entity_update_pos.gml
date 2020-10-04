/// entity_update_pos
// Attempt to move in x axis
var _sv = sign(vx), _maxstep = abs(bbox_right - bbox_left);
if (entity_place_meeting(x + vx, y, oTile))
{
    // march forwards
    while (!entity_place_meeting(x + _sv, y, oTile) && _maxstep-- > 0)
        x += _sv;
    vx = 0;
}
x += vx;

// Attempt to move in y axis
var _sv = sign(vy), _maxstep = abs(bbox_bottom - bbox_top);
if (entity_place_meeting(x, y + vy, oTile))
{
    // march forwards
    while (!entity_place_meeting(x, y + _sv, oTile) && _maxstep-- > 0)
        y += _sv;
    vy = 0;
}
y += vy;

// Room constraint
if (x < 0) x += oMap.roomW;
if (x >= oMap.roomW) x -= oMap.roomW;
if (y < 0) y += oMap.roomH;
if (y >= oMap.roomH) y -= oMap.roomH;

// Update depth
depth = -10 - y;
