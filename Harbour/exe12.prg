// parte visual
clear
set scoreboard off
@ 00,00 to 24,79 double
@ 00,02 say 'exe12'

nNumeroA     := 0
nNumeroB     := 0
nNumeroC     := 0
nMaiorNumero := 0

@ 01,02 say 'Numero A:'
@ 02,02 say 'Numero B:'
@ 03,02 say 'Numero C:'

@ 01,12 get nNumeroA picture '999'
@ 02,12 get nNumeroB picture '999'
@ 03,12 get nNumeroC picture '999'
read

nMaiorNumero := nNumeroA

if nNumeroB > nMaiorNumero
    nMaiorNumero := nNumeroB
endif

if nNumeroC > nMaiorNumero
    nMaiorNumero := nNumeroC
endif

@ 05,02 say 'O maior numero eh: ' + AllTrim(Str(nMaiorNumero)) + '.'

@ 23,02 say 'Pressione qualquer tecla para continuar...'
Inkey(0)