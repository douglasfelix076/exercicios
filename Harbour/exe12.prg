nLinha   := 0
nNumeroA := 0
nNumeroB := 0
nNumeroC := 0
nMaior   := 0
cMascara := '9999'

set scoreboard off
set color to 'N/W+'
clear
@ 00,00 to 24,79 double

@ 02,02 say 'Digite tres numeros:'
@ 03,02 say 'A: '
@ 04,02 say 'B: '
@ 05,02 say 'C: '
@ 03,05 get nNumeroA picture cMascara
@ 04,05 get nNumeroB picture cMascara
@ 05,05 get nNumeroC picture cMascara
read

nMaior := nNumeroA
if nMaior < nNumeroB
   nMaior := nNumeroB
endif
if nMaior < nNumeroC
   nMaior := nNumeroC
endif

@ 06,02 say 'O maior numero eh: ' + alltrim(str(nMaior)) + '.'

@ 22,02 say 'Pressione qualquer tecla para continuar...'
inkey(0)
clear
