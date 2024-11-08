// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações


function scr_slime_checar_personagem(){

	if (distance_to_object(obj_isaac) <= 50)
	{
		estado = scr_slime_perseguindo;
	}
	
}


function scr_slime_colisao(){
	if place_meeting(x + hveloc, y, obj_parede) 
	{
        while !place_meeting(x + sign(hveloc), y, obj_parede) 
		{
            x += sign(vveloc);
        }
        hveloc = 0;
    }
    // Verifica colisão no eixo vertical
    if place_meeting(x, y + vveloc, obj_parede) 
	{
        while !place_meeting(x, y + sign(vveloc), obj_parede) 
		{
            y += sign(vveloc);
        }
        vveloc = 0;
	}
}


function scr_slime_escolher_estado(){
	
	scr_slime_checar_personagem();
	proximo_estado = choose(scr_slime_andando, scr_slime_parada);
	
	if (proximo_estado == scr_slime_andando){
		estado = scr_slime_andando;
		dest_x = irandom_range(0, room_width);
		dest_y = irandom_range(0, room_height);
	
	}else if (proximo_estado == scr_slime_parada)
	{
		estado = scr_slime_parada;
	}
}

function scr_slime_andando(){
	
	scr_slime_checar_personagem();
	
	if (distance_to_point(dest_x, dest_y) > veloc)
	{
		image_speed = 1;
		var _direc = point_direction(x, y, dest_x, dest_y);
		hveloc = lengthdir_x(veloc, _direc);
		vveloc = lengthdir_y(veloc, _direc);
	
		scr_slime_colisao();
			x += hveloc;
			y += vveloc;
	}else
	{
		x = dest_x;
		y = dest_y;
	}
	
}

function scr_slime_parada(){
	
	scr_slime_checar_personagem();
	image_speed = 0.5;
}

function scr_slime_perseguindo(){
	
	if (estado != scr_slime_hit)
	{
		image_speed = 1.5;
		dest_x = obj_isaac.x;
		dest_y = obj_isaac.y;
	
		var _dir = point_direction(x, y, dest_x, dest_y);
		hveloc = lengthdir_x(veloc_persegue, _dir);
		vveloc = lengthdir_y(veloc_persegue, _dir);
	
		scr_slime_colisao();
		x += hveloc;
		y += vveloc;
	
		if(distance_to_object(obj_isaac) >= dist_desaggro)
		{
			estado = scr_slime_escolher_estado;
			alarm[0] = irandom_range(120, 200);
		}
	}

}

function scr_slime_hit()
{
	empurrar_veloc = lerp(empurrar_veloc, 0, 0.2);
	
	hveloc = lengthdir_x(empurrar_veloc, empurrar_dir);
	vveloc = lengthdir_y(empurrar_veloc, empurrar_dir);
	scr_slime_colisao();
	x += hveloc;
	y += vveloc;
	
}