{
	--QUANTIDADE DE PESSOAS NASCIDAS EM CADA MES
	--QUANTIDADE DE PESSOAS NASCIDAS ANTES DE 1970, ENTRE 1970 E 1980, 1980 A 1990, 1990 A 2000, 2000 E 2010, E DEPOIS DE 2010
	--QUANTIDADE E PORCENTAGEM DE PESSOAS QUE GANHAM ABAIXO DE 10Mil
	--QUANTIDADE E PORCENTAGEM DE PESSOAS QUE GANHAM ACIMA DE 10Mil
	--MEDIA DE SALARIO DE CADA PROFISSAO     
	--MEDIA DE SALARIO GERAL
	--MAIOR E MENOR SALARIO
	--ANO DE NASCIMENTO DA PESSOA MAIS VELHA E MAIS NOVA
}
Program Trabalho02_1 ;

var nPessoas, i : integer;
		nome : string;
		profissao, salario, mes, ano : integer;
		sexo : char; 
		antes1970, entre1970_1980, entre1980_1990, entre1990_2000, entre2000_2010, depois2010 : integer;
		qMes1, qMes2, qMes3, qMes4, qMes5, qMes6, qMes7, qMes8, qMes9, qMes10, qMes11, qMes12 : integer;
		nProfissao1, nProfissao2, nProfissao3, nProfissao4, nProfissao5, profissoesNaoNulas : integer;
		mediaP1, mediaP2, mediaP3, mediaP4, mediaP5, mediaGeral, maiorSalario, menorSalario : real;
		anoPMN, idadePMN, anoPMV, idadePMV : integer;
		abaixoDe10Mil, acimaDe10Mil : integer;
      
