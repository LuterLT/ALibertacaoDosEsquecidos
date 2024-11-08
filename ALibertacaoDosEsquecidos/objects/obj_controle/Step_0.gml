
if (keyboard_check_pressed(vk_escape)) // Detecta quando a tecla ESC é pressionada
{
    global.pause = !global.pause; // Alterna entre pausado e não pausado
	if (global.deseja_sair == false)
	{
		//batalhar = obj_isaac.batalhando;
		scr_abriFechar_menu();

	}
	else
	{
		global.pause = true;
		scr_abriFechar_menu();
		global.deseja_sair = false;
	}
}

if (global.tirarZoom == 3) //3 é tirar zoom
{
	if (camera_get_view_width(view_camera[0]) < largura_final || camera_get_view_height(view_camera[0]) < altura_final)
	{
	    // Calcula as novas dimensões, mas sem ultrapassar o tamanho final
	    var nova_largura = min(camera_get_view_width(view_camera[0]) + incremento, largura_final);
	    var nova_altura = min(camera_get_view_height(view_camera[0]) + incremento, altura_final);

	    // Define o novo tamanho da câmera
	    camera_set_view_size(view_camera[0], nova_largura, nova_altura);
	}
}