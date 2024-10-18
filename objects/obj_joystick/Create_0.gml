#region Definição das variáveis do obj_joystick
//Define a variável de distância entre o toque na tela e o centro do joystick
distancia_joy = 0;

//Define a direção do toque na tela em relação ao centro do joystick
direcao_joy = 0;

//Esta variável guarada o estado de clicado ou não do joystick
//Serve para suavizar o efeito de toque
clicado = 0;

//Guardam o índice  e a posição dos clicks na tela
indice_toque_joystick = 0;
posicao_x_atual_click = 0;
posicao_y_atual_click = 0;

#endregion

////Velocidades horizontaal e vertical traduzidas de "distancia_joy" e "direcao_joy"
global.hveloc_psg = 0;
global.vveloc_psg = 0;

