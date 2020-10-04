/// calculate_normal_3d(_x1, _y1, _z1, _x2, _y2, _z2, _x3, _y3, _z3)
/*
    Calculates surface normal of triangle and returns an array containing 3D normal
*/
var _x1 = argument0, _y1 = argument1, _z1 = argument2, _x2 = argument3, _y2 = argument4, _z2 = argument5, _x3 = argument6, _y3 = argument7, _z3 = argument8;

// Calculate normal from three triangle points
// https://www.khronos.org/opengl/wiki/Calculating_a_Surface_Normal
var _ux = _x2 - _x1, _uy = _y2 - _y1, _uz = _z2 - _z1;
var _vx = _x3 - _x1, _vy = _y3 - _y1, _vz = _z3 - _z1;

return makearray(
    _uy * _vz - _uz * _vy,
    _uz * _vx - _ux * _vz,
    _ux * _vy - _uy * _vx
    );
