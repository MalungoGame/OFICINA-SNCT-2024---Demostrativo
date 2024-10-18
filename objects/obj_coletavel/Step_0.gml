if (place_meeting(x, y, obj_psg_equipe_1)) {
	instance_destroy();
	obj_contador.contador++;
	
	obj_contador.escala	= lerp (obj_contador.escala, 2, 0.1);
	obj_contador.escala	= lerp (obj_contador.escala, 1, -0.1);
	
}