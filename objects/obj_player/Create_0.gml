event_inherited();

velh     = 0;
velv     = 0;
max_velh = 4;
max_velv = 10;

grav  = 0.5;

right = false;
left  = false;
jump  = false;

qtd_pulos = 1;

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
}

#endregion

estado = estado_parado;