Begin
	write('Numero de pessoas: ');
	readln(nPessoas);		
	
	for i := 1 to nPessoas do begin
		//writeln('Insira o nome, sexo, data de nascimento, profissao e salario: ');
		writeln('Pessoa n�', i, ':');      
		write('nome: ');
		readln(nome);		
		write('sexo (F/M): ');
		readln(sexo);
		
		repeat // impedir que um mes invalido seja colocado
			write('mes de nascimento (1-12): ');
			readln(mes);
		until (mes > 0) and (mes < 13);
		
		write('ano de nascimento: ');
		readln(ano);	
		
		repeat  // impedir que uma profissao invalida seja colocada
			write('profissao: ');
			readln(profissao);
		until (profissao >= 1) and (profissao <= 5);		
		
		write('salario: ');
		readln(salario);	
		
		writeln;
		
		case(mes) of
			01 : qMes1 := qMes1 + 1;
			02 : qMes2 := qMes2 + 1;
			03 : qMes3 := qMes3 + 1;
			04 : qMes4 := qMes4 + 1;
			05 : qMes5 := qMes5 + 1;
			06 : qMes6 := qMes6 + 1;
			07 : qMes7 := qMes7 + 1;
			08 : qMes8 := qMes8 + 1;
			09 : qMes9 := qMes9 + 1;
			10 : qMes10 := qMes10 + 1;
			11 : qMes11 := qMes11 + 1;
			12 : qMes12 := qMes12 + 1;
		end;        
				
	  if (ano < 1970) then 
	  	antes1970 := antes1970 + 1
		else if (ano >= 1970) and (ano < 1980) then                
	  	entre1970_1980 := entre1970_1980 + 1
	  else if (ano >= 1980) and (ano < 1990) then                
	  	entre1980_1990 := entre1980_1990 + 1
	  else if (ano >= 1990) and (ano < 2000) then                
	  	entre1990_2000 := entre1990_2000 + 1
	  else if (ano >= 2000) and (ano < 2010) then                
	  	entre2000_2010 := entre2000_2010 + 1
	  else                                         
	    depois2010 := depois2010 + 1;
	    
	  if (salario < 10000) then
			abaixoDe10Mil := abaixoDe10Mil + 1
		else        
			acimaDe10Mil := acimaDe10Mil + 1;
		
		case(profissao) of
			1 :
				begin
			  	nProfissao1 := nProfissao1 + 1;
			  	mediaP1 := mediaP1 + salario;
				end;
			2 :
				begin
			  	nProfissao2 := nProfissao2 + 1;
			  	mediaP2 := mediaP2 + salario;
				end;
			3 :
				begin
			  	nProfissao3 := nProfissao3 + 1;
			  	mediaP3 := mediaP3 + salario;
				end;
			4 :
				begin
			  	nProfissao4 := nProfissao4 + 1;
			  	mediaP4 := mediaP4 + salario;
				end;
			5 :
				begin
			  	nProfissao5 := nProfissao5 + 1;
			  	mediaP5 := mediaP5 + salario;
				end;	
		end;
		
		if (i = 1) then begin //W
			anoPMN := ano;
			anoPMV := ano;
			menorSalario := salario;
			maiorSalario := salario;
		end
		else begin
			if (salario < menorSalario) then
			  menorSalario := salario
			else if (salario > maiorSalario) then
				maiorSalario := salario; 
				
			if (ano < idadePMV) then
			  anoPMV := ano;
			if (ano > idadePMN) then
			  anoPMN := ano;
		end;
	end;      
	
	// calculo das medias  
	// faz algumas comparacoes para impedir divis�es por 0
	if (nProfissao1 <> 0) then begin
		mediaP1 := mediaP1 / nProfissao1;
		profissoesNaoNulas := profissoesNaoNulas + 1;
	end;
	if (nProfissao2 <> 0) then begin
		mediaP2 := mediaP2 / nProfissao2;
		profissoesNaoNulas := profissoesNaoNulas + 1;
	end;
	if (nProfissao3 <> 0) then begin
		mediaP3 := mediaP3 / nProfissao3;
		profissoesNaoNulas := profissoesNaoNulas + 1;
	end; 
	if (nProfissao4 <> 0) then begin
		mediaP4 := mediaP4 / nProfissao4;
		profissoesNaoNulas := profissoesNaoNulas + 1;
	end;
	if (nProfissao5 <> 0) then begin
		mediaP5 := mediaP5 / nProfissao5;
		profissoesNaoNulas := profissoesNaoNulas + 1;
	end;
	
	if (profissoesNaoNulas <> 0) then
		mediaGeral := (mediaP1 + mediaP2 + mediaP3 + mediaP4 + mediaP5) / profissoesNaoNulas;
	
	writeln('----------------------------------'); 
	
	writeln('Pessoas nascidas em cada mes:'); 
	writeln('Janeiro  : ', qMes1); 	
	writeln('Fevereiro: ', qMes2); 	
	writeln('Marco    : ', qMes3); 	
	writeln('Abril    : ', qMes4); 	
	writeln('Maio     : ', qMes5); 	
	writeln('Junho    : ', qMes6); 	
	writeln('Julho    : ', qMes7); 	
	writeln('Agosto   : ', qMes8); 	
	writeln('Setembro : ', qMes9); 	
	writeln('Outubro  : ', qMes10); 	
	writeln('Novembro : ', qMes11); 	
	writeln('Desembro : ', qMes12);
	writeln;
	
	writeln('Pessoas nascidas em cada decada:'); 
	writeln('Antes de 1970    : ', antes1970); 
	writeln('Entre 1970 e 1980: ', entre1970_1980); 
	writeln('Entre 1980 e 1990: ', entre1980_1990); 
	writeln('Entre 1990 e 2000: ', entre1990_2000); 
	writeln('Entre 2000 e 2010: ', entre2000_2010);  
	writeln('Depois de 2010   : ', depois2010); 
	writeln;  
	                   
	// 1 = Professor, 2 = Engenheiro, 3 = Advogado, 4 = Medico e 5 = Contador.
	writeln('Salario Medio - Professor : ', mediaP1:2:2); 
	writeln('Salario Medio - Engenheiro: ', mediaP2:2:2); 
	writeln('Salario Medio - Advogado  : ', mediaP3:2:2); 
	writeln('Salario Medio - Medico    : ', mediaP4:2:2); 
	writeln('Salario Medio - Contador  : ', mediaP5:2:2);
	writeln('Salario Medio Geral       : ', mediaGeral:2:2); 
	writeln; 
	
	writeln('Menor Salario: ', MenorSalario:2:2);
	writeln('Maior Salario: ', MaiorSalario:2:2);
	writeln;
	
	writeln('Salarios abaixo de 10Mil: ', abaixoDe10Mil);
	writeln('Salarios acima de 10Mil: ', acimaDe10Mil);
	writeln;
	
	writeln('Ano de nascimento da pessoa mais nova: ', anoPMN);
	writeln('Ano de nascimento da pessoa mais velha: ', anoPMV);
End.