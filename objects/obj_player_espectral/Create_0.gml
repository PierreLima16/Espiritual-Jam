// Inherit the parent event
event_inherited();

max_velh = 4;
max_velv = 4;

estado = noone;

estado_txt = "";

alarm[0] = room_speed * 2;

alvo = id;



pega_input = function()
{
    right = keyboard_check(vk_right);
    left  = keyboard_check(vk_left);
    down = keyboard_check(vk_down);
    up  = keyboard_check(vk_up);
    
    normal = keyboard_check_pressed(ord("R"));
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
    
    if (velh > 0) dir = 1;
    if (velh < 0) dir = -1    
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
    
    if (normal)
    {
        estado = estado_voltando_normal;
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
    
    if (normal)
    {
        estado = estado_voltando_normal;
    }
}

estado_normal = function()
{
    estado_txt = "Mundo normal";
    
    var _player_normal = instance_create_layer(x, y, layer, obj_player);
    _player_normal.timer_recarrega = _player_normal.tempo_recarrega;
    _player_normal.dir = dir;
    
    global.espectral = false;
    
    instance_destroy();
    
}

estado_voltando_normal = function()
{
    estado_txt = "Destransformando";
    
    //Zerando minha velocidade
    velh = 0;
    velv = 0;
    
    troca_sprite(spr_player_saindo_espectro);
    
    //Quando minha animação chegar ao fim
    if (acabou_animacao())
    {
        //Vou para o estado de espectro
        estado = estado_normal;
    }
}

estado = estado_parado;