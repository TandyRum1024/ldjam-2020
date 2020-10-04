#define colour_to_vec4
/// colour_to_vec4(colour_bbggrr, alpha)
var _arr = -1;
_arr[3] = argument1;
_arr[2] = ((argument0 & $FF0000) >> 16) / 255;
_arr[1] = ((argument0 & $00FF00) >> 8)  / 255;
_arr[0] = ((argument0 & $0000FF))       / 255;
return _arr;

#define vec3_to_colour
/// vec3_to_colour(r, g, b)
// magically turns vec(R, G, B) into $BBGGRR
return ((argument2 * 255) << 16) | ((argument1 * 255) << 8) | ((argument0 * 255) << 0);

#define vec3_to_colour_safe
/// vec3_to_colour_safe(r, g, b)
// magically turns vec(R, G, B) into $BBGGRR
return ((clamp(argument2, 0, 1) * 255) << 16) | ((clamp(argument1, 0, 1) * 255) << 8) | ((clamp(argument0, 0, 1) * 255) << 0);