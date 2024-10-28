
function scr_destruir_menu(){
		instance_destroy(obj_menu_pause);
		instance_destroy(obj_botao_voltar);
		instance_destroy(obj_botao_salvar);
		instance_destroy(obj_botao_opcoes);
		instance_destroy(obj_botao_sair);
}

function scr_deseja_sair()
{
	instance_create_layer( global.x_isaac, global.y_isaac, "Instances", obj_menu_pause);
	instance_create_layer( global.x_isaac, global.y_isaac - 16, "Instances", obj_sair_pergunta);
	obj_sair_pergunta.image_xscale = 0.5;
	obj_sair_pergunta.image_yscale = 0.5;
	obj_sair_pergunta.depth = -100
	instance_create_layer( global.x_isaac - 40, global.y_isaac + 20, "GUI", obj_botao_sim);
	instance_create_layer( global.x_isaac + 40, global.y_isaac + 20, "GUI", obj_botao_nao);


}