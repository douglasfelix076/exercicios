// parte visual
clear
set scoreboard off
@ 00,00 to 24,79 double
@ 00,02 say 'exe18'

nContador := 0
do while nContador++ < 10
   @ 01,02 + nContador * 3 say nContador picture '99'
enddo

do while nContador-- > 1
   @ 02,02 + nContador * 3 say (11 - nContador) picture '99'
enddo

@ 23,02 say 'Pressione qualquer tecla para continuar...'
Inkey(0)