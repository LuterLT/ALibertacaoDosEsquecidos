

if (hit == true){
	gpu_set_fog(true, c_white, 0, 0);
	//draw_sprite(spr_slime_sombra, 0, x, y); sombra
	draw_self();
	gpu_set_fog(false, c_white, 0, 0);
} else
{
	draw_self();
}

if (estado != scr_slime_hit)
{
	if (hveloc != 0) {
	    // Movimento horizontal
	    if (hveloc > 0) {
	        sprite_index = spr_slime_dir_strip2; // Direita
	    } else {
	        sprite_index = spr_slime_esq_strip2; // Esquerda
	    }
	} else if (vveloc != 0) {
	    // Movimento vertical
	    if (vveloc > 0) {
	        sprite_index = spr_slime_frente_strip2; // Baixo
	    } else {
	        sprite_index = spr_slime_costas_strip2; // Cima
	    }
	}
}


/*
if (hveloc > 0) and (vveloc > 0)
{
	
	if (dest_x < x)//esquerda
		{
			sprite_index = spr_slime_esq_strip2;
		}
		else if (dest_x > x)//direita
		{
			sprite_index = spr_slime_dir_strip2;
		}
	
}	else if (hveloc > 0)
	{
		if (dest_x < x)//esquerda
		{
			sprite_index = spr_slime_esq_strip2;
		}
		else if (dest_x > x)//direita
		{
			sprite_index = spr_slime_dir_strip2;
		}
		
	}else if (vveloc > 0)
	{
		if (dest_y < y)//cima
		{
			sprite_index = spr_slime_costas_strip2;
		}
		else if (dest_y > y)//baixo
		{
			sprite_index = spr_slime_frente_strip2;
		}
	} */
	
	