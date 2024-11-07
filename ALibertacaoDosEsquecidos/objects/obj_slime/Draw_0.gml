
draw_self();

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
	
	