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


function scr_centralizar_camera()
{
	// Suponha que o personagem seja "obj_personagem"

	// Define o alvo (centro da câmera) como a posição do personagem
	var centro_x = obj_isaac.x;
	var centro_y = obj_isaac.y;

	//Calcula a posição da câmera com base no centro da tela
	camera_set_view_pos(view_camera[0], centro_x - camera_get_view_width(view_camera[0]) / 2, centro_y - camera_get_view_height(view_camera[0]) / 2);

}

function draw_text_outline(x, y, text, text_color, outline_color, outline_thickness) 
{

    draw_set_color(outline_color);
    
    for (var i = -outline_thickness; i <= outline_thickness; i++) 
	{
        for (var j = -outline_thickness; j <= outline_thickness; j++) 
		{
            if (i != 0 || j != 0) 
			{
                draw_text(x + i, y + j, text);
            }
        }
    }
    
    draw_set_color(text_color);
    draw_text(x, y, text);
}
