/// debug_log(values, ...)
/// Builds string from given arguments and prints the resulting string
var values = argument[0];
var _str = "";
for (var i=0; i<argument_count; i++)
{
    _str += string(argument[i]);
}
show_debug_message(object_get_name(object_index) + "|" + _str);
