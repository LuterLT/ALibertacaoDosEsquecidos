// Ajuste o valor para definir o nível de delay (menor = mais rápido)
var delay = 0.1;

// Faz o objeto seguidor se aproximar do personagem
x += (obj_isaac.x - x) * delay;
y += (obj_isaac.y - y) * delay;
