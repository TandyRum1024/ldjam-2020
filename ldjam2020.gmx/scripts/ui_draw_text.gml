#define ui_draw_text
/// ui_draw_text(_x, _y, _str, _scale, _col, _alpha)
/*
    Wrapper function for draw_text_transformed_colour
*/
var _x = argument0, _y = argument1, _str = argument2, _scale = argument3, _col = argument4, _alpha = argument5;
draw_text_transformed_colour(_x, _y, _str, _scale, _scale, 0, _col, _col, _col, _col, _alpha);

#define ui_draw_text_ext
/// ui_draw_text_ext(_x, _y, _str, _scale, _col, _alpha, _wid, _sep = -1)
/*
    Wrapper function for draw_text_ext_transformed_colour
*/
var _x = argument[0], _y = argument[1], _str = argument[2], _scale = argument[3], _col = argument[4], _alpha = argument[5], _wid = argument[6];
var _sep; if (argument_count > 7) _sep = argument[7]; else _sep = -1;
draw_text_ext_transformed_colour(_x, _y, _str, _sep, _wid / _scale, _scale, _scale, 0, _col, _col, _col, _col, _alpha);