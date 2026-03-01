
event_inherited();

colisores();

buffer_pulo();
coyote_jump();

estado();

retorna_efeito_squash(0.1);

if (timer_recarrega > 0) timer_recarrega--;
    
if (timer_recarrega <= 0)
{
    global.espectral = true;
}

var _lay_normal = layer_get_id("Player");
var _lay_espectro = layer_get_id("Espectral");

if (global.mundo == "Normal")
{
    layer = _lay_normal;
}
else
{
    layer = _lay_espectro;
}

/*
if (keyboard_check_pressed(ord("N")))
{
    salva_jogo();
    show_message("Salvei");
}