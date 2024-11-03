// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function fim_da_animacao(){
	
	var _sprite = sprite_index;
	var _image = image_index;
	if(argument_count > 0) _sprite = argument[0];
	if(argument_count > 1) _image = argument[1];
	var _type = sprite_get_speed_type(sprite_index);
	var _spd = sprite_get_speed(sprite_index)*image_speed;
	if(_type == spritespeed_framespersecond)
	    _spd = _spd/room_speed;
	if(argument_count > 2) _spd = argument[2];
	return _image + _spd >= sprite_get_number(_sprite);
	

	//Dono do codigo: PixellatedPope e Minty Python
}

function scr_pegar_centroTela()
{
	global.center_x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2;
	global.center_y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2;
}

function scr_aplicar_zoom_batalha() 
{
	// Definindo os valores do zoom
	var zoom_final = 1.2;  // Fator de zoom desejado (1.2x)
	var duracao = 30;      // Duração do zoom em steps

	// Inicializando os tamanhos originais da câmera uma vez (se não estiver definido)
	if (!variable_global_exists("original_camera_width")) {
	    global.original_camera_width = camera_get_view_width(view_camera[0]);
	    global.original_camera_height = camera_get_view_height(view_camera[0]);
	}

	// Aplicando zoom suave
	var target_width = global.original_camera_width / zoom_final;
	var target_height = global.original_camera_height / zoom_final;

	camera_set_view_size(view_camera[0], lerp(camera_get_view_width(view_camera[0]), target_width, 1 / duracao), lerp(camera_get_view_height(view_camera[0]), target_height, 1 / duracao));
	
	instance_create_layer(obj_isaac.x, obj_isaac.y, "Instances", obj_escurecimento);

}
