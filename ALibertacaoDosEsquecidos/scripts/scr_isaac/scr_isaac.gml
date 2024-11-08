


function scr_isaac_movimentacao()
{
	if (instance_exists(obj_escurecimento))
	{
		instance_destroy(obj_escurecimento);
		global.tirarZoom = 3;
	}
	
		// Movimentação
	var _dir = keyboard_check(ord("D"));
	var _esq = keyboard_check(ord("A"));
	var _up = keyboard_check(ord("W"));
	var _down = keyboard_check(ord("S"));

	var velocidade = 1;

	veloh = (_dir - _esq) * velocidade;
	velov = (_down - _up) * velocidade;
	
	// Movimento com colisão no eixo horizontal
	if (veloh != 0) {
	    if (!place_meeting(x + veloh, y, obj_parede)) {
	        x += veloh;
	    } else {
	        veloh = 0; // Para movimento horizontal em colisão
	    }
	}

	// Movimento com colisão no eixo vertical
	if (velov != 0) {
	    if (!place_meeting(x, y + velov, obj_parede)) {
	        y += velov;
	    } else {
	        velov = 0; // Para movimento vertical em colisão
	    }
	}

	// Define o estado de movimento
	if (veloh != 0 or velov != 0) {
	    estadoSpr = 1; // movendo
	} else if (veloh == 0 and velov == 0)
	{
		estadoSpr = 0;//parado
	}

	// Define o lado
	if (_up) { lado = 1; } // costa
	if (_down) { lado = 0; } // frente
	if (_esq) { lado = 2; }
	if (_dir) { lado = 3; }

	// Muda a sprite
	sprite_index = sprites[estadoSpr][lado];
	
	if mouse_check_button_pressed(mb_left)
	{
		image_index = 0;
		switch lado
		{
			case 0:
				sprite_index =  spr_isaac_atacando_faca_frente_strip8;
			break;
			case 1:
				sprite_index = spr_isaac_atacando_faca_costas_strip8;
			break;
			case 2:
				sprite_index = spr_isaac_atacando_faca_esq_strip8;
			break;
			case 3:
				sprite_index = spr_isaac_atacando_faca_dir_strip8;
			break;
		}
		estado = scr_isaac_atacando;
	}
	
	if(batalhando == true)
	{
		estado = scr_isaac_batalhando;
	}

}


function scr_isaac_atacando()
{
	if (image_index >= 1)
	{
		if (atacar == false)
		{
			switch lado
			{
				default:
					instance_create_layer(x, y + 6, "Instances", obj_isaac_hitbox);
					obj_isaac_hitbox.image_angle = 90;
				break;
				case 1:
					instance_create_layer(x, y - 6, "Instances", obj_isaac_hitbox);
					obj_isaac_hitbox.image_angle = 270;
				break;
				case 2:
					instance_create_layer(x - 6, y, "Instances", obj_isaac_hitbox);
					obj_isaac_hitbox.image_angle = 360; 
				break;
				case 3:
					instance_create_layer(x + 6, y, "Instances", obj_isaac_hitbox);
					obj_isaac_hitbox.image_angle = 180;
				break;
			}
		
			atacar = true;
		}
		
		if (fim_da_animacao())
		{
			estado = scr_isaac_movimentacao;
			atacar = false;
		}
	}
}


function scr_isaac_batalhando()
{
	if (batalhando == false)
	{
		estado = scr_isaac_movimentacao;
	}
	else
	{
			if(instance_exists(obj_escurecimento) == false)
			{
				global.tirarZoom = false;
				instance_create_layer(x,y,"Instances",obj_escurecimento);
			}

		#region Andar
			var _dir = keyboard_check(ord("D"));
			var _esq = keyboard_check(ord("A"));
			var _up = keyboard_check(ord("W"));
			var _down = keyboard_check(ord("S"));

			var velocidade = 2;

			veloh = (_dir - _esq) * velocidade;
			velov = (_down - _up) * velocidade;

	
			// Movimento com colisão no eixo horizontal
			if (veloh != 0) {
			    if (!place_meeting(x + veloh, y, obj_parede)) {
			        x += veloh;
			    } else {
			        veloh = 0; // Para movimento horizontal em colisão
			    }
			}

			// Movimento com colisão no eixo vertical
			if (velov != 0) {
			    if (!place_meeting(x, y + velov, obj_parede)) {
			        y += velov;
			    } else {
			        velov = 0; // Para movimento vertical em colisão
			    }
			}
	
		
			direcao = floor((point_direction(x, y, mouse_x, mouse_y)+45)/90);
	
			if (veloh != 0 or velov != 0)
			{
				movendo = true;
			}
			else
			{
				movendo = false;
			}
	
	
	
			if (movendo == true)
			{
				switch direcao
				{
					default:
						sprite_index = spr_isaac_correndo_dir_strip6;
					break;
					case 1:
						sprite_index = spr_isaac_correndo_costas_strip6;
					break;
					case 2:
						sprite_index = spr_isaac_correndo_esq_strip6;
					break;
					case 3:
						sprite_index = spr_isaac_correndo_frente_strip6;
					break;
				}
			}
			else
			{
				switch direcao
				{
					default:
						sprite_index = spr_isaac_respirando_dir;
					break;
					case 1:
						sprite_index = spr_isaac_respirando_costas;
					break;
					case 2:
						sprite_index = spr_isaac_respirando_esq;
					break;
					case 3:
						sprite_index = spr_isaac_respirando_frente;
					break;
				}
			}
		#endregion

		#region Verificar Ataque
			if mouse_check_button_pressed(mb_left)
			{
				image_index = 0;
				switch direcao
				{
					default:
						sprite_index =  spr_isaac_atacando_faca_dir_strip8;
					break;
					case 1:
						sprite_index = spr_isaac_atacando_faca_costas_strip8;
					break;
					case 2:
						sprite_index = spr_isaac_atacando_faca_esq_strip8;
					break;
					case 3:
						sprite_index = spr_isaac_atacando_faca_frente_strip8;
					break;
				}
				estado = scr_isaac_batalhando_ataque;
			}
		#endregion

	}
		
}


function scr_isaac_batalhando_ataque()
{
	if (direcao == 0 && estado == scr_isaac_batalhando_ataque) { // Se está olhando para a direita
    sprite_index = spr_isaac_atacando_faca_dir_strip8;
	}

	if (image_index >= 1)
	{
		if (atacar == false)
		{
			switch direcao
			{
				default:
					instance_create_layer(x + 6, y, "Instances", obj_isaac_hitbox);
					obj_isaac_hitbox.image_angle = 180;
				break;
				case 1:
					instance_create_layer(x, y - 6, "Instances", obj_isaac_hitbox);
					obj_isaac_hitbox.image_angle = 270;
				break;
				case 2:
					instance_create_layer(x - 6, y, "Instances", obj_isaac_hitbox);
					obj_isaac_hitbox.image_angle = 360; 
				break;
				case 3:
					instance_create_layer(x, y + 6, "Instances", obj_isaac_hitbox);
					obj_isaac_hitbox.image_angle = 90;
				break;
			}
		
			atacar = true;
		}
		
		if (fim_da_animacao())
		{
			estado = scr_isaac_batalhando;
			atacar = false;
			image_index = 0;
		}
	}
}