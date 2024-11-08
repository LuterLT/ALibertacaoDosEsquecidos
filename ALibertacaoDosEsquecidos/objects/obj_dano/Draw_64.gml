
var _cx = camera_get_view_x(view_camera[0]);
var _cy = camera_get_view_y(view_camera[0]);

var _x = (xx - _cx) * escala;
var _y = (yy - _cy) * escala;

draw_set_font(fonte);
draw_set_alpha(alpha);
draw_text_outline(_x, _y, dano, c_white, c_black, 4);
draw_set_alpha(1);