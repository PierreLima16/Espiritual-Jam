estado = noone;

estado_fechada = function()
{
    if (global.chaves == 0)
    {
        estado = estado_abrindo;
    }
}

estado_abrindo = function()
{
    y -= 0.5;
    
    if ( y <= ystart - sprite_height)
    {
        estado = estado_aberta;
    }
    else
    {
        x = xstart + random_range(-1, 1);
    }
}

estado_aberta = function()
{
    y = y;
}

estado = estado_fechada;