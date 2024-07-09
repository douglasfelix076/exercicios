clear

@ 00,00 say 'Nome..:'
@ 01,00 say 'Idade.:'
@ 02,00 say 'Peso..:'

cNome := space(2000)
nIdade := 0
nPeso := 0

@ 00,08 get cNome  picture '@!'     valid !empty(cNome)
@ 01,08 get nIdade picture '999'    valid nIdade >= 0
@ 02,08 get nPeso  picture '999.99' valid nPeso >= 0
read
