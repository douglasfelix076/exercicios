program Trabalho_5;

const tamanho_maximo = 10;

type Matriz = array[1..tamanho_maximo, 1..tamanho_maximo] of real;
			 
var escolha, tamanho : integer;
	matrizA, matrizB, matrizC, matTemp : matriz;
	
function LerMatriz(var mat : Matriz) : Matriz;
var i, j : integer; 
begin
	for i := 1 to tamanho do begin       
		for j := 1 to tamanho do
			read(mat[i, j]);
		writeln; 
	end;
	LerMatriz := mat;
end;

procedure MostrarMatriz(mat : Matriz);
var i, j : integer;
begin
	for i := 1 to tamanho do
	begin
		write('| ');
		for j := 1 to tamanho do
			write(mat[i, j]:2:2, ' | ');
		writeln;
	end;
end;

procedure SomarMatrizes(matA, matB : Matriz; var matC : Matriz);
var	i, j : integer;
begin
	for i := 1 to tamanho do
		for j := 1 to tamanho do
			matC[i, j] := matA[i, j] + matB[i, j];
end;

procedure SubtrairMatrizes(matA, matB : Matriz; var matC : Matriz);
var
	i, j : integer;
begin
	for i := 1 to tamanho do
		for j := 1 to tamanho do
			matC[i, j] := matA[i, j] - matB[i, j];
end;
	
procedure MultiplicarMatrizes(matA, matB : Matriz; var matC : Matriz);
var
	i, j : integer;
begin
	for i := 1 to tamanho do  
		for j := 1 to tamanho do
			matC[i, j] := matA[i, j] * matB[i, j];
end;

procedure SomarDiagonalPrincipal(mat: Matriz);
var
	i : integer;
	total : real;
begin
	total := 0;
	for i := 1 to tamanho do
		total := total + mat[i, i];
	writeln('Soma da diagonal principal: ', total:2:2);
end;

procedure SomarColunas(mat: Matriz);
var	i, j : integer;
	total : real;
begin
	for i := 1 to tamanho do
	begin     
		total := 0;
		for j := 1 to tamanho do
			total := mat[j,i];
		writeln('Soma da coluna ', i, ': ', total:2:2);
	end;
end;

procedure SomarLinhas(mat: Matriz);
var	i, j : integer;
	total : real;
begin
	for i := 1 to tamanho do
	begin  
		total := 0;
		for j := 1 to tamanho do
			total := mat[i,j];
		writeln('Soma da linha ', i, ': ', total:2:2);
	end;
end;

// pega uma letra digitada pelo usuario e retorna a matriz associada
function LerChar() : Matriz; 
var matrizEscolhida:char;
	valido : boolean;
begin                
	valido := false;
	repeat //repete ate que o usuario digite uma resposta valida
		readln(matrizEscolhida);
		if (matrizEscolhida = 'a') or (matrizEscolhida = 'b') or (matrizEscolhida = 'c') then
			valido := true
		else
			writeln('resposta invalida.');
	until (valido);
	case matrizEscolhida of
		'a' : LerChar := matrizA;
		'b' : LerChar := matrizB;
		'c' : LerChar := matrizC;
	end;
end;  

procedure MatrizTransposta(mat : Matriz; var matA : Matriz);
var
	i, j : integer;
	temp : real;
begin
	for i := 1 to tamanho do
		for j := i+1 to tamanho do
		begin
			temp := matriz[i, j];
			mat[i, j] := mat[j, i];
			mat[j, i] := temp;
		end;
	matA := mat;
end;
          
procedure MatrizesEmVetor();
var i, j, k: integer;
  vetor: array[1..(tamanho_maximo * tamanho_maximo * 3)] of real;
begin
	k := 1; // variavel para salvar a posicao atual do vetor
	
  for i := 1 to tamanho do
    for j := 1 to tamanho do begin
			vetor[k] := matrizA[i, j]; 
      k := k + 1;
    end;
  
	for i := 1 to tamanho do
    for j := 1 to tamanho do begin
			vetor[k] := matrizB[i, j];   
      k := k + 1;
    end;
  
	for i := 1 to tamanho do
    for j := 1 to tamanho do begin
			vetor[k] := matrizC[i, j];   
      k := k + 1;
    end;
       
  write('| ');
  for i := 1 to k-1 do
    write(vetor[i]:2:2, ' | ');
  writeln;
end;		
begin

	writeln('Digite o tamanho das matrizes (N x N):'); readln(tamanho);  
	writeln('Digite os elementos da matriz A:'); LerMatriz(matrizA);
	writeln('Digite os elementos da matriz B:'); LerMatriz(matrizB);
	writeln('Digite os elementos da matriz C:'); LerMatriz(matrizC);
	 
	repeat
	begin
		writeln;
		writeln('Escolha uma opcao:');
		writeln('1 - Calcular e mostrar o resultado da soma de duas matrizes');
		writeln('2 - Calcular e mostrar o resultado da subtracao de duas matrizes');
		writeln('3 - Calcular e mostrar o resultado da multiplicacao de duas matrizes');
		writeln('4 - Calcular e mostrar a matriz transposta de uma das tres matrizes');
		writeln('5 - Calcular e mostrar a soma dos elementos da diagonal principal de uma das tres matrizes');
		writeln('6 - Calcular e mostrar a soma dos elementos de cada coluna de uma das tres matrizes');
		writeln('7 - Calcular e mostrar a soma dos elementos de cada linha de uma das tres matrizes');
		writeln('8 - Calcular e mostrar na tela um vetor formado por todos os elementos das tres matrizes');
		writeln('9 - Sair');
		
		read(escolha);
										
		case escolha of
			1: begin
					writeln('Escolha duas matrizes para soma (a/b/c):');
					SomarMatrizes(LerChar, LerChar, matTemp);
					MostrarMatriz(matTemp);
				end;
			2: begin
					writeln('Escolha duas matrizes para subtracao (a/b/c):');				
					SubtrairMatrizes(LerChar, LerChar, matTemp); 
					MostrarMatriz(matTemp);
				end;
			3: begin
					writeln('Escolha duas matrizes para multiplicacao (a/b/c):');	 
					MultiplicarMatrizes(LerChar, LerChar, matTemp);
					MostrarMatriz(matTemp);           
				end;
			4: begin
					writeln('Escolha uma matriz para transpor (a/b/c):');	  				
					MatrizTransposta(LerChar, matTemp);  
					MostrarMatriz(matTemp); 
				end;
			5: begin
					writeln('Escolha uma matriz a soma da diagonal (a/b/c):');	   
					SomarDiagonalPrincipal(LerChar);
				end;
			6: begin
					writeln('Escolha uma matriz para a soma das colunas(a/b/c):');	   						
					SomarColunas(LerChar);
				end;
			7: begin
					writeln('Escolha uma matriz (a/b/c):');	   
					SomarLinhas(LerChar);
				end;
			8: MatrizesEmVetor;
		end;
	end;
	until (escolha = 9);
end.