estado = noone;

raio = 70;

estado_abrindo = function()
{
    instance_destroy();
}

estado_nada = function()
{
      
}


desenha_input = function()
{
    if (instance_exists(obj_player_espectral))
    {
        if (!abrir) exit;
            
        
        //Pegando a distancia entre mim o player
        var _dist = point_distance(x, y, obj_player_espectral.x, obj_player_espectral.y);
        
        //Se a distancia for menor que 100 pixels
        if (_dist < raio)
        {
            var _x1 = x + sprite_width/2;
            var _y1 = y + sprite_height/2;
            
            //draw_text_transformed(_x1, _y1, "Aperte", 0.2, 0.2, 0);
            //Eu desenho o input para ser apertado
            draw_sprite_ext(spr_desfaz_barreira, 0, _x1, _y1, 1, 1, 0, c_white, 1);
            draw_circle(_x1, _y1, raio, 1);
            
            
            if (abrir)
            {
                if (keyboard_check_pressed(ord("E")))
                {
                    estado = estado_abrindo;
                }
            }
            
             
            
        }
        
    }
    
}

estado = estado_nada;