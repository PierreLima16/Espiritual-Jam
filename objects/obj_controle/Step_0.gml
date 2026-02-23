var _lay_normal = layer_get_id("Instances");
var _lay_espectro = layer_get_id("Espectral");

if (global.mundo == "Normal")
{
    layer = _lay_normal;
}
else
{
    layer = _lay_espectro;
}