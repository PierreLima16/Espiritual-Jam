
desenha_gui = function(_qtd)
{
    var _marg = 0;
    repeat(_qtd)
    {
        draw_sprite_ext(spr_chave, 0, 40 + _marg, 30, 3, 3, 0, c_white, 1);
        _marg += 50;
    }
}