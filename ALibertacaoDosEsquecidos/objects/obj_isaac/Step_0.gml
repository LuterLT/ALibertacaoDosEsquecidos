script_execute(estado);
global.x_isaac = x;
global.y_isaac = y;

if (place_meeting(x, y, obj_slime))
{
	vida = vida - 0.1;	
}

if (vida == 0)
{
	visible = false;
	solid = false;
	x = -1000; y = -1000;
}

if (vida_regen >= 240)
{
	if (vida > 15)
	{
		vida += 1;
	}
	vida_regen = 0;
}
