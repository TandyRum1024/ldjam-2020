/// modpos(_x, _div)
/*
    returns 'always positive' modulo
*/
var _x = argument0, _div = argument1;
if (_div < 0) 
    var _q = ceil(_x/_div);
else
    var _q = floor(_x/_div);

return _x - (_q * _div);
