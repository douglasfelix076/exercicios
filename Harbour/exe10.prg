set date to british
set epoch to 1940

nIdade := 0

clear

@ 00,00 say 'Digite sua idade:'

@ 00,27 get nIdade valid nIdade > 0
read

if (nIdade > 21)
   @ 01,00 say 'Voce tem mais de 21 anos.'
elseif (nIdade = 21)
   @ 01,00 say 'Voce tem 21 anos.'
else
   @ 01,00 say 'Voce tem menos de 21 anos.'
endif

@ 20,00 say 'Pressione qualquer tecla para continuar...'
inkey(0)
clear
