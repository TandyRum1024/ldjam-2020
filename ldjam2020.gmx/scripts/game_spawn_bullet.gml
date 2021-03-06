/// game_spawn_bullet()
/*
    Spawns bullet
*/

var _success = false, _maxattempt = 64;
var _x, _y, _dir;

// Get players tile space coords
var _target_x = random_range(0, oMap.roomW), _target_y = random_range(0, oMap.roomH);
if (instance_exists(oPlayer) && random_range(0, 1) < 0.5)
{
    _target_x = oPlayer.x;
    _target_y = oPlayer.y;
}
// (convert to tile space)
_target_x = floor(_target_x / TILE_UNIT) * TILE_UNIT;
_target_y = floor(_target_y / TILE_UNIT) * TILE_UNIT;

while (!_success && _maxattempt-- > 0)
{
    var _spawn_anywhere = random_range(0, 1) < 0.25;
    
    // Choose which side of the map to spawn bullet on
    if (choose(true, false))
    {
        // spawn on vertical side
        var _check_x;
        if (choose(true, false))
        {
            _x = 0;
            _check_x = TILE_UNIT_HALF;
        }
        else
        {
            _x = oMap.roomW;
            _check_x = oMap.roomW - TILE_UNIT_HALF;
        }
        _dir = point_direction(_x, 0, oMap.roomW * 0.5, 0);
        
        if (_spawn_anywhere)
        {
            _y = _target_y; // floor(random_range(0, oMap.roomH) / TILE_UNIT) * TILE_UNIT;
        }
        else
        {
            // try to find an empty space
            var _best_pos = -9999, _best_dist = oMap.roomH * 2;
            for (var i=0; i<oMap.roomTileH; i++)
            {
                var _pos = i * TILE_UNIT + TILE_UNIT_HALF;
                if (!position_meeting(_check_x, _pos, oTile))
                {
                    var _dist = abs(_pos - _target_y);
                    if (_dist < _best_dist)
                    {
                        _best_dist = _dist;
                        _best_pos = _pos;
                    }
                }
            }
            
            if (_best_pos != -9999)
            {
                // found some empty space
                _y = _best_pos;
                _success = true;
            }
        }
    }
    else
    {
        // spawn on horizontal side
        var _check_y;
        if (choose(true, false))
        {
            _y = 0;
            _check_y = TILE_UNIT_HALF;
        }
        else
        {
            _y = oMap.roomH;
            _check_y = oMap.roomH - TILE_UNIT_HALF;
        }
        _dir = point_direction(0, _y, 0, oMap.roomH * 0.5);
        
        if (_spawn_anywhere)
        {
            _x = _target_x; // floor(random_range(0, oMap.roomW) / TILE_UNIT) * TILE_UNIT;
        }
        else
        {
            // try to find an empty space
            var _best_pos = -9999, _best_dist = oMap.roomW * 2;
            for (var i=0; i<oMap.roomTileW; i++)
            {
                var _pos = i * TILE_UNIT + TILE_UNIT_HALF;
                if (!position_meeting(_pos, _check_y, oTile))
                {
                    var _dist = abs(_pos - _target_x);
                    if (_dist < _best_dist)
                    {
                        _best_dist = _dist;
                        _best_pos = _pos;
                    }
                }
            }
            
            if (_best_pos != -9999)
            {
                // found some empty space
                _x = _best_pos;
                _success = true;
            }
        }
    }
    
    if (_success)
    {
        var _inst = instance_create(_x, _y, oBulletSpawner);
        _inst.image_angle = _dir;
        /*
        with (_inst)
        {
            image_angle = _dir;
            event_user(0);
        }
        */
        
        _success = true;
        return true;
    }
}

// Spawn anywhere if we couldn't find any spots
if (!_success)
{
    var _spawn_anywhere = random_range(0, 1) < 0.25;
    
    // Choose which side of the map to spawn bullet on
    if (_spawn_anywhere)
    {
        if (choose(true, false))
        {
            _x   = choose(0, oMap.roomW);
            _y   = floor(random_range(0, oMap.roomH) / TILE_UNIT) * TILE_UNIT;
            _dir = point_direction(_x, 0, oMap.roomW * 0.5, 0);
        }
        else
        {
            _y   = choose(0, oMap.roomH);
            _x   = floor(random_range(0, oMap.roomW) / TILE_UNIT) * TILE_UNIT;
            _dir = point_direction(0, _y, 0, oMap.roomH * 0.5);
        }
    }
    else
    {
        if (choose(true, false))
        {
            _x   = choose(0, oMap.roomW);
            _y   = _target_y; // floor(random_range(0, oMap.roomH) / TILE_UNIT) * TILE_UNIT;
            _dir = point_direction(_x, 0, oMap.roomW * 0.5, 0);
        }
        else
        {
            _x   = _target_x; // floor(random_range(0, oMap.roomW) / TILE_UNIT) * TILE_UNIT;
            _y   = choose(0, oMap.roomH);
            _dir = point_direction(0, _y, 0, oMap.roomH * 0.5);
        }
    }
    var _inst = instance_create(_x, _y, oBulletSpawner);
    _inst.image_angle = _dir;
    /*
    with (_inst)
    {
        image_angle = _dir;
        event_user(0);
    }
    */
    
    _success = true;
    return false;
}
