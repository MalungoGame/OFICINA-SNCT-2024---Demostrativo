#region  MultiToque na Tela

	//A função abaixo ativa o click duplo, ou melhor, ele considera o segundo mb_left como um mb_right
	//device_mouse_dbclick_enable(1);

	//Número máximo de clicks na tela
	num_max_clicks = 4;

	//Número do click é uma variável declarada para atribuir um valor que corresponde ao caráter ordinal de toques na tela
	//Exemplo: É o segundo click na tela -> numero_do_click = 2
	global.indice_do_click = 0;

	//As variáveis guardam as posições x e y dos toques na tela
	global.toque_posicao_x = 0;
	global.toque_posicao_y = 0;

#endregion

