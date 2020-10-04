/// size3d(_layerwid, _layerhei, _layers)
/*
    Calculates total size of an array / list from 3D sizes
*/
var _layerwid = argument0, _layerhei = argument1, _layers = argument2;
return _layerwid + _layerhei * _layerwid + _layers * _layerwid * _layerhei;
