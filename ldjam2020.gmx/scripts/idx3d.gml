/// idx3d(_x, _y, _z, _layerwid, _layerhei)
/*
    Calculates 3D index from given x, y, z and width & height of each 'layer'
*/
var _x = argument0, _y = argument1, _z = argument2, _layerwid = argument3, _layerhei = argument4
return ((_y + _z * _layerhei) * _layerwid + _x);

