velh     = 0;
velv     = 0;
max_velh = 3;
max_velv = 4;

grav  = 0.2;

right = false;
left  = false;
jump  = false;

qtd_pulos = 1;

chao  = false;

estado = noone;

//Método para pegar os inputs do player
pega_input = function()
{
    //Inputs de movimentos básicos
    right = keyboard_check(vk_right);
    left  = keyboard_check(vk_left);
    jump  = keyboard_check(vk_up);
}

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

sistema_colisao = function()
{
    //Colisão horizontal
    repeat(abs(velh))
    { 
        var _velh = sign(velh);
    
        if (place_meeting(x + _velh, y, obj_colisao))
        {
           velh = 0;
            
            break;
        }
        else
        {
            x += _velh;
        }
    }
    
    //Colisão vertical
    repeat(abs(velv))
    {
        var _velv = sign(velh);
        
        if (place_meeting(x, y + _velv, obj_colisao))
        {
            velv = 0;
            
            break;
        }
        else
        {
            y += _velv;
        }
    }
    
}