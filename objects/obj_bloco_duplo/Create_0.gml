image_speed = 0;

tempo = 60;
timer = tempo;

estado = noone;

estado_parado_normal = function()
{
    sprite_index = spr_bloco_indo;
    image_speed = 0;
    image_index = 0;
    mask_index = sprite_index;
    
    if (timer > 0) timer--;
        
    if (timer <= 0)
    {
        estado = estado_indo_espirito;
        timer = tempo;
    }
    
    if (place_meeting(x, y, obj_player_espectral))
    {
        with(obj_player_espectral)
        {
            estado = estado_voltando_normal;
        }
    }
    
}

estado_indo_espirito = function()
{
    image_speed = 1;
    
    if (global.mundo == "Espiritual")
    {
        mask_index = spr_mask_vazia;
    }
    else
    {
        mask_index = sprite_index;
    }
    
    
    if (image_index >= 5)
    {
        estado = estado_parado_espirito;
    }
}

estado_parado_espirito = function()
{
    sprite_index = spr_bloco_volta;
    image_speed = 0;
    image_index = 0;
    
    if (global.mundo == "Espiritual")
    {
        mask_index = spr_mask_vazia;
    }
    else
    {
        mask_index = sprite_index;
    }
    
    if (timer > 0) timer--;
        
    if (timer <= 0)
    {
        estado = estado_indo_normal;
        timer = tempo;
    }
}

estado_indo_normal = function()
{
    image_speed = 1;
    
    if (global.mundo == "Espiritual")
    {
        mask_index = spr_mask_vazia;
    }
    else
    {
        mask_index = sprite_index;
    }
    
    if (image_index >= 5)
    {
        estado = estado_parado_normal;
    }
}

estado = estado_parado_normal;