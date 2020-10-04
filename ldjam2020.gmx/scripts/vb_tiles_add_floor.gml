#define vb_tiles_add_floor
/// vb_tiles_add_floor(_vb, _x, _y, _z, _w, _h, _uv1, _uv2, _flip = false, _col = c_white, _alpha = 1.0)
/*
    Appends vertex datas that represents a floor shape (horizontal quad)
    to provided vertex buffer that uses tile mesh vertex format
*/
var _vb = argument[0], _x = argument[1], _y = argument[2], _z = argument[3], _w = argument[4], _h = argument[5], _uv1 = argument[6], _uv2 = argument[7];
var _flip; if (argument_count > 8) _flip = argument[8]; else _flip = false;
var _col; if (argument_count > 9) _col = argument[9]; else _col = c_white;
var _alpha; if (argument_count > 10) _alpha = argument[10]; else _alpha = 1.0;

// Calculate positions and UVs
if (_flip)
{
    // Flip U
    var _tmp_u = _uv1[0];
    _uv1[0] = _uv2[0];
    _uv2[0] = _tmp_u;
}
var _x2 = _x + _w, _y2 = _y + _h;

var _pos_v1 = makearray(_x, _y, _z);
var _pos_v2 = makearray(_x2, _y, _z);
var _pos_v3 = makearray(_x, _y2, _z);
var _pos_v4 = makearray(_x2, _y2, _z);
var _uv_v1 = _uv1; // makearray(_uv1[0], _uv1[1]);
var _uv_v2 = makearray(_uv2[0], _uv1[1]);
var _uv_v3 = makearray(_uv1[0], _uv2[1]);
var _uv_v4 = _uv2; // makearray(_uv2[0], _uv2[1]);

if (_flip)
{
    // Triangle 1
    vb_tiles_add_tri_adv(_vb,
            _pos_v3,
            _pos_v2,
            _pos_v1,
            _uv_v3,
            _uv_v2,
            _uv_v1,
            _col, _col, _col,
            _alpha, _alpha, _alpha
        );
    
    // Triangle 2
    vb_tiles_add_tri_adv(_vb,
            _pos_v4,
            _pos_v2,
            _pos_v3,
            _uv_v4,
            _uv_v2,
            _uv_v3,
            _col, _col, _col,
            _alpha, _alpha, _alpha
        );
}
else
{
    // Triangle 1
    vb_tiles_add_tri_adv(_vb,
            _pos_v1,
            _pos_v2,
            _pos_v3,
            _uv_v1,
            _uv_v2,
            _uv_v3,
            _col, _col, _col,
            _alpha, _alpha, _alpha
        );
    
    // Triangle 2
    vb_tiles_add_tri_adv(_vb,
            _pos_v3,
            _pos_v2,
            _pos_v4,
            _uv_v3,
            _uv_v2,
            _uv_v4,
            _col, _col, _col,
            _alpha, _alpha, _alpha
        );
}

// Return vertices added
return 6;

#define vb_tiles_add_floor_abspos
/// vb_tiles_add_floor_abspos(_vb, _x1, _y1, _z, _x2, _y2, _uv1, _uv2, _flip = false, _col = c_white, _alpha = 1.0)
/*
    Appends vertex datas that represents a floor shape (horizontal quad)
    to provided vertex buffer that uses tile mesh vertex format
*/
var _vb = argument[0], _x1 = argument[1], _y1 = argument[2], _z = argument[3], _x2 = argument[4], _y2 = argument[5], _uv1 = argument[6], _uv2 = argument[7];
var _flip; if (argument_count > 8) _flip = argument[8]; else _flip = false;
var _col; if (argument_count > 9) _col = argument[9]; else _col = c_white;
var _alpha; if (argument_count > 10) _alpha = argument[10]; else _alpha = 1.0;

// Calculate positions and UVs
if (_flip)
{
    // Flip U
    var _tmp_u = _uv1[0];
    _uv1[0] = _uv2[0];
    _uv2[0] = _tmp_u;
}

var _pos_v1 = makearray(_x1, _y1, _z);
var _pos_v2 = makearray(_x2, _y1, _z);
var _pos_v3 = makearray(_x1, _y2, _z);
var _pos_v4 = makearray(_x2, _y2, _z);
var _uv_v1 = _uv1; // makearray(_uv1[0], _uv1[1]);
var _uv_v2 = makearray(_uv2[0], _uv1[1]);
var _uv_v3 = makearray(_uv1[0], _uv2[1]);
var _uv_v4 = _uv2; // makearray(_uv2[0], _uv2[1]);

if (_flip)
{
    // Triangle 1
    vb_tiles_add_tri_adv(_vb,
            _pos_v3,
            _pos_v2,
            _pos_v1,
            _uv_v3,
            _uv_v2,
            _uv_v1,
            _col, _col, _col,
            _alpha, _alpha, _alpha
        );
    
    // Triangle 2
    vb_tiles_add_tri_adv(_vb,
            _pos_v4,
            _pos_v2,
            _pos_v3,
            _uv_v4,
            _uv_v2,
            _uv_v3,
            _col, _col, _col,
            _alpha, _alpha, _alpha
        );
}
else
{
    // Triangle 1
    vb_tiles_add_tri_adv(_vb,
            _pos_v1,
            _pos_v2,
            _pos_v3,
            _uv_v1,
            _uv_v2,
            _uv_v3,
            _col, _col, _col,
            _alpha, _alpha, _alpha
        );
    
    // Triangle 2
    vb_tiles_add_tri_adv(_vb,
            _pos_v3,
            _pos_v2,
            _pos_v4,
            _uv_v3,
            _uv_v2,
            _uv_v4,
            _col, _col, _col,
            _alpha, _alpha, _alpha
        );
}

// Return vertices added
return 6;

#define vb_tiles_add_floor_ext
/// vb_tiles_add_floor_ext(_vb, _x1, _y1, _x2, _y2, _z1, _z2, _z3, _z4, _uv1, _uv2, _flip = false, _col = c_white, _alpha = 1.0)
/*
    Appends vertex datas that represents a floor shape (horizontal quad)
    to provided vertex buffer that uses tile mesh vertex format
*/
var _vb = argument[0], _x1 = argument[1], _y1 = argument[2], _x2 = argument[3], _y2 = argument[4], _z1 = argument[5], _z2 = argument[6], _z3 = argument[7], _z4 = argument[8], _uv1 = argument[9], _uv2 = argument[10];
var _flip; if (argument_count > 11) _flip = argument[11]; else _flip = false;
var _col; if (argument_count > 12) _col = argument[12]; else _col = c_white;
var _alpha; if (argument_count > 13) _alpha = argument[13]; else _alpha = 1.0;

// Calculate positions and UVs
if (_flip)
{
    // Flip U
    var _tmp_u = _uv1[0];
    _uv1[0] = _uv2[0];
    _uv2[0] = _tmp_u;
}

var _pos_v1 = makearray(_x1, _y1, _z1);
var _pos_v2 = makearray(_x2, _y1, _z2);
var _pos_v3 = makearray(_x1, _y2, _z3);
var _pos_v4 = makearray(_x2, _y2, _z4);
var _uv_v1 = _uv1; // makearray(_uv1[0], _uv1[1]);
var _uv_v2 = makearray(_uv2[0], _uv1[1]);
var _uv_v3 = makearray(_uv1[0], _uv2[1]);
var _uv_v4 = _uv2; // makearray(_uv2[0], _uv2[1]);

if (_flip)
{
    // Triangle 1
    vb_tiles_add_tri_adv(_vb,
            _pos_v3,
            _pos_v2,
            _pos_v1,
            _uv_v3,
            _uv_v2,
            _uv_v1,
            _col, _col, _col,
            _alpha, _alpha, _alpha
        );
    
    // Triangle 2
    vb_tiles_add_tri_adv(_vb,
            _pos_v4,
            _pos_v2,
            _pos_v3,
            _uv_v4,
            _uv_v2,
            _uv_v3,
            _col, _col, _col,
            _alpha, _alpha, _alpha
        );
}
else
{
    // Triangle 1
    vb_tiles_add_tri_adv(_vb,
            _pos_v1,
            _pos_v2,
            _pos_v3,
            _uv_v1,
            _uv_v2,
            _uv_v3,
            _col, _col, _col,
            _alpha, _alpha, _alpha
        );
    
    // Triangle 2
    vb_tiles_add_tri_adv(_vb,
            _pos_v3,
            _pos_v2,
            _pos_v4,
            _uv_v3,
            _uv_v2,
            _uv_v4,
            _col, _col, _col,
            _alpha, _alpha, _alpha
        );
}

// Return vertices added
return 6;