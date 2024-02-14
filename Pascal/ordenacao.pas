program exe4_1;

var i,tamanho,temp,menu:integer;
valores:array[1..10] of Integer; // aparentemente pascalzim n�o suporta arrays din�micas :cry:
ordenado:Boolean;

begin
Writeln('Digite os valores do vetor');
            
tamanho := 10;
for i := 1 to tamanho do begin
    Write(i, ': ');
    ReadLn(valores[i]);
end;

repeat begin
  clrscr;    
  Writeln('O que deseja fazer?');      
  Writeln('1. Ordenar o vetor (Crescente)');    
  Writeln('2. Ord   enar o vetor (Decrescente)');   
  Writeln('3. Sair do programa'); 
    
  ReadLn(menu);
  WriteLn;   			  
  if (menu = 1) then begin // ORDENACAO CRESCENTE    
  repeat begin
    ordenado := true;
    for i := 1 to tamanho-1 do begin
      if (valores[i] > valores[i+1]) then begin // se for maior, troca os dois de posi��o
            temp := valores[i];
          valores[i] := valores[i+1];
          valores[i+1] := temp;
          ordenado := false; 
      end;
    end;
  end;
until ordenado; // false = o vetor ainda n�o est� completamente ordenado

for i := 1 to tamanho do begin
    Writeln(valores[i]);
end; 
            
    Writeln('Digite qualquer coisa para voltar.');
readln;
end
else if (menu = 2) then begin // ORDENACAO DECRESCENTE       
    repeat begin
        ordenado := true;
        for i := 1 to tamanho-1 do begin
        if (valores[i] < valores[i+1]) then begin // se for menor, troca os dois de posi��o
            temp := valores[i];
            valores[i] := valores[i+1];
            valores[i+1] := temp;
            ordenado := false;
        end;
        end;
    end;
    until ordenado; 
    
    for i := 1 to tamanho do begin
    Writeln(valores[i]);
    end; 
            
    Writeln('Digite qualquer coisa para voltar.');
    readln;
end;         
end;
until (menu = 3);
end.