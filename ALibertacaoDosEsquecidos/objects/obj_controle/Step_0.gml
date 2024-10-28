
if (keyboard_check_pressed(vk_escape)) // Detecta quando a tecla ESC é pressionada
{
    global.pause = !global.pause; // Alterna entre pausado e não pausado
    
    if(global.pause) 
    {	
		global.x_isaac = obj_isaac.x;
		global.y_isaac = obj_isaac.y;
        // Se estiver pausando, desativa todos os objetos móveis do jogo
        instance_deactivate_all(true); 
        instance_activate_object(obj_controle); // Deixa o controle ativo para detectar a saída da pausa
		//cria o menu
		instance_create_layer( global.x_isaac, global.y_isaac, "Instances", obj_menu_pause);
		//cria os botões
		instance_create_layer( global.x_isaac, global.y_isaac - 30, "GUI", obj_botao_voltar);
		instance_create_layer( global.x_isaac, global.y_isaac, "GUI", obj_botao_salvar);
		instance_create_layer( global.x_isaac, global.y_isaac + 30, "GUI", obj_botao_opcoes);
		instance_create_layer( global.x_isaac, global.y_isaac + 60, "GUI", obj_botao_sair);
		
    }
    else
    {
        // Se estiver despausando, reativa todos os objetos
        instance_activate_all();
		scr_destruir_menu();
    }
}
