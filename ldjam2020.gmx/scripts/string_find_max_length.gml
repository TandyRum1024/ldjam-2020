#define string_find_max_length
/// string_find_max_length(_str, _wid)
/*
    Finds the maximum length of sub-string from given string
    that can fit within the given maximum width limit
    ====
    FYI : The width used for calculation will be unscaled, so do not forget to divide the width by your string's scale
*/
var _str = argument0, _wid = argument1;
var _len = 0;
var _total_wid = 0; // total width counted

// Find the position of next occurance of space character
// Doing this instead of looping through each character lets us to process the string word by word
var _next_space_pos = string_pos(" ", _str);
while (_next_space_pos && _total_wid > _wid)
{
    // Calculate the substring (word), which is essentially a part of the string
    // That starts from first character, and ending at the position of space
    var _word = string_copy(_str, 1, _next_space_pos - 1);
    var _word_wid = string_width(_word); // width of substring (word)
    
    // Check if adding the width of current word to total width will result in 'overflow'
    // Thus, letting us to determine the position of word that will make the string overflow.
    if (_total_wid + _word_wid >= _wid)
    {
        break;
    }
    _total_wid += _word_wid;
    
    // Find the next occurance of space,
    // Delete a part of the string, from the beginning to the current position of space to prevent the same space being detected twice
    _len += _next_space_pos;
    _str = string_delete(_str, 1, _next_space_pos);
    _next_space_pos = string_pos(" ", _str);
}

// Return the final length
// We subtract one from the calculated length to exclude the space character
return _len - 1;

#define string_split_max_length
/// string_split_max_length(_str, _wid, _begin_width = 0)
/*
    Splits the given string to multiple strings so that
    each string fits in the given maximum width limit
    ====
    FYI : The width used for calculation will be unscaled, so do not forget to divide the width by your string's scale
*/
var _str = argument[0], _wid = argument[1];
var _begin_width; if (argument_count > 2) _begin_width = argument[2]; else _begin_width = 0;
var _current_wid = _begin_width;  // width counted
var _current_str = ""; // holds the string that will be appended to array of string
var _strings = -1; // array of strings
var _strings_idx = 0;

// Find the position of next occurance of space character
// Doing this instead of looping through each character lets us to process the string word by word
var _next_space_pos = string_pos(" ", _str);
while (_next_space_pos && _str != "")
{
    // Calculate the substring (word), which is essentially a part of the string
    // That starts from first character, and ending at the position of space
    var _word = string_copy(_str, 1, _next_space_pos );
    var _word_wid = string_width(_word); // width of substring (word)
    
    // Check if adding the width of current word to total width will result in 'overflow'
    // Thus, letting us to determine the position of word that will make the string overflow.
    if (_current_wid + _word_wid >= _wid)
    {
        _current_wid = 0;
        
        // Add the current string to the array and clear the string
        _strings[_strings_idx++] = _current_str;
        _current_str = "";
    }
    
    _current_wid += _word_wid;
    _current_str += string_copy(_str, 1, _next_space_pos);
    
    // Find the next occurance of space,
    // Delete a part of the string, from the beginning to the current position of space to prevent the same space being detected twice
    _str = string_delete(_str, 1, _next_space_pos);
    _next_space_pos = string_pos(" ", _str);
}

// Add the leftover string to the array if they're not empty
var _word_wid = string_width(_str);
if (_current_wid + _word_wid >= _wid)
{
    _current_wid = 0;
    
    // Add the current string to the array and clear the string
    _strings[_strings_idx++] = _current_str;
    _current_str = "";
}
_current_str += _str;
if (_current_str != "")
{
    _strings[_strings_idx++] = _current_str;
}

// Return the splitted strings
return _strings;