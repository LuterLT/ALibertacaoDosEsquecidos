
var _guil = display_get_gui_width();
var _guia = display_get_gui_height();

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

if inventario == true
{
	var _invx = _guil/2 - inventario_l/2;
	var _invy = _guia/2 - inventario_a/2;
	
	draw_sprite_ext(spr_inventario_itens, 0, _invx, _invy, escala, escala, 0, c_white, 1);
	
	var ix = 0;
	var iy = 0;
	
	for (var i = 0; i < total_slots; i++)
	{
		var _slotsx = _invx + comeco_x + ((tamanho_slots + buffer) * ix);
		var _slotsy = _invy + comeco_y + ((tamanho_slots + buffer) * iy);
		
		if point_in_rectangle(_mx, _my, _slotsx, _slotsy, _slotsx + tamanho_slots, _slotsy + tamanho_slots)
		{
			draw_sprite_ext(spr_inventario_selecionado, 0, _slotsx, _slotsy,escala, escala, 0, c_white, 1);
		}
		
		if grid_itens[# Infos.Item, i] != -1
		{
			draw_sprite_ext(spr_itens, grid_itens[# 0, i], _slotsx, _slotsy, escala, escala, 0, c_white, 1);
			
			draw_set_font(fonte);			
			draw_set_halign(fa_center);
			
		}
		
		
		
		ix++;
		if ix >= slots_h
		{
			ix = 0;
			iy++;
		}
	}
}