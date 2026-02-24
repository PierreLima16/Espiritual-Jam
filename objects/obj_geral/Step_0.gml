var _lay_id = layer_get_id("Background");
var _lay_back = layer_background_get_id(_lay_id);
if (global.mundo == "Normal")
{
    //Desativando minha layer de efeitos
    layer_enable_fx("Mundo_espiritual", false);
    
    //Deixando a layer invisivel
    layer_set_visible("Espectral", false);
}

if (global.mundo == "Espiritual")
{
    
    //Ativando minha layer de efeitos
    layer_enable_fx("Mundo_espiritual", true);
    
    //Deixando a layer visivel
    layer_set_visible("Espectral", true);
}

global.chaves = instance_number(obj_chave);