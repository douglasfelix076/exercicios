program exe4_3;

var i,tamanho,temp,menu:integer;
  valores:array[1..20] of Integer;
  ordenado:Boolean;
  
begin
  Writeln('Digite os valores do vetor');
              
  tamanho := 20;
  for i := 1 to 20 do begin
      Write(i, ': ');
      ReadLn(valores[i]);
  end;
  
  repeat begin
      clrscr;    
      Writeln('O que deseja fazer?');      
      Writeln('1. Ordenar o vetor (Crescente)');    
      Writeln('2. Ordenar o vetor (Decrescente)');   
      Writeln('3. Sair do programa'); 
          
      ReadLn(menu);
                      
      if (menu = 1) then begin // ORDENACAO CRESCENTE    
          repeat begin
            ordenado := true;
            for i := 1 to tamanho-1 do begin
              if (valores[i] > valores[i+1]) then begin
                temp := valores[i];
                valores[i] := valores[i+1];
                valores[i+1] := temp;
                ordenado := false; 
              end;
            end;
          end;
          until ordenado; // false = o vetor ainda não está completamente ordenado
          
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
              if (valores[i] < valores[i+1]) then begin
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