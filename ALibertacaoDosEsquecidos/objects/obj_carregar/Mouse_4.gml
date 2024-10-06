if (file_exists("save.sav"))
{
	ini_open("save.sav");
	//verificar se a sala salva existe
	var saved_room = ini_read_real("JogadorBasic", "room", 1 );// Valor padrão -1 caso a chave não exista
	
    if (room_exists(saved_room)) 
	{
		global.verificar_salvo = true;//informa o objeto controle 
        room_goto(saved_room);
    } 
	else 
	{
        show_message("Sala salva não encontrada!");
    }
	//outras coisas
	global.x_isaac = ini_read_real("JogadorBasic", "x_atual", 4);
	global.y_isaac = ini_read_real("JogadorBasic", "y_atual", 4);
	
	ini_close();

	//instance_create_layer( x_isaac, y_isaac, "Instances", obj_isaac);
}
else
{
	show_message("Você não tem nenhum save!");
}