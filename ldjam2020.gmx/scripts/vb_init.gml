#define vb_init
/*
    initializes vertex buffer handler
*/
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_textcoord();
vertex_format_add_normal();
vertex_format_add_colour();
global.VFTiles = vertex_format_end();

#define vb_destroy
/*
    Destroys and frees memory allocated for vertex buffer handler
*/
vertex_format_delete(global.VFTiles);