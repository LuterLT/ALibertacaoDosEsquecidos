
var _escala = 8; 
var _guia = display_get_gui_height();
var _spra = sprite_get_height(spr_hud_barra_estatisticas) * _escala;
var _huda = _guia - _spra * 4.75;

draw_sprite_ext(spr_hud_barra_estatisticas, 0, 75, _huda, _escala, _escala, 0, c_white, 1);

draw_sprite_ext(spr_hud_barra_vida, 0, 75, _huda, _escala, _escala, 0, c_white, 1);