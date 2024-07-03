clear

@ 00,00 say 'Digite a qtd de cada produto que voce gostaria de comprar'

@ 03,01 say '  Produto    Preco   QTD      Total '
@ 05,01 say ' Produto A   10,00'
@ 07,01 say ' Produto B   05,25'
@ 09,01 say ' Produto C   20,00'

@ 02,12 to 10,20
@ 02,26 to 12,40
@ 04,00 to 06,40
@ 06,00 to 08,40
@ 02,00 to 10,40

nQuantidadeA := 0
nQuantidadeB := 0
nQuantidadeC := 0

cMascara := '999'
@ 05,22 get nQuantidadeA picture cMascara valid nQuantidadeA >= 0 color ('W+/N')
@ 07,22 get nQuantidadeB picture cMascara valid nQuantidadeB >= 0 color ('W+/N')
@ 09,22 get nQuantidadeC picture cMascara valid nQuantidadeC >= 0 color ('W+/N')
read

// calculo dos precos
nTotalA := (nQuantidadeA * 10.00)
nTotalB := (nQuantidadeB * 05.25)
nTotalC := (nQuantidadeC * 20.00)
nTotal  := nTotalA + nTotalB + nTotalC

// apos os calculos, mostrar os precos na tela
cMascaraDinheiro := '@E 999,999.99'
@ 05,28 say nTotalA picture cMascaraDinheiro
@ 07,28 say nTotalB picture cMascaraDinheiro
@ 09,28 say nTotalC picture cMascaraDinheiro
@ 11,28 say nTotal  picture cMascaraDinheiro color ('G+/N')

@ 14,00 say 'O preco total ficou: ' + str(nTotal) + '$.'

inkey(0)
