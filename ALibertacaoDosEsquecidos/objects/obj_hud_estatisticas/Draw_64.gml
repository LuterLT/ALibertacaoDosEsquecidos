
var _escala = 8; 
var _guia = display_get_gui_height();
var _spra = sprite_get_height(spr_hud_barra_estatisticas) * _escala;
var _huda = _guia - _spra * 4.75;

var _vida = obj_isaac.vida;
var _maxvida = obj_isaac.max_vida;

var _estamina = obj_isaac.estamina;
var _maxestamnia = obj_isaac.max_estamina;

var _mana = obj_isaac.mana;
var _maxmana = obj_isaac.max_mana;

draw_sprite_ext(spr_hud_barra_estatisticas, 0, 75, _huda, _escala, _escala, 0, c_white, 1);

draw_sprite_ext(spr_hud_barra_vida, 0, 75, _huda, (_vida / _maxvida) * _escala, _escala, 0, c_white, 1);

draw_sprite_ext(spr_hud_barra_estamina, 0, 75, _huda + 56, (_estamina / _maxestamnia) * _escala, _escala, 0, c_white, 1);

draw_sprite_ext(spr_hud_barra_mana, 0, 75, _huda + 112, (_mana / _maxmana) * _escala, _escala, 0, c_white, 1);