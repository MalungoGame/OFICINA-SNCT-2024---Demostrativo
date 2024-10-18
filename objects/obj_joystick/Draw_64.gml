#region Parte que setamos a posição e tamanho da sprite do joystick

	//Setando a posição do obj_joystick
	var _x = 180;
	var _y = 525;
	
	//Cálculo da distância entre os centro do joystick e sua circunferência
	var _raio = sprite_get_width(spr_joystick)/2;

	#endregion
	
	#region Parte que desenha a sprite de base do joystick

	draw_circle(_x, _y, _raio, 1);
	draw_sprite_ext(spr_joystick, 0,_x, _y, 1, 1, 0, c_white, .2);

	#endregion
	
	#region Parte que verificamos se o jogador clicou no joystick
	
	//Verifica se o jogador clicou sobre a sprite do joystick
	var _clicando_no_joystick = (point_in_circle(global.toque_posicao_x, global.toque_posicao_y, _x, _y, _raio) && device_mouse_check_button(global.indice_do_click, mb_left));
	
	//Verifica se o jogador está clicando dentro da área de interação limite, esta que corresponde a metade da tela, ou seja: (width, height) = ((display_get_gui_width()/2), display_get_gui_height())
	var _clicando_em_area_interativa = (point_in_rectangle(global.toque_posicao_x, global.toque_posicao_y, 0, 0, display_get_gui_width()/2, display_get_gui_height()) && (device_mouse_check_button(global.indice_do_click, mb_left)));
	
	//Se o jogador clicou na sprite e dentro da área limite de interação guardamos o indice do toque, isto é, se foi o primeiro, segundo, ..., n-ésimo click
	//Isto é feito para que ele não reconheça outro toque na tela, mas apenas aquele feito no joystick
	if (_clicando_no_joystick && _clicando_em_area_interativa && !clicado){
		indice_toque_joystick = global.indice_do_click;
	}
	
	//Verifica se apenas o toque sobre o joystick contrinua sobre a sprite do joystick e a área de interação limitada
	var _permanece_joystick = (point_in_circle(posicao_x_atual_click, posicao_y_atual_click, _x, _y, _raio) && device_mouse_check_button(indice_toque_joystick, mb_left));
	var _permanece_area_interativa = (point_in_rectangle(posicao_x_atual_click, posicao_y_atual_click, 0, 0, display_get_gui_width()/2, display_get_gui_height()) && (device_mouse_check_button(indice_toque_joystick, mb_left)));
	
	#endregion
	
	#region	Parte das ações do joystick

	//Situação 1
	//Se o jogador clicou na sprite e dentro da área limite de interação, ou a variável o estado do joystick é clicado, 
	//são executadas as ações funcionais do joystick
	if ((_clicando_no_joystick && _clicando_em_area_interativa) || clicado){
		
		#region Parte de cálculo
		
		//Setando ao estado da variável para clicado 
		clicado = 1;
		
		//Calcula das coordenadas apenas do click sobre joystick
		posicao_x_atual_click = device_mouse_x_to_gui(indice_toque_joystick);
		posicao_y_atual_click = device_mouse_y_to_gui(indice_toque_joystick);
		
		//Cálcula a distância entre o toque na tela e o centro da sprite do joystick
		distancia_joy = min(point_distance(_x, _y, posicao_x_atual_click, posicao_y_atual_click), _raio);
		//Cálcula a direção do toque na tela e o centro da sprite do joystick
		direcao_joy = point_direction(_x, _y, posicao_x_atual_click, posicao_y_atual_click);
		
		#endregion
		
		#region Define hveloc e vveloc para a situação 1
		
			//Atribui as variáveis globais o valor das componentes x e y do toque na tela
			//Isto é, considerando o centro com sendo o meio das sprite doo joystick
			global.hveloc_psg = lengthdir_x(distancia_joy, direcao_joy);
			global.vveloc_psg = lengthdir_y(distancia_joy, direcao_joy);
			
		#endregion
		
		//Corrdendas de posição do joystick
		var _x1 = global.hveloc_psg + _x;
		var _y1 = global.vveloc_psg + _y;
		
		for (var i = 0; i <= 5; i++) {
			
			//Desenhando o background do joystick
			draw_sprite_ext(spr_joystick, 0, _x1, _y1, 0.5, 0.5, 0, c_white, (.2 * i));
			
		}
		
		draw_line(_x, _y, _x1, _y1);
	}
	
	//Situação 2
	
	if (!(_permanece_joystick || _permanece_area_interativa)) {
		
		//Dessetando a variável de click
		clicado = 0;
		
		#region Define hveloc e vveloc para a situação 2
		
			global.hveloc_psg = 0;
			global.vveloc_psg = 0;
			
		#endregion
		
		//Usando a função lerp fazemos com que o joystick volte para o centro da circunferência
		distancia_joy = lerp(distancia_joy, 0, .1);
		
		//Coordenadas
		var _x1 = lengthdir_x(distancia_joy, direcao_joy) + _x;
		var _y1 = lengthdir_y(distancia_joy, direcao_joy) + _y;

		//Desenhando o background do joystick transparente
		draw_sprite_ext(spr_joystick, 0, _x1, _y1, 0.5, 0.5, 0, c_white, .2);

		draw_line(_x, _y, _x1, _y1);
		
	}
	#endregion	
