/// osc_sin(_frequency)
/*
    Returns oscillating value between 0 and 1
    Default - 1 oscillation per seconds
*/
var _frequency = argument0;
return sin(current_time * pi * 0.002 * _frequency) * 0.5 + 0.5;
