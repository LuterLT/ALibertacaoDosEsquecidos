
if (global.verificar_salvo)
{
	x = global.x_isaac;
	y = global.y_isaac;
}

#region Movimentação
veloh = 0;
velov= 0;
estado = scr_isaac_movimentacao; 
estadoSpr = 0;
lado = 0;
#endregion

#region Spites
//sprites parado
sprites[0][0] = spr_isaac_parado_frente;
sprites[0][1] = spr_isaac_parado_costas;
sprites[0][2] = spr_isaac_parado_esq;
sprites[0][3] = spr_isaac_parado_dir;
//sprites andando
sprites[1][0] = spr_isaac_andando_frente_strip8;
sprites[1][1] = spr_isaac_andando_costas_strip8;
sprites[1][2] = spr_isaac_andando_esq_strip8;
sprites[1][3] = spr_isaac_andando_dir_strip8;
//sprites atacando
sprites[2][0] = spr_isaac_atacando_faca_frente_strip8;
sprites[2][1] = spr_isaac_atacando_faca_costas_strip8;
sprites[2][2] = spr_isaac_atacando_faca_esq_strip8;
sprites[2][3] = spr_isaac_atacando_faca_dir_strip8;
#endregion


#region Ataque
dano = 1;
atacar = false; //vai servir como um switch para quando criar a hitbox
#endregion