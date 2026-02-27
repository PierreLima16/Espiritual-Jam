//event_inherited();
/*
if (global.mundo == "Normal")
{
    image_index = 0;
}
else
{
    image_index = 1;
}
*/

//Criando o efeito de onda da chave
var _onda = sin(3 * get_timer()/1000000);

//Aplicando o efeito de onda nas chaves
y -= _onda/5;
//image_angle = _onda * 20;