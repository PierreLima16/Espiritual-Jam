if (global.transicao) exit;

//Definindo a fonte
draw_set_font(fnt_tutorial);

//Alinhando meu texto
draw_set_valign(1);
draw_set_halign(1);

draw_set_colour(c_black);
var _effect = sin(10 * get_timer()/1000000);
draw_text_transformed(80, 60 + 3, "ESC", 1, 1, _effect);

draw_set_colour(c_white);
draw_text_transformed(80, 60, "ESC", 1, 1, _effect);

//Resetando a fonte
draw_set_font(-1);

//Resetando o alinhamento
draw_set_valign(-1);
draw_set_halign(-1);

