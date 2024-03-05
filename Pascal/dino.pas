// '-')b
//

Program Dino;
uses graph, math;

const gravidade = 0.2;
const mapa_largura = 70;
const dino_col_hor = 4; // tamanho colisao horizontal do dino
const dino_col_ver = 4; // tamanho colisao vertical do dino
const dino_pos_hor = 16; // posicao horizontal do dino
const altura_chao = 16; // altura do dino e obstaculos
const altura_pulo = 1.7;
const max_obstaculos = 3; // numero maximo de obstaculos que podem aparecer de uma vez
const max_nuvens = 3; // numero maximo de nuvens
const max_detalhes = 3; // numero maximo de detalhes no chao
const tempo_de_iteracao = 20; // velocidade de iteracao do jogo

const cor_fundo = 7;
const cor_dino = 0;
const cor_cacto = 2;
const cor_chao = 8;
const cor_nuvem = 15;

var
	dino_vel_ver:real; // velocidade vertical do dino
	dino_pos_ver:real; // posicao vertical do dino
	dino_quadro:integer; // quadro da animacao
	cair:boolean; // faz o dino cair mais rapido
	bateu:boolean; // fim de jogo
	sair:boolean; // jogo terminou
	reiniciar:boolean; // reiniciar jogo
	pontuacao_recorde:real; // melhor tempo da partida anterior
	pontuacao_atual:real; // tempo da partida
	velocidade:real; // velocidade do cenario
	
	proximo_obstaculo:real; // tempo restante ate o proximo obstaculo
	obstaculos_ativo:array[1..max_obstaculos] of boolean; // false = espaco vazio, true = obstaculo ativo
	obstaculos_posicao:array[1..max_obstaculos] of real; // posicao horizontal do obstaculo, eh do tipo real pois integer limitaria a velocidade a numeros inteiro
	obstaculos_visual:array[1..max_obstaculos] of integer; // 1, 2, 3: numero do visual do obstaculo
	nuvens_posicao:array[1..max_nuvens] of real;
	nuvens_altura:array[1..max_nuvens] of integer;
	detalhes_posicao:array[1..max_detalhes] of real;

// calcula se dois quadrados estao se sobrepondo
function Colidiu(x1,y1,w1,h1,x2,y2,w2,h2:integer):boolean;
var result:boolean;
begin
	result := (x1 <= x2+w2) and (x1+w1 >= x2) and (y1 <= y2+h2) and (y1+h1 >= y2);
	Colidiu := result;
end;

// apaga um quadrado especificado
procedure ApagarDesenho(X,Y,W,H:integer);
var linha:string;
	i:integer;
begin
	// cria uma string vazia com o tamanho da largura do quadrado
	// (eh mais rapido que usar gotoxy em cada posicao e colocar um espaco la)
	linha := ' ';
	for i := 1 to W do	
		linha := linha + ' ';
	for i := 1 to H do
	begin	
		gotoxy(X,Y+i);
		write(linha);
	end;
end;

procedure CriarObstaculo;
var i:integer;
begin
	for i := 1 to max_obstaculos do
	begin
		if not (obstaculos_ativo[i]) then
		begin
			obstaculos_ativo[i] := true;
			obstaculos_posicao[i] := mapa_largura;
			obstaculos_visual[i] := random(3)+1;
			exit; // exit pois nao eh mais necessario continuar com o resto do codigo
		end;
	end;
end;

procedure DestruirObstaculo(id:integer);
begin
	obstaculos_ativo[id] := false;
	obstaculos_posicao[id] := 0;
	obstaculos_visual[id] := 0;
end;

/// DESENHOS ///////////////

// desenha o dinossauro com a origem no canto inferior esquerdo
procedure DesenharDino(X,Y,quadro:integer;cair:boolean);
begin
	textcolor(cor_dino);
	
	// corpo superior
	if (cair) then
	begin
		gotoxy(X-3,Y-2); write(#220#32#32#32#32#32#220#220#220#220);
		gotoxy(X-3,Y-1); write(#219#219#219#219#219#219#219#220#219#219);
	end
	else
	begin
		gotoxy(X,Y-3); write(#219#223#219#219);
		gotoxy(X-2,Y-2); write(#220#32#219#219#219#223);
		gotoxy(X-2,Y-1); write(#219#219#219#219#219);	
	end;
	
	// os pes sao desenhados separadamente para animacao
	gotoxy(X-2,Y);
	case quadro of
		0 : write(#223#219#223#223#219); 
		1 : write(#223#223#223#223#219); 
		2 : write(#223#219#223#223#223); 
	end;	
end;

// desenha um cacto com a origem na base
procedure DesenharCacto(X,Y,tipo:integer);
begin
	textcolor(cor_cacto);
	case tipo of //'tipo' sao os diferentes visuais de cacto
		1 : begin
			gotoxy(X,Y-3); write(#220#220);
			gotoxy(X,Y-2); write(#219#219);
			gotoxy(X,Y-1); write(#219#219#219);
			gotoxy(X,Y); write(#219#219);
		end;
		2 : begin
			gotoxy(X+1,Y-3); write(#219#219);
			gotoxy(X-1,Y-2); write(#220#32#219#219);
			gotoxy(X-1,Y-1); write(#219#219#219#219);
			gotoxy(X,Y); write(#219#219' ');
		end;
		3 : begin
			gotoxy(X,Y-2); write(#219#219);
			gotoxy(X-1,Y-1); write(#219#219#219);
			gotoxy(X,Y); write(#219#219);
		end;
	end;
end;

// desenha uma nuvel com a origem no centro inferior
procedure DesenharNuvem(X,Y,tipo:integer);
begin
	textcolor(cor_nuvem);
	case tipo of //'tipo' sao os diferentes visuais da nuvem
		1 : begin
			gotoxy(X,Y); write(#220#219#219#220#219#219#219);
		end;
		2 : begin
			gotoxy(X+3,Y-1); write(#219#219#219#219#219#219#220#219#219#219#219#220);
			gotoxy(X,Y); write(#219#219#219#219#219#219#219#219#219#219#219#219#219#219#219);
		end;
		3 : begin
			gotoxy(X+7,Y-2); write(#219#219#219#219#219#219);
			gotoxy(X+3,Y-1); write(#219#219#219#219#219#219#219#219#219#219#220#219#219#219#219);
			gotoxy(X,Y); write(#219#219#219#219#219#219#219#219#219#219#219#219#219#219#219#219#219#219#219#219);
		end;
	end;
end;

// desenho do cenario
procedure DesenharCenario;
var linha:string;
	i,tipo_nuvem:integer;
begin
	textbackground(cor_fundo);
	textcolor(cor_chao);
	gotoxy(1,15);

	linha := '';
	for i := 1 to mapa_largura do	
		linha := linha + #254;
	write(linha);
	
	for i := 1 to max_nuvens do
	begin
		// aqui a altura da nuvem tambem decide o quao rapido ela se move e o qual pequena ela eh
		tipo_nuvem := nuvens_altura[i];
		nuvens_posicao[i] := nuvens_posicao[i] + (velocidade / (4-tipo_nuvem)*3)/5; //move as nuvens com velocidade dependente da altura
		
		// se a nuvem chegar no canto da tela, ela volta para o outro lado
		//if (nuvens_posicao[i] <= 10) then
			//nuvens_posicao[i] := mapa_largura; 
			
		DesenharNuvem(mapa_largura-round(round(nuvens_posicao[i]) mod mapa_largura), 7 - tipo_nuvem, tipo_nuvem);
	end;

	for i := 1 to max_detalhes do
	begin
		detalhes_posicao[i] := detalhes_posicao[i] + velocidade;
		textcolor(cor_chao);
		gotoxy(mapa_largura - (round(detalhes_posicao[i])) mod mapa_largura+1, altura_chao+1);
		write(#254);
	end;
end;

// desenho do dino e obstaculos
procedure DesenharEntidades;
var i:integer;
begin                                             // matematica doida para pegar o quadro de animacao do dino
	DesenharDino(dino_pos_hor, round(dino_pos_ver), 1+round(round(velocidade*40) mod 2), cair);	
		
	for i := 1 to max_obstaculos do
		DesenharCacto(round(obstaculos_posicao[i]), altura_chao, obstaculos_visual[i]); 
end;

// JOGO

procedure Iniciar;
var i,j:integer;
begin
	sair := false;
	reiniciar := false;
	bateu := false;
	velocidade := 1;
	pontuacao_atual := 0;
	
	proximo_obstaculo := 0;
	
	//zera os obstaculos
	for i:= 1 to 3 do
		DestruirObstaculo(i);
		
	dino_pos_ver := altura_chao;
	dino_vel_ver := 0;
	dino_quadro := 1;
	
	// gera um padrao de nuvens
	for i := 1 to max_nuvens do
	begin
		nuvens_posicao[i] := random(mapa_largura-10)+10;
		nuvens_altura[i] := random(3)+1;
	end; 

	// gera um padrao dos detalhes do chao
	for i:= 1 to max_detalhes do
		detalhes_posicao[i] := random(mapa_largura);
		
	clrscr;
end;

procedure GerenciarDino;
begin 
	// calculo da velocidade e gravidade
	
	// forca o dino a cair mais rapidamente
	if (cair) then
		dino_vel_ver := 1.5;	
	
	// se o dino nao estiver no chao, a velocidade vertical dele ficara subindo com a gravidade, fazendo ele descer
	if (dino_pos_ver < altura_chao) then
		dino_vel_ver := dino_vel_ver + gravidade;
	dino_pos_ver := round(dino_pos_ver + dino_vel_ver);
				
	// limita a posicao do dinossauro entre 4 e 15
	if (dino_pos_ver < 4) then
		dino_pos_ver := 4
	else if (dino_pos_ver > altura_chao) then
	begin
		dino_vel_ver := 0; // tambem reseta a velocidade 
		dino_pos_ver := altura_chao;
	end; 
end;

procedure GerenciarObstaculos;
var i:integer;
begin
	for i := 1 to max_obstaculos do
	begin
		// se [i] = true entao eh um obstaculo ativo
		if (obstaculos_ativo[i]) then
		begin
			
			//Apaga o desenho anterior do obstaculo antes de calcular a proxima posicao
			obstaculos_posicao[i] := obstaculos_posicao[i] - velocidade;
			
			// se o obstaculo nao estiver no canto esquerdo da tela, ele eh movido para a esquerda
			// senao, ele eh destruido
			if (obstaculos_posicao[i] > 2) then
			begin
				// olha se a o cacto e o dino estao se sobrepondo
				if (Colidiu(round(obstaculos_posicao[i]),altura_chao-2,2,3,dino_pos_hor-1,round(dino_pos_ver-3),dino_col_hor,dino_col_ver)) then
				begin
					bateu := true;
					break;
				end
			end
			else
				DestruirObstaculo(i);
		end;
	end;

	if (proximo_obstaculo <= 0) then
	begin
		for i:= 1 to 3 do // olha cada posicao na matriz do obstaculo e ve se algum deles esta vazio
		begin             // se algum estiver vazio, criar um novo obstaculo, se nenhum estiver vazio, nao fazer nada
			if not (obstaculos_ativo[i]) then
			begin
				CriarObstaculo;          // esse random adiciona pequenas variacoes entre o intervalo dos obstaculos
				proximo_obstaculo := 1 + (random(100)/100);
				break;
			end;
		end;
	end;

	// diminui o tempo do proximo obstaculo   //matematica doida para gradualmente criar obstaculos mais rapidamente
	proximo_obstaculo := proximo_obstaculo - (tempo_de_iteracao/1000 + velocidade/80);
end;

procedure GerenciarTeclas;
var tecla:char;
begin 
	cair := false;
	if (keypressed) then
	begin
		case readkey of 
		#0:Begin // olha se uma tecla especial esta sendo presionada
			case readkey of //ler tecla de novo
			#72: if (dino_pos_ver = altura_chao) then dino_vel_ver := -altura_pulo; // negativo faz o dino ir para cima 
			#80: cair := true; 
			end;
		end;
			'r' : Iniciar; // reinicia o jogo
			#27 : bateu := true; // para o jogo
		end;
	end
end;

procedure GerenciarJogo();
begin
	repeat
	begin
		// apaga toda a tela (eh mais rapido que usar clrscr)
		ApagarDesenho(1,1,mapa_largura+20,17);
		
		GerenciarTeclas;
		GerenciarDino;
		GerenciarObstaculos;

		// desenha as coisas apos toda a logica
		DesenharCenario; 
		DesenharEntidades;

		pontuacao_atual := pontuacao_atual + tempo_de_iteracao/100; // pontuacao
		velocidade := velocidade + tempo_de_iteracao/5000; // aumenta a velocidade gradualmente
		textcolor(0); gotoxy(3,3); write('Pontos: ', pontuacao_atual:3:0);
		delay(tempo_de_iteracao);
	end;
	until (bateu);
end;

procedure Finalizacao();
var tempo:real;
	novo_recorde:string;
begin
	// se o recorde for batido, a string novo_recorde eh atualizada, senao, novo_recorde fica vazia
	if (pontuacao_atual > pontuacao_recorde) then
		novo_recorde := ' - NOVO RECORDE!';
		
	textcolor(0);
	gotoxy(34, 4); write('FIM DE JOGO');
	gotoxy(26, 6); write('pontuacao: ', pontuacao_atual:3:0, novo_recorde);
	gotoxy(26, 7); write('recorde: ', pontuacao_recorde:3:0);

	//se o tempo for maior que o tempo recorde, tempo recorde eh atualizado
	if (pontuacao_atual > pontuacao_recorde) then
		pontuacao_recorde := pontuacao_atual;
		
	gotoxy(26, 10); write('R - reinciar    ESC - sair');
		
	repeat
	begin
		if (keypressed) then
			case readkey of 
				#27 : sair := true;
				'r' : reiniciar := true;
			end;
	end;
	until (sair) or (reiniciar)
end;

// programa principal
Begin
	cursoroff; 
	randomize;
	pontuacao_recorde := 0;

	// desenhos iniciais
	textbackground(cor_fundo);
	clrscr;
	DesenharCenario;
	DesenharDino(dino_pos_hor, altura_chao, 0, false);
	
	textcolor(0);
	gotoxy(18, 6); write('Pressione qualquer tecla para iniciar');
	gotoxy(18, 9); write('Seta para cima - pular');
	gotoxy(18, 10); write('Seta para baixo - descer mais rapidamente');
	readkey;

	repeat
	begin
		Iniciar;
		GerenciarJogo;
		Finalizacao;
	end;
	until (sair);
End.