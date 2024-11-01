
function scr_destruir_menu(){
		instance_destroy(obj_menu_pause);
		instance_destroy(obj_botao_voltar);
		instance_destroy(obj_botao_salvar);
		instance_destroy(obj_botao_opcoes);
		instance_destroy(obj_botao_sair);
}

function scr_destruir_desejaSair()
{
	instance_destroy(obj_botao_nao);
	instance_destroy(obj_sair_pergunta);
	instance_destroy(obj_botao_sim);
	instance_destroy(obj_quadro_desejaSair);
}

function scr_deseja_sair()
{
	scr_pegar_centroTela();
	instance_create_layer( global.center_x, global.center_y, "Instances", obj_quadro_desejaSair);
	instance_create_layer( global.center_x, global.center_y - 16, "Instances", obj_sair_pergunta);
	obj_sair_pergunta.image_xscale = 0.5;
	obj_sair_pergunta.image_yscale = 0.5;
	obj_sair_pergunta.depth = -100
	instance_create_layer( global.center_x - 40, global.center_y + 20, "GUI", obj_botao_sim);
	instance_create_layer( global.center_x + 40, global.center_y + 20, "GUI", obj_botao_nao);


}

function scr_abriFechar_menu()
{
    
	if(global.pause) 
    {	
		scr_pegar_centroTela();
		scr_destruir_desejaSair();
		
        // Se estiver pausando, desativa todos os objetos móveis do jogo
        instance_deactivate_all(true); 
        instance_activate_object(obj_controle); // Deixa o controle ativo para detectar a saída da pausa
		//cria o menu
		instance_create_layer( global.center_x, global.y_isaac + 80, "Instances", obj_menu_pause);
		//cria os botões
		instance_create_layer( global.center_x, global.center_y - 50, "GUI", obj_botao_voltar);
		instance_create_layer( global.center_x, global.center_y - 20, "GUI", obj_botao_salvar);
		instance_create_layer( global.center_x, global.center_y + 10, "GUI", obj_botao_opcoes);
		instance_create_layer( global.center_x, global.center_y + 40, "GUI", obj_botao_sair);
		global.deseja_sair = false;
    }
    else
    {
        // Se estiver despausando, reativa todos os objetos
		scr_destruir_desejaSair();
        instance_activate_all();
		scr_destruir_menu();
		global.deseja_sair = false;
    }
}