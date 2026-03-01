
desenha_gui = function(_qtd, _spr, _y, _scale, _marg)
{
    /*
    var _marg = 0;
    repeat(_qtd)
    {
        draw_sprite_ext(_spr, 0, 40 + _marg, _y, _scale, _scale, 0, c_white, 1);
        _marg += 50;
    }
    */
    
    draw_set_font(fnt_tutorial);
    
    draw_set_valign(0);
    draw_set_halign(0);
    
    draw_set_colour(c_black);
    draw_text_transformed(40, _y + 3, string(_qtd) + "X", _scale, _scale, 0);
    draw_set_colour(c_white);
    
    draw_text_transformed(40, _y, string(_qtd) + "X", _scale, _scale, 0);
    draw_sprite_ext(_spr, 0, 110, _y + _marg, 3, 3, 0, c_white, 1);
    
    
    draw_set_valign(-1);
    draw_set_halign(-1);
    draw_set_colour(-1);
    
    draw_set_font(-1);
    
}

efeito_mundo = function()
{
    var _lay_id = layer_get_id("Background");
    var _lay_back = layer_background_get_id(_lay_id);
    
    var _lay;
    var _lay_fx;
    var _fx;
    static _incremento = 0;
    static _vel_x = 0;
    static _vel_y = 0;
    
    if (global.mundo == "Normal")
    {
        _vel_x = lerp(_vel_x, -0.2, 0.02);
        _vel_y = lerp(_vel_y, 0.2, 0.02);
        //Voltando a velocidade ao normal
        layer_hspeed("Background", _vel_x);
        layer_vspeed("Background", _vel_y);
        
        if (layer_exists("Espiritos"))
        {
            _fx = fx_create("_filter_colourise");
            
            fx_set_parameter(_fx, "g_TintCol", [35, 218, 255]);
            
            if (_incremento != 0)
            {
                _incremento -= 0.1;
            } 
            else
            {
                layer_destroy("Espiritos");
            }
                
            fx_set_parameter(_fx, "g_Intensity", _incremento);
                
            layer_set_fx("Espiritos", _fx);
            
        }
        /*
        //Desativando minha layer de efeitos
        layer_enable_fx("Mundo_espiritual", false);
        
        //Deixando a layer invisivel
        layer_set_visible("Espectral", false);
        */
    }
    
    if (global.mundo == "Espiritual")
    {
        _vel_x = lerp(_vel_x, -0.05, 0.02);
        _vel_y = lerp(_vel_y, 0.05, 0.02);
        //Voltando a velocidade ao normal
        layer_hspeed("Background", _vel_x);
        layer_vspeed("Background", _vel_y);
        
        if (!layer_exists("Espiritos"))
        {
            var _depth = layer_get_depth("Player");
            _lay = layer_create(300, "Espiritos");
            
        }
        else
        {
            _fx = fx_create("_filter_colourise");
            
            fx_set_parameter(_fx, "g_TintCol", [35, 218, 255]);
            
            if (_incremento != 1) _incremento += 0.1;
                
            fx_set_parameter(_fx, "g_Intensity", _incremento);
                
            layer_set_fx("Espiritos", _fx);
            
        }
        
        
        
        /*
        //Ativando minha layer de efeitos
        layer_enable_fx("Mundo_espiritual", true);
        
        //Deixando a layer visivel
        layer_set_visible("Espectral", true);
        */
    }
}