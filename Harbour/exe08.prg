// parte visual
clear
set scoreboard off
@ 00,00 to 24,79 double
@ 00,02 say 'exe08'

nValorA := 10
nValorB := 5.25
nValorC := 20
nQtdA   := 0
nQtdB   := 0
nQtdC   := 0
nTotal  := 0


@ 01,02 say 'Qtd do produto A:'
@ 02,02 say 'Qtd do produto B:'
@ 03,02 say 'Qtd do produto C:'

@ 01,20 get nQtdA picture '999' valid nQtdA >= 0
@ 02,20 get nQtdB picture '999' valid nQtdB >= 0
@ 03,20 get nQtdC picture '999' valid nQtdC >= 0
read

nTotal := nQtdA * nValorA + nQtdB * nValorB + nQtdC * nValorC

@ 05,02 say 'O total sera: ' + AllTrim(Str(nTotal))

@ 23,02 say 'Pressione qualquer tecla para continuar...'
Inkey(0)