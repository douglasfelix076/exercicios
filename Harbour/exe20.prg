// parte visual
clear
set scoreboard off
@ 00,00 to 24,79 double
@ 00,02 say 'exe20'

nSoma     := 0
nInicio   := 10
nFim      := 50
nContador := nInicio

do while nContador <= nFim
    nSoma += nContador
    nContador++
enddo

@ 01,02 say 'A soma dos numeros de ' + AllTrim(Str(nInicio)) + ' a ' + AllTrim(Str(nFim)) + ' eh: ' + AllTrim(Str(nSoma)) + '.'

@ 23,02 say 'Pressione qualquer tecla para continuar...'
Inkey(0)