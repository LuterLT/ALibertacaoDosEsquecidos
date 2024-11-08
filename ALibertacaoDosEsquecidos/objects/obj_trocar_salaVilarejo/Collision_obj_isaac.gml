if (sala_destino_id != -1) {
    switch (sala_destino_id) {
        case 0:
            room_goto(vilarejo);
            break;
        case 1:
            room_goto(galpao);
            break;
        case 2:
            room_goto(casa_isaac);
            break;
		case 3:
			room_goto(casa_carlos);
			break;
		case 4:
			room_goto(Room1);
			break;
        // Adicione mais cases conforme necessário para cada sala
        case -1:
            show_message("Sala não definida para este ID.");
			break;
    }
}