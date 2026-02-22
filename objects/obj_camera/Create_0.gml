alvo = noone;
estado = noone;

segue_alvo = function()
{
    var _view_w = camera_get_view_width(view_camera[0]);
    var _view_h = camera_get_view_height(view_camera[0]);
    
    var _cam_x = x - _view_w/2;
    var _cam_y = y - _view_h/2;
    
    _cam_x = clamp(_cam_x, 0, room_width - _view_w);
    _cam_y = clamp(_cam_y, 0, room_height - _view_h);
    
    if (alvo)
    {
        x = lerp(x, alvo.x, 0.1);
        y = lerp(y, alvo.y, 0.1);
    }
    
    
    camera_set_view_pos(view_camera[0], _cam_x, _cam_y);
}

segue_player = function()
{
    if (instance_exists(obj_player))
    {
        alvo = obj_player;
        
        x = lerp(x, alvo.x, 0.1);
        y = lerp(y, alvo.y, 0.1);
    }
    else if (instance_exists(obj_player_espectral))
    {
        alvo = obj_player_espectral;
        
        x = lerp(x, alvo.x, 0.1);
        y = lerp(y, alvo.y, 0.1);
    }
    else
    {
        estado = segue_nada;
    }
    
    segue_alvo();
}

segue_espectro = function()
{
    segue_alvo();
}

segue_nada = function()
{
    alvo = noone;
}

estado = segue_player;