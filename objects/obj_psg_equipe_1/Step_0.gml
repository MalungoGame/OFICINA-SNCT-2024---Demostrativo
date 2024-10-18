#region Atribuindo valaores limite aos deslocamentos horizontal e vertical

	hveloc = lerp(0, clamp(global.hveloc_psg, min_hveloc_vveloc, max_hveloc_vveloc), .2);
	vveloc = lerp(0, clamp(global.vveloc_psg, min_hveloc_vveloc, max_hveloc_vveloc), .2);
	
#endregion

#region Colisão do personagem
	//Dica: As colisões em x e em y devem ser feitas de forma separada

	//Verifica se a futura posição da instância do personagem (x + hveloc) está colidindo com a instância de colisão
	//Ou seja, eu prevejo que existirá uma colisão à frente
	if (place_meeting(x + hveloc, y, obj_colisor)){
		//A utilização  do "while" tem como finalidade ver quantos pixels existem 
		//entre a instância do personagem e a instância de colisão, partindo da posição futura (x + hveloc)
		while (!place_meeting(x + sign(hveloc), y, obj_colisor)){
			//Pegando a posição atual (x), que ainda não colide, adicionaremos (-1, 0, +1) a posição atual até
			//que esteja realmente colidindo para poder sair do loop
			x += sign(hveloc);
		}
		//Define o deslocamento horizotal do player em 0
		hveloc = 0;
	}

	//Caso não colida ou deixe de colidir, o player volta a mover-se pela room
	//E caso utilize-se do "else" o segundo caso não é verdade, ou seja, ele é ignorado
	x += hveloc;

	//Repete-se o mesmo processo só que para y
	if (place_meeting(x, y + vveloc, obj_colisor)){
		while (!place_meeting(x, y + sign(vveloc), obj_colisor)){
			y += sign(vveloc);
		}
		//Define o deslocamento vertical do player em 0
		vveloc = 0;
	}

	y += vveloc;

#endregion

image_xscale	= 2;
image_yscale	= 2;