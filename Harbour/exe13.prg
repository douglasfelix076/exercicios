nCodigo   := 0
cClass    := ''
lInvalido := .f.

set scoreboard off
set color to 'N/W+'
clear
@ 00,00 to 24,79 double

@ 02,02 say 'Digite o codigo do produto:'
@ 02,30 get nCodigo picture '999'
read

if (nCodigo = 1)
   cClass := 'Alimento nao-perecivel'
elseif (nCodigo >= 2 .and. nCodigo <= 4)
   cClass := 'Alimento perecivel'
elseif (nCodigo >= 5 .and. nCodigo <= 6)
   cClass := 'Vestuario'
elseif (nCodigo = 7)
   cClass := 'Higiene pessoal'
elseif (nCodigo >= 8 .and. nCodigo <= 15)
   cClass := 'Limpeza e utensilios domesticos'
else
   lInvalido := .t.
endif

if (lInvalido)
   @ 04,02 say 'Codigo de produto invalido (' + AllTrim(Str(nCodigo)) + ').' color 'R/N'
else
   @ 04,02 say 'Classificacao do produto (' + AllTrim(Str(nCodigo)) + ') : ' + cClass +'.'
end

