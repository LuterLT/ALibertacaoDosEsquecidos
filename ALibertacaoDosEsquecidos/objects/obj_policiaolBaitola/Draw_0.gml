if (hit == true){
	gpu_set_fog(true, c_white, 0, 0);
	//draw_sprite(spr_slime_sombra, 0, x, y); sombra
	draw_self();
	gpu_set_fog(false, c_white, 0, 0);
} else
{
	draw_self();
}

if (estado != scr_policial_hit)
{
	if (hveloc != 0) {
	    // Movimento horizontal
	    if (hveloc > 0) {
	        sprite_index = spr_policial_baitola_andando_dir_strip4; // Direita
	    } else {
	        sprite_index = spr_policial_baitola_andando_esq_strip4; // Esquerda
	    }
	} else if (vveloc != 0) {
	    // Movimento vertical
	    if (vveloc > 0) {
	        sprite_index = spr_policial_baitola_andando_frente_strip4; // Baixo
	    } else {
	        sprite_index = spr_policial_baitola_andando_costa_strip4; // Cima
	    }
	}
}