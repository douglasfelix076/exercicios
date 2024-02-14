Program Trabalho02_1 ;

var	nVotosA, nVotosB, nVotosC, nVotosD, nVotosBrancos, nVotosNulos : integer;  
		nPessoas, votoAtual, totalVotos : integer;  
		nv1, nv2, nv3, nv4, nvTemp : integer; // ordenacao (votos)
		nc1, nc2, nc3, nc4, ncTemp : char;    // ordenacao (candidato)      
		porcentagemTotal : real;    
		i : integer; // forloop
      
Begin
	writeln('- Elei��es -');
	              
	write('Numero de pessoas a votar: ');
	readln(nPessoas);	
	writeln;	
  
	for i := 1 to nPessoas do begin              
		writeln('Pessoa n�', i, ':');      
		write('Insira o numero do candidato: ');
		readln(votoAtual);		
		case(votoAtual) of
			123 : nVotosA := nVotosA + 1;
			456 : nVotosB := nVotosB + 1;
			789 : nVotosC := nVotosC + 1;
			111213 : nVotosD := nVotosD + 1;
			0 : nVotosBrancos := nVotosBrancos + 1;
		else 
				nVotosNulos := nVotosNulos + 1;
		end; 
	end;
		      
	// ordenacao   
	 
	nv1 := nVotosA;
	nv2 := nVotosB;
	nv3 := nVotosC;
	nv4 := nVotosD;
	nc1 := 'A';
	nc2 := 'B';
	nc3 := 'C';
	nc4 := 'D';
	
	// compara dois numeros: se o numero 1 for menor que o 2, troca a posicao deles
	// repete esse processo ate que os numeros estejam em ordem decrescente
	repeat begin
	  if (nv1 < nv2) then begin
	    nvTemp := nv1;
			nv1 := nv2;
			nv2 := nvTemp;   
			
	    ncTemp := nc1;
			nc1 := nc2;
			nc2 := ncTemp;
	  end;
	  if (nv3 < nv4) then begin
	    nvTemp := nv3;
			nv3 := nv4;
			nv4 := nvTemp;   
			
	    ncTemp := nc3;
			nc3 := nc4;
			nc4 := ncTemp;
	  end;   
	  if (nv2 < nv3) then begin
	    nvTemp := nv2;
			nv2 := nv3;
			nv3 := nvTemp;   
			
	    ncTemp := nc2;
			nc2 := nc3;
			nc3 := ncTemp;
	  end;
	end;
	until (nv1 >= nv2) and (nv2 >= nv3) and (nv3 >= nv4);  
	                                              
	writeln;
	writeln('---------------------------------');
	writeln;
	
	writeln('- Resultados -');                 
	writeln('Candidato ', nc1, ': ', nv1, ' votos');  
	writeln('Candidato ', nc2, ': ', nv2, ' votos'); 
	writeln('Candidato ', nc3, ': ', nv3, ' votos'); 
	writeln('Candidato ', nc4, ': ', nv4, ' votos');
	writeln('Votos em braco: ', nVotosBrancos);
	writeln('Votos Invalidos: ', nVotosNulos);   
	  
	totalVotos := nVotosA + nVotosB + nVotosC + nVotosD + nVotosBrancos;
	writeln('Votos Totais: ', totalVotos);     
	
  porcentagemTotal := nv1 / totalVotos * 100;
	                                        
	writeln('O vencedor foi o candidato ', nc1, ' com ', nv1, ' votos (', porcentagemTotal:2:0, ' porcento dos votos totais).');
	
End.