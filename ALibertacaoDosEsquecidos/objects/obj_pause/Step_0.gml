if (keyboard_check_pressed(vk_escape)) // Detecta quando a tecla ESC é pressionada
{
    global.pause = !global.pause; // Alterna entre pausado e não pausado
    
    if(global.pause) 
    {
        // Se estiver pausando, desativa todos os objetos móveis do jogo
        instance_deactivate_all(true); 
        instance_activate_object(obj_pause); // Deixa o controle ativo para detectar a saída da pausa
    }
    else
    {
        // Se estiver despausando, reativa todos os objetos
        instance_activate_all();
    }
}
