if (!instance_exists(obj_geral))
{
    instance_create_layer(0, 0, "Geral", obj_geral);
}


if (global.transicao)
{
    cria_transicao(sq_transicao2);
}