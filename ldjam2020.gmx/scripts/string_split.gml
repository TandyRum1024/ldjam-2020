#define string_split
/// string_split(_string, _splitter)
/*
    Splits a string with given delimiter and returns a new array
*/
var _string = argument0, _splitter = argument1;

var _buffers = -1, _buffers_idx = 0;
var _buffer_current = "";
var _splitter_pos = string_pos(_splitter, _string);

// Base case : No delimiter exists -- just a single string has been provided
// in this case just return the string as is
if (_splitter_pos == 0)
    return _string;

// Otherwise : Begin consuming the string as we build the list of split strings
while (_splitter_pos > 0)
{
    var _previous_ch = string_char_at(_string, _splitter_pos - 1);
    
    // Check if the delimiter is escaped via backslash
    if (_previous_ch != '\')
    {
        // Delimiter is NOT escaped, split the string by adding a portion of string to the array
        // and resetting the buffer
        _buffers[_buffers_idx++] = string_trim_whitespace(_buffer_current + string_copy(_string, 1, _splitter_pos - 1));
        _buffer_current = "";
    }
    else
    {
        // Delimiter is escaped, just append current portion of string to the buffer
        _buffer_current += string_copy(_string, 1, _splitter_pos);
    }
    
    // Remove a portion from the string to prevent same delimiter getting detected over and over again
    _string = string_delete(_string, 1, _splitter_pos);
    
    // Find the next delimiter position
    _splitter_pos = string_pos(_splitter, _string);
}

// If there's still some unconsumed string left, then add that to the list of strings aswell
var _leftover = string_trim_whitespace(_buffer_current + _string);
if (_buffers_idx > 0)
    _buffers[_buffers_idx++] = _leftover;
else
    _buffers = _leftover;

return _buffers;

#define string_split_for_obj
/// string_split_for_obj(_string, _splitter, _default = -1)
/*
    Splits a string with given delimiter and returns a new array
    (special version for OBJ parser, with default value support)
*/
var _string = argument[0], _splitter = argument[1];
var _default; if (argument_count > 2) _default = argument[2]; else _default = -1;

var _buffers = _default, _buffers_idx = 0;
var _buffer_current = "";
var _splitter_pos = string_pos(_splitter, _string);

// Base case : No delimiter exists -- just a single string has been provided
// in this case just return the string as is
if (_splitter_pos == 0)
{
    _buffers[0] = _string;
    return _buffers;
}

// Otherwise : Begin consuming the string as we build the list of split strings
while (_splitter_pos > 0)
{
    // Delimiter is NOT escaped, split the string by adding a portion of string to the array
    _buffers[_buffers_idx++] = string_trim_whitespace(string_copy(_string, 1, _splitter_pos - 1));
    
    // Remove a portion from the string to prevent same delimiter getting detected over and over again
    _string = string_delete(_string, 1, _splitter_pos);
    
    // Find the next delimiter position
    _splitter_pos = string_pos(_splitter, _string);
}

// If there's still some unconsumed string left, then add that to the list of strings aswell
var _leftover = string_trim_whitespace(_string);
_buffers[_buffers_idx++] = _leftover;
/*
if (_buffers_idx > 0)
    _buffers[_buffers_idx++] = _leftover;
else
    _buffers[0] = _leftover;
*/
return _buffers;