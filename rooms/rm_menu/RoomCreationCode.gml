audio_stop_sound(msc_game);
audio_stop_sound(msc_parabens);

msc(msc_menu, 0.4);

if (instance_exists(obj_geral))
{
    instance_destroy(obj_geral);
}

if (instance_exists(obj_camera))
{
    instance_destroy(obj_camera);
}