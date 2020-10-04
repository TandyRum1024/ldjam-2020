#define debug_emit_message
/// debug_emit_message(_msg)
/*
    Shows message / log on the screen
*/
var _msg = argument0;
debug_log(_msg);

// Check if the message already exists in the messages list
var _msg_data = -1;
for (var _msg_idx=ds_list_size(global.debugMsgs)-1; _msg_idx>=0; _msg_idx--)
{
    _msg_data = global.debugMsgs[| _msg_idx];
    if (_msg_data[0] == _msg)
        break;
    else
        _msg_data = -1;
}

if (_msg_data != -1) // message already exists, reset the time & increment the message count
{
    _msg_data[@ 1] = global.debugMsgFrames;
    _msg_data[@ 2]++;
}
else // message does not exist in the map, make a new message
{
    _msg_data = makearray(_msg, global.debugMsgFrames, 1);
    ds_list_add(global.debugMsgs, _msg_data);
}

#define debug_emit_message_init
global.debugMsgs = ds_list_create();
global.debugMsgFrames = room_speed * 3;
global.debugMsgFadeFrame = room_speed;

#define debug_emit_message_update
// Iterate through all messages & update their frames etc
for (var i=0; i<ds_list_size(global.debugMsgs); i++)
{
    var _msg_data = global.debugMsgs[| i];
    if (_msg_data[1] > 0)
    {
        _msg_data[@ 1]--;
    }
    else
    {
        ds_list_delete(global.debugMsgs, i);
        i--;
    }
}

#define debug_emit_message_destroy
ds_list_destroy(global.debugMsgs);