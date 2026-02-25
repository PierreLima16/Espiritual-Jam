

function inicia_efeito_squash()
{
    xscale = 1;
    yscale = 1;
    dir    = 1;
}

function efeito_squash(_xscale, _yscale)
{
    xscale = _xscale;
    yscale = _yscale;
}

function retorna_efeito_squash(_qtd_voltar)
{
    xscale = lerp(xscale, 1, _qtd_voltar);
    yscale = lerp(yscale, 1, _qtd_voltar);
}

function desenha_efeito_squash()
{
    draw_sprite_ext(sprite_index, image_index, x, y, xscale * dir, yscale, image_angle, image_blend, image_alpha);
}