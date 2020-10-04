#define ui_draw_sprite_tiled
/// ui_draw_sprite_tiled(_sprite, _subimg, _x, _y, _w, _h, _scale, _colour, _alpha)
/*
    Draws tiled sprite
*/
var _sprite = argument0, _subimg = argument1, _x = argument2, _y = argument3, _w = argument4, _h = argument5, _scale = argument6, _colour = argument7, _alpha = argument8;

var _spr_w = sprite_get_width(_sprite);
var _spr_h = sprite_get_height(_sprite);
var _spr_scaled_w = _spr_w * _scale;
var _spr_scaled_h = _spr_h * _scale;
var _num_x = floor(_w / _spr_scaled_w);
var _num_y = floor(_h / _spr_scaled_h);
var _rem_w = (_w % _spr_scaled_w);
var _rem_h = (_h % _spr_scaled_h);
var _rem_unit_w = _rem_w / _scale;
var _rem_unit_h = _rem_h / _scale;

var _draw_x = _x;
var _draw_y = _y;

/// Draw sprites that hasn't been 'cut' (aka WHOLE sprites)
for (var i=0; i<_num_x; i++)
{
    _draw_y = _y;
    for (var j=0; j<_num_y; j++)
    {
        draw_sprite_ext(_sprite, _subimg, _draw_x, _draw_y, _scale, _scale, 0, _colour, _alpha);
        _draw_y += _spr_scaled_h;
    }
    _draw_x += _spr_scaled_w;
}

/// Draw sprites that has been 'cut' to fit
// Horizontal
if (_rem_w != 0)
{
    _draw_x = _x + _w - _rem_w;
    _draw_y = _y;
    for (var i=0; i<_num_y; i++)
    {
        draw_sprite_part_ext(_sprite, _subimg, 0, 0, _rem_unit_w, _spr_h, _draw_x, _draw_y, _scale, _scale, _colour, _alpha);
        _draw_y += _spr_scaled_h;
    }
}

// Vertical
if (_rem_h != 0)
{
    _draw_x = _x;
    _draw_y = _y + _h - _rem_h;
    for (var i=0; i<_num_x; i++)
    {
        draw_sprite_part_ext(_sprite, _subimg, 0, 0, _spr_w, _rem_unit_h, _draw_x, _draw_y, _scale, _scale, _colour, _alpha);
        _draw_x += _spr_scaled_w;
    }
}

// Both
if (_rem_w != 0 && _rem_h != 0)
{
    _draw_x = _x + _w - _rem_w;
    _draw_y = _y + _h - _rem_h;
    draw_sprite_part_ext(_sprite, _subimg, 0, 0, _rem_unit_w, _rem_unit_h, _draw_x, _draw_y, _scale, _scale, _colour, _alpha);
}

#define ui_draw_sprite_tiled_scroll
/// ui_draw_sprite_tiled_scroll(_sprite, _subimg, _x, _y, _w, _h, _scale, _colour, _alpha, _xoff, _yoff)
/*
    Draws tiled, scrolling sprite
*/
var _sprite = argument0, _subimg = argument1, _x = argument2, _y = argument3, _w = argument4, _h = argument5, _scale = argument6, _colour = argument7, _alpha = argument8, _xoff = argument9, _yoff = argument10;

/// Calcualte values
var _spr_w = sprite_get_width(_sprite);
var _spr_h = sprite_get_height(_sprite);
var _spr_scaled_w = _spr_w * _scale;
var _spr_scaled_h = _spr_h * _scale;
_xoff %= _spr_scaled_w;
_yoff %= _spr_scaled_h;

var _num_x = floor((_w - _xoff) / _spr_scaled_w);
var _num_y = floor((_h - _yoff) / _spr_scaled_h);

var _rem_w = ((_w - _xoff) % _spr_scaled_w);
var _rem_h = ((_h - _yoff) % _spr_scaled_h);
var _rem_unit_w = _rem_w / _scale;
var _rem_unit_h = _rem_h / _scale;

var _rem2_w = _xoff / _scale;
var _rem2_h = _yoff / _scale;
var _rem2_inv_w = _spr_w - _rem2_w;
var _rem2_inv_h = _spr_h - _rem2_h;
var _rem2_min_w = min(_rem2_w, _w / _scale);
var _rem2_min_h = min(_rem2_h, _h / _scale);

var _draw_x = _x + _xoff;
var _draw_y = _y + _yoff;
var _draw_end_x = _x + _w - _rem_w;
var _draw_end_y = _y + _h - _rem_h;

/// Draw sprites that hasn't been 'cut' (aka WHOLE sprites)
for (var i=0; i<_num_x; i++)
{
    _draw_y = _y + _yoff;
    for (var j=0; j<_num_y; j++)
    {
        draw_sprite_ext(_sprite, _subimg, _draw_x, _draw_y, _scale, _scale, 0, _colour, _alpha);
        _draw_y += _spr_scaled_h;
    }
    _draw_x += _spr_scaled_w;
}

/// Draw sprites that has been 'cut' to fit
// Horizontal
if (_rem_w != 0)
{
    _draw_y = _y + _yoff;
    for (var i=0; i<_num_y; i++)
    {
        draw_sprite_part_ext(_sprite, _subimg, _rem2_inv_w, 0, _rem2_min_w, _spr_h, _x, _draw_y, _scale, _scale, _colour, _alpha); // left
        draw_sprite_part_ext(_sprite, _subimg, 0, 0, _rem_unit_w, _spr_h, _draw_end_x, _draw_y, _scale, _scale, _colour, _alpha); // right
        _draw_y += _spr_scaled_h;
    }
}

// Vertical
if (_rem_h != 0)
{
    _draw_x = _x + _xoff;
    for (var i=0; i<_num_x; i++)
    {
        draw_sprite_part_ext(_sprite, _subimg, 0, _rem2_inv_h, _spr_w, _rem2_min_h, _draw_x, _y, _scale, _scale, _colour, _alpha); // top
        draw_sprite_part_ext(_sprite, _subimg, 0, 0, _spr_w, _rem_unit_h, _draw_x, _draw_end_y, _scale, _scale, _colour, _alpha); // bottom
        _draw_x += _spr_scaled_w;
    }
}

// Both / corners
if (_rem_w != 0 && _rem_h != 0)
{
    draw_sprite_part_ext(_sprite, _subimg, _rem2_inv_w, _rem2_inv_h, _rem2_min_w, _rem2_min_h, _x, _y, _scale, _scale, _colour, _alpha); // top left
    draw_sprite_part_ext(_sprite, _subimg, 0, _rem2_inv_h, _rem_unit_w, _rem2_min_h, _draw_end_x, _y, _scale, _scale, _colour, _alpha); // top right
    draw_sprite_part_ext(_sprite, _subimg, _rem2_inv_w, 0, _rem2_min_w, _rem_unit_h, _x, _draw_end_y, _scale, _scale, _colour, _alpha); // bottom left
    draw_sprite_part_ext(_sprite, _subimg, 0, 0, _rem_unit_w, _rem_unit_h, _draw_end_x, _draw_end_y, _scale, _scale, _colour, _alpha); // bottom right
}