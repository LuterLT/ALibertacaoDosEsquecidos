// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_hit(){
empurrar_veloc = lerp(empurrar_veloc, 0, 0.05);

hveloc = lengthdir_x(empurrar_veloc, empurrar_dir);
vveloc = lengthdir_y(empurrar_veloc, empurrar_dir);

}

function scr_movimentacao_inimigo()
{
	hveloc = 0;
	vveloc = 0;
}