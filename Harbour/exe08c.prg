set scoreboard off
clear
@ 00,00 to 24,79 double

do while .t.
	// informacoes da venda
	cNome   := Space(20)
	nIdade  := 0
	dCompra := Date()
	nLimite := 0

	// cheque
	nDesconto      := 0
	dEntrega       := CToD('')
	cEndereco      := Space(20)
	cTextoDesconto := '' // texto que aparece apos o total mostrando o valor do desconto

	// compra
	cProdutoNome       := Space(20)
	nProdutoQtd        := 0
	nProdutoValor      := 0
	nProdutoValorTotal := 0
	nCompraTotal       := 0
	nContador          := 0
	nLinha             := 0
	lCompraFinalizada  := .t.

	cComprasCupom      := ''

	// cores
	cCorDinheiro   := 'G/N'
	cCorLimite     := 'G+/N'

	@ 04,01 to 04,78
	@ 01,02 say 'Informacoes da compra'
	@ 02,02 say 'Nome:'
	@ 02,29 say 'Idade:'
	@ 02,40 say 'Data da compra:'
	@ 03,02 say 'Limite:'

	@ 02,08 get cNome   picture '@!'         valid !Empty(cNome)
	@ 02,36 get nIdade  picture '999'        valid nIdade > 0
	@ 02,56 get dCompra                      valid !Empty(dCompra) .and. dCompra <= Date()
	@ 03,10 get nLimite picture '@E 9999.99' valid nLimite >= 0
	read

    if (LastKey() = 27)
        nOpcao := Alert('Deseja sair?', { 'Sim', 'Nao' })
        if (nOpcao = 1)
        	exit
        endif

        loop
    endif
	
	//deixando uma data de entrega por padrao
	dEntrega := dCompra + 3
	nLinha   := 4

	@ 01,01 clear to 23,78
	@ 03,05 to 19,05
	@ 03,01 to 19,78
	@ 03,01 to 03,78
	@ 02,03 say 'N   PRODUTO              QTD PRECO   TOTAL  '
	@ 20,02 say 'Total da compra: '
	@ 21,02 say 'Limite.........: '

	do while lCompraFinalizada
		if nLinha >= 19
			nLinha := 4
			@ 04,06 clear to 18,77
			@ 04,02 clear to 18,04
		endif

		@ 21,39     say nLimite - nCompraTotal picture '@E 9999.99' color cCorLimite
		@ nLinha,02 say nContador 			   picture '999'
		
		cProdutoNome  := Space(20)
		nProdutoQtd   := 0
		nProdutoValor := 0
		
		@ nLinha,07 get cProdutoNome  picture '@!'       valid !Empty(cProdutoNome)
		@ nLinha,28 get nProdutoQtd   picture '999'      valid nProdutoQtd > 0
		@ nLinha,32 get nProdutoValor picture '@E 99.99' valid nProdutoValor > 0
		read
	
		if (LastKey() = 27)
			nOpcao := Alert('O que deseja fazer?', { 'Finalizar compra', 'Cancelar compra', 'Continuar' })
			if (nOpcao = 1)
				exit
			elseif (nOpcao = 2)
				lCompraFinalizada := .f.
				exit
			endif

			loop
		endif
	
		nProdutoValorTotal := nProdutoValor * nProdutoQtd
		nCompraTotal       += nProdutoValorTotal
		cComprasCupom      += cProdutoNome + '  ' + Transform(nProdutoQtd, '999') + ' x ' + Transform(nProdutoValor, '@E 99.99') + ':   ' + Transform(nProdutoValorTotal, '@E 999.99')
		
		if (nLimite - nCompraTotal < 0)
			cCorLimite := 'R/N'
		endif
	
		@ nLinha,40 say nProdutoValorTotal picture '@E 999.99'  color cCorDinheiro
		@ 20,39     say nCompraTotal       picture '@E 9999.99' color cCorDinheiro
		nLinha += 2
		nContador++
	enddo

	if !lCompraFinalizada
		@ 01,01 clear to 23,78
		loop
	endif

	// cheque
	@ 01,01 clear to 23,78
	
	do while .t.
		@ 01,02 say 'Cheque'
		@ 03,01 to 03,78

		@ 02,02 say 'Desconto (%): '
		@ 02,21 say 'Data de entrega:'
		@ 02,48 say 'Endereco:'

		@ 02,16 get nDesconto picture '999' valid nDesconto >= 0 .and. nDesconto <= 100
		@ 02,38 get dEntrega                valid dEntrega >= dCompra + 3
		@ 02,58 get cEndereco picture '@!'  valid !Empty(cEndereco) 
		read

		if (LastKey() = 27)
			nOpcao := Alert('Deseja cancelar a compra?', { 'Sim', 'Nao' })
			if (nOpcao = 1)
				exit
			endif
			loop
		endif

		@ 01,01 clear to 23,78

		if (nDesconto > 0)
			cTextoDesconto := ' -' + AllTrim(Str(nDesconto)) + '%'
		endif
		nCompraTotal -= nDesconto / 100 * nCompraTotal 
		nLimite      -= nCompraTotal

		/*
		// desenho da nota
		set color to 'W/GR+'
		@ 02,04 clear to 21,55
		@ 02,04 to 21,55
		@ 03,06 say 'Obrigado pela sua compra'
		@ 05,06 say 'Nome....: ' + cNome
		@ 06,06 say 'Endereco: ' + cEndereco
		
		@ 08,06 say 'Total da compra..................:  ' + Transform(nCompraTotal, '@E 9999.99') + cTextoDesconto
		@ 09,06 say 'Data da compra...................: ' + DToC(dCompra)
		@ 10,06 say 'Data de entrega..................: ' + DToC(dEntrega)
		@ 21,04 say Replicate('\/', 26)
		set color to 'W+/N'
		*/


		// desenho da nota
		set color to 'W/GR+'
		@ 02,04 clear to 13,55
		@ 02,04 to 13,55
		@ 03,06 say 'Obrigado pela sua compra'
		@ 05,06 say 'Nome....: ' + cNome
		@ 06,06 say 'Endereco: ' + cEndereco
		
		@ 08,06 say 'Total da compra..................:  ' + Transform(nCompraTotal, '@E 9999.99') + cTextoDesconto
		@ 09,06 say 'Data da compra...................: ' + DToC(dCompra)
		@ 10,06 say 'Data de entrega..................: ' + DToC(dEntrega)
		@ 12,06 say 'Produtos              QTD   VALOR     TOTAL'
		
		nProdutosQTD    := nContador
		nContador       := 0
		nTamanhoCompras := Len(cComprasCupom) / nProdutosQTD
		nLinha          := 13

		do while nContador < nProdutosQTD
			if (nLinha > 22)
				nLinha := 02

				Inkey(0)

				set color to 'W+/N'
				@ 01,04 clear to 22,55
				set color to 'W/GR+'
				
				@ 01,04 clear to 01,55
				@ 01,04 to 02,04
				@ 01,55 to 02,55
			endif
			
			@ nLinha,04 clear to 22,55
			@ nLinha,04 to 02,04
			@ nLinha,55 to 02,55
			@ nLinha,06 say SubStr(cComprasCupom, (nTamanhoCompras * nContador) + 1, nTamanhoCompras)
			nContador++
			nLinha++
		enddo

		@ nLinha,04 say Replicate('\/', 26)
		set color to 'W+/N'
		
		Inkey(0)
		
		exit
	enddo

	@ 01,01 clear to 23,78
enddo