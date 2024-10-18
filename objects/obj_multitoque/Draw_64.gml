#region Desenha Círculo Indicador de Toque

	//O laço for verifica para cada índice até num_max_clicks se há toque na tela
	for (var i = 0; i < num_max_clicks; i++){
		//Verifica se há o toque na tela
		if (device_mouse_check_button(i, mb_left)){
			//Desenha a posição em que ocorre os clicks
			draw_circle(device_mouse_x_to_gui(i), device_mouse_y_to_gui(i), 50, 0);
		}
		/*
		//Desenha as informações sobre os clicks
		draw_text(60,	550 + (40 * i),	device_mouse_check_button(i, mb_left));
		draw_text(100,	550,			global.indice_do_click);
		//---------------------------------------------------------
		draw_text(140,	550 + (40 * i),	global.toque_posicao_x);
		draw_text(180,	550 + (40 * i),	global.toque_posicao_y);
		//---------------------------------------------------------
		*/
	}
	//draw_text(30, 525, "Informacoes sobre os clicks");
	//draw_rectangle(50, 550, 210, 690, 1);

#endregion