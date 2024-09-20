if(file_exists("save.sav"))
{
	file_delete("save.sav");
	ini_open("save.sav");
		ini_write_real("JogadorBasic", "x_atual", global.x_isaac);
		ini_write_real("JogadorBasic", "y_atual", global.y_isaac);
	
	ini_close();
	show_message("Save re-salvo!");
}
else
{
	ini_open("save.sav");
		ini_write_real("JogadorBasic", "x_atual", global.x_isaac);
		ini_write_real("JogadorBasic", "y_atual", global.y_isaac);
	
	ini_close();
	show_message("jogo salvo!");
}