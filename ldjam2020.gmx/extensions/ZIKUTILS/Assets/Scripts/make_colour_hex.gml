/// make_colour_hex(_hex_string)
/*
    Converts string that represents colour in HTML format (#RRGGBB) into a GML-friendly colour format
*/
var _hex_string = argument0;

// debug_log("make_colour_hex> CONVERTING COLOUR : `", _hex_string, "`");
_hex_string = string_upper(_hex_string);

// Table used to convert hex to dec
var _HEX_LUT = "0123456789ABCDEF";
var _num = 0;

// Convert hex-representing string to real hex
for (var i=1; i<=string_length(_hex_string); i++)
{
    var _decimal = max(string_pos(string_char_at(_hex_string, i), _HEX_LUT) - 1, 0);
    
    // By right bitshifting the _num by 4,
    // we can effectively multiply by 16, thus 'offsetting' the decimals
    _num = (_num << 4) | _decimal;
}

// Switch endianness to convert $RRGGBB to $BBGGRR,
// which is GML-friendly colour format.
_num = ((_num & $0000FF) << 16) | (_num & $00FF00) | ((_num & $FF0000) >> 16);

// debug_log("make_colour_hex> FINAL COLOUR : `", _num, "` | (COMP - #FFDD00 : `", $00DDFF, "`)");

return _num;
