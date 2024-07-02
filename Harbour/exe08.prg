clear

@ 00,00 say 'Digite a quantidade de cada produto que voce gostaria de comprar'

@ 04,00 to 06,26
@ 02,00 to 08,26
@ 03,02 say 'Produto A | 10,00 |'
@ 05,02 say 'Produto B | 05,25 |'
@ 07,02 say 'Produto C | 20,00 |'

nQuantidadeA := 0
nQuantidadeB := 0
nQuantidadeC := 0

cMascara := '999'
@ 03,22 get nQuantidadeA picture cMascara
@ 05,22 get nQuantidadeB picture cMascara
@ 07,22 get nQuantidadeC picture cMascara
read

nTotal := (nQuantidadeA * 10.00)+(nQuantidadeB * 05.25)+(nQuantidadeC * 20.00)

@ 10,00 say 'O preco total ficou: ' + str(nTotal) + '$.'
