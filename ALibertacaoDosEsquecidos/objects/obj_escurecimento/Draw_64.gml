// Chama a função para pegar o centro da câmera
scr_pegar_centroTela();

// Efeito de escurecimento nas bordas usando as dimensões da câmera
var fade_alpha = 0.5; // Nível de escurecimento
var border_color = make_color_rgb(0, 0, 0); // Cor preta

// Obtendo as dimensões da câmera
var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var cam_width = camera_get_view_width(view_camera[0]);
var cam_height = camera_get_view_height(view_camera[0]);

// Desenha o escurecimento nas bordas
draw_set_alpha(fade_alpha);
draw_set_color(border_color);

// Desenhar retângulos nas bordas da câmera
draw_rectangle(0, 0, display_get_width(), cam_y, true); // Topo
draw_rectangle(0, cam_y + cam_height, display_get_width(), display_get_height(), true); // Baixo
draw_rectangle(0, cam_y, cam_x, cam_y + cam_height, true); // Esquerda
draw_rectangle(cam_x + cam_width, cam_y, display_get_width(), cam_y + cam_height, true); // Direita

draw_set_alpha(1); // Resetando a opacidade para o padrão
