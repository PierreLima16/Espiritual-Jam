global.transicao = false;
global.destino   = rm_tutorial_1;

function cria_transicao(_sq)
{
    var _cam_x = camera_get_view_x(view_camera[0]);
    var _cam_y = camera_get_view_y(view_camera[0]);
    
    if (!layer_sequence_exists("Transicao", _sq))
    {
        layer_sequence_create("Transicao", _cam_x, _cam_y, _sq);
    }
}

function muda_room()
{
    global.transicao = true;
    
    room_goto(global.destino);
}

function finaliza_transicao()
{
    global.transicao = false;
    
    layer_sequence_destroy(sq_transicao2);
}