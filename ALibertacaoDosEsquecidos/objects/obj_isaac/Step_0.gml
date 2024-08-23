

var _dir = keyboard_check(ord("D"));
var _esq = keyboard_check(ord("A"));
var _up = keyboard_check(ord("W"));
var _down = keyboard_check(ord("S"));

veloh = (_dir - _esq)*1;
velov = (_down - _up)*1.2;

x += veloh;
y += velov;

//if pra ver se tá se movendo ou não
if (veloh != 0 or velov != 0)
{
	movendo = 1;
}
else
{
 movendo = 0;
}

//conjunto de if pra definir o lado
if (_up) {lado = 1;}
if (_down) {lado = 0;}
if (_esq) {lado = 2;}
if (_dir) {lado = 3;}

//muda a sprite (as sprites tao no create numa matriz)
sprite_index = sprites[movendo][lado]