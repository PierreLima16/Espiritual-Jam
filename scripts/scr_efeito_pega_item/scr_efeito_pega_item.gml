function inicia_efeito_pega_item()
{
    image_alpha = 1;

    image_xscale = 0.8;
    image_yscale = image_xscale;
}

function efeito_pega_item()
{ 
    image_alpha = lerp(image_alpha, 0, 0.1);

    image_xscale = lerp(image_xscale, 1.3, 0.05);
    image_yscale = image_xscale;
    
    y -= 0.2;
    
    if (image_alpha <= 0.04)
    {
        instance_destroy();
    }
}