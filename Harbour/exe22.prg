// parte visual
//set color to 'N/W'
clear
set scoreboard off
@ 00,00 to 24,79 double
@ 00,02 say 'exe22'

nMesada       := 0

cNomeProduto  := Space(10)
nQtdProduto   := 0
nValorProduto := 0
nTotalProduto := 0
nTotalCompra  := 0

nContador     := 1
nLinha        := 0

// mascaras
cMascaraTotal := '@E 999.99'

// cores
cCorVerde := 'G+/N'

@ 01,02 say 'Digite o valor da mesada:'

@ 01,28 get nMesada picture cMascaraTotal valid nMesada >= 0
read

// desenho da tabela de compras
@ 01,01 clear to 23,78
@ 04,05 to 19,05
@ 04,01 to 04,78
@ 02,01 to 02,78 double
@ 19,01 to 19,78 double

@ 01,02 say 'Compras' 
@ 01,64 say 'Mesada:' 
@ 03,06 say 'Produto      Valor   QTD   Total'
@ 20,02 say 'Total da compra:'
@ 01,72 say nMesada picture cMascaraTotal color cCorVerde

do while .t.
	if nContador % 14 == 0
		// apaga os produtos anteriores
		@ 05,01 clear to 18,04
		@ 05,06 clear to 18,78

		nLinha := 0
	endif

	cNomeProduto  := Space(10)
	nQtdProduto   := 0
	nValorProduto := 0

	@ 05+nLinha,01 say Str(nContador, 4)
	
	@ 05+nLinha,06 get cNomeProduto  picture '@!'       valid !Empty(cNomeProduto)
	@ 05+nLinha,19 get nValorProduto picture '@E 99.99' valid nValorProduto > 0
	@ 05+nLinha,27 get nQtdProduto   picture '999'      valid nQtdProduto > 0
	read

	if LastKey() == 27
		nEscolha := Alert('Deseja finalizar a compra?', { 'Sim', 'Nao'})

		if nEscolha == 1
			exit
		endif

		loop
	endif

	nTotalProduto := nValorProduto * nQtdProduto

	if nTotalCompra + nTotalProduto > nMesada
		Alert('Saldo insuficiente.')
		loop
	endif

	nTotalCompra += nTotalProduto

	@ 05+nLinha,33 say nTotalProduto picture cMascaraTotal color cCorVerde

	// atualiza o valor total da compra abaixo
	@ 20,33 clear to 20,39
	@ 20,33 say nTotalCompra picture cMascaraTotal color cCorVerde

	nLinha++
	nContador++
enddo


@ 23,02 say 'Pressione qualquer tecla para prosseguir...'
Inkey(0)

@ 01,01 clear to 23,78

nMesada -= nTotalCompra


@ 02,02 say 'Total da compra.....:'
@ 02,24 say nTotalCompra picture cMascaraTotal color cCorVerde
@ 03,02 say 'Novo valor da mesada:'
@ 03,24 say nMesada picture cMascaraTotal color cCorVerde










@ 23,02 say 'Pressione qualquer tecla para continuar...'
Inkey(0)