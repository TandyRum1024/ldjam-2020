/// calc_interp(_frame, _maxframe, _weightbegin, _weightend)
/*
    Calculates interpolation factor in 0..1 range with given weights
    for using in procedural animations
*/
var _frame = argument0, _maxframe = argument1, _weightbegin = argument2, _weightend = argument3;
return power(1.0 - power(1.0 - clamp(_frame / _maxframe, 0.0, 1.0), _weightend), _weightbegin);
