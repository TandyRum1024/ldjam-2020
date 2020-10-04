#define buffer_write_string
/// buffer_write_string(_buffer, _str, _bytes)
/*
    Writes sequence of buffer_u8 to given buffer
*/
var _buffer = argument0, _str = argument1, _bytes = argument2;

var _delta = _bytes - string_length(_str);
if (_delta > 0)
    _str += string_repeat(" ", _delta);
else
    _str = string_copy(_str, 1, _bytes);

debug_log("buffer_write_string> WRITING : ", _str);
for (var i=1; i<=_bytes; i++)
{
    var _char = ord(string_char_at(_str, i));
    debug_log(" > WRITE : ", chr(_char), " [", _char, "]");
    buffer_write(_buffer, buffer_u8, _char);
}

#define buffer_read_string
/// buffer_read_string(_buffer, _bytes)
/*
    Writes sequence of buffer_u8 to given buffer
*/
var _buffer = argument0, _bytes = argument1;
var _str = "";
for (var i=0; i<_bytes; i++)
{
    var _char = buffer_read(_buffer, buffer_u8);
    _str += chr(_char);
}

return _str;