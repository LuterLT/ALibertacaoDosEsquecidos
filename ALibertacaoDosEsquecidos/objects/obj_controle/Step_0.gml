
if (keyboard_check_pressed(vk_escape)) // Detecta quando a tecla ESC é pressionada
{
    global.pause = !global.pause; // Alterna entre pausado e não pausado
	if (global.deseja_sair == false)
	{
		batalhar = obj_isaac.batalhando;
		scr_abriFechar_menu();

	}
	else
	{
		global.pause = true;
		scr_abriFechar_menu();
		global.deseja_sair = false;
	}
}
