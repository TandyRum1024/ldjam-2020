/// sfx_play(_snd, _vol, _pitch)
/// sfx_play
var _snd = argument0, _vol = argument1, _pitch = argument2;

var _sfx = audio_play_sound(_snd, 0, false);
audio_sound_gain(_sfx, _vol * global.soundVolumeFX, 0);
audio_sound_pitch(_sfx, _pitch);
return _sfx;
