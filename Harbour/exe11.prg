cNome      := Space(15)
nIdade     := 0
cCategoria := 'Nenhum'

set scoreboard off
set color to 'N/W+'
clear
@ 00,00 to 24,79 double

@ 02,02 say 'Digite as informacoes do nadador'
@ 03,02 say 'Nome : '
@ 04,02 say 'Idade: '

@ 03,09 get cNome  picture '@!'  valid !Empty(cNome)
@ 04,09 get nIdade picture '999' valid nIdade > 0
read

if (nIdade >= 18) // 18+
   cCategoria := 'Senior'

elseif (nIdade >= 14) // 14-17
   cCategoria := 'Juvenil B'

elseif (nIdade >= 11) // 11-13
   cCategoria := 'Juvenil A'

elseif (nIdade >= 8) // 8-10
   cCategoria := 'Infantil B'

elseif (nIdade >= 5) // 5-7
   cCategoria := 'Infantil A'

endif

@ 06,02 say 'O nadador ' + AllTrim(cNome) + ' esta classificado na categoria: ' + cCategoria
@ 22,02 say 'Pressione qualquer tecla para continuar...'

inkey(0)
