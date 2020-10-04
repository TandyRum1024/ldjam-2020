#define ui_state_main
/// oUI::ui_state_main

#define ui_state_title
/// oUI::ui_state_title
var _text       = "AD#NJOHHOSJNSLSZAM";
var _text_y     = SCREEN_CY;
var _text_scale = 4 * UI_SCALE;

draw_set_align(1, 1);
ui_draw_text(SCREEN_CX, _text_y + _text_scale, _text, _text_scale, c_black, 1.0);
ui_draw_text(SCREEN_CX, _text_y, _text, _text_scale, c_white, 1.0);

var _subtext       = "PRESS <Z>";
var _subtext_y     = SCREEN_CY + SCREEN_CY * 0.5;
var _subtext_scale = 2 * UI_SCALE;

ui_draw_text(SCREEN_CX, _subtext_y + _subtext_scale, _subtext, _subtext_scale, c_black, 1.0);
ui_draw_text(SCREEN_CX, _subtext_y, _subtext, _subtext_scale, c_ltgray, 1.0);

#define ui_state_ingame_intermission
/// oUI::ui_state_ingame_intermission
var _text       = "<ENTER> : BEGIN";
var _text_y     = 16 * UI_SCALE;
var _text_scale = 3 * UI_SCALE;

if (fsmStateCtr > oGameKNT.intermissionReadyFrames)
{
    // Draw text
    draw_set_align(1, 0);
    ui_draw_text(SCREEN_CX, _text_y + _text_scale, _text, _text_scale, c_black, 1.0);
    ui_draw_text(SCREEN_CX, _text_y, _text, _text_scale, c_white, 1.0);
}

#define ui_state_ingame_intermission_results
/// oUI::ui_state_ingame_intermission_results
var _text       = "NICE MOVES :)#<ENTER> : CONTINUE";
var _text_y     = 16 * UI_SCALE;
var _text_scale = 3 * UI_SCALE;

// Draw text
draw_set_align(1, 0);
ui_draw_text(SCREEN_CX, _text_y + _text_scale, _text, _text_scale, c_black, 1.0);
ui_draw_text(SCREEN_CX, _text_y, _text, _text_scale, c_white, 1.0);

#define ui_state_ingame_bullet_spawn
/// oUI::ui_state_ingame_bullet_spawn
var _target_num = instance_number(oTileTarget);
var _spawn_secs = floor(oGameKNT.bulletSpawnCtr / room_speed);

var _text       = string(_spawn_secs + 1) + "s TIL NEXT BULLET [" + string(oGameKNT.bulletSpawnNum) + "/" + string(oGameKNT.bulletSpawnNumMax) + "]#TARGETS LEFT : [" + string(_target_num) + "/" + string(oMap.roomTargetNum) + "]";
var _text_y     = 16 * UI_SCALE;
var _text_scale = 3 * UI_SCALE;
var _text_col   = merge_colour(c_white, merge_colour(c_blue, c_yellow, (current_time * 0.005) & 1), _spawn_secs < 1);

// Draw text
draw_set_align(1, 0);
ui_draw_text(SCREEN_CX, _text_y + _text_scale, _text, _text_scale, c_black, 1.0);
ui_draw_text(SCREEN_CX, _text_y, _text, _text_scale, _text_col, 1.0);

#define ui_state_ingame_bullet_survive
/// oUI::ui_state_ingame_bullet_survive
var _survive_secs = floor(oGameKNT.bulletSurviveCtr / room_speed);

var _text       = string(_survive_secs + 1) + " 초";
var _text_y     = 16 * UI_SCALE;
var _text_scale = 3 * UI_SCALE;
var _text_col   = merge_colour(c_white, merge_colour(c_blue, c_yellow, (current_time * 0.005) & 1), _survive_secs < 1);

// Draw text
draw_set_align(1, 0);
ui_draw_text(SCREEN_CX, _text_y + _text_scale, _text, _text_scale, c_black, 1.0);
ui_draw_text(SCREEN_CX, _text_y, _text, _text_scale, _text_col, 1.0);

#define ui_state_ingame_gameover
/// oUI::ui_state_ingame_gameover
var _text       = "DEAD :^)#----------#" + string(oGameKNT.scoreRooms) + " ZONES##PRESS <ENTER> TO RETRY.";
var _text_y     = 16 * UI_SCALE;
var _text_scale = 4 * UI_SCALE;
var _text_col   = make_colour_hsv(current_time * 0.1, 128, 255);

// Draw backdrop
ui_draw_rect(0, 0, SCREEN_W, SCREEN_H, c_black, 0.25);

// Draw text
draw_set_align(1, 1);
ui_draw_text(SCREEN_CX, SCREEN_CY + _text_scale, _text, _text_scale, c_black, 1.0);
ui_draw_text(SCREEN_CX, SCREEN_CY, _text, _text_scale, _text_col, 1.0);