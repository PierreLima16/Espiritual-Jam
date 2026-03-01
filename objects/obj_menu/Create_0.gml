menu = ["JOGAR", "CRÉDITOS"];
indice = 0;

pos = 40;
scale = 1.3;

controla_menu = function()
{
    var _apertei = keyboard_check_released(vk_enter);
    
    if (keyboard_check_pressed(vk_up))
    {
        indice -= 1;
        
        pos = 0;
        
        scale = 1
    } 
    if (keyboard_check_pressed(vk_down))
    {
        indice += 1;
        
        pos = 0;
        
        scale = 1;
    } 
    
    
    if (_apertei)
    {
        switch(indice)
        {
            //JOGAR
            case 0:
                cria_transicao_inicia(rm_tutorial_1);
                
            break;
        
            case 1:
                show_message("Ver créditos");
                
            break;
        }
    }    
    
    indice = clamp(indice, 0, array_length(menu) - 1);
    pos = lerp(pos, 40, 0.1);
    scale = lerp(scale, 1.3, 0.1);
}

desenha_menu = function()
{
    //Pegando as dimensões da minha GUI
    var _gui_w = display_get_gui_width();
    var _gui_h = display_get_gui_height() /2
    
    //Definindo a fonte
    draw_set_font(fnt_tutorial);
    
    //Alinhando meu texto
    draw_set_valign(1);
    draw_set_halign(1);
    
    //Iniciando a margem
    var _marg_y = 0;
    
    //Passando por todo meu array
    for (var i = 0; i < array_length(menu); i++)
    {
        var _cor = c_white;
        var _sombra = c_black
        var _pos = 1;
        var _scale = 1;
        var _fx = noone;
        
        var _alt = string_height("I");
        
        if (i == indice)
        {
            _cor = c_aqua;
            
            _sombra = c_blue;
            
            _pos = pos;
            
            _scale = scale;
            
            _fx = sin(10  * get_timer()/1000000);
            
        }
        
        
        //Sombra
        draw_set_colour(_sombra);
        draw_text_transformed(_gui_w/2 /*+ _pos*/, _gui_h + 130 + 3 + (i * 1.3)* _alt - 100, menu[i], _scale, _scale, _fx);
        draw_set_colour(-1);
        
        //Texto
        draw_set_colour(_cor);
        draw_text_transformed(_gui_w/2 /* + _pos*/, _gui_h + 130 + (i * 1.3) * _alt - 100, menu[i], _scale, _scale, _fx);
        
        
        
        
    }
    //Resetando a fonte
    draw_set_font(-1);
    
    //Resetando o alinhamento
    draw_set_valign(-1);
    draw_set_halign(-1);
    
          
    var _fx = sin(5 * get_timer()/1000000);
    
    draw_sprite_ext(spr_titulo, 0, _gui_w/2, _gui_h - 200, 3, 3, _fx, c_white, 1);
            
}