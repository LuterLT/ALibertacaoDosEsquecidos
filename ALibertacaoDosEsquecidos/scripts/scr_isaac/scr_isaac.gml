
function scr_isaac_colisao()
{
    // Verifica colisão no eixo horizontal
    if place_meeting(x + veloh, y, obj_parede) {
        while !place_meeting(x + sign(veloh), y, obj_parede) {
            x += sign(veloh);
        }
        veloh = 0;
    }
    // Verifica colisão no eixo vertical
    if place_meeting(x, y + velov, obj_parede) {
        while !place_meeting(x, y + sign(velov), obj_parede) {
            y += sign(velov);
        }
        velov = 0;
    }
    // Atualiza posição final
    x += veloh;
    y += velov;
}


function scr_isaac_movimentacao()
{
		// Movimentação
	var _dir = keyboard_check(ord("D"));
	var _esq = keyboard_check(ord("A"));
	var _up = keyboard_check(ord("W"));
	var _down = keyboard_check(ord("S"));

	veloh = (_dir - _esq) * 1;
	velov = (_down - _up) * 1;
	//scr_isaac_colisao();
	
	x += veloh;
	y += velov;

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
				break;
				case 1:
					instance_create_layer(x, y - 6, "Instances", obj_isaac_hitbox);
				break;
				case 2:
					instance_create_layer(x - 6, y, "Instances", obj_isaac_hitbox);
				break;
				case 3:
					instance_create_layer(x + 6, y, "Instances", obj_isaac_hitbox);
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

#region Andar
	var _dir = keyboard_check(ord("D"));
	var _esq = keyboard_check(ord("A"));
	var _up = keyboard_check(ord("W"));
	var _down = keyboard_check(ord("S"));

	veloh = (_dir - _esq) * 2;
	velov = (_down - _up) * 2;
	
		x += veloh;
		y += velov;
		
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
				break;
				case 1:
					instance_create_layer(x, y - 6, "Instances", obj_isaac_hitbox);
				break;
				case 2:
					instance_create_layer(x - 6, y, "Instances", obj_isaac_hitbox);
				break;
				case 3:
					instance_create_layer(x, y + 8, "Instances", obj_isaac_hitbox);
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