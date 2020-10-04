#define vb_tiles_add_wall
/// vb_tiles_add_wall(_vb, _x, _y, _z, _xsize, _ysize, _hei, _uv1, _uv2, _flip = false, _top_col = c_white, _top_alpha = 1.0, _bottom_col = c_white, _bottom_alpha = 1.0)
/*
    Appends vertex datas that represents a wall shape (vertical quad)
    to provided vertex buffer that uses tile mesh vertex format
    ===
    FYI : _xsize and _ysize determines the horizontal dimension and angle while _hei determines vertical (z) height
*/
var _vb = argument[0], _x = argument[1], _y = argument[2], _z = argument[3], _xsize = argument[4], _ysize = argument[5], _hei = argument[6], _uv1 = argument[7], _uv2 = argument[8];
var _flip; if (argument_count > 9) _flip = argument[9]; else _flip = false;
var _top_col; if (argument_count > 10) _top_col = argument[10]; else _top_col = c_white;
var _top_alpha; if (argument_count > 11) _top_alpha = argument[11]; else _top_alpha = 1.0;
var _bottom_col; if (argument_count > 12) _bottom_col = argument[12]; else _bottom_col = c_white;
var _bottom_alpha; if (argument_count > 13) _bottom_alpha = argument[13]; else _bottom_alpha = 1.0;

// Calculate positions and UVs
if (_flip)
{
    // Flip U
    var _tmp_u = _uv1[0];
    _uv1[0] = _uv2[0];
    _uv2[0] = _tmp_u;
}

var _x2 = _x + _xsize, _y2 = _y + _ysize, _z2 = _z + _hei;

var _pos_v1 = makearray(_x, _y, _z2);
var _pos_v2 = makearray(_x2, _y2, _z2);
var _pos_v3 = makearray(_x, _y, _z);
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
            _top_col, _top_col, _bottom_col,
            _top_alpha, _top_alpha, _bottom_alpha
        );
        
    // Triangle 2
    vb_tiles_add_tri_adv(_vb,
            _pos_v4,
            _pos_v2,
            _pos_v3,
            _uv_v4,
            _uv_v2,
            _uv_v3,
            _bottom_col, _top_col, _bottom_col,
            _bottom_alpha, _top_alpha, _bottom_alpha
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
            _top_col, _top_col, _bottom_col,
            _top_alpha, _top_alpha, _bottom_alpha
        );
        
    // Triangle 2
    vb_tiles_add_tri_adv(_vb,
            _pos_v3,
            _pos_v2,
            _pos_v4,
            _uv_v3,
            _uv_v2,
            _uv_v4,
            _bottom_col, _top_col, _bottom_col,
            _bottom_alpha, _top_alpha, _bottom_alpha
        );
}

// Return vertices added
return 6;

#define vb_tiles_add_wall_abspos
/// vb_tiles_add_wall_abspos(_vb, _x1, _y1, _z1, _x2, _y2, _z2, _uv1, _uv2, _flip = false, _top_col = c_white, _top_alpha = 1.0, _bottom_col = c_white, _bottom_alpha = 1.0)
/*
    Appends vertex datas that represents a wall shape (vertical quad)
    to provided vertex buffer that uses tile mesh vertex format
    ===
    FYI : _xsize and _ysize determines the horizontal dimension and angle while _hei determines vertical (z) height
*/
var _vb = argument[0], _x1 = argument[1], _y1 = argument[2], _z1 = argument[3], _x2 = argument[4], _y2 = argument[5], _z2 = argument[6], _uv1 = argument[7], _uv2 = argument[8];
var _flip; if (argument_count > 9) _flip = argument[9]; else _flip = false;
var _top_col; if (argument_count > 10) _top_col = argument[10]; else _top_col = c_white;
var _top_alpha; if (argument_count > 11) _top_alpha = argument[11]; else _top_alpha = 1.0;
var _bottom_col; if (argument_count > 12) _bottom_col = argument[12]; else _bottom_col = c_white;
var _bottom_alpha; if (argument_count > 13) _bottom_alpha = argument[13]; else _bottom_alpha = 1.0;

// Calculate positions and UVs
if (_flip)
{
    // Flip U
    var _tmp_u = _uv1[0];
    _uv1[0] = _uv2[0];
    _uv2[0] = _tmp_u;
}

var _pos_v1 = makearray(_x1, _y1, _z2);
var _pos_v2 = makearray(_x2, _y2, _z2);
var _pos_v3 = makearray(_x1, _y1, _z1);
var _pos_v4 = makearray(_x2, _y2, _z1);
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
            _top_col, _top_col, _bottom_col,
            _top_alpha, _top_alpha, _bottom_alpha
        );
        
    // Triangle 2
    vb_tiles_add_tri_adv(_vb,
            _pos_v4,
            _pos_v2,
            _pos_v3,
            _uv_v4,
            _uv_v2,
            _uv_v3,
            _bottom_col, _top_col, _bottom_col,
            _bottom_alpha, _top_alpha, _bottom_alpha
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
            _top_col, _top_col, _bottom_col,
            _top_alpha, _top_alpha, _bottom_alpha
        );
        
    // Triangle 2
    vb_tiles_add_tri_adv(_vb,
            _pos_v3,
            _pos_v2,
            _pos_v4,
            _uv_v3,
            _uv_v2,
            _uv_v4,
            _bottom_col, _top_col, _bottom_col,
            _bottom_alpha, _top_alpha, _bottom_alpha
        );
}

// Return vertices added
return 6;