clear

cNomeA       := Space(10)
cNomeB       := Space(10)
cNomeC       := Space(10)
nPrecoA      := 0
nPrecoB      := 0
nPrecoC      := 0
nQuantidadeA := 0
nQuantidadeB := 0
nQuantidadeC := 0
nTotal       := 0

@ 00,00 say 'Digite a qtd de cada produto que voce gostaria de comprar'
@ 03,01 say '  Produtos    Preco   QTD       Total'

@ 02,13 to 10,21
@ 02,27 to 12,44
@ 04,00 to 06,44 color ('N+')
@ 06,00 to 08,44 color ('N+')
@ 02,00 to 10,44

cMascaraQTD   := '999'
cMascaraNome  := '@!'
cMascaraPreco := '@E 999.99'
cMascaraTotal := '@E 999,999,999.99'

@ 05,02 get cNomeA       picture cMascaraNome  valid !Empty(cNomeA)
@ 05,14 get nPrecoA      picture cMascaraPreco valid nPrecoA > 0       color ('W+/N')
@ 05,23 get nQuantidadeA picture cMascaraQTD   valid nQuantidadeA >= 0 color ('W+/N')
read

nTotalA := (nQuantidadeA * nPrecoA)
nTotal  += nTotalA

@ 05,28 say nTotalA picture cMascaraTotal
@ 11,28 say nTotal  picture cMascaraTotal color ('G+/N')

@ 07,02 get cNomeB       picture cMascaraNome  valid !Empty(cNomeB)
@ 07,14 get nPrecoB      picture cMascaraPreco valid nPrecoB > 0       color ('W+/N')
@ 07,23 get nQuantidadeB picture cMascaraQTD   valid nQuantidadeB >= 0 color ('W+/N')
read

nTotalB := (nQuantidadeB * nPrecoB)
nTotal  += nTotalB

@ 07,28 say nTotalB picture cMascaraTotal
@ 11,28 say nTotal  picture cMascaraTotal color ('G+/N')

@ 09,02 get cNomeC       picture cMascaraNome  valid !Empty(cNomeC)
@ 09,14 get nPrecoC      picture cMascaraPreco valid nPrecoC > 0       color ('W+/N')
@ 09,23 get nQuantidadeC picture cMascaraQTD   valid nQuantidadeC >= 0 color ('W+/N')
read

nTotalC := (nQuantidadeC * nPrecoC)
nTotal  += nTotalC

@ 09,28 say nTotalC picture cMascaraTotal
@ 11,28 say nTotal  picture cMascaraTotal color ('G+/N')

@ 14,00 say 'O preco total ficou: ' + str(nTotal) + '$.'

inkey(0)
