#define player_anim_idle
/// oPlayer::player_anim_idle
if (fsmStateInit)
{
    event_user(1);
    
    sprite_index = sprPlayer;
    image_index = 0;
    image_speed = 0;
    x = 0;
    y = 0;
}

var _speed = point_distance(0, 0, owner.vx, owner.vy);
image_index = floor(fsmStateCtr * 0.1) % 2;
image_xscale = owner.moveFacingH;

if (_speed >= 0.1)
{
    fsm_switch("move");
}

#define player_anim_move
/// oPlayer::player_anim_move
if (fsmStateInit)
{
    event_user(1);
    
    sprite_index = sprPlayer;
    image_index = 2;
    image_speed = 0;
    
    BUF_SND_PLAYED = false;
}

var _speed = point_distance(0, 0, owner.vx, owner.vy);
BUF_CTR += _speed;

// animate player move
var _bop = (sin(BUF_CTR * (pi / 32)) * 0.5 + 0.5);
y = -power(_bop, 2.0) * 16 * clamp(_speed / owner.moveVelMax, 0, 1);
image_angle = cos(BUF_CTR * (pi * 2 / 32)) * 8;
image_xscale = owner.moveFacingH;

// play sound
if (_bop < 0.1 && !BUF_SND_PLAYED)
{
    var _pitch = 0.7 + BUF_SND_CTR * 0.3;
    sfx_play(choose(fxFootstep1, fxFootstep2), 0.5, random_range(0.9, 1.1) * _pitch);
    
    BUF_SND_CTR = !BUF_SND_CTR;
    BUF_SND_PLAYED = true;
}
else if (_bop > 0.5)
{
    BUF_SND_PLAYED = false;
}

// switch
if (_speed < 0.1)
{
    fsm_switch("idle");
}

#define player_anim_parry
/// oPlayer::player_anim_parry
if (fsmStateInit)
{
    var _facing = image_xscale;
    event_user(1);
    
    sprite_index = sprPlayer;
    image_index = 3;
    image_speed = 0;
    image_xscale = _facing;
    x = 0;
    y = 0;
    
    // play sound
    sfx_play(fxSwing, 1.0, random_range(0.8, 1.2));
}

var _frame = floor(fsmStateCtr * 0.25);
image_index = 3 + min(_frame, 2);

if (_frame > 3)
{
    fsm_switch("idle");
}