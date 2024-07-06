
set date to british
set epoch to 1940

nPrecoA     := 0
nPrecoB     := 0
nPrecoC     := 0
nQtdA       := 0
nQtdB       := 0
nQtdC       := 0
nTotalA     := 0
nTotalB     := 0
nTotalC     := 0
nTotalGeral := 0

cNomeA    := Space(10)
cNomeB    := Space(10)
cNomeC    := Space(10)
cEndereco := Space(20)

cMascaraQTD   := '999'
cMascaraNome  := '@!'
cMascaraValor := '@E 999.99'
cMascaraTotal := '@E 9,999,999.99'
cCorValor     := 'RB/W'
cCorQtd       := 'B/W'
cCorTotal     := 'G/W'
cCorTexto     := 'N/W'

dDataEntrega := Date()

set color to "0/W+"
clear

@ 00,00 say 'Digite a qtd de cada produto que voce gostaria de comprar'

// Desenho da caixa
@ 03,01 say '  Produto     Preco    QTD      Total'

@ 02,13 to 10,22 //
@ 02,28 to 12,43 //
@ 04,00 to 06,43 //
@ 06,00 to 08,43 //
@ 02,00 to 10,43 //
@ 02,00 to 12,43 double

// Produto A
@ 05,02 get cNomeA  picture cMascaraNome  valid !Empty(cNomeA) color cCorTexto
@ 05,15 get nPrecoA picture cMascaraValor valid nPrecoA > 0    color cCorValor
@ 05,24 get nQtdA   picture cMascaraQTD   valid nQtdA >= 0     color cCorQtd
read

nTotalA := (nQtdA * nPrecoA)
nTotalGeral += nTotalA

@ 05,30 say nTotalA     picture cMascaraTotal color cCorTotal
@ 11,30 say nTotalGeral picture cMascaraTotal color cCorTotal

// Produto B
@ 07,02 get cNomeB  picture cMascaraNome  valid !Empty(cNomeB) color cCorTexto
@ 07,15 get nPrecoB picture cMascaraValor valid nPrecoB > 0    color cCorValor
@ 07,24 get nQtdB   picture cMascaraQTD   valid nQtdB >= 0     color cCorQtd
read

nTotalB := (nQtdB * nPrecoB)
nTotalGeral += nTotalB

@ 07,30 say nTotalB     picture cMascaraTotal color cCorTotal
@ 11,30 say nTotalGeral picture cMascaraTotal color cCorTotal

// Produto C
@ 09,02 get cNomeC  picture cMascaraNome  valid !Empty(cNomeC) color cCorTexto
@ 09,15 get nPrecoC picture cMascaraValor valid nPrecoC > 0    color cCorValor
@ 09,24 get nQtdC   picture cMascaraQTD   valid nQtdC >= 0     color cCorQtd
read

nTotalC := (nQtdC * nPrecoC)
nTotalGeral += nTotalC

@ 09,30 say nTotalC     picture cMascaraTotal color cCorTotal
@ 11,30 say nTotalGeral picture cMascaraTotal color cCorTotal

@ 14,00 say 'Digite o endereco        :'
@ 15,00 say 'Digite a data da entrega :'

@ 14,27 get cEndereco    picture cMascaraNome valid !Empty(cEndereco)      color cCorTexto
@ 15,27 get dDataEntrega                      valid dDataEntrega >= Date() color cCorTexto
read

@ 20,00 say 'Pressione qualquer tecla para continuar...'
inkey(0)
clear

// boleto
@ 00,01 to 16,46 double
@ 16,01 say Replicate('/\', 23)

@ 02,04 say 'Obrigado pela sua compra!'

@ 06,04 say 'Valor total.....' + Replicate('.', 24) color cCorTexto
@ 07,04 say 'Data da compra..' + Replicate('.', 24) color cCorTexto
@ 08,04 say 'Local de entrega' + Replicate('.', 24) color cCorTexto
@ 09,04 say 'Data da entrega.' + Replicate('.', 24) color cCorTexto

@ 06,43 - Len(AllTrim(Str(nTotalGeral))) say AllTrim(Str(nTotalGeral)) + '$'  color cCorTexto
@ 07,44 - Len(DToC(date()))              say date()                    color cCorTexto
@ 08,44 - Len(AllTrim(cEndereco))        say AllTrim(cEndereco)        color cCorTexto
@ 09,44 - Len(DToC(dDataEntrega))        say dDataEntrega              color cCorTexto

@ 20,00 say 'Pressione qualquer tecla para continuar...'
inkey(0)
