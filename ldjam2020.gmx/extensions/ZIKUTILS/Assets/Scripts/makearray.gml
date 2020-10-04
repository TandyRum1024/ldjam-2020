/// makearray(v1, ...)
/// @args values ...
var v1 = argument[0];
var _arr = -1;
for (var i=argument_count-1; i>=0; i--)
    _arr[i] = argument[i];
/*
for (var i=0; i<argument_count; i++)
    _arr[i] = argument[i];
*/
return _arr;
