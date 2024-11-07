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

enum Infos
{
	Item, Quantidade, Altura
}

enum Itens
{
	Adaga, Capacete, Torso, Calca, Botas, Maca, Banana, Pocao_cura, Pocao_mana, Altura,
}


grid_itens = ds_grid_create(Infos.Altura, total_slots);
ds_grid_set_region(grid_itens, 0, 0, 1, total_slots - 1, -1);

//Itens Teste

grid_itens[# Infos.Item, 0] = Itens.Adaga;
grid_itens[# Infos.Quantidade, 0] = 1;

grid_itens[# Infos.Item, 1] = Itens.Pocao_cura;
grid_itens[# Infos.Quantidade, 1] = 3;

grid_itens[# Infos.Item, 2] = Itens.Capacete;
grid_itens[# Infos.Quantidade, 2] = 2;

grid_itens[# Infos.Item, 4] = Itens.Banana;
grid_itens[# Infos.Quantidade, 4] = 9;

