global.espectral = false;
global.mundo = "Normal";

if (!instance_exists(obj_screenshake))
{
    instance_create_layer(0, 0, layer, obj_screenshake);
}