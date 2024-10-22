// parte visual
clear
set scoreboard off
@ 00,00 to 24,79 double
@ 00,02 say 'exeXX'

nIdade := 0

@ 01,02 say 'Digite a sua idade:'

@ 01,22 get nIdade picture '999' valid nIdade > 0
read

if nIdade > 21
    @ 03,02 say 'Usuario tem mais de 21 anos.'
else
    @ 03,02 say 'Usuario tem menos de 21 anos.'
endif

@ 23,02 say 'Pressione qualquer tecla para continuar...'
Inkey(0)