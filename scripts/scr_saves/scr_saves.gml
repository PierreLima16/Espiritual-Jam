
function salva_jogo()
{
    var _save = ds_map_create();
    
    ds_map_add(_save, "Fase_atual", global.fase_atual);
    
    ds_map_secure_save(_save, "Save.dat");
    
    ds_map_destroy(_save);
}

function carrega_jogo()
{
    if (file_exists("Save.dat"))
    {
        var _save = ds_map_secure_load("Save.dat");
        
        global.fase_atual = _save[? "Fase_atual"];
        
        fx(snd_selecionado, 0.8, 1.2);
        cria_transicao_inicia(global.fase_atual);
        
        ds_map_destroy(_save);
    }
    else
    {
        fx(snd_error, 1, 1);
        screenshake(10);
    }
    
}