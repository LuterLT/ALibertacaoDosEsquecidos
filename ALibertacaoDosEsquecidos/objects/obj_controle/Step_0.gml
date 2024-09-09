
if (keyboard_check_pressed(vk_escape)) // Detecta quando a tecla ESC é pressionada
{
    global.pause = !global.pause; // Alterna entre pausado e não pausado
    
    if(global.pause) 
    {	
		var x_isaac = obj_isaac.x;
		var y_isaac = obj_isaac.y;
        // Se estiver pausando, desativa todos os objetos móveis do jogo
        instance_deactivate_all(true); 
        instance_activate_object(obj_controle); // Deixa o controle ativo para detectar a saída da pausa
		instance_create_layer( x_isaac, y_isaac, "Instances", obj_menu_pause);
    }
    else
    {
        // Se estiver despausando, reativa todos os objetos
        instance_activate_all();
		instance_destroy(obj_menu_pause);
    }
}
