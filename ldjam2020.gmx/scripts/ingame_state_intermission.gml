#define ingame_state_intermission
/// oGameKNT::ingame_state_intermission
if (fsmStateInit)
{
    ui_set("ingame_intermission");
    
    // Request room generation & init room
    with (oMap)
    {
        event_user(0);
        event_user(1);
    }
    
    // Update maximum bullet number
    oGameKNT.bulletSpawnNumMax = instance_number(oTileTarget) + 2;
    
    // Show UI message
    with (oUI)
    {
        msg = "ZONE \#" + string(oGameKNT.scoreRooms);
        msgFrames = room_speed * 3.0;
    }
}

if (fsmStateCtr > intermissionReadyFrames)
{
    // Begin
    if (keyboard_check_pressed(vk_enter))
    {
        fsm_switch("bullet_spawn");
    }
}

// Reset dynamic music
global.soundVolumeMusic1 = lerp(global.soundVolumeMusic1, 1.0, 0.1);
global.soundVolumeMusic2 = lerp(global.soundVolumeMusic2, 0.0, 0.1);
global.soundVolumeMusic3 = lerp(global.soundVolumeMusic3, 0.0, 0.1);

// Restart
if (keyboard_check_pressed(ord('R')))
{
    fsm_switch("setup");
}

#define ingame_state_setup
/// oGameKNT::ingame_state_setup
// Reset game variables
scoreRooms = 0;

// Clear all game instances
instance_destroy(oGameEntity);

fsm_switch("intermission");

#define ingame_state_bullet_spawn
/// oGameKNT::ingame_state_bullet_spawn
if (fsmStateInit)
{
    ui_set("ingame_bullet_spawn");
    
    // Reset bullet spawn frames
    bulletSpawnCtr = bulletSpawnFrames;
    bulletSpawnNum = 0;
    
    // Reset dynamic music
    global.soundVolumeMusic1 = 1.0;
    global.soundVolumeMusic2 = 0.0;
    global.soundVolumeMusic3 = 0.0;
}

/// Update bullet spawn mechanic
if (bulletSpawnNum < bulletSpawnNumMax)
{
    if (bulletSpawnCtr > 0)
    {
        bulletSpawnCtr--;
    }
    else
    {
        // Spawn bullet & increment bullet counter & reset spawn frames
        game_spawn_bullet();
        
        bulletSpawnCtr = bulletSpawnFrames;
        bulletSpawnNum++;
    }
}

/// Update dynamic music
if (bulletSpawnNum >= bulletSpawnNumMax)
{
    global.soundVolumeMusic1 = lerp(global.soundVolumeMusic1, 1.0, 0.1);
    global.soundVolumeMusic2 = lerp(global.soundVolumeMusic2, 1.0, 0.1);
    global.soundVolumeMusic3 = lerp(global.soundVolumeMusic3, 1.0, 0.1);
}
else if (bulletSpawnNum >= floor(bulletSpawnNumMax * 0.5))
{
    global.soundVolumeMusic1 = lerp(global.soundVolumeMusic1, 1.0, 0.1);
    global.soundVolumeMusic2 = lerp(global.soundVolumeMusic2, 1.0, 0.1);
    global.soundVolumeMusic3 = lerp(global.soundVolumeMusic3, 0.0, 0.1);
}
else if (bulletSpawnNum >= 0)
{
    // Reset dynamic music
    global.soundVolumeMusic1 = lerp(global.soundVolumeMusic1, 1.0, 0.1);
    global.soundVolumeMusic2 = lerp(global.soundVolumeMusic2, 0.0, 0.1);
    global.soundVolumeMusic3 = lerp(global.soundVolumeMusic3, 0.0, 0.1);
}

/// Check for room complete criterias
if (bulletSpawnNum >= bulletSpawnNumMax && instance_number(oTileTarget) <= 0)
{
    // Engage bullet survive mode
    fsm_switch("bullet_survive");
}
else if (!instance_exists(oPlayer)) // Check for player death
{
    fsm_switch("gameover");
}

// Instant restart
if (keyboard_check_pressed(ord('R')))
{
    fsm_switch("setup");
}

#define ingame_state_bullet_survive
/// oGameKNT::ingame_state_bullet_survive
if (fsmStateInit)
{
    ui_set("ingame_bullet_survive");
    
    // Reset bullet survive frames
    bulletSurviveCtr = bulletSurviveFrames;
}

/// Update bullet survive mechanic
if (bulletSpawnNumMax)
{
    if (bulletSurviveCtr > 0)
    {
        bulletSurviveCtr--;
    }
    else
    {
        // Engage results mode
        fsm_switch("intermission_results");
    }
    
    // Check for player death
    if (!instance_exists(oPlayer))
    {
        fsm_switch("gameover");
    }
}

// Instant restart
if (keyboard_check_pressed(ord('R')))
{
    fsm_switch("setup");
}

#define ingame_state_intermission_results
/// oGameKNT::ingame_state_intermission_results
if (fsmStateInit)
{
    ui_set("ingame_intermission_results");
    
    // destroy all hostile stuffs
    instance_destroy(oBullet);
    
    // increment score
    scoreRooms++;
}

if (keyboard_check_pressed(vk_enter))
{
    fsm_switch("intermission");
}

// Instant restart
if (keyboard_check_pressed(ord('R')))
{
    fsm_switch("setup");
}

#define ingame_state_gameover
/// oGameKNT::ingame_state_gameover
if (fsmStateInit)
{
    ui_set("ingame_gameover");
}

if (keyboard_check_pressed(vk_enter))
{
    fsm_switch("intermission");
}