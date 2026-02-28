global.transicao = false;
global.destino   = rm_tutorial_1;

function cria_transicao_inicia(_destino = noone)
{
    if (!room_exists(_destino)) 
    {
        show_message("defina um destino")
        return;
    }
    
    //Criando o objeto transição
    var _transicao = instance_create_depth(0, 0, 0, obj_transicao, { destino: _destino});
    
}

//Função de transição
//O objeto transição vai usar ela para criar a sequence de transição inicial
function fazendo_transicao(_sq = sq_transicao1)
{
    //Criando a camada de transição se ela não existe
    if (!layer_exists("Transicao"))
    {
        layer_create(-100, "Transicao");    
    }
    
    global.transicao = true;
    
    //Pegando a posição da câmera para criar a transição no local correto
    var _cam_x = camera_get_view_x(view_camera[0]);
    var _cam_y = camera_get_view_y(view_camera[0]);

    layer_sequence_create("Transicao", _cam_x, _cam_y, _sq);
}


//Destruindo a sequencia da transição no final dela
function destruindo_layer_transicao()
{
    if (layer_exists("Transicao"))
    {
        layer_destroy("Transicao");
    }
    global.transicao = false;
}