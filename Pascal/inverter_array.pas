program exe4_2;

var i:integer;
  vetor:array[1..10] of Integer;
  invertido:array[1..10] of Integer;
  
begin
  Writeln('Digite os valores do vetor');
  
  // pega os valores do vetor original            
  for i := 1 to 10 do begin
    Write(i, ': ');
    ReadLn(vetor[i]);
  end;
  
  // cria o vetor invertido 
  for i := 1 to 10 do
    invertido[i] := vetor[11 - i];
  
  clrscr;
                      
  WriteLn('Vetor original');
  for i := 1 to 10 do
    Writeln(vetor[i]);
  
  WriteLn('Vetor invertido');
  for i := 1 to 10 do
    Writeln(invertido[i]);
    
end.