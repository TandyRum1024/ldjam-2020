/// string_build(values, ...)
/// Builds string from given arguments and returns the resulting string
var values = argument[0];
var _str = "";
for (var i=0; i<argument_count; i++)
{
    _str += string(argument[i]);
}

return _str;
