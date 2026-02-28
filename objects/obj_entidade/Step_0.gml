

retorna_efeito_squash(0.1);


if (keyboard_check_pressed(ord("R")))
{
    if (global.transicao) exit;
    cria_transicao_inicia(room);
}