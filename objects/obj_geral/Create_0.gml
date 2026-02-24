
desenha_gui = function(_qtd)
{
    var _marg = 0;
    repeat(_qtd)
    {
        draw_sprite_ext(spr_chave, 0, 40 + _marg, 30, 3, 3, 0, c_white, 1);
        _marg += 50;
    }
}

efeito_mundo = function()
{
    var _lay_id = layer_get_id("Background");
    var _lay_back = layer_background_get_id(_lay_id);
    
    var _lay;
    var _lay_fx;
    var _fx;
    static _incremento = 0
    
    if (global.mundo == "Normal")
    {
        
        //Desativando minha layer de efeitos
        layer_enable_fx("Mundo_espiritual", false);
        
        //Deixando a layer invisivel
        layer_set_visible("Espectral", false);
    }
    
    if (global.mundo == "Espiritual")
    {
        /*
        if (!layer_exists("Espiritos"))
        {
            _lay = layer_create(400, "Espiritos");
            
            _fx = fx_create("_filter_colourise");
            fx_set_parameter(_fx, "g_TintCol", [35, 218, 255]);
            
            fx_set_parameter(_fx, "g_Intensity", _incremento);
            
            layer_set_fx(_lay, _fx);
            
        }
        */
        
        //Ativando minha layer de efeitos
        layer_enable_fx("Mundo_espiritual", true);
        
        //Deixando a layer visivel
        layer_set_visible("Espectral", true);
    }
}