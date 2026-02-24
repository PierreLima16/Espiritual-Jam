//event_inherited();
if (global.mundo == "Normal")
{
    image_index = 0;
}
else
{
    image_index = 1;
}

var _onda = sin(2 * get_timer()/1000000);

image_angle = _onda * 10;
y += _onda / 5;