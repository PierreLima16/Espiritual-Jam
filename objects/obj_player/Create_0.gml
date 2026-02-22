event_inherited();

velh     = 0;
velv     = 0;
max_velh = 2;
max_velv = 6;

pulo_tempo = game_get_speed(gamespeed_fps) * 0.1;
pulo_timer = 0;

coyote_tempo = game_get_speed(gamespeed_fps) * 0.1;
coyote_timer = coyote_tempo;

grav  = 0.4;

right = false;
left  = false;
jump  = false;

tempo_recarrega = room_speed * 1.5;
timer_recarrega = 0;

chao  = false;

estado = noone;
estado_txt = "";

alvo = id;

//Criando a câmera ao nascer
var _cam = instance_create_layer(x, y, layer, obj_camera);


#region Inputs / colisao / aplicador de velocidade

coyote_jump = function()
{
    colisores();
    
    if (!chao)
    {
        coyote_timer--;
    }
    else
    {
        coyote_timer = coyote_tempo;
    }
}

buffer_pulo = function()
{
    colisores()
    pega_input();
    
    if (!chao)
    {
        if (jump) pulo_timer = pulo_tempo;
            
        pulo_timer--;
    }
}

//Método para aplicar velocidade
aplica_velocidade = function()
{
    pega_input();
    
    //Movimentando
    velh = (right - left) * max_velh;
    
    //Se movendo para a direita, olho para a direita
    if (velh > 0) dir = 1;
        
    //Se movendo para a esquerda, olho para a esquerda
    if (velh < 0) dir = -1;    
    
    //Se estou no chao
    if (!chao)
    {
        //Aplico minha gravidade
        velv += grav;
    }
    else //Não estou no chao
    {
        //Reseto a quantidade de pulos
        qtd_pulos = 1;
        
        //Se apertei para pular e ainda tenho pulos sobrando
        if (jump or pulo_timer and qtd_pulos > 0)
        {
            //Pulando
            velv = -max_velv;
            
            qtd_pulos--;
            
            pulo_timer = 0;
        }
    }
    
    
    //Limitando minha velocidade vertical
    velv = clamp(velv, -max_velv, max_velv);
}


colisores = function()
{
    chao = place_meeting(x, y + 1, obj_colisao);
}

//Método para pegar os inputs do player
pega_input = function()
{
    //Inputs de movimentos básicos
    right = keyboard_check(vk_right);
    left  = keyboard_check(vk_left);
    jump  = keyboard_check_pressed(vk_up);
    
    //Input para mudar de mundo
    espectal = keyboard_check_pressed(ord("R"));
}

#endregion

#region Estados do player

//Estado parado
estado_parado = function()
{
    //estado debug
    estado_txt = "Parado";
    
    pega_input();
    
    //Trocando a sprite
    troca_sprite(spr_player_idle);
    
    //Zerando minha velocidade
    velh = 0;
    if (pulo_timer == 0) velv = 0;
    
    aplica_velocidade();
    
    //Se eu pulei
    if (jump or pulo_timer)
    {
        //Indo para o estado de pulo
        estado = estado_pulo;
    }
    
    //Se eu apertei para algum lado
    if (right xor left)
    {
        //Indo para o estado de movendo
        estado = estado_movendo;
    }
    
    //Se eu não estou no chao
    if (!chao)
    {
        //Vou para o estado de pulo
        estado = estado_pulo;
    }
    
    //Se eu apertei R
    if (espectal and global.espectral)
    {
        //Eu entro no mundo espectral
        estado = estado_espectro;
    }
}

//Estado de pulo
estado_pulo = function()
{
    estado_txt = "Pulando";
    
    pega_input();
    
    //Trocando a sprite
    troca_sprite(spr_player_jump);
    
    aplica_velocidade();
    
    if (coyote_timer > 0 and jump)
    {
        velv = -max_velv;
        coyote_timer = 0;
    }
    
    //Se eu não estiver me movendo
    if (chao)
    {
        //Indo para o estado de parado
        estado = estado_parado;
    }
    
    //Se eu apertei R
    if (espectal and global.espectral)
    {
        //Eu entro no mundo espectral
        estado = estado_espectro;
    }
}

//Estado de movendo
estado_movendo = function()
{
    estado_txt = "Movendo";
    
    pega_input();
    
    //Trocando a sprite
    troca_sprite(spr_player_move);
    
    aplica_velocidade();
    
    //Se minha velocidade horizontal for zero
    if (velh == 0 and chao)
    {
        //Eu vou para o estado de parado
        estado = estado_parado;
    }
    
    //Apertei para pular
    if (jump)
    {
        //Vou para o estado de pulo
        estado = estado_pulo;
    }
    
    //Se eu apertei R
    if (espectal and global.espectral)
    {
        //Eu entro no mundo espectral
        estado = estado_espectro;
    }
}

estado_espectro = function()
{
    estado_txt = "Espectral";
    
    var _player_espectro = instance_create_layer(x, y, layer, obj_player_espectral);
    _player_espectro.dir = dir;
    
    global.mundo = "Espiritual";
    
    estado = estado_repouso;
    //instance_destroy();
    
    with(obj_camera)
    {
        alvo = _player_espectro;
    }
}

estado_repouso = function()
{
    estado_txt = "Repouso";
    
    velh = 0;
    
    if (!chao)
    {
        velv += grav;
    }
    
    
    if (global.mundo == "Normal")
    {
        estado = estado_parado;
    }
}

#endregion

#region Estados do player de intermédio

estado_indo_espectro = function()
{
    estado_txt = "Transformando";
    
    //Zerando minha velocidade
    velh = 0;
    velv = 0;
    
    troca_sprite(spr_player_indo_espectro);
    
    //Quando minha animação chegar ao fim
    if (acabou_animacao())
    {
        //Vou para o estado de espectro
        estado = estado_espectro;
    }
}

#endregion

estado = estado_parado;