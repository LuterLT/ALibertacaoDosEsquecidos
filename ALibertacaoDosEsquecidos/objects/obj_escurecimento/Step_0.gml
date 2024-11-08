scr_pegar_centroTela();

x = global.center_x;
y = global.center_y;


if (tempo >= 0)
{
   // Obtenha o tamanho atual da câmera
   var largura_atual = camera_get_view_width(camera);
   var altura_atual = camera_get_view_height(camera);

   // Diminui o tamanho da câmera de forma incremental
   largura_atual -= largura_por_frame;
   altura_atual -= altura_por_frame;

   // Define o novo tamanho da câmera
   camera_set_view_size(camera, largura_atual, altura_atual);

   // Decrementa o tempo
   tempo--;
}
