global.espectral = false;
global.mundo = "Normal";

audio_stop_sound(msc_menu);
//audio_stop_sound(msc_game);

msc(msc_game, 0.3);

if (!instance_exists(obj_screenshake))
{
    instance_create_layer(0, 0, layer, obj_screenshake);
}