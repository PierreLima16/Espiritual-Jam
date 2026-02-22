// Inherit the parent event
event_inherited();

max_velh = 4;
max_velv = 4;

estado = noone;

estado_txt = "";

pega_input = function()
{
    right = keyboard_check(vk_right);
    left  = keyboard_check(vk_left);
    down = keyboard_check(vk_down);
    up  = keyboard_check(vk_up);
}

colisores = function()
{
    chao = place_meeting(x, y + 1, obj_colisao);
}

aplica_velocidade = function()
{
    colisores();
    pega_input();
    
    velh = (right - left) * max_velh;
    velv = (down - up) * max_velv;
}

estado_parado = function()
{
    estado_txt = "PARADO";
    velv = 0;
    velh = 0;
    
    aplica_velocidade();
        
    if (right xor left)
    {
        estado = estado_movendo;
    }
    
    if (down xor up)
    {
        estado = estado_movendo;
    }
    
}

estado_movendo = function()
{
    estado_txt = "MOVENDO";
    
    aplica_velocidade();
    
    if (!(right or left or down or up))
    {
        estado = estado_parado;
    }
}

estado = estado_parado;