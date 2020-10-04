/// ui_rect_outline(_x, _y, _w, _h, _col, _alpha, _thickness)
/*
    Draws outlined rectangle
*/
var _x = argument0, _y = argument1, _w = argument2, _h = argument3, _col = argument4, _alpha = argument5, _thickness = argument6;

// Left
draw_sprite_stretched_ext(sprUI1x1, 0, _x, _y, _thickness, _h, _col, _alpha);
// Right
draw_sprite_stretched_ext(sprUI1x1, 0, _x + _w - _thickness, _y, _thickness, _h, _col, _alpha);
// Top
draw_sprite_stretched_ext(sprUI1x1, 0, _x, _y, _w, _thickness, _col, _alpha);
// Bottom
draw_sprite_stretched_ext(sprUI1x1, 0, _x, _y + _h - _thickness, _w, _thickness, _col, _alpha);
