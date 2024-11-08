script_execute(estado);
global.x_isaac = x;
global.y_isaac = y;

if (place_meeting(x, y, obj_slime)) or (place_meeting(x, y, obj_policiaolBaitola))
{
	vida = vida - 0.01;	
}

if (vida == 0)
{
	visible = false;
	solid = false;
	x = -1000; y = -1000;
}
