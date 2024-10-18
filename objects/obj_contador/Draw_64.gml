//Desenhando o Background do Contador
draw_roundrect_color_ext(dimen[0], dimen[1], dimen[2], dimen[3], 50, 50, c_white, c_white, 0);

#region Conteúdo do COntador
	
	//Definindo a string
	var texto				= string(contador) + " / " + string(num_max_contador);
	var tamanho_texto	= string_width(texto); // Tamanho d Texto

	//Desenhando valores do contador
	draw_text_ext_color((posicao[0] - tamanho_texto/2), dimen[1] + 20, texto, 0, tamanho_texto, c_black, c_black, c_black, c_black, 1);
	
	if (sprite_item_coletado == noone) {
		draw_circle_color(posicao[0], posicao[1] + 30, 30, c_grey, c_grey, 0);
	}
	else {
		draw_sprite_ext(sprite_item_coletado, 0, (posicao[0]), (posicao[1]), escala, escala, 0, c_white, 1);
	
	}
	
#endregion