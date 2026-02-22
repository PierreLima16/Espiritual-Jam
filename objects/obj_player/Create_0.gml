event_inherited();

velh     = 0;
velv     = 0;
max_velh = 4;
max_velv = 10;

grav  = 0.5;

right = false;
left  = false;
jump  = false;

tempo_recarrega = room_speed * 1.5;
timer_recarrega = 0;

chao  = false;

estado = noone;
estado_txt = "";


#region Inputs / colisao / aplicador de velocidade


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
    }
    
    //Se apertei para pular e ainda tenho pulos sobrando
    if (jump and qtd_pulos > 0)
    {
        //Pulando
        velv = -max_velv;
        
        qtd_pulos--;
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
    
    //Zerando minha velocidade
    velh = 0;
    velv = 0;
    
    aplica_velocidade();
    
    //Se eu pulei
    if (jump)
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
    
    aplica_velocidade();
    
    
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
    
    instance_destroy();
}

#endregion

estado = estado_parado;