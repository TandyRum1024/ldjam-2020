#define vb_tiles_add_vertex
/// vb_tiles_add_vertex(_vb, _x, _y, _z, _u, _v, _nx, _ny, _nz, _col, _alpha)
/*
    Adds vertex data to vertex buffers that uses tile mesh vertex format
*/
var _vb = argument0, _x = argument1, _y = argument2, _z = argument3, _u = argument4, _v = argument5, _nx = argument6, _ny = argument7, _nz = argument8, _col = argument9, _alpha = argument10;
vertex_position_3d(_vb, _x, _y, _z);
vertex_texcoord(_vb, _u, _v);
vertex_normal(_vb, _nx, _ny, _nz);
vertex_colour(_vb, _col, _alpha);

#define vb_tiles_add_tri
/// vb_tiles_add_tri(_vb, _pos1, _pos2, _pos3, _u1, _v1, _u2, _v2, _u3, _v3, _c1, _c2, _c3, _a1, _a2, _a3)
var _vb = argument0, _pos1 = argument1, _pos2 = argument2, _pos3 = argument3, _u1 = argument4, _v1 = argument5, _u2 = argument6, _v2 = argument7, _u3 = argument8, _v3 = argument9, _c1 = argument10, _c2 = argument11, _c3 = argument12, _a1 = argument13, _a2 = argument14, _a3 = argument15;

var _x1 = _pos1[0], _y1 = _pos1[1], _z1 = _pos1[2];
var _x2 = _pos2[0], _y2 = _pos2[1], _z2 = _pos2[2];
var _x3 = _pos3[0], _y3 = _pos3[1], _z3 = _pos3[2];

// Calculate normal from three triangle points
var _normal = calculate_normal_3d(_x1, _y1, _z1, _x2, _y2, _z2, _x3, _y3, _z3);
var _nx = _normal[0], _ny = _normal[1], _nz = _normal[2];

vb_tiles_add_vertex(_vb, _x1, _y1, _z1, _u1, _v1, _nx, _ny, _nz, _c1, _a1);
vb_tiles_add_vertex(_vb, _x2, _y2, _z2, _u2, _v2, _nx, _ny, _nz, _c2, _a2);
vb_tiles_add_vertex(_vb, _x3, _y3, _z3, _u3, _v3, _nx, _ny, _nz, _c3, _a3);

#define vb_tiles_add_tri_adv
/// vb_tiles_add_tri_adv(_vb, _pos1, _pos2, _pos3, _uv1, _uv2, _uv3, _c1, _c2, _c3, _a1, _a2, _a3, _flipnormal = false)
var _vb = argument[0], _pos1 = argument[1], _pos2 = argument[2], _pos3 = argument[3], _uv1 = argument[4], _uv2 = argument[5], _uv3 = argument[6], _c1 = argument[7], _c2 = argument[8], _c3 = argument[9], _a1 = argument[10], _a2 = argument[11], _a3 = argument[12];
var _flipnormal; if (argument_count > 13) _flipnormal = argument[13]; else _flipnormal = false;

var _x1 = _pos1[0], _y1 = _pos1[1], _z1 = _pos1[2];
var _x2 = _pos2[0], _y2 = _pos2[1], _z2 = _pos2[2];
var _x3 = _pos3[0], _y3 = _pos3[1], _z3 = _pos3[2];

// Calculate normal from three triangle points
var _normal = calculate_normal_3d(_x1, _y1, _z1, _x2, _y2, _z2, _x3, _y3, _z3);
var _normal_fac = -1;
if (_flipnormal)
    _normal_fac = -1;
var _nx = _normal[0] * _normal_fac, _ny = _normal[1] * _normal_fac, _nz = _normal[2] * _normal_fac;

vb_tiles_add_vertex(_vb, _x1, _y1, _z1, _uv1[0], _uv1[1], _nx, _ny, _nz, _c1, _a1);
vb_tiles_add_vertex(_vb, _x2, _y2, _z2, _uv2[0], _uv2[1], _nx, _ny, _nz, _c2, _a2);
vb_tiles_add_vertex(_vb, _x3, _y3, _z3, _uv3[0], _uv3[1], _nx, _ny, _nz, _c3, _a3);

#define _vb_tiles_add_tri_legacy
/// vb_tiles_add_tri(_vb, _x1, _y1, _z1, _x2, _y2, _z2, _x3, _y3, _z3, _u1, _v1, _u2, _v2, _u3, _v3, _c1, _c2, _c3, _a1, _a2, _a3)
/*
    Adds vertex datas that represents a single triangle to vertex buffers that uses tile mesh vertex format
*/
var _vb = argument0, _x1 = argument1, _y1 = argument2, _z1 = argument3, _x2 = argument4, _y2 = argument5, _z2 = argument6, _x3 = argument7, _y3 = argument8, _z3 = argument9, _u1 = argument10, _v1 = argument11, _u2 = argument12, _v2 = argument13, _u3 = argument14, _v3 = argument15, _c1 = argument16, _c2 = argument17, _c3 = argument18, _a1 = argument19, _a2 = argument20, _a3 = argument21;

// Calculate normal from three triangle points
var _normal = calculate_normal_3d(_x1, _y1, _z1, _x2, _y2, _z2, _x3, _y3, _z3);
var _nx = _normal[0], _ny = _normal[1], _nz = _normal[2];

vb_tiles_add_vertex(_vb, _x1, _y1, _z1, _u1, _v1, _nx, _ny, _nz, _c1, _a1);
vb_tiles_add_vertex(_vb, _x2, _y2, _z2, _u2, _v2, _nx, _ny, _nz, _c2, _a2);
vb_tiles_add_vertex(_vb, _x3, _y3, _z3, _u3, _v3, _nx, _ny, _nz, _c3, _a3);