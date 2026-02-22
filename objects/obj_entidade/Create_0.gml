velh     = 0;
velv     = 0;
max_velh = 4;
max_velv = 10;

sistema_colisao = function()
{
    
    #region sistema 1 
    
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
        var _velv = sign(velv);
        
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
    
    #endregion
    
}
