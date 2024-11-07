var _guil = display_get_gui_width();
var _guia = display_get_gui_height();



if skilltree == true
{
	var _invx = _guil/2 - skilltree_l/2;
	var _invy = _guia/2 - skilltree_a/2;
	
	draw_sprite_ext(spr_skilltree_completa, 0, _invx, _invy, escala, escala, 0, c_white, 1);
}



