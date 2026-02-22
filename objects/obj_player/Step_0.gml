event_inherited();

colisores();

estado();

if (timer_recarrega > 0) timer_recarrega--;
    
if (timer_recarrega <= 0)
{
    global.espectral = true;
}