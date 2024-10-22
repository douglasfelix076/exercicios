// parte visual
clear
set scoreboard off
@ 00,00 to 24,79 double
@ 00,02 say 'exe03'

nNumero1 := 3
nNumero2 := 4
nProduto := nNumero1 * nNumero2

@ 01,02 say 'O produto dos numeros ' + AllTrim(Str(nNumero1)) + ' e ' + AllTrim(Str(nNumero2)) + ' eh ' + AllTrim(Str(nProduto)) + '.'

@ 23,02 say 'Pressione qualquer tecla para continuar...'
inkey(0)