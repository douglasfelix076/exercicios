// parte visual
clear
set scoreboard off
@ 00,00 to 24,79 double
@ 00,02 say 'exe15'

cNome     := Space(20)
nContador := 0

@ 01,02 say 'Digite seu nome:'

@ 01,19 get cNome picture '@!' valid !Empty(cNome)
read

do while nContador++ < 10
    @ 02 + nContador,02 say AllTrim(Str(nContador)) + ': ' + cNome
enddo

@ 23,02 say 'Pressione qualquer tecla para continuar...'
Inkey(0)