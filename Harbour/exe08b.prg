clear
@ 00,00 to 24,79

// informacoes da venda
cNome   := Space(20)
nIdade  := 0
dCompra := Date()
nLimite := 0

do while .t.
	// cheque
	nDesconto      := 0
	dEntrega       := CToD('')
	cEndereco      := Space(20)
	cTextoDesconto := '' // texto que aparece apos o total mostrando o valor do desconto

	// compra
	cProdutoANome       := Space(20)
	cProdutoBNome       := Space(20)
	cProdutoCNome       := Space(20)
	nProdutoAQtd        := 0
	nProdutoBQtd        := 0
	nProdutoCQtd        := 0
	nProdutoAValor      := 0
	nProdutoBValor      := 0
	nProdutoCValor      := 0
	nProdutoAValorTotal := 0
	nProdutoBValorTotal := 0
	nProdutoCValorTotal := 0
	nCompraTotal        := 0
	nLinha              := 0

	// cores
	cCorDinheiro := 'G/N'
	cCorLimite   := 'G+/N'

	@ 04,01 to 04,78
	@ 06,05 to 12,05
	@ 06,01 to 12,78

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
	nLinha   := 7

	@ 05,03 say 'N   PRODUTO              QTD PRECO   TOTAL  '
	@ 07,03 say '01'
	@ 09,03 say '02'
	@ 11,03 say '03'
	@ 13,02 say 'Total da compra: '
	@ 14,02 say 'Limite.........: '
	@ 14,39 say nLimite picture '@E 9999.99' color cCorLimite

	// produto A
	@ nLinha,07 get cProdutoANome  picture '@!'       valid !Empty(cProdutoANome)
	@ nLinha,28 get nProdutoAQtd   picture '999'      valid nProdutoAQtd > 0
	@ nLinha,32 get nProdutoAValor picture '@E 99.99' valid nProdutoAValor > 0
	read

    if (LastKey() = 27)
        nOpcao := Alert('Deseja sair?', { 'Sim', 'Nao' })
        if (nOpcao = 1)
        	exit
        endif
        loop
    endif

	nProdutoAValorTotal := nProdutoAValor * nProdutoAQtd
	nCompraTotal        += nProdutoAValorTotal
	nLimite             -= nProdutoAValorTotal

	if (nLimite < 0)
		cCorLimite := 'R/N'
	endif

	@ nLinha,40 say nProdutoAValorTotal picture '@E 999.99' color cCorDinheiro
	nLinha += 2

	@ 13,02 say 'Total da compra: '
	@ 13,39 say nCompraTotal picture '@E 9999.99' color 'G+/N'
	@ 14,39 say nLimite      picture '@E 9999.99' color cCorLimite


	// produto B
	@ nLinha,07 get cProdutoBNome  picture '@!'       valid !Empty(cProdutoBNome)
	@ nLinha,28 get nProdutoBQtd   picture '999'      valid nProdutoBQtd > 0
	@ nLinha,32 get nProdutoBValor picture '@E 99.99' valid nProdutoBValor > 0
	read

    if (LastKey() = 27)
        nOpcao := Alert('Deseja sair?', { 'Sim', 'Nao' })
        if (nOpcao = 1)
        	exit
        endif
        loop
    endif

	nProdutoBValorTotal := nProdutoBValor * nProdutoBQtd
	nCompraTotal        += nProdutoBValorTotal
	nLimite             -= nProdutoBValorTotal

	if (nLimite < 0)
		cCorLimite := 'R/N'
	endif

	@ nLinha,40 say nProdutoBValorTotal picture '@E 999.99' color cCorDinheiro
	nLinha += 2

	@ 13,02 say 'Total da compra: '
	@ 13,39 say nCompraTotal picture '@E 9999.99' color 'G+/N'
	@ 14,39 say nLimite      picture '@E 9999.99' color cCorLimite


	// produto C
	@ nLinha,07 get cProdutoCNome  picture '@!'    	  valid !Empty(cProdutoCNome)
	@ nLinha,28 get nProdutoCQtd   picture '999'   	  valid nProdutoCQtd > 0
	@ nLinha,32 get nProdutoCValor picture '@E 99.99' valid nProdutoCValor > 0
	read

    if (LastKey() = 27)
        nOpcao := Alert('Deseja sair?', { 'Sim', 'Nao' })
        if (nOpcao = 1)
        	exit
        endif
        loop
    endif

	nProdutoCValorTotal := nProdutoCValor * nProdutoCQtd
	nCompraTotal        += nProdutoCValorTotal
	nLimite             -= nProdutoCValorTotal

	if (nLimite < 0)
		cCorLimite := 'R/N'
	endif

	@ nLinha,40 say nProdutoCValorTotal picture '@E 999.99' color cCorDinheiro
	nLinha += 2

	@ 13,02 say 'Total da compra: '
	@ 13,39 say nCompraTotal picture '@E 9999.99' color 'G+/N'
	@ 14,39 say nLimite      picture '@E 9999.99' color cCorLimite

	Inkey(0)


	// cheque
	@ 01,01 clear to 23,78
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
        nOpcao := Alert('Deseja sair?', { 'Sim', 'Nao' })
        if (nOpcao = 1)
        exit
        endif
        loop
    endif

	if (nDesconto > 0)
		cTextoDesconto := ' -' + AllTrim(Str(nDesconto)) + '%'
	endif
	nCompraTotal -= nDesconto / 100 * nCompraTotal 

	// desenho da nota
	set color to 'W/GR+'
	@ 05,04 clear to 21,55
	@ 05,04 to 21,55
	@ 06,06 say 'Obrigado pela sua compra'
	@ 08,06 say 'Nome....: ' + cNome
	@ 09,06 say 'Endereco: ' + cEndereco
	@ 11,06 say 'Produtos              QTD   VALOR     TOTAL'
	@ 12,06 say cProdutoANome + '  ' + Transform(nProdutoAQtd, '999') + ' x ' + Transform(nProdutoAValor, '@E 99.99') + ':   ' + Transform(nProdutoAValorTotal, '@E 999.99')
	@ 13,06 say cProdutoBNome + '  ' + Transform(nProdutoBQtd, '999') + ' x ' + Transform(nProdutoBValor, '@E 99.99') + ':   ' + Transform(nProdutoBValorTotal, '@E 999.99')
	@ 14,06 say cProdutoCNome + '  ' + Transform(nProdutoCQtd, '999') + ' x ' + Transform(nProdutoCValor, '@E 99.99') + ':   ' + Transform(nProdutoCValorTotal, '@E 999.99')
	@ 15,06 say 'Total da compra..................:  ' + Transform(nCompraTotal, '@E 9999.99') + cTextoDesconto
	@ 17,06 say 'Data da compra...................: ' + DToC(dCompra)
	@ 18,06 say 'Data de entrega..................: ' + DToC(dEntrega)
	@ 21,04 say Replicate('\/', 26)
	set color to 'W+/N'

	//@ 23,02 say 'Pressione qualquer tecla para continuar...'
	Inkey(0)
	clear
enddo