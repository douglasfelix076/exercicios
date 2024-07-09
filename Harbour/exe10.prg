set date to british
set epoch to 1940
set scoreboard off

set color to 'N/W+'
clear
@ 00,00 to 24,79 double

nIdade := 0

@ 02,02 say 'Digite sua idade:'

@ 02,20 get nIdade picture '999' valid nIdade > 0
read

if (nIdade > 21)
   @ 03,02 say 'Voce tem mais de 21 anos.'
elseif (nIdade = 21)
   @ 03,02 say 'Voce tem 21 anos.'
else
   @ 03,02 say 'Voce tem menos de 21 anos.'
endif

@ 20,02 say 'Pressione qualquer tecla para continuar...'
inkey(0)
clear
