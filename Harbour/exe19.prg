// parte visual
clear
set scoreboard off
@ 00,00 to 24,79 double
@ 00,02 say 'exe19'

nNumero   := 0
nContador := 0

@ 01,02 say 'Digite um numero:'
@ 01,20 get nNumero picture '99' valid nNumero > 0 .and. nNumero < 100
read

do while nContador++ < 10
   @ 02 + nContador,03 say Str(nNumero, 2) + ' * ' + Str(nContador, 2) + ' = ' + AllTrim(Str(nContador * nNumero)) + '.'
enddo

@ 23,02 say 'Pressione qualquer tecla para continuar...'
Inkey(0)