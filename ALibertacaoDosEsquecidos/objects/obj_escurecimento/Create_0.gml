obj_escurecimento.image_xscale = 0.6;
obj_escurecimento.image_yscale = 0.6;

//camera_set_view_size(view_camera[0], camera_get_view_width(view_camera[0]) / 1.2, camera_get_view_height(view_camera[0]) / 1.2);


tempo_total = 30;           // Duração do efeito em frames (ajuste conforme necessário)
tempo = tempo_total;         // Inicializa o contador de tempo

largura_inicial = 480;       // Largura inicial da câmera
altura_inicial = 270;        // Altura inicial da câmera

largura_final = 400;         // Largura final desejada da câmera
altura_final = 225;          // Altura final desejada da câmera

// Calcula a quantidade de pixels para diminuir por frame
largura_por_frame = (largura_inicial - largura_final) / tempo_total;
altura_por_frame = (altura_inicial - altura_final) / tempo_total;

// Identifique a câmera ativa (se estiver usando a câmera view 0)
camera = view_camera[0];


