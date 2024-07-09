clear

set date to american
set epoch to 1940
set scoreboard off

cLetra   := ' '
dData    := Date()
nInteiro := 0
nDecimal := 0
cString  := space(20)

set scoreboard off
set color to 'N/W+'
clear
@ 00,00 to 24,79 double

@ 03,02 say 'Texto   : '
@ 04,02 say 'Decimal : '
@ 05,02 say 'Inteiro : '
@ 06,02 say 'Letra   : '
@ 07,02 say 'Data    : '

@ 03,12 get cString  picture '@!'
@ 04,12 get nDecimal picture '999.99'
@ 05,12 get nInteiro picture '999'
@ 06,12 get cLetra   picture '@!'
@ 07,12 get dData
read

@ 09,02 say 'Texto   : ' + cString + '.'
@ 10,02 say 'Decimal : ' + str(nDecimal) + '.'
@ 12,02 say 'Inteiro : ' + str(nInteiro) + '.'
@ 13,02 say 'Letra   : ' + cLetra + '.'
@ 14,02 say 'Data    : ' + DToC(dData) + '.'

@ 20,02 say 'Pressione qualquer tecla para continuar...'
inkey(0)
clear

