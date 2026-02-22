event_inherited();
colisores();

buffer_pulo();
coyote_jump();

estado();


if (timer_recarrega > 0) timer_recarrega--;
    
if (timer_recarrega <= 0)
{
    global.espectral = true;
}