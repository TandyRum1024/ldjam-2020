#define anim_init
/*
    Initializes animation system
*/
animator = instance_create(0, 0, oAnim);
animator.visible = false;
animator.owner = id;

#define anim_fire
/// anim_fire(_name)
/*
    Fires animation
*/
var _name = argument0;
with (animator)
{
    if (fsmStateCurrent != _name)
        fsm_switch(_name);
}

#define anim_define
/// anim_define(_name, _script)
/*
    Defines animation to the system
*/
var _name = argument0, _script = argument1;
with (animator)
{
    fsm_add_state(_name, _script);
}

#define anim_destroy
/*
    Frees animation system from memory
*/
if (instance_exists(animator))
    instance_destroy(animator);