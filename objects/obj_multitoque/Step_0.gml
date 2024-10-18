//O loop abaixo verifica o índice e as posições do device e retorna eles se o device for clicado
for (var i = 0; i < num_max_clicks; i++){
	
	if (device_mouse_check_button(i, mb_left)){
		global.indice_do_click = i;
		global.toque_posicao_x = device_mouse_x_to_gui(i);
		global.toque_posicao_y = device_mouse_y_to_gui(i);
	}

}