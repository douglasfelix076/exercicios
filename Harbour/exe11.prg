clear

cNome      := Space(15)
cCategoria := ''
nIdade     := 0

@ 00,00 say 'Nome : '
@ 01,00 say 'Idade: '
@ 00,07 get cNome valid !Empty(cNome)
@ 01,07 get nIdade valid nIdade > 0
read

if (nIdade > 18)
   cCategoria := 'senior'
elseif (nIdade >= 14)
   cCategoria := 'juvenil B'
elseif (nIdade >= 11)
   cCategoria := 'juvenil A'
elseif (nIdade >= 8)
   cCategoria := 'infantil B'
elseif (nIdade > 18)
   cCategoria := 'infantil A'
else
   cCategoria := 'nenhum'
endif

@ 03,00 say 'o nadador ' + AllTrim(cNome) + ' esta classificado na categoria: ' + cCategoria

@ 20,00 say 'Pressione qualquer tecla para continuar...'
inkey(0)
clear
