
inventario = false;
escala = 6;

comeco_x = 12 * escala;
comeco_y = 14 * escala;

slots_h = 7;
slots_v = 3;
total_slots = slots_h * slots_v;
tamanho_slots = 10 * escala;
buffer = 4 * escala;

inventario_l = sprite_get_width(spr_inventario_itens) * escala;
inventario_a = sprite_get_height(spr_inventario_itens) * escala;
