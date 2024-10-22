other.vida -= obj_isaac.dano;

var _dir = point_direction(obj_isaac.x, obj_isaac.y, other.x, other.y);
other.empurrar_dir = _dir;
other.empurrar_veloc = 6;
other.estado = scr_hit;

other.alarm[0] = 5;
other.hit = true;