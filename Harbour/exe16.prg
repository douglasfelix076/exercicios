set scoreboard off
clear
@ 00,00 to 24,79 double
@ 00,02 say 'exe16'

do while .t.
	cNome          := Space(20)
	nTamanhoNome   := 0
	nRepetir       := 0
	nContador      := 0
	nColuna        := 0
	nLinha         := 0
	nPagina        := 0
	nNomePorPagina := 0
	
	@ 01,02 say 'Digite seu nome...........:'
	@ 02,02 say 'Quantas vezes deve repetir:'

	@ 01,30 get cNome    picture '@!' valid !Empty(cNome)
	@ 02,30 get nRepetir picture '9999' valid nRepetir > 0
	read

    if (LastKey() = 27)
        nOpcao := Alert('Deseja sair?', { 'Sim', 'Nao' })
        if (nOpcao = 1)
        	exit
        endif
        loop
    endif

	cNome          := AllTrim(cNome)
	nTamanhoNome   := Len(cNome) + 6
	nNomePorPagina := (75 / nTamanhoNome) - 0.5

	do while nContador++ < nRepetir
		if (nLinha >= 18) // atingiu o limite vertical 
			nLinha := 0
			nColuna++
			
			if (nColuna >= nNomePorPagina) // atingiu o limite horizontal
				nColuna := 0
				nPagina++
				
				@ 23,76 say Str(nPagina, 2)
				@ 23,02 say 'Avancar para a proxima pagina...'
				Inkey(0)
				@ 03,02 clear to 23,78 // apaga a tela
			endif
		endif

		@ 04 + nLinha, 02 + nColuna * nTamanhoNome say Str(nContador, 4) + ':' color 'N+/N'
		@ 04 + nLinha, 07 + nColuna * nTamanhoNome say cNome
		nLinha++
	enddo

	@ 23,02 say 'Pressione qualquer tecla para continuar...'
	Inkey(0)

	@ 03,02 clear to 23,78 // apaga a tela
enddo