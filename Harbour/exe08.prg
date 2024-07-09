set date to british
set epoch to 1940

nValorA     := 0
nValorB     := 0
nValorC     := 0
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

// Data
dDataEntrega := Date()

cMes         := 'janeiro'
cSemana      := 'domingo'
cDataExtenso := ''

nAno    := Year(Date())
nMes    := Month(Date())
nDia    := Day(Date())
nSemana := DoW(Date())

if (nMes = 2)
   cMes := 'fevereiro'
elseif (nMes = 3)
   cMes := 'marco'
elseif (nMes = 4)
   cMes := 'abril'
elseif (nMes = 5)
   cMes := 'maio'
elseif (nMes = 6)
   cMes := 'junho'
elseif (nMes = 7)
   cMes := 'julho'
elseif (nMes = 8)
   cMes := 'agosto'
elseif (nMes = 9)
   cMes := 'setembro'
elseif (nMes = 10)
   cMes := 'outubro'
elseif (nMes = 11)
   cMes := 'novembro'
elseif (nMes = 12)
   cMes := 'dezembro'
endif

if (nSemana = 2)
   cSemana := 'segunda-feira'
elseif (nSemana = 3)
   cSemana := 'terca-feira'
elseif (nSemana = 4)
   cSemana := 'quarta-feira'
elseif (nSemana = 5)
   cSemana := 'quinta-feira'
elseif (nSemana = 6)
   cSemana := 'sexta-feira'
elseif (nSemana = 7)
   cSemana := 'sabado'
endif

cDataExtenso := 'Maringa, ' + AllTrim(Str(nDia)) + ' de ' + cMes + ', ' + AllTrim(Str(nAno)) + ' (' + cSemana + ')'

set scoreboard off
set color to 'N/W+'
clear
@ 00,00 to 24,79 double

@ 02,02 say 'Digite a qtd de cada produto que voce gostaria de comprar'

// Desenho da caixa
@ 04,03 say '  Produto     Preco    QTD      Total'

@ 03,15 to 11,24 //
@ 03,30 to 13,45 //
@ 05,02 to 07,45 //
@ 07,02 to 09,45 //
@ 03,02 to 11,45 //
@ 03,02 to 13,45 double

// Produto A
@ 06,04 get cNomeA  picture cMascaraNome  valid !Empty(cNomeA) color cCorTexto
@ 06,17 get nValorA picture cMascaraValor valid nValorA > 0    color cCorValor
@ 06,26 get nQtdA   picture cMascaraQTD   valid nQtdA >= 0     color cCorQtd
read

nTotalA := (nQtdA * nValorA)
nTotalGeral += nTotalA

@ 06,32 say nTotalA     picture cMascaraTotal color cCorTotal
@ 12,32 say nTotalGeral picture cMascaraTotal color cCorTotal

// Produto B
@ 08,04 get cNomeB  picture cMascaraNome  valid !Empty(cNomeB) color cCorTexto
@ 08,17 get nValorB picture cMascaraValor valid nValorB > 0    color cCorValor
@ 08,26 get nQtdB   picture cMascaraQTD   valid nQtdB >= 0     color cCorQtd
read

nTotalB := (nQtdB * nValorB)
nTotalGeral += nTotalB

@ 08,32 say nTotalB     picture cMascaraTotal color cCorTotal
@ 12,32 say nTotalGeral picture cMascaraTotal color cCorTotal

// Produto C
@ 10,04 get cNomeC  picture cMascaraNome  valid !Empty(cNomeC) color cCorTexto
@ 10,17 get nValorC picture cMascaraValor valid nValorC > 0    color cCorValor
@ 10,26 get nQtdC   picture cMascaraQTD   valid nQtdC >= 0     color cCorQtd
read

nTotalC := (nQtdC * nValorC)
nTotalGeral += nTotalC

@ 10,32 say nTotalC     picture cMascaraTotal color cCorTotal
@ 12,32 say nTotalGeral picture cMascaraTotal color cCorTotal

@ 15,02 say 'Digite o endereco        :'
@ 16,02 say 'Digite a data da entrega :'

@ 15,29 get cEndereco    picture cMascaraNome valid !Empty(cEndereco)      color cCorTexto
@ 16,29 get dDataEntrega                      valid dDataEntrega >= Date() color cCorTexto
read

@ 20,02 say 'Pressione qualquer tecla para continuar...'
inkey(0)
@ 01,01 clear to 23,78

// boleto

@ 02,03 to 18,48 double
@ 18,03 say Replicate('/\', 23)

@ 04,06 say 'Obrigado pela sua compra!'

@ 08,06 say 'Valor total.....' + Replicate('.', 24)
@ 09,06 say 'Data da compra..' + Replicate('.', 24)
@ 10,06 say 'Local de entrega' + Replicate('.', 24)
@ 11,06 say 'Data da entrega.' + Replicate('.', 24)
@ 15,06 say cDataExtenso color cCorTexto

cValorTotal := AllTrim(Transform(nTotalGeral, cMascaraTotal)) + '$'
@ 08,46 - Len(cValorTotal)        say AllTrim(cValorTotal) color cCorTexto
@ 09,46 - Len(DToC(date()))       say date()               color cCorTexto
@ 10,46 - Len(AllTrim(cEndereco)) say AllTrim(cEndereco)   color cCorTexto
@ 11,46 - Len(DToC(dDataEntrega)) say dDataEntrega         color cCorTexto
// ^ alinha os valores com a direita

@ 20,02 say 'Pressione qualquer tecla para continuar...'
inkey(0)
