clear

set date to american
set epoch to 1940
set century on
set scoreboard off

cLetra   := ' '
dData    := Date()
nInteiro := 0
nDecimal := 0
cString  := space(20)

@ 01,00 say 'Texto   : '
@ 02,00 say 'Decimal : '
@ 03,00 say 'Inteiro : '
@ 04,00 say 'Letra   : '
@ 05,00 say 'Data    : '

@ 01,10 get cString  picture '@!'
@ 02,10 get nDecimal picture '999.99'
@ 03,10 get nInteiro picture '999'
@ 04,10 get cLetra   picture '@!'
@ 05,10 get dData
read

@ 07,00 say 'Texto   : ' + cString + '.'
@ 08,00 say 'Decimal : ' + str(nDecimal) + '.'
@ 09,00 say 'Inteiro : ' + str(nInteiro) + '.'
@ 10,00 say 'Letra   : ' + cLetra + '.'
@ 11,00 say 'Data    : ' + DToC(dData) + '.'
