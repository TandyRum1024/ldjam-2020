/// ui_draw_ninepatch(_spr, _x, _y, _w, _h, _scale, _colour, _alpha, _scrollx = 0, _scrolly = 0, _centerscale = 1)
/*
    Draws ninepatch box
*/
var _spr = argument[0], _x = argument[1], _y = argument[2], _w = argument[3], _h = argument[4], _scale = argument[5], _colour = argument[6], _alpha = argument[7];
var _scrollx; if (argument_count > 8) _scrollx = argument[8]; else _scrollx = 0;
var _scrolly; if (argument_count > 9) _scrolly = argument[9]; else _scrolly = 0;
var _centerscale; if (argument_count > 10) _centerscale = argument[10]; else _centerscale = 1;

// (scaled sprite dimensions)
var _sprw = sprite_get_width(_spr) * _scale;
var _sprh = sprite_get_height(_spr) * _scale;
// ('middle' positions)
var _x2 = _x + _sprw;
var _y2 = _y + _sprh;
var _w2 = _w - _sprw * 2;
var _h2 = _h - _sprh * 2;
// ('end' positions)
var _x3 = _x + _w - _sprw;
var _y3 = _y + _h - _sprh;


// Top
draw_sprite_ext(_spr, 0, _x, _y, _scale, _scale, 0, _colour, _alpha); // left
ui_draw_sprite_tiled(_spr, 1, _x2, _y, _w2, _sprh, _scale, _colour, _alpha); // middle
draw_sprite_ext(_spr, 2, _x3, _y, _scale, _scale, 0, _colour, _alpha); // right

// Middle
ui_draw_sprite_tiled(_spr, 3, _x, _y2, _sprw, _h2, _scale, _colour, _alpha); // left
ui_draw_sprite_tiled_scroll(_spr, 4, _x2, _y2, _w2, _h2, _scale * _centerscale, _colour, _alpha, _scrollx, _scrolly); // middle
ui_draw_sprite_tiled(_spr, 5, _x3, _y2, _sprw, _h2, _scale, _colour, _alpha); // right

// Bottom
draw_sprite_ext(_spr, 6, _x, _y3, _scale, _scale, 0, _colour, _alpha); // left
ui_draw_sprite_tiled(_spr, 7, _x2, _y3, _w2, _sprh, _scale, _colour, _alpha); // middle
draw_sprite_ext(_spr, 8, _x3, _y3, _scale, _scale, 0, _colour, _alpha); // right